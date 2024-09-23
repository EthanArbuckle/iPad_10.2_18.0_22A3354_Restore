@implementation SDAirDropStatus

- (SDAirDropStatus)init
{
  SDAirDropStatus *v2;
  SDAirDropStatus *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *properties;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDAirDropStatus;
  v2 = -[SDAirDropStatus init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SDAirDropStatus stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropStatus;
  -[SDAirDropStatus dealloc](&v3, "dealloc");
}

- (void)setStatusAndNotify
{
  _QWORD block[5];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationAirDropEnabledKey);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B2AC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
  -[SDAirDropStatus setStatusAndNotify](self, "setStatusAndNotify", a3);
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    -[SDAirDropStatus setStatusAndNotify](self, "setStatusAndNotify");
  }
}

- (void)stop
{
  if (self->_started)
    self->_started = 0;
}

- (SDAirDropStatusDelegate)delegate
{
  return (SDAirDropStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
