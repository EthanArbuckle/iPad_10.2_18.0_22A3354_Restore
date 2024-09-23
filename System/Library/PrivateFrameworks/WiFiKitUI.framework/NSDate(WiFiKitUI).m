@implementation NSDate(WiFiKitUI)

- (id)stringFromDHCPLeaseExpirationDateWithFormatString:()WiFiKitUI
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "isTodayWithCalendar:", v6);

  if (v7)
  {
    objc_msgSend(v5, "setTimeStyle:", 1);
    objc_msgSend(v5, "setDateStyle:", 0);
LABEL_7:
    objc_msgSend(v5, "stringFromDate:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("en_US"));

  objc_msgSend(v5, "setDoesRelativeDateFormatting:", 1);
  if (!v4 || !v10)
  {
    objc_msgSend(v5, "setDateStyle:", 3);
    objc_msgSend(v5, "setTimeStyle:", 1);
    goto LABEL_7;
  }
  objc_msgSend(v5, "setDateStyle:", 1);
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setTimeStyle:", 1);
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "stringFromDate:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

- (BOOL)isTodayWithCalendar:()WiFiKitUI
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 30, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "day");
  if (v9 == objc_msgSend(v8, "day")
    && (v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month"))
    && (v11 = objc_msgSend(v7, "year"), v11 == objc_msgSend(v8, "year")))
  {
    v12 = objc_msgSend(v7, "era");
    v13 = v12 == objc_msgSend(v8, "era");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
