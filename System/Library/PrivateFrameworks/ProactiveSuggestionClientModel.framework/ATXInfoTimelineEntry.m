@implementation ATXInfoTimelineEntry

+ (id)entryWithDate:(id)a3 relevance:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:relevance:", v7, v6);

  return v8;
}

- (ATXInfoTimelineEntry)initWithDate:(id)a3 relevance:(id)a4
{
  id v7;
  id v8;
  ATXInfoTimelineEntry *v9;
  ATXInfoTimelineEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInfoTimelineEntry;
  v9 = -[ATXInfoTimelineEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_relevance, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevance, CFSTR("relevance"));

}

- (ATXInfoTimelineEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXInfoTimelineEntry *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXInfoTimelineEntry checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("date"), v4, CFSTR("com.apple.proactive.TimelineSuggestionEntry"), -1))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXInfoTimelineEntry checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v7, CFSTR("relevance"), v4, CFSTR("com.apple.proactive.TimelineSuggestionEntry"), -1))
    {
      v6 = 0;
    }
    else
    {
      self = -[ATXInfoTimelineEntry initWithDate:relevance:](self, "initWithDate:relevance:", v5, v7);
      v6 = self;
    }

  }
  return v6;
}

+ (id)entryWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:relevance:", v5, 0);

  return v6;
}

- (ATXInfoTimelineEntry)initWithDate:(id)a3 importantRelativeToTimeline:(BOOL)a4
{
  return -[ATXInfoTimelineEntry initWithDate:relevance:](self, "initWithDate:relevance:", a3, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (ATXInfoTimelineEntryRelevance)relevance
{
  return self->_relevance;
}

- (BOOL)isImportantRelativeToTimeline
{
  return self->_isImportantRelativeToTimeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevance, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
