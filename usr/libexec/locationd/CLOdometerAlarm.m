@implementation CLOdometerAlarm

- (CLOdometerAlarm)init
{
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Use the designated initializer"));
  return 0;
}

- (CLOdometerAlarm)initWithDistance:(double)a3 inUniverse:(id)a4 handler:(id)a5
{
  CLOdometerAlarm *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLOdometerAlarm;
  v8 = -[CLOdometerAlarm init](&v10, "init");
  if (v8)
  {
    if ((objc_msgSend(objc_msgSend(a4, "vendor"), "isServiceEnabled:", CFSTR("CLOdometerAlarmManager")) & 1) != 0)
    {
      -[CLOdometerAlarm setOdometerTarget:](v8, "setOdometerTarget:", a3);
      -[CLOdometerAlarm setHandler:](v8, "setHandler:", a5);
      -[CLOdometerAlarm setManager:](v8, "setManager:", objc_msgSend(objc_msgSend(a4, "vendor"), "proxyForService:", CFSTR("CLOdometerAlarmManager")));
      -[CLOdometerAlarmManagerProtocol addAlarm:](-[CLOdometerAlarm manager](v8, "manager"), "addAlarm:", v8);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CLOdometerAlarm setHandler:](self, "setHandler:", 0);
  -[CLOdometerAlarm setManager:](self, "setManager:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLOdometerAlarm;
  -[CLOdometerAlarm dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  objc_sync_enter(self);
  -[CLOdometerAlarm setInvalid:](self, "setInvalid:", 1);
  objc_sync_exit(self);
  -[CLOdometerAlarmManagerProtocol removeAlarm:](-[CLOdometerAlarm manager](self, "manager"), "removeAlarm:", self);
}

- (void)fire:(double)a3 withError:(id)a4
{
  unsigned __int8 v7;
  void (**v8)(id, CLOdometerAlarm *, id, double);

  objc_sync_enter(self);
  v7 = -[CLOdometerAlarm invalid](self, "invalid");
  objc_sync_exit(self);
  if ((v7 & 1) == 0)
  {
    v8 = -[CLOdometerAlarm handler](self, "handler");
    v8[2](v8, self, a4, a3);
  }
}

- (double)odometerTarget
{
  return self->odometerTarget;
}

- (void)setOdometerTarget:(double)a3
{
  self->odometerTarget = a3;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)invalid
{
  return self->invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->invalid = a3;
}

- (CLOdometerAlarmManagerProtocol)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
