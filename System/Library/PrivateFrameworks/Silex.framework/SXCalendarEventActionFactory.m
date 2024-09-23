@implementation SXCalendarEventActionFactory

- (SXCalendarEventActionFactory)initWithDateParser:(id)a3
{
  id v5;
  SXCalendarEventActionFactory *v6;
  SXCalendarEventActionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXCalendarEventActionFactory;
  v6 = -[SXCalendarEventActionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dateParser, a3);

  return v7;
}

- (id)actionForAddition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "startDate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXCalendarEventActionFactory actionForStartDate:endDate:](self, "actionForStartDate:endDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocation:", v10);

    objc_msgSend(v4, "notes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNotes:", v11);

    objc_msgSend(v4, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v12);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXFormattedText *v12;
  void *v13;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("startDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("endDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("location"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("notes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryValueForName:", CFSTR("URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SXCalendarEventActionFactory actionForStartDate:endDate:](self, "actionForStartDate:endDate:", v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v7);
      objc_msgSend(v11, "setLocation:", v8);
      v12 = -[SXFormattedText initWithText:]([SXFormattedText alloc], "initWithText:", v9);
      objc_msgSend(v11, "setNotes:", v12);

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setURL:", v13);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)actionForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  uint64_t v25;
  SXCalendarEventAction *v26;

  v6 = a4;
  v7 = a3;
  -[SXCalendarEventActionFactory dateParser](self, "dateParser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXCalendarEventActionFactory dateParser](self, "dateParser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if ((objc_msgSend(v9, "containedTime") & 1) != 0 || objc_msgSend(v11, "containedTime"))
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v9;
    if (v13)
    {
LABEL_7:
      objc_msgSend(v14, "timeZone");
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v12 = (void *)v15;
      goto LABEL_12;
    }
    objc_msgSend(v11, "timeZone");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v9, "timeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v11;
      if (!v17)
        goto LABEL_7;
      v16 = 0;
    }
  }
  else
  {
    v12 = 0;
    v16 = 1;
  }
LABEL_12:
  objc_msgSend(v9, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 && v18
    || (objc_msgSend(v18, "timeIntervalSince1970"), v21 = v20, objc_msgSend(v19, "timeIntervalSince1970"), v21 > v22))
  {
    v23 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v23, "setHour:", 1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateByAddingComponents:toDate:options:", v23, v18, 0);
    v25 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v25;
  }
  v26 = -[SXCalendarEventAction initWithStartDate:]([SXCalendarEventAction alloc], "initWithStartDate:", v18);
  -[SXCalendarEventAction setEndDate:](v26, "setEndDate:", v19);
  -[SXCalendarEventAction setAllDay:](v26, "setAllDay:", v16);
  -[SXCalendarEventAction setTimeZone:](v26, "setTimeZone:", v12);

  return v26;
}

- (SXDateParser)dateParser
{
  return self->_dateParser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateParser, 0);
}

@end
