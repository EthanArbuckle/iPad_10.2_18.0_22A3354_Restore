@implementation STUInterfaceOrientationProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUInterfaceOrientationProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUInterfaceOrientationProvider_iOS;
  -[STUInterfaceOrientationProvider_iOS dealloc](&v3, "dealloc");
}

- (STUInterfaceOrientationProvider_iOS)init
{
  STUInterfaceOrientationProvider_iOS *v2;
  STUInterfaceOrientationProvider_iOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUInterfaceOrientationProvider_iOS;
  v2 = -[STUInterfaceOrientationProvider_iOS init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUInterfaceOrientationProvider_iOS setInterfaceOrientation:](v2, "setInterfaceOrientation:", 0);
  return v3;
}

- (id)key
{
  return CRKDeviceInterfaceOrientationKey;
}

- (id)value
{
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUInterfaceOrientationProvider_iOS interfaceOrientation](self, "interfaceOrientation"));
}

- (void)beginUpdating
{
  CRKInterfaceOrientationMonitor *v3;
  id v4;

  if (!self->mIsMonitoring)
  {
    self->mIsMonitoring = 1;
    v3 = objc_opt_new(CRKInterfaceOrientationMonitor);
    -[STUInterfaceOrientationProvider_iOS setMonitor:](self, "setMonitor:", v3);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[STUInterfaceOrientationProvider_iOS monitor](self, "monitor"));
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("interfaceOrientation"), 4, CFSTR("STUInterfaceOrientationProviderContext"));

  }
}

- (void)endUpdating
{
  void *v3;

  if (self->mIsMonitoring)
  {
    self->mIsMonitoring = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInterfaceOrientationProvider_iOS monitor](self, "monitor"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("interfaceOrientation"), CFSTR("STUInterfaceOrientationProviderContext"));

    -[STUInterfaceOrientationProvider_iOS setMonitor:](self, "setMonitor:", 0);
    -[STUInterfaceOrientationProvider_iOS updateOrientation:](self, "updateOrientation:", 0);
  }
}

+ (id)keyPathsForValuesAffectingValue
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("interfaceOrientation"), 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if (a6 == CFSTR("STUInterfaceOrientationProviderContext"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[STUInterfaceOrientationProvider_iOS monitor](self, "monitor", a3, a4, a5));
    -[STUInterfaceOrientationProvider_iOS updateOrientation:](self, "updateOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STUInterfaceOrientationProvider_iOS;
    -[STUInterfaceOrientationProvider_iOS observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)updateOrientation:(unint64_t)a3
{
  _BOOL4 mIsMonitoring;
  unint64_t v6;

  mIsMonitoring = self->mIsMonitoring;
  v6 = -[STUInterfaceOrientationProvider_iOS interfaceOrientation](self, "interfaceOrientation");
  if (!mIsMonitoring)
  {
    if (!v6)
      return;
    a3 = 0;
    goto LABEL_6;
  }
  if (v6 != a3)
LABEL_6:
    -[STUInterfaceOrientationProvider_iOS setInterfaceOrientation:](self, "setInterfaceOrientation:", a3);
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (CRKInterfaceOrientationMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
