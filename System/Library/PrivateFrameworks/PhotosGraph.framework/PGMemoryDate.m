@implementation PGMemoryDate

- (PGMemoryDate)initWithLocalDate:(id)a3
{
  id v4;
  PGMemoryDate *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGMemoryDate;
  v5 = -[PGMemoryDate init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_era = objc_msgSend(v6, "era");
    v5->_year = objc_msgSend(v6, "year");
    v5->_month = objc_msgSend(v6, "month");
    v5->_day = objc_msgSend(v6, "day");

  }
  return v5;
}

- (id)universalDateInTimeZone:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setEra:", self->_era);
  objc_msgSend(v6, "setYear:", self->_year);
  objc_msgSend(v6, "setMonth:", self->_month);
  objc_msgSend(v6, "setDay:", self->_day);
  objc_msgSend(v6, "setHour:", 2);
  objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:inTimeZone:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
