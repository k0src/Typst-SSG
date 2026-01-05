#import "@local/tssg-util:0.1.0": *
#import "../../components/card.typ": card
#import "../../components/unsplash-image.typ": unsplash-image

#align(center)[
  #text(size: 2em, weight: "bold")[John Developer]
  #v(0.25em)
  #text(size: 1.1em, fill: rgb("#666"))[Software Engineer & Designer]
  #v(0.25em)
  #text(size: 0.95em)[
    #link("mailto:john@example.com")[john\@example.com] #sym.bullet
    #link("https://github.com")[GitHub] #sym.bullet
    #link("https://linkedin.com")[LinkedIn]
  ]
]

#divider()

== About Me

I'm a software engineer passionate about creating elegant solutions to complex problems. With expertise in full-stack development, I specialize in building scalable web applications and developer tools.

#unsplash-image(
  "../assets/code.jpg",
  caption: "JavaScript code on a computer screen.",
  photographer: "Mitchell Luo",
  photographer-url: "https://unsplash.com/@mitchel3uo",
  photo-url: "https://unsplash.com/photos/black-and-white-striped-textile-FWoq_ldWlNQ",
  width: 80%,
)

== Skills

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.8em,

  [
    *Languages*
    - TypeScript/JavaScript
    - Python
    - Rust
    - Go
  ],

  [
    *Frameworks*
    - React/Next.js
    - Node.js
    - FastAPI
    - Actix-web
  ],

  [
    *Tools*
    - Git/GitHub
    - Docker
    - PostgreSQL
    - AWS/Vercel
  ],
)

== Projects

#v(1em)

#card(
  title: "Real-time Collaboration Platform",
  meta: "Web Application",
  [
    Built a real-time collaborative document editing platform supporting 1000+ concurrent users.

    *Technologies:* React, WebSocket, Redis, PostgreSQL

    *Impact:* Reduced document sync latency by 75% compared to previous solution
  ]
)

#v(1em)

#card(
  title: "Machine Learning Pipeline",
  meta: "Data Science",
  [
    Developed automated ML pipeline for processing and classifying large-scale datasets.

    *Technologies:* Python, TensorFlow, Apache Airflow

    *Results:*
    - Processed 10M+ records daily
    - Achieved 94% classification accuracy
    - Reduced manual processing time by 80%
  ]
)

#v(1em)

#card(
  title: "Mobile Fitness Tracker",
  meta: "Mobile App",
  [
    Cross-platform mobile app for tracking workouts and nutrition with 50K+ downloads.

    *Technologies:* React Native, Firebase, GraphQL

    *Highlights:*
    - 4.8#sym.star average rating
    - Featured in App Store
    - Active community of 10K+ users
  ]
)

== Experience

=== Senior Software Engineer
*TechCorp Inc.* #sym.bullet 2021 - Present

- Led development of microservices architecture serving 1M+ users
- Mentored team of 5 junior developers
- Improved API response time by 60% through optimization

=== Software Engineer
*StartupXYZ* #sym.bullet 2019 - 2021

- Built MVP that secured Series A funding
- Implemented CI/CD pipeline reducing deployment time by 80%
- Collaborated with design team on UI/UX improvements

=== Junior Developer
*WebDev Solutions* #sym.bullet 2017 - 2019

- Developed client websites using modern frameworks
- Participated in code reviews and agile ceremonies
- Maintained legacy applications

== Education

*Master of Science in Computer Science* \
University of Technology #sym.bullet 2015 - 2017

*Bachelor of Science in Software Engineering* \
State University #sym.bullet 2011 - 2015

== Publications & Talks

+ "Optimizing WebAssembly Performance for Browser Applications" - Web Performance Conference 2023
+ "Building Scalable Real-time Systems" - DevCon 2022
+ "Introduction to Rust for JavaScript Developers" - Local Meetup Series 2021

== Certifications

- AWS Certified Solutions Architect
- Google Cloud Professional Developer
- Certified Kubernetes Administrator (CKA)