@implementation BAExtensionRuntime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAExtensionRuntime)init
{
  void *v3;
  BAExtensionRuntime *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = -[BAExtensionRuntime initWithStartDate:](self, "initWithStartDate:", v3);

  return v4;
}

- (BAExtensionRuntime)initWithStartDate:(id)a3
{
  id v4;
  BAExtensionRuntime *v5;
  BAExtensionRuntime *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BAExtensionRuntime;
  v5 = -[BAExtensionRuntime init](&v8, "init");
  v6 = v5;
  if (v5)
    -[BAExtensionRuntime setStartDate:](v5, "setStartDate:", v4);

  return v6;
}

- (BAExtensionRuntime)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BAExtensionRuntime *v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v6 = objc_opt_class(NSKeyedUnarchiver, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)BAExtensionRuntime;
    self = -[BAExtensionRuntime init](&v15, "init");
    if (!self)
      goto LABEL_5;
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v7), CFSTR("startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[BAExtensionRuntime setStartDate:](self, "setStartDate:", v9);

    v10 = (BAExtensionRuntime *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime startDate](self, "startDate"));
    if (v10)
    {
      v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v11), CFSTR("endDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[BAExtensionRuntime setEndDate:](self, "setEndDate:", v13);

      v10 = (BAExtensionRuntime *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
      if (v10)
      {
LABEL_5:
        self = self;
        v10 = self;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_opt_class(NSKeyedArchiver, v4);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime startDate](self, "startDate"));
    objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("startDate"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
    if (v7)
      v8 = objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)v8;
    objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("endDate"));

  }
}

- (double)elapsedTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));

  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime startDate](self, "startDate"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  return v8;
}

- (void)extensionExited
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BAExtensionRuntime setEndDate:](self, "setEndDate:", v3);

}

- (BOOL)isMoreThan24HoursAgo
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(-[BAExtensionRuntime endDate](self, "endDate"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)v4;

  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6 < -86400.0;

  return v7;
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
