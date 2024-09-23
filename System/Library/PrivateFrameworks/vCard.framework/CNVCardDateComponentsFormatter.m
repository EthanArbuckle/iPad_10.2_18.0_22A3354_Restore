@implementation CNVCardDateComponentsFormatter

- (id)stringFromDateComponents:(id)a3
{
  if (!a3)
    return 0;
  -[CNVCardDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)gregorianCalendar
{
  NSCalendar *gregorianCalendar;
  id v4;
  NSCalendar *v5;
  NSCalendar *v6;

  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D48]);
    v5 = (NSCalendar *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v6 = self->_gregorianCalendar;
    self->_gregorianCalendar = v5;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (id)monthDayDateFormatter
{
  NSDateFormatter *monthDayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;
  void *v8;

  monthDayDateFormatter = self->_monthDayDateFormatter;
  if (!monthDayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_monthDayDateFormatter;
    self->_monthDayDateFormatter = v4;

    -[CNVCardDateComponentsFormatter gregorianCalendar](self, "gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_monthDayDateFormatter, "setCalendar:", v6);

    -[NSDateFormatter setDateFormat:](self->_monthDayDateFormatter, "setDateFormat:", CFSTR("--MM-dd"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -1.25138736e10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDefaultDate:](self->_monthDayDateFormatter, "setDefaultDate:", v7);

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_monthDayDateFormatter, "setLocale:", v8);

    monthDayDateFormatter = self->_monthDayDateFormatter;
  }
  return monthDayDateFormatter;
}

- (id)yearMonthDayDateHourMinuteSecondZFormatter
{
  NSDateFormatter *yearMonthDayDateHourMinuteSecondZFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;

  yearMonthDayDateHourMinuteSecondZFormatter = self->_yearMonthDayDateHourMinuteSecondZFormatter;
  if (!yearMonthDayDateHourMinuteSecondZFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_yearMonthDayDateHourMinuteSecondZFormatter;
    self->_yearMonthDayDateHourMinuteSecondZFormatter = v4;

    -[CNVCardDateComponentsFormatter gregorianCalendar](self, "gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_yearMonthDayDateHourMinuteSecondZFormatter, "setCalendar:", v6);

    -[NSDateFormatter setDateFormat:](self->_yearMonthDayDateHourMinuteSecondZFormatter, "setDateFormat:", CFSTR("y-MM-dd'T'HH:mm:ss'Z'"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_yearMonthDayDateHourMinuteSecondZFormatter, "setLocale:", v7);

    yearMonthDayDateHourMinuteSecondZFormatter = self->_yearMonthDayDateHourMinuteSecondZFormatter;
  }
  return yearMonthDayDateHourMinuteSecondZFormatter;
}

- (id)yearMonthDayDateFormatter
{
  NSDateFormatter *yearMonthDayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;

  yearMonthDayDateFormatter = self->_yearMonthDayDateFormatter;
  if (!yearMonthDayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_yearMonthDayDateFormatter;
    self->_yearMonthDayDateFormatter = v4;

    -[CNVCardDateComponentsFormatter gregorianCalendar](self, "gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_yearMonthDayDateFormatter, "setCalendar:", v6);

    -[NSDateFormatter setDateFormat:](self->_yearMonthDayDateFormatter, "setDateFormat:", CFSTR("y-MM-dd"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_yearMonthDayDateFormatter, "setLocale:", v7);

    yearMonthDayDateFormatter = self->_yearMonthDayDateFormatter;
  }
  return yearMonthDayDateFormatter;
}

- (id)compactYearMonthDayDateFormatter
{
  NSDateFormatter *compactYearMonthDayDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;

  compactYearMonthDayDateFormatter = self->_compactYearMonthDayDateFormatter;
  if (!compactYearMonthDayDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_compactYearMonthDayDateFormatter;
    self->_compactYearMonthDayDateFormatter = v4;

    -[CNVCardDateComponentsFormatter gregorianCalendar](self, "gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_compactYearMonthDayDateFormatter, "setCalendar:", v6);

    -[NSDateFormatter setDateFormat:](self->_compactYearMonthDayDateFormatter, "setDateFormat:", CFSTR("yyyyMMdd"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_compactYearMonthDayDateFormatter, "setLocale:", v7);

    compactYearMonthDayDateFormatter = self->_compactYearMonthDayDateFormatter;
  }
  return compactYearMonthDayDateFormatter;
}

- (id)compactYearMonthDayDateHourMinuteSecondZFormatter
{
  NSDateFormatter *compactYearMonthDayDateHourMinuteSecondZFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;

  compactYearMonthDayDateHourMinuteSecondZFormatter = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
  if (!compactYearMonthDayDateHourMinuteSecondZFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
    self->_compactYearMonthDayDateHourMinuteSecondZFormatter = v4;

    -[CNVCardDateComponentsFormatter gregorianCalendar](self, "gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_compactYearMonthDayDateHourMinuteSecondZFormatter, "setCalendar:", v6);

    -[NSDateFormatter setDateFormat:](self->_compactYearMonthDayDateHourMinuteSecondZFormatter, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss'Z'"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_compactYearMonthDayDateHourMinuteSecondZFormatter, "setLocale:", v7);

    compactYearMonthDayDateHourMinuteSecondZFormatter = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
  }
  return compactYearMonthDayDateHourMinuteSecondZFormatter;
}

- (id)dateComponentsFromString:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v6;

  if (!a3)
    return 0;
  v6 = 0;
  v3 = -[CNVCardDateComponentsFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", &v6, a3, 0);
  v4 = v6;
  if (!v3)
    v4 = 0;
  return v4;
}

- (id)monthDayStringFromDateComponents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "month") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v3, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld"), 1604, objc_msgSend(v3, "month"), objc_msgSend(v3, "day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)yearMonthDayStringFromDateComponents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "year") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v3, "month") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v3, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld"), objc_msgSend(v3, "year"), objc_msgSend(v3, "month"), objc_msgSend(v3, "day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNVCardDateComponentsFormatter yearMonthDayStringFromDateComponents:](self, "yearMonthDayStringFromDateComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[CNVCardDateComponentsFormatter monthDayStringFromDateComponents:](self, "monthDayStringFromDateComponents:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (v8)
        v9 = v8;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  int v9;
  void *v10;
  NSCalendar *gregorianCalendar;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  NSCalendar *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  char v27;
  NSCalendar *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  char v33;
  NSCalendar *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  NSCalendar *v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v8 = a4;
  if (!objc_msgSend(v8, "length"))
  {
    LOBYTE(v16) = 0;
    goto LABEL_16;
  }
  -[CNVCardDateComponentsFormatter yearMonthDayDateFormatter](self, "yearMonthDayDateFormatter");
  v51 = 0;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v46, "getObjectValue:forString:errorDescription:", &v51, v8, a5);
  v10 = 0;
  if (v9)
  {
    gregorianCalendar = self->_gregorianCalendar;
    v12 = v51;
    -[NSCalendar components:fromDate:](gregorianCalendar, "components:fromDate:", 28, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCalendar:", self->_gregorianCalendar);

  }
  -[CNVCardDateComponentsFormatter yearMonthDayDateHourMinuteSecondZFormatter](self, "yearMonthDayDateHourMinuteSecondZFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    -[CNVCardDateComponentsFormatter compactYearMonthDayDateFormatter](self, "compactYearMonthDayDateFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    -[CNVCardDateComponentsFormatter compactYearMonthDayDateHourMinuteSecondZFormatter](self, "compactYearMonthDayDateHourMinuteSecondZFormatter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    -[CNVCardDateComponentsFormatter monthDayDateFormatter](self, "monthDayDateFormatter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v50 = 0;
  v17 = objc_msgSend(v13, "getObjectValue:forString:errorDescription:", &v50, v8, a5);
  v18 = v17;
  if (v17)
  {
    v19 = self->_gregorianCalendar;
    v20 = v50;
    -[NSCalendar components:fromDate:](v19, "components:fromDate:", 28, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setCalendar:", self->_gregorianCalendar);
    v10 = v21;
  }
  -[CNVCardDateComponentsFormatter compactYearMonthDayDateFormatter](self, "compactYearMonthDayDateFormatter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if ((v18 & 1) != 0)
    goto LABEL_10;
  v49 = 0;
  v26 = objc_msgSend(v22, "getObjectValue:forString:errorDescription:", &v49, v8, a5);
  v27 = v26;
  if (v26)
  {
    v28 = self->_gregorianCalendar;
    v42 = v14;
    v29 = v49;
    -[NSCalendar components:fromDate:](v28, "components:fromDate:", 28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setCalendar:", self->_gregorianCalendar);
    v14 = v42;
    v10 = v30;
  }
  -[CNVCardDateComponentsFormatter compactYearMonthDayDateHourMinuteSecondZFormatter](self, "compactYearMonthDayDateHourMinuteSecondZFormatter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  if ((v27 & 1) != 0)
    goto LABEL_11;
  v48 = 0;
  v32 = objc_msgSend(v31, "getObjectValue:forString:errorDescription:", &v48, v8, a5);
  v33 = v32;
  if (v32)
  {
    LODWORD(v40) = v32;
    v43 = v14;
    v34 = self->_gregorianCalendar;
    v35 = v48;
    -[NSCalendar components:fromDate:](v34, "components:fromDate:", 28, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v40;
    objc_msgSend(v36, "setCalendar:", self->_gregorianCalendar);

    v10 = v36;
    v14 = v43;
  }
  -[CNVCardDateComponentsFormatter monthDayDateFormatter](self, "monthDayDateFormatter", v40);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v37;
  if ((v33 & 1) == 0)
  {
    v47 = 0;
    v16 = objc_msgSend(v37, "getObjectValue:forString:errorDescription:", &v47, v8, a5);
    if (v16)
    {
      v44 = self->_gregorianCalendar;
      v41 = v47;
      -[NSCalendar components:fromDate:](v44, "components:fromDate:", 24, v41);
      v45 = a3;
      v38 = v14;
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "setCalendar:", self->_gregorianCalendar);
      v10 = v39;
      v14 = v38;
      a3 = v45;
    }
    goto LABEL_13;
  }
LABEL_12:
  LOBYTE(v16) = 1;
LABEL_13:
  if (a3)
    *a3 = objc_retainAutorelease(v10);

LABEL_16:
  return v16;
}

+ (id)dateComponentsFromALTBDAYString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "dateComponentsFromALTBDAYString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateComponentsFromALTBDAYString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D78];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  +[CNVCardDateScanner scannerWithString:](CNVCardDateScanner, "scannerWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEra:", objc_msgSend(v6, "scanCalendarUnit:", 2));
  objc_msgSend(v5, "setYear:", objc_msgSend(v6, "scanCalendarUnit:", 4));
  objc_msgSend(v5, "setMonth:", objc_msgSend(v6, "scanCalendarUnit:", 8));
  objc_msgSend(v5, "setLeapMonth:", objc_msgSend(v6, "scanLeapMarker"));
  objc_msgSend(v5, "setDay:", objc_msgSend(v6, "scanCalendarUnit:", 16));
  if (objc_msgSend(v5, "day") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v5, "month") == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (id)altBDAYStringFromDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", objc_msgSend(v4, "era"), CFSTR("%04li"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", objc_msgSend(v4, "year"), CFSTR("%04li"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", objc_msgSend(v4, "month"), CFSTR("%02li"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  if (objc_msgSend(v4, "isLeapMonth"))
    objc_msgSend(v5, "appendString:", CFSTR("L"));
  -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", objc_msgSend(v4, "day"), CFSTR("%02li"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v9);

  return v5;
}

- (id)stringForComponentValue:(int64_t)a3 format:(id)a4
{
  __CFString *v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", a4, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearMonthDayDateHourMinuteSecondZFormatter, 0);
  objc_storeStrong((id *)&self->_yearMonthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_compactYearMonthDayDateHourMinuteSecondZFormatter, 0);
  objc_storeStrong((id *)&self->_compactYearMonthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end
