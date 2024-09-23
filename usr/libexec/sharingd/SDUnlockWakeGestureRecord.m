@implementation SDUnlockWakeGestureRecord

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockWakeGestureRecord date](self, "date"));
  v7 = -[SDUnlockWakeGestureRecord onWrist](self, "onWrist");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, date:%@, on wrist:%@>"), v5, self, v6, v8));

  return v9;
}

- (BOOL)onWrist
{
  return self->_onWrist;
}

- (void)setOnWrist:(BOOL)a3
{
  self->_onWrist = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
