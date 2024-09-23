@implementation PLCoreDuetEventInterval

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLCoreDuetEventInterval startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  -[PLCoreDuetEventInterval endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%f, %f)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)intersects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = a3;
  -[PLCoreDuetEventInterval startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  if (v7 >= 5.0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreDuetEventInterval endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10 < 5.0;

  }
  return v11;
}

- (id)joinWithInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[PLCoreDuetEventInterval intersects:](self, "intersects:", v4))
  {
    v5 = (void *)objc_opt_new();
    -[PLCoreDuetEventInterval startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "earlierDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartDate:", v8);

    -[PLCoreDuetEventInterval endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "laterDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndDate:", v11);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
