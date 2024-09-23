@implementation CNVCardDateComponentsParser

- (CNVCardDateComponentsParser)init
{
  CNVCardDateComponentsParser *v2;
  CNVCardDateComponentsFormatter *v3;
  CNVCardDateComponentsFormatter *formatter;
  id v5;
  uint64_t v6;
  NSCalendar *gregorianCalendar;
  CNVCardDateComponentsParser *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateComponentsParser;
  v2 = -[CNVCardDateComponentsParser init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNVCardDateComponentsFormatter);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    v5 = objc_alloc(MEMORY[0x1E0C99D48]);
    v6 = objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v6;

    v8 = v2;
  }

  return v2;
}

- (id)gregorianDateComponentsWithParser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "firstParameterWithName:", CFSTR("X-APPLE-OMIT-YEAR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 1604;
  }
  objc_msgSend(v4, "parseStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("-"))
      && (objc_msgSend(v10, "hasPrefix:", CFSTR("--")) & 1) == 0)
    {
      objc_msgSend(v10, "substringFromIndex:", 1);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    -[CNVCardDateComponentsParser dateComponentsFromString:omitYear:](self, "dateComponentsFromString:omitYear:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)dateComponentsFromString:(id)a3 omitYear:(int64_t)a4
{
  void *v6;

  -[CNVCardDateComponentsFormatter dateComponentsFromString:](self->_formatter, "dateComponentsFromString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "year") == 1604 || objc_msgSend(v6, "year") == a4)
    objc_msgSend(v6, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "setCalendar:", self->_gregorianCalendar);
  return v6;
}

- (id)dateComponentsWithParser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "parseRemainingLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstParameterWithName:", CFSTR("CALSCALE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNVCardDateComponentsParser dateComponentsFromString:calendarIdentifier:](self, "dateComponentsFromString:calendarIdentifier:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dateComponentsFromString:(id)a3 calendarIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
    }
    else
    {
      objc_msgSend(v6, "lowercaseString");
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v9 = 0;
        v6 = (id)v10;
        goto LABEL_11;
      }
      v8 = (void *)v11;
      v6 = (id)v10;
    }
    +[CNVCardDateComponentsFormatter dateComponentsFromALTBDAYString:](CNVCardDateComponentsFormatter, "dateComponentsFromALTBDAYString:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCalendar:", v8);
    if (objc_msgSend(v12, "isValidDate"))
      v9 = v12;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
