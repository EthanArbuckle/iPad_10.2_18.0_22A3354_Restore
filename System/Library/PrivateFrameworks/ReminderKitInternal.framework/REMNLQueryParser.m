@implementation REMNLQueryParser

- (REMNLQueryParser)initWithLocale:(id)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5 forTesting:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  REMNLQueryParser *v14;
  REMNLQueryParser *v15;
  NSDate *v16;
  NSDate *referenceDate;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)REMNLQueryParser;
  v14 = -[REMNLQueryParser init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_timeZone, a5);
    objc_storeStrong((id *)&v15->_locale, a3);
    if (v12)
    {
      v16 = (NSDate *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    referenceDate = v15->_referenceDate;
    v15->_referenceDate = v16;

    v15->_forTesting = a6;
  }

  return v15;
}

- (id)parseString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = (id)objc_opt_new();
  if (self->_forTesting)
  {
    -[REMNLQueryParser parserManagerTestOptions](self, "parserManagerTestOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D83560], "remindersParserManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__REMNLQueryParser_parseString___block_invoke;
  v9[3] = &unk_1E4C0DCF8;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateParseResultsForString:options:withBlock:", v4, v5, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __32__REMNLQueryParser_parseString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)parserManagerTestOptions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSDate *referenceDate;
  NSLocale *locale;
  uint64_t v9;
  void *v10;
  void *v11;
  NSTimeZone *timeZone;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = *MEMORY[0x1E0D84760];
  v5 = *MEMORY[0x1E0D83598];
  v14[0] = *MEMORY[0x1E0D83590];
  v14[1] = v5;
  v15[0] = v4;
  v15[1] = CFSTR("com.apple.reminders.parser");
  v6 = *MEMORY[0x1E0D835B8];
  v14[2] = *MEMORY[0x1E0D835A0];
  v14[3] = v6;
  referenceDate = self->_referenceDate;
  v15[2] = &unk_1E4C3AD60;
  v15[3] = referenceDate;
  locale = self->_locale;
  v9 = *MEMORY[0x1E0D835A8];
  v14[4] = *MEMORY[0x1E0D835B0];
  v14[5] = v9;
  v15[4] = locale;
  v15[5] = MEMORY[0x1E0C9AAB0];
  v14[6] = CFSTR("forTesting");
  v15[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  timeZone = self->_timeZone;
  if (timeZone)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", timeZone, *MEMORY[0x1E0D835C0]);
  return v11;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
