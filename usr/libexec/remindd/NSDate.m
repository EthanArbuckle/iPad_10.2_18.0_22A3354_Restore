@implementation NSDate

- (BOOL)ic_isToday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v7));
  v9 = objc_msgSend(v5, "isEqualToDate:", v8);

  return v9;
}

- (BOOL)ic_isYesterday
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v4));
  v6 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v6, "setDay:", -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v6, v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 28, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFromComponents:", v9));

  LOBYTE(v8) = objc_msgSend(v5, "isEqualToDate:", v10);
  return (char)v8;
}

- (NSString)ic_localDateWithSeconds
{
  if (qword_100852738 != -1)
    dispatch_once(&qword_100852738, &stru_1007D9988);
  return (NSString *)objc_msgSend((id)qword_100852730, "stringFromDate:", self);
}

- (NSString)ic_shortFormattedDate
{
  uint64_t *v3;

  if (-[NSDate ic_isToday](self, "ic_isToday") || -[NSDate ic_isYesterday](self, "ic_isYesterday"))
  {
    if (qword_100852748 != -1)
      dispatch_once(&qword_100852748, &stru_1007D99A8);
    v3 = &qword_100852740;
  }
  else
  {
    if (qword_100852758 != -1)
      dispatch_once(&qword_100852758, &stru_1007D99C8);
    v3 = &qword_100852750;
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v3, "stringFromDate:", self));
}

- (NSString)ic_briefFormattedDate
{
  NSDate *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v4 = -[NSDate isEqual:](v2, "isEqual:", v3);

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

    v2 = (NSDate *)v5;
  }
  if (-[NSDate ic_isToday](v2, "ic_isToday"))
  {
    if (qword_100852768 != -1)
      dispatch_once(&qword_100852768, &stru_1007D99E8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100852760, "stringFromDate:", v2));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "components:fromDate:", 28, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFromComponents:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -1, v10, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v10, 0));
    if ((id)-[NSDate compare:](v2, "compare:", v11) == (id)1 || (id)-[NSDate compare:](v2, "compare:", v12) != (id)1)
    {
      if (qword_100852788 != -1)
        dispatch_once(&qword_100852788, &stru_1007D9A28);
      v13 = &qword_100852780;
    }
    else
    {
      if (qword_100852778 != -1)
        dispatch_once(&qword_100852778, &stru_1007D9A08);
      v13 = &qword_100852770;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v13, "stringFromDate:", v2));

  }
  return (NSString *)v6;
}

- (BOOL)ic_isEarlierThanDate:(id)a3
{
  return -[NSDate compare:](self, "compare:", a3) == NSOrderedAscending;
}

- (BOOL)ic_isLaterThanDate:(id)a3
{
  return (id)-[NSDate compare:](self, "compare:", a3) == (id)1;
}

- (id)jsonify
{
  uint64_t v2;
  NSDate *v3;
  id result;
  id v5;

  v2 = qword_100837398;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_100837398, sub_1003A5818);
  result = objc_msgSend((id)qword_100871EB8, "stringFromDate:", v3);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
