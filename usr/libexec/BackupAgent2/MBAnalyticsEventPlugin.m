@implementation MBAnalyticsEventPlugin

- (id)startingBackupWithEngine:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[MBAnalyticsEventPlugin setStartTime:](self, "setStartTime:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsEvent"));

  objc_msgSend(v5, "setMetric:value:", CFSTR("total"), 1);
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  return 0;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsEvent"));
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "setMetric:value:", CFSTR("failed"), 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsEvent"));
    objc_msgSend(v10, "setError:", v6);
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v12 = v11;
    -[MBAnalyticsEventPlugin startTime](self, "startTime");
    objc_msgSend(v9, "setMetric:value:", CFSTR("duration"), (unint64_t)(v12 - v13));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsEvent"));
    objc_msgSend(v10, "setMetric:value:", CFSTR("successes"), 1);
  }

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[MBAnalyticsEventPlugin setStartTime:](self, "setStartTime:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsEvent"));

  objc_msgSend(v6, "setMetric:value:", CFSTR("total"), 1);
  return 0;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsEvent"));
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "setMetric:value:", CFSTR("failed"), 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsEvent"));
    objc_msgSend(v11, "setError:", v7);
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v13 = v12;
    -[MBAnalyticsEventPlugin startTime](self, "startTime");
    objc_msgSend(v10, "setMetric:value:", CFSTR("duration"), (unint64_t)(v13 - v14));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsEvent"));
    objc_msgSend(v11, "setMetric:value:", CFSTR("successes"), 1);
  }

  return 0;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

@end
