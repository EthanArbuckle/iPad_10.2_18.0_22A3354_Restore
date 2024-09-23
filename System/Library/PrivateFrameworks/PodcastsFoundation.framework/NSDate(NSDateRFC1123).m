@implementation NSDate(NSDateRFC1123)

+ (id)dateFromRFC1123:()NSDateRFC1123
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)dateFromRFC1123__rfc1123;
    if (!dateFromRFC1123__rfc1123)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v6 = (void *)dateFromRFC1123__rfc1123;
      dateFromRFC1123__rfc1123 = (uint64_t)v5;

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      objc_msgSend((id)dateFromRFC1123__rfc1123, "setLocale:", v7);

      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)dateFromRFC1123__rfc1123, "setTimeZone:", v8);

      objc_msgSend((id)dateFromRFC1123__rfc1123, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss z"));
      v4 = (void *)dateFromRFC1123__rfc1123;
    }
    objc_msgSend(v4, "dateFromString:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = (void *)dateFromRFC1123__rfc850;
      if (!dateFromRFC1123__rfc850)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        v12 = (void *)dateFromRFC1123__rfc850;
        dateFromRFC1123__rfc850 = (uint64_t)v11;

        objc_msgSend((id)dateFromRFC1123__rfc1123, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)dateFromRFC1123__rfc850, "setLocale:", v13);

        objc_msgSend((id)dateFromRFC1123__rfc1123, "timeZone");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)dateFromRFC1123__rfc850, "setTimeZone:", v14);

        objc_msgSend((id)dateFromRFC1123__rfc850, "setDateFormat:", CFSTR("EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z"));
        v10 = (void *)dateFromRFC1123__rfc850;
      }
      objc_msgSend(v10, "dateFromString:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v15 = (void *)dateFromRFC1123__asctime;
        if (!dateFromRFC1123__asctime)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          v17 = (void *)dateFromRFC1123__asctime;
          dateFromRFC1123__asctime = (uint64_t)v16;

          objc_msgSend((id)dateFromRFC1123__rfc1123, "locale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)dateFromRFC1123__asctime, "setLocale:", v18);

          objc_msgSend((id)dateFromRFC1123__rfc1123, "timeZone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)dateFromRFC1123__asctime, "setTimeZone:", v19);

          objc_msgSend((id)dateFromRFC1123__asctime, "setDateFormat:", CFSTR("EEE MMM d HH':'mm':'ss yyyy"));
          v15 = (void *)dateFromRFC1123__asctime;
        }
        objc_msgSend(v15, "dateFromString:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)rfc1123String
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)rfc1123String_df;
  if (!rfc1123String_df)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)rfc1123String_df;
    rfc1123String_df = (uint64_t)v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend((id)rfc1123String_df, "setLocale:", v5);

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)rfc1123String_df, "setTimeZone:", v6);

    objc_msgSend((id)rfc1123String_df, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"));
    v2 = (void *)rfc1123String_df;
  }
  return objc_msgSend(v2, "stringFromDate:", a1);
}

@end
