@implementation SiriCoreSiriDaemonLaunchContext

- (SiriCoreSiriDaemonLaunchContext)initWithLaunchArguments:(id)a3
{
  SiriCoreSiriDaemonLaunchContext *v3;
  SiriCoreSiriDaemonLaunchContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriCoreSiriDaemonLaunchContext;
  v3 = -[SiriCoreSiriDaemonLaunchContext init](&v6, sel_init, a3);
  v4 = v3;
  if (v3)
    -[SiriCoreSiriDaemonLaunchContext setDaemonType:](v3, "setDaemonType:", 1);
  return v4;
}

- (int64_t)daemonType
{
  return self->_daemonType;
}

- (void)setDaemonType:(int64_t)a3
{
  self->_daemonType = a3;
}

@end
