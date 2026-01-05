#import "@local/tssg-util:0.1.0": *

#align(center)[
  #text(size: 1.8em, weight: "bold")[
    Performance Analysis of Sorting Algorithms
  ]

  #v(0.25em)

  #text(size: 0.9em, fill: rgb("#666"))[
    Report No. TR-2024-03 \
    #format-date(10, 2, 2024)
  ]
]

#v(1em)

== Executive Summary

This report presents a comprehensive analysis of common sorting algorithm performance characteristics. We evaluate time complexity, space complexity, and real-world performance across different input sizes and data distributions.

*Key Findings:*
- QuickSort performs best for random data (average case)
- MergeSort provides consistent $O(n log n)$ performance
- RadixSort excels for integer sorting with limited range

== 1. Introduction

Sorting is a fundamental operation in computer science with applications spanning databases, search engines, and data analysis. Understanding the performance characteristics of different sorting algorithms is essential for selecting the appropriate algorithm for specific use cases.

=== 1.1 Scope

This study examines:
- Comparison-based sorts: QuickSort, MergeSort, HeapSort
- Non-comparison sorts: RadixSort, CountingSort
- Simple sorts: InsertionSort, SelectionSort

=== 1.2 Methodology

All algorithms were implemented in C++ and compiled with GCC 11.2 with -O2 optimization. Tests ran on:

- CPU: Intel Core i7-9700K @ 3.60GHz
- RAM: 32GB DDR4-3200
- OS: Ubuntu 22.04 LTS

== 2. Theoretical Analysis

=== 2.1 Time Complexity

#table(
  columns: (auto, auto, auto, auto),
  inset: 0.7em,
  stroke: 0.5pt + rgb("#ddd"),
  fill: (col, row) => if row == 0 { rgb("#f5f5f5") } else if calc.even(row) { rgb("#fafafa") } else { white },
  [*Algorithm*], [*Best Case*], [*Average Case*], [*Worst Case*],
  [QuickSort], [$O(n log n)$], [$O(n log n)$], [$O(n^2)$],
  [MergeSort], [$O(n log n)$], [$O(n log n)$], [$O(n log n)$],
  [HeapSort], [$O(n log n)$], [$O(n log n)$], [$O(n log n)$],
  [InsertionSort], [$O(n)$], [$O(n^2)$], [$O(n^2)$],
  [RadixSort], [$O(d n)$], [$O(d n)$], [$O(d n)$],
)

where $d$ is the number of digits in RadixSort.

=== 2.2 Space Complexity

#table(
  columns: (auto, auto),
  inset: 0.8em,
  stroke: 0.5pt + rgb("#ddd"),
  [*Algorithm*], [*Space Complexity*],
  [QuickSort], [$O(log n)$],
  [MergeSort], [$O(n)$],
  [HeapSort], [$O(1)$],
  [InsertionSort], [$O(1)$],
  [RadixSort], [$O(n + k)$],
)

== 3. Experimental Results

=== 3.1 Random Input Performance

Testing with arrays of random integers:

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    inset: 0.6em,
    stroke: 0.5pt + rgb("#ddd"),
    align: (left, right, right, right, right),
    [*Algorithm*], [*n=1K*], [*n=10K*], [*n=100K*], [*n=1M*],
    [QuickSort], [0.12ms], [1.45ms], [18.2ms], [215ms],
    [MergeSort], [0.15ms], [1.82ms], [22.1ms], [258ms],
    [HeapSort], [0.18ms], [2.34ms], [29.8ms], [342ms],
    [InsertionSort], [2.4ms], [245ms], [24.5s], [—],
    [RadixSort], [0.08ms], [0.95ms], [11.2ms], [128ms],
  )
]

=== 3.2 Nearly Sorted Input

Performance on arrays that are 90% sorted:

- InsertionSort: Excellent performance ($approx O(n)$)
- QuickSort: Poor performance (approaches $O(n^2)$)
- MergeSort: Consistent performance

=== 3.3 Reverse Sorted Input

Worst case for some algorithms:

- QuickSort (naive pivot): $O(n^2)$ confirmed
- MergeSort: Unaffected
- InsertionSort: Maximum comparisons

== 4. Algorithm Analysis

=== 4.1 QuickSort

QuickSort's partitioning step:

```python
def partition(arr, low, high):
    pivot = arr[high]
    i = low - 1
    for j in range(low, high):
        if arr[j] <= pivot:
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return i + 1
```

*Advantages:*
- In-place sorting
- Cache-friendly
- Fast average case

*Disadvantages:*
- Unstable
- Poor worst-case performance

=== 4.2 MergeSort

The merge operation:

$
  "merge"(A[1..m], B[1..n]) = C[1..m+n]
$

where $C$ contains all elements from $A$ and $B$ in sorted order.

*Advantages:*
- Stable sort
- Guaranteed $O(n log n)$
- Parallelizable

*Disadvantages:*
- Requires $O(n)$ extra space
- Slower than QuickSort in practice

=== 4.3 RadixSort

For $d$-digit numbers with base $b$:

Total time: $O(d(n + b))$

When $d$ and $b$ are constants: $O(n)$ linear time!

== 5. Recommendations

Based on our analysis:

#block(
  width: 100%,
  inset: 1em,
  fill: rgb("#f9f9f9"),
  stroke: (left: 3pt + rgb("#2980b9")),
  [
    *General Purpose:* Use QuickSort (with random pivot selection)

    *Guaranteed Performance:* Use MergeSort or HeapSort

    *Small Arrays (n < 50):* Use InsertionSort

    *Integer Sorting:* Use RadixSort when range is limited

    *Nearly Sorted:* Use InsertionSort or TimSort
  ]
)

== 6. Conclusion

No single sorting algorithm is optimal for all scenarios. The choice depends on:

+ Input size
+ Data distribution
+ Memory constraints
+ Stability requirements
+ Parallelization needs

Modern hybrid algorithms like TimSort (used in Python and Java) combine multiple approaches to achieve robust performance across diverse inputs.

== 7. Future Work

Future investigations will explore:

- Parallel sorting algorithms
- External sorting for datasets exceeding RAM
- Adaptive algorithms that detect input patterns
- GPU-accelerated sorting

== Appendix A: Mathematical Proofs

=== QuickSort Average Case

Let $T(n)$ be the expected runtime. For random pivot:

$
  T(n) &= n + 1/n sum_(i=0)^(n-1) [T(i) + T(n-i-1)] \
       &= n + 2/n sum_(i=0)^(n-1) T(i)
$

Solving this recurrence yields $T(n) = O(n log n)$.

== Appendix B: Test Data Generation

Pseudorandom number generator (Xorshift):

```cpp
uint32_t xorshift32(uint32_t state) {
    state ^= state << 13;
    state ^= state >> 17;
    state ^= state << 5;
    return state;
}
```