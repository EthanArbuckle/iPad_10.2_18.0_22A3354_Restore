@implementation AppInfo

- (unsigned)state
{
  return self->_state;
}

- (BOOL)isApp
{
  return self->_isApp;
}

- (BOOL)isAlive
{
  return self->_isAlive;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)supportsBackgroundedCentrals
{
  return self->_supportsBackgroundedCentrals;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIsApp:(BOOL)a3
{
  self->_isApp = a3;
}

- (void)setIsAlive:(BOOL)a3
{
  self->_isAlive = a3;
}

- (AppInfo)initWithPID:(int)a3 isApp:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  AppInfo *v6;
  AppInfo *v7;
  objc_super v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)AppInfo;
  v6 = -[AppInfo init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[AppInfo setPid:](v6, "setPid:", v5);
    -[AppInfo setIsApp:](v7, "setIsApp:", v4);
    -[AppInfo setIsAlive:](v7, "setIsAlive:", (_DWORD)v5 != 0);
    -[AppInfo setState:](v7, "setState:", 1);
  }
  return v7;
}

+ (id)appInfoWithPID:(int)a3 isApp:(BOOL)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithPID:isApp:", *(_QWORD *)&a3, a4);
}

- (void)setSupportsBackgroundedCentrals:(BOOL)a3
{
  self->_supportsBackgroundedCentrals = a3;
}

- (BOOL)supportsBackgroundedPeripherals
{
  return self->_supportsBackgroundedPeripherals;
}

- (void)setSupportsBackgroundedPeripherals:(BOOL)a3
{
  self->_supportsBackgroundedPeripherals = a3;
}

@end
