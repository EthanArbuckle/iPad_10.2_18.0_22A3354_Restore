@implementation BSUIWeeklyProgressDay

- (BSUIWeeklyProgressDay)initWithType:(int64_t)a3 progress:(double)a4 text:(id)a5 dateShortString:(id)a6
{
  id v11;
  id v12;
  BSUIWeeklyProgressDay *v13;
  BSUIWeeklyProgressDay *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BSUIWeeklyProgressDay;
  v13 = -[BSUIWeeklyProgressDay init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_progress = a4;
    objc_storeStrong((id *)&v13->_text, a5);
    objc_storeStrong((id *)&v14->_dateShortString, a6);
  }

  return v14;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[BSUIWeeklyProgressDay type](self, "type");
  -[BSUIWeeklyProgressDay progress](self, "progress");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressDay text](self, "text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressDay dateShortString](self, "dateShortString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) type=%ld progress=%.3f text=%@ dateShortString=%@ >"), v5, self, v6, v8, v9, v10));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = objc_opt_class(BSUIWeeklyProgressDay);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7
    && (v8 = -[BSUIWeeklyProgressDay type](self, "type"), v8 == objc_msgSend(v7, "type"))
    && (-[BSUIWeeklyProgressDay progress](self, "progress"), v10 = v9, objc_msgSend(v7, "progress"), v10 == v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressDay text](self, "text"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    if (objc_msgSend(v12, "isEqualToString:", v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWeeklyProgressDay dateShortString](self, "dateShortString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateShortString"));
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (double)progress
{
  return self->_progress;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)dateShortString
{
  return self->_dateShortString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateShortString, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
