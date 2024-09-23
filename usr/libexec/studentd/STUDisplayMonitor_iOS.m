@implementation STUDisplayMonitor_iOS

- (STUDisplayMonitor_iOS)init
{
  STUDisplayMonitor_iOS *v2;
  STUDisplaysPropertyProvider_iOS *v3;
  void *v4;
  STUDisplaysPropertyProvider_iOS *v5;
  STUDevicePropertyProviding *displaysProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUDisplayMonitor_iOS;
  v2 = -[STUDisplayMonitor_iOS init](&v8, "init");
  if (v2)
  {
    v3 = [STUDisplaysPropertyProvider_iOS alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayMonitor_iOS interfaceOrientationProvider](v2, "interfaceOrientationProvider"));
    v5 = -[STUDisplaysPropertyProvider_iOS initWithInterfaceOrientationProvider:](v3, "initWithInterfaceOrientationProvider:", v4);
    displaysProvider = v2->_displaysProvider;
    v2->_displaysProvider = (STUDevicePropertyProviding *)v5;

  }
  return v2;
}

- (STUDevicePropertyProviding)displayHeightProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  STUStaticPropertyProvider *v6;
  uint64_t v7;
  double v8;
  void *v9;
  STUStaticPropertyProvider *v10;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayMonitor_iOS displaysProvider](self, "displaysProvider"));
  v3 = objc_opt_class(STUDisplaysPropertyProvider_iOS);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDisplayMonitor_iOS displayHeightProvider]"));
    v14 = (objc_class *)objc_opt_class(STUDisplaysPropertyProvider_iOS);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (objc_class *)objc_opt_class(v2);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("STUDisplayMonitor_iOS.m"), 46, CFSTR("expected %@, got %@"), v16, v19);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = [STUStaticPropertyProvider alloc];
  v7 = CRKDeviceDisplayHeightKey;
  objc_msgSend(v5, "frame");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  v10 = -[STUStaticPropertyProvider initWithKey:value:](v6, "initWithKey:value:", v7, v9);

  return (STUDevicePropertyProviding *)v10;
}

- (STUDevicePropertyProviding)displayWidthProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  STUStaticPropertyProvider *v6;
  uint64_t v7;
  double v8;
  void *v9;
  STUStaticPropertyProvider *v10;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayMonitor_iOS displaysProvider](self, "displaysProvider"));
  v3 = objc_opt_class(STUDisplaysPropertyProvider_iOS);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDisplayMonitor_iOS displayWidthProvider]"));
    v14 = (objc_class *)objc_opt_class(STUDisplaysPropertyProvider_iOS);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (objc_class *)objc_opt_class(v2);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("STUDisplayMonitor_iOS.m"), 52, CFSTR("expected %@, got %@"), v16, v19);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = [STUStaticPropertyProvider alloc];
  v7 = CRKDeviceDisplayWidthKey;
  objc_msgSend(v5, "frame");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  v10 = -[STUStaticPropertyProvider initWithKey:value:](v6, "initWithKey:value:", v7, v9);

  return (STUDevicePropertyProviding *)v10;
}

- (STUDevicePropertyProviding)displayScaleFactorProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  STUStaticPropertyProvider *v6;
  uint64_t v7;
  void *v8;
  STUStaticPropertyProvider *v9;
  void *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplayMonitor_iOS displaysProvider](self, "displaysProvider"));
  v3 = objc_opt_class(STUDisplaysPropertyProvider_iOS);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDisplayMonitor_iOS displayScaleFactorProvider]"));
    v13 = (objc_class *)objc_opt_class(STUDisplaysPropertyProvider_iOS);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (objc_class *)objc_opt_class(v2);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("STUDisplayMonitor_iOS.m"), 58, CFSTR("expected %@, got %@"), v15, v18);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = [STUStaticPropertyProvider alloc];
  v7 = CRKDeviceDisplayBackingScaleFactorKey;
  objc_msgSend(v5, "scaleFactor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9 = -[STUStaticPropertyProvider initWithKey:value:](v6, "initWithKey:value:", v7, v8);

  return (STUDevicePropertyProviding *)v9;
}

- (STUDevicePropertyProviding)interfaceOrientationProvider
{
  return (STUDevicePropertyProviding *)objc_opt_new(STUInterfaceOrientationProvider_iOS);
}

- (STUDevicePropertyProviding)displaysProvider
{
  return self->_displaysProvider;
}

- (void)setDisplaysProvider:(id)a3
{
  objc_storeStrong((id *)&self->_displaysProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaysProvider, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationProvider, 0);
}

@end
