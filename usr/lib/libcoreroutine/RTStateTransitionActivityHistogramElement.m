@implementation RTStateTransitionActivityHistogramElement

- (RTStateTransitionActivityHistogramElement)initWithActivity:(id)a3
{
  id v4;
  RTStateTransitionActivityHistogramElement *v5;
  uint64_t v6;
  CMMotionActivity *activity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateTransitionActivityHistogramElement;
  v5 = -[RTStateTransitionActivityHistogramElement init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activity = v5->_activity;
    v5->_activity = (CMMotionActivity *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTStateTransitionActivityHistogramElement activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithActivity:", v5);

  -[RTStateTransitionActivityHistogramElement interval](self, "interval");
  objc_msgSend(v6, "setInterval:");
  return v6;
}

- (CMMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
