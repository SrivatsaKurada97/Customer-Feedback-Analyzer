# Customer-Feedback-Analyzer - AI Automation Learning Project 

> My first exploration into AI automation using no-code platforms
[![Learning Project](https://img.shields.io/badge/Status-Learning%20Project-yellow)]()
[![n8n](https://img.shields.io/badge/Automation-n8n-blue)]()
[![Claude AI](https://img.shields.io/badge/AI-Claude-purple)]()

---

## ⚠️ Status: Learning Project / Proof of Concept

This is a **beginner project** built to learn AI automation and no-code platforms. It's **not production-ready** and has many areas for improvement. If you're looking for a polished, production system, this isn't it. But if you're learning like me, hopefully this helps!

---

## 🎯 Why I Built This

I kept seeing posts about AI automation and no-code platforms, and wanted to understand:
- How do these tools actually work?
- What does "connecting AI to workflows" really mean?
- Can you actually build useful things without writing tons of code?

So I built the simplest thing I could think of to find out.

---

## 🛠️ What It Does (Simply)

**The workflow:**
1. Customer submits feedback via Google Sheets
2. n8n detects new row and triggers workflow
3. Feedback text sent to Claude AI for sentiment analysis
4. AI responds with sentiment, category, priority
5. Results stored in SQL Server database
6. Basic charts shown in Power BI

**That's it!** Nothing fancy, just the basics.

**Visual:**
```
Google Sheets → n8n → Claude AI → SQL Server → Power BI
     (input)    (automation)  (analysis)  (storage)  (visualization)
```

---
