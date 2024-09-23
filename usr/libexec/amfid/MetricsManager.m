@implementation MetricsManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C1D8;
  block[3] = &unk_1000251A0;
  block[4] = a1;
  if (qword_100029610 != -1)
    dispatch_once(&qword_100029610, block);
  return (id)qword_100029608;
}

- (MetricsManager)init
{
  MetricsManager *v2;
  _TtC5amfid29ConstraintUsageMetricsManager *v3;
  _TtC5amfid29ConstraintUsageMetricsManager *constraintUsageMetrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MetricsManager;
  v2 = -[MetricsManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(_TtC5amfid29ConstraintUsageMetricsManager);
    constraintUsageMetrics = v2->_constraintUsageMetrics;
    v2->_constraintUsageMetrics = v3;

  }
  return v2;
}

- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6
{
  -[ConstraintUsageMetricsManager recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:](self->_constraintUsageMetrics, "recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:", a3, a4, a5, a6);
}

- (void)clean
{
  -[ConstraintUsageMetricsManager clean](self->_constraintUsageMetrics, "clean");
}

- (void)report
{
  -[ConstraintUsageMetricsManager report](self->_constraintUsageMetrics, "report");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintUsageMetrics, 0);
}

@end
