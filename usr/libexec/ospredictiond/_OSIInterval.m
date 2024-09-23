@implementation _OSIInterval

- (BOOL)isValidInterval
{
  NSDate *endDate;
  double v4;

  if (!self->_startDate)
    goto LABEL_5;
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
    if (v4 > 0.0)
    {
      LOBYTE(endDate) = v4 == self->_duration;
      return (char)endDate;
    }
LABEL_5:
    LOBYTE(endDate) = 0;
  }
  return (char)endDate;
}

- (BOOL)hasReasonableDuration
{
  return self->_duration >= 0.0;
}

- (NSString)description
{
  NSDate *startDate;
  void *v4;
  void *v5;
  NSDate *endDate;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  double duration;
  void *v11;

  startDate = self->_startDate;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLocale](NSLocale, "systemLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate descriptionWithLocale:](startDate, "descriptionWithLocale:", v4));

  endDate = self->_endDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLocale](NSLocale, "systemLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate descriptionWithLocale:](endDate, "descriptionWithLocale:", v7));

  v9 = &AnalyticsSendEventLazy_ptr;
  duration = self->_duration;
  LODWORD(v9) = llround(duration);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start = %@ | end = %@ | duration = %d sec / %.1f min / %.2f hr"), v5, v8, v9, duration / 60.0, duration / 3600.0));

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval startDate](self, "startDate"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStartDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval endDate](self, "endDate"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setEndDate:", v8);

  -[_OSIInterval duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  return v4;
}

- (BOOL)localizeDatesWithSecondsFromGMT:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = objc_msgSend(v5, "secondsFromGMT");

  v7 = a3 - (_QWORD)v6;
  if ((id)a3 != v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval startDate](self, "startDate"));
    v9 = (double)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", (double)v7));
    -[_OSIInterval setStartDate:](self, "setStartDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInterval endDate](self, "endDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v9));
    -[_OSIInterval setEndDate:](self, "setEndDate:", v12);

  }
  return a3 != (_QWORD)v6;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
