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
---
<img src = "https://github.com/SrivatsaKurada97/Customer-Feedback-Analyzer/blob/99f8bb1c5dc513e299f792e108f518ccca67ab1f/images/google-sheets.png" alt = "Google Sheets" width = "100" height = "100"> ->
<img src = "https://github.com/SrivatsaKurada97/Customer-Feedback-Analyzer/blob/99f8bb1c5dc513e299f792e108f518ccca67ab1f/images/N8N.png" alt = "N8N" width = "100" height = "100"> ->
<img src = "https://github.com/SrivatsaKurada97/Customer-Feedback-Analyzer/blob/2712dc55dc2e285b743b48d33d269d5008f30896/images/Claude_logo.webp" alt = "Claude AI" width = "100" height = "100"> ->
<img src = "https://github.com/SrivatsaKurada97/Customer-Feedback-Analyzer/blob/2712dc55dc2e285b743b48d33d269d5008f30896/images/sql-server-builds.jpg" alt = "SQL Server" width = "100" height = "100"> ->
<img src = "https://github.com/SrivatsaKurada97/Customer-Feedback-Analyzer/blob/99f8bb1c5dc513e299f792e108f518ccca67ab1f/images/Power%20BI.jpg" alt = "Power BI" width = "100" height = "100">

---

## 🧰 Tools Used

| Tool | Purpose | Why I Chose It |
|------|---------|----------------|
| **n8n** | Workflow automation | Visual interface, good for learning |
| **Claude AI** | Sentiment analysis | Easy API, good documentation |
| **SQL Server** | Database | Already familiar with SQL |
| **Power BI** | Visualization | Already know Power BI basics |
| **Google Sheets** | Data input | Simple, no setup needed |

---

## 📁 Project Structure

```
├── sql/
│   ├── Create-Tables.sql              # Database table definitions
│   ├── Create-Views.sql               # SQL views for analytics
│   ├── Create-StoredProcedures.sql    # Stored procedure for inserts
│   └── Generate-Sample-Data.sql       # 100 test records
├── n8n/
│   ├── workflow.json                  # n8n workflow export
│   └── claude-prompt.txt              # AI prompt I used
├── powerbi/
│   └── dashboard.pbix                 # Power BI dashboard file
├── docs/
│   ├── setup-guide.md                 # How to set this up yourself
│   ├── challenges.md                  # Problems I ran into
│   └── learnings.md                   # What I learned
└── README.md                          # You are here
```

---
## 📚 What I Learned

### About No-Code Platforms

**Expectations:**
- "No-code means anyone can build anything!"
- "Just drag and drop, it's easy!"

**Reality:**
- You still need to understand APIs, data types, authentication
- Visual doesn't mean simple - logic is logic
- Each platform has its own learning curve
- Documentation is often lacking
- Debugging visual workflows is hard

**Takeaway:** "No-code" lowers the barrier but doesn't eliminate it.

### About AI Integration

**What surprised me:**
- AI doesn't magically understand what you want
- You need to be VERY specific in your prompts
- Getting consistent output format is tricky
- AI can fail or give unexpected responses
- Prompt engineering is a real skill

**Example prompt evolution:**

❌ **Attempt 1:** "Analyze this feedback"
→ Got paragraphs of text, couldn't parse it

❌ **Attempt 2:** "Give me the sentiment"
→ Got "The sentiment is positive" instead of just "Positive"

✅ **Attempt 3:** "Respond ONLY with JSON in this exact format: {sentiment: 'Positive/Neutral/Negative', score: -1.0 to 1.0}"
→ Finally got parseable output!

### About Data Pipelines

**Challenges:**
- Data type conversions between tools (numbers vs strings)
- Understanding how data flows between nodes
- Handling null/undefined/missing values
- SQL syntax differences when passing variables
- Power BI performance with raw data

**Biggest lesson:** Test each connection separately before chaining them together!

---

## 🐛 Challenges I Faced (And How I Fixed Them)

### Challenge 1: SQL Type Errors

**Problem:** 
```
Error: Cannot convert nvarchar to int
```

**Cause:** n8n was passing everything as strings, including numbers

**Solution:** 
Added explicit type conversion in JavaScript:
```javascript
Rating: parseInt(analysis.rating, 10),
sentimentScore: parseFloat(analysis.sentimentScore)
```

**Learning:** Always validate data types when connecting tools!

---
---

### Challenge 2: Inconsistent AI Responses

**Problem:** Claude sometimes returned JSON, sometimes plain text, sometimes wrapped in markdown

**Solution:** 
- Added very specific prompt instructions
- Used regex to extract JSON: `/\{[\s\S]*\}/`
- Added fallback error handling

**Learning:** AI outputs need robust parsing!

---

### Challenge 3: Power BI Slow Performance

**Problem:** Dashboard took 30+ seconds to load

**Solution:** 
Created SQL views to pre-aggregate data:
```sql
CREATE VIEW vw_SentimentSummary AS
SELECT Date, SentimentLabel, COUNT(*) as Count
FROM CustomerFeedback
GROUP BY Date, SentimentLabel
```

**Learning:** Don't make Power BI do all the work!

---

### Challenge 4: Workflow Node Order

**Problem:** SQL node getting 'undefined' for all values

**Cause:** Connected SQL node after email node instead of after parsing node

**Solution:** Reorganized: Parse → SQL → Email

**Learning:** Data flow matters in visual tools!

---

## 🔜 Future Improvements (Learning Goals)

Things I want to add as I learn more:

**Short-term:**
- [ ] Add error handling with try-catch
- [ ] Implement retry logic for API failures  
- [ ] Better prompt engineering for edge cases
- [ ] Add data validation before SQL insert

**Medium-term:**
- [ ] Batch processing (handle multiple feedbacks at once)
- [ ] More complex conditional logic (IF this THEN that)
- [ ] Better Power BI dashboards with drill-through
- [ ] Add email notifications for high-priority items

**Long-term:**
- [ ] Try other no-code platforms (Zapier, Make, Tray.io)
- [ ] Compare performance and capabilities
- [ ] Build something more complex
- [ ] Maybe transition to code-based approach

---

**Detailed setup instructions:** See `/docs/setup-guide.md`

## 💡 For Other Learners

If you're also just starting with AI automation, here's my advice:

**Do:**
- ✅ Start with the simplest possible version
- ✅ Test each component separately first
- ✅ Document what doesn't work (not just what does)
- ✅ Use sample/fake data for testing
- ✅ Read error messages carefully
- ✅ Google everything (seriously, everything)

**Don't:**
- ❌ Try to build everything at once
- ❌ Expect it to work first time
- ❌ Skip the documentation
- ❌ Test on real/production data
- ❌ Compare yourself to experts
- ❌ Give up when it's frustrating

**Resources that helped me:**
- n8n Documentation: https://docs.n8n.io
- Claude AI Docs: https://docs.anthropic.com
- Stack Overflow (for SQL errors)
- YouTube tutorials on n8n
- This subreddit: r/n8n





