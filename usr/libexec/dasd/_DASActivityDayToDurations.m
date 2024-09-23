@implementation _DASActivityDayToDurations

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](self, "activityDurations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Date: %@, Activity Durations %@"), v3, v4));

  return v5;
}

- (_DASActivityDayToDurations)initWithDate:(id)a3 activityDurations:(id)a4
{
  id v7;
  id v8;
  _DASActivityDayToDurations *v9;
  _DASActivityDayToDurations *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASActivityDayToDurations;
  v9 = -[_DASActivityDayToDurations init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_activityDurations, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](self, "activityDurations"));
  v7 = objc_msgSend(v4, "initWithDate:activityDurations:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityDurations, CFSTR("activityDurations"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityDayToDurations)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  _DASActivityDayToDurations *v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_opt_class(NSDictionary);
  v8 = objc_opt_class(NSString);
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(NSNumber), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("activityDurations")));

  v12 = 0;
  if (v6)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
    v12 = (_DASActivityDayToDurations *)objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithDate:activityDurations:", v6, v11);

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDictionary)activityDurations
{
  return self->_activityDurations;
}

- (void)setActivityDurations:(id)a3
{
  objc_storeStrong((id *)&self->_activityDurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDurations, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
