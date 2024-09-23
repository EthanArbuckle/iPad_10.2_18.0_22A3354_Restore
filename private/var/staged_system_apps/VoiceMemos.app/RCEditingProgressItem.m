@implementation RCEditingProgressItem

- (RCEditingProgressItem)init
{
  RCEditingProgressItem *v2;
  dispatch_time_t v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCEditingProgressItem;
  v2 = -[RCEditingProgressItem init](&v8, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_time(0, 350000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10007AAE4;
    v5[3] = &unk_1001AC138;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)hasMetTimeThreshold
{
  return self->_hasMetTimeThreshold;
}

- (void)setHasMetTimeThreshold:(BOOL)a3
{
  self->_hasMetTimeThreshold = a3;
}

- (RCEditingProgressDelegate)delegate
{
  return (RCEditingProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
