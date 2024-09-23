@implementation WFDateFormatVariableAggrandizement

- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5 customDateFormat:(id)a6 includesTimeForISO8601:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  WFDateFormatVariableAggrandizement *v18;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setValue:forKey:", v15, CFSTR("WFDateFormatStyle"));

  objc_msgSend(v16, "setValue:forKey:", v14, CFSTR("WFTimeFormatStyle"));
  objc_msgSend(v16, "setValue:forKey:", v13, CFSTR("WFRelativeDateFormatStyle"));

  objc_msgSend(v16, "setValue:forKey:", v12, CFSTR("WFDateFormat"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("WFISO8601IncludeTime"));

  v18 = -[WFVariableAggrandizement initWithDictionary:](self, "initWithDictionary:", v16);
  return v18;
}

- (WFDateFormatVariableAggrandizement)initWithDateStyle:(id)a3 timeStyle:(id)a4 relativeDateStyle:(id)a5
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:](self, "initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:", a3, a4, a5, 0, 0);
}

- (WFDateFormatVariableAggrandizement)initWithRelativeDateStyle:(id)a3 timeStyle:(id)a4
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:](self, "initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:", *MEMORY[0x1E0D141E8], a4, a3, 0, 0);
}

- (WFDateFormatVariableAggrandizement)initWithRelativeTimeStyle
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:](self, "initWithDateStyle:timeStyle:relativeDateStyle:", 0, *MEMORY[0x1E0D141E8], 0);
}

- (WFDateFormatVariableAggrandizement)initWithISO8601DateStyleAndTime:(BOOL)a3
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:](self, "initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:", *MEMORY[0x1E0D141D8], 0, 0, 0, a3);
}

- (WFDateFormatVariableAggrandizement)initWithRFC2822DateStyle
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:](self, "initWithDateStyle:timeStyle:relativeDateStyle:", *MEMORY[0x1E0D141E0], 0, 0);
}

- (WFDateFormatVariableAggrandizement)initWithCustomDateFormat:(id)a3
{
  return -[WFDateFormatVariableAggrandizement initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:](self, "initWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includesTimeForISO8601:", *MEMORY[0x1E0D141D0], 0, 0, a3, 0);
}

- (NSString)dateStyle
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFDateFormatStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)timeStyle
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFTimeFormatStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)relativeDateStyle
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFRelativeDateFormatStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)customDateFormat
{
  void *v2;
  void *v3;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFDateFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)includesTimeForISO8601
{
  void *v2;
  void *v3;
  char v4;

  -[WFVariableAggrandizement dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFISO8601IncludeTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)processedContentClasses:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
}

- (void)applyToContentCollection:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke;
  v4[3] = &unk_1E7AF6CC8;
  v4[4] = self;
  objc_msgSend(a3, "transformItemsUsingBlock:completionHandler:", v4, a4);
}

void __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E7AF6CA0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

void __81__WFDateFormatVariableAggrandizement_applyToContentCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v6 = a4;
  objc_msgSend(v16, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "dateFromComponents:", v16),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "dateStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "relativeDateStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "customDateFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 32), "includesTimeForISO8601");
    objc_msgSend(v16, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wf_formattedStringWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:", v9, v10, v11, v12, v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
