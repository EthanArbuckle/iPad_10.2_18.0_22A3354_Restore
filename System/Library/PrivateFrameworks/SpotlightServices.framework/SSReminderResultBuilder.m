@implementation SSReminderResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.reminders");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithCompletionDate:(id)a3 dueDate:(id)a4 modificationDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    +[SSDateFormatManager dateCompletedStringFormat](SSDateFormatManager, "dateCompletedStringFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
  }
  else if (v8)
  {
    +[SSDateFormatManager dateDueStringFormat](SSDateFormatManager, "dateDueStringFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
  }
  else
  {
    if (!v9)
    {
      v11 = 0;
      v13 = 0;
      goto LABEL_10;
    }
    +[SSDateFormatManager dateModifiedStringFormat](SSDateFormatManager, "dateModifiedStringFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
  }
  v13 = v12;
  if (!v11)
  {
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  +[SSDateFormatManager shortDateTimeFormatter](SSDateFormatManager, "shortDateTimeFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v16;
}

- (SSReminderResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSReminderResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSReminderResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v17, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60A0], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setCompletionDate:](v5, "setCompletionDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A0], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setDueDate:](v5, "setDueDate:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E0], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setModificationDate:](v5, "setModificationDate:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setReminder:](v5, "setReminder:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6098], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setNote:](v5, "setNote:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6358], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setHashtags:](v5, "setHashtags:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA63D8], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v12, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6808], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setIsFlagged:](v5, "setIsFlagged:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6810], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setIsRecurring:](v5, "setIsRecurring:", objc_msgSend(v14, "BOOLValue"));

    -[SSReminderResultBuilder completionDate](v5, "completionDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder setIsCompleted:](v5, "setIsCompleted:", v15 != 0);

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSReminderResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v8, sel_buildInlineCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSReminderResultBuilder isFlagged](self, "isFlagged") && SSSnippetModernizationEnabled())
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setSymbolName:", CFSTR("flag.fill"));
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "setTrailingTopText:", v5);

    objc_msgSend(v3, "trailingTopText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGlyph:", v4);

  }
  return v3;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSReminderResultBuilder reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v7 = (void *)objc_opt_new();
    v14[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFormattedTextPieces:", v8);

    v9 = -[SSReminderResultBuilder isCompleted](self, "isCompleted");
    objc_msgSend(v3, "formattedTextPieces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsEmphasized:", v9);

    return v3;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SSReminderResultBuilder;
    -[SSResultBuilder buildTitle](&v13, sel_buildTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    v3 = (void *)objc_opt_new();
    -[SSReminderResultBuilder note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D8C660];
      -[SSReminderResultBuilder note](self, "note");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
    v9 = (void *)objc_opt_new();
    -[SSReminderResultBuilder dueDate](self, "dueDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SSReminderResultBuilder dueDate](self, "dueDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSDateFormatManager shortDateTimeStringFromDate:isAllDay:showAllDayString:](SSDateFormatManager, "shortDateTimeStringFromDate:isAllDay:showAllDayString:", v11, -[SSReminderResultBuilder isAllDay](self, "isAllDay"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[SSReminderResultBuilder isRecurring](self, "isRecurring"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, "), v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      -[SSReminderResultBuilder dueDate](self, "dueDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      if (v15 >= 0.0)
        v16 = 0;
      else
        v16 = -[SSReminderResultBuilder isCompleted](self, "isCompleted") ^ 1;

      objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTextColor:", v16);
      objc_msgSend(v9, "addObject:", v23);
      if (-[SSReminderResultBuilder isRecurring](self, "isRecurring"))
      {
        v24 = (void *)objc_opt_new();
        objc_msgSend(v24, "setIsTemplate:", 1);
        objc_msgSend(v24, "setSymbolName:", CFSTR("repeat"));
        v25 = (void *)objc_opt_new();
        objc_msgSend(v25, "setGlyph:", v24);
        objc_msgSend(v25, "setTextColor:", v16);
        objc_msgSend(v9, "addObject:", v25);

      }
    }
    v19 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[SSReminderResultBuilder hashtags](self, "hashtags");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v30));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v19, "count"))
    {
      v32 = objc_msgSend(v9, "count");
      v33 = &stru_1E6E549F0;
      if (v32)
        v33 = CFSTR(" ");
      v34 = v33;
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v37);

    }
    if (objc_msgSend(v9, "count"))
    {
      v38 = (void *)objc_opt_new();
      objc_msgSend(v38, "setFormattedTextPieces:", v9);
      objc_msgSend(v3, "addObject:", v38);

    }
    if (objc_msgSend(v3, "count"))
      v39 = v3;
    else
      v39 = 0;
    v22 = v39;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D8C660];
    v18 = (void *)objc_opt_class();
    -[SSReminderResultBuilder completionDate](self, "completionDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder dueDate](self, "dueDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSReminderResultBuilder modificationDate](self, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithCompletionDate:dueDate:modificationDate:", v3, v9, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_completionDate, a3);
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_dueDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)reminder
{
  return self->_reminder;
}

- (void)setReminder:(id)a3
{
  objc_storeStrong((id *)&self->_reminder, a3);
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (NSArray)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
{
  objc_storeStrong((id *)&self->_hashtags, a3);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setIsFlagged:(BOOL)a3
{
  self->_isFlagged = a3;
}

- (BOOL)isRecurring
{
  return self->_isRecurring;
}

- (void)setIsRecurring:(BOOL)a3
{
  self->_isRecurring = a3;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
}

@end
