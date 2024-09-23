@implementation NSDateInterval

- (id)unionWithDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (-[NSDateInterval intersectsDateInterval:](self, "intersectsDateInterval:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval startDate](self, "startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "earlierDate:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateInterval endDate](self, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laterDate:", v9));

    if (objc_msgSend(v7, "isBeforeDate:", v10))
      v11 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v7, v10);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
