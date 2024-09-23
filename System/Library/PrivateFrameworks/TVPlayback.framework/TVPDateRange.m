@implementation TVPDateRange

- (TVPDateRange)initWithStartDate:(id)a3 duration:(double)a4
{
  id v7;
  TVPDateRange *v8;
  TVPDateRange *v9;
  uint64_t v10;
  NSDate *endDate;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVPDateRange;
  v8 = -[TVPDateRange init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startDate, a3);
    v9->_durationInSeconds = a4;
    objc_msgSend(v7, "dateByAddingTimeInterval:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v10;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TVPDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDate:", v7))
    {
      -[TVPDateRange endDate](self, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDate:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TVPDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TVPDateRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPDateRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPDateRange durationInSeconds](self, "durationInSeconds");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Start date: %@ End Date:%@ Duration: %f "), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateRangeByIntersectingDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  TVPDateRange *v20;

  v4 = a3;
  -[TVPDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[TVPDateRange durationInSeconds](self, "durationInSeconds");
  v10 = v8 + v9;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v4, "durationInSeconds");
  v14 = v13;

  v15 = v12 + v14;
  if (v10 >= v12 + v14)
    v16 = v12 + v14;
  else
    v16 = v10;
  v17 = v12 <= v8 && v8 < v15;
  v18 = v5;
  if (v17 || (v8 <= v12 ? (v19 = v12 < v10) : (v19 = 0), v8 = v12, v18 = v6, v19))
    v20 = -[TVPDateRange initWithStartDate:duration:]([TVPDateRange alloc], "initWithStartDate:duration:", v18, v16 - v8);
  else
    v20 = 0;

  return v20;
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[TVPDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[TVPDateRange durationInSeconds](self, "durationInSeconds");
  v9 = v7 + v8;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v11 = v10;

  return v11 <= v9 && v11 >= v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
