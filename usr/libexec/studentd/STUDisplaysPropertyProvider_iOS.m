@implementation STUDisplaysPropertyProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUDisplaysPropertyProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUDisplaysPropertyProvider_iOS;
  -[STUDisplaysPropertyProvider_iOS dealloc](&v3, "dealloc");
}

- (STUDisplaysPropertyProvider_iOS)initWithInterfaceOrientationProvider:(id)a3
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  STUDisplaysPropertyProvider_iOS *v9;
  STUDisplaysPropertyProvider_iOS *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  v8 = objc_msgSend(v7, "isEqual:", CRKDeviceInterfaceOrientationKey);

  if ((v8 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDisplaysPropertyProvider_iOS.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[interfaceOrientationProvider.key isEqual:CRKDeviceInterfaceOrientationKey]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)STUDisplaysPropertyProvider_iOS;
  v9 = -[STUDisplaysPropertyProvider_iOS init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mInterfaceOrientationProvider, a3);
    -[STUDisplaysPropertyProvider_iOS updateDisplays](v10, "updateDisplays");
  }

  return v10;
}

- (id)key
{
  return CRKDeviceDisplaysKey;
}

- (id)value
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplaysPropertyProvider_iOS displays](self, "displays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_mapUsingBlock:", &stru_1000CB578));

  return v3;
}

- (void)beginUpdating
{
  if (!self->mIsObserving)
  {
    -[STUDevicePropertyProviding addObserver:forKeyPath:options:context:](self->mInterfaceOrientationProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("value"), 0, CFSTR("STUDisplaysPropertyProviderContext"));
    self->mIsObserving = 1;
    -[STUDevicePropertyProviding beginUpdating](self->mInterfaceOrientationProvider, "beginUpdating");
    -[STUDisplaysPropertyProvider_iOS updateDisplays](self, "updateDisplays");
  }
}

- (void)endUpdating
{
  if (self->mIsObserving)
  {
    -[STUDevicePropertyProviding removeObserver:forKeyPath:context:](self->mInterfaceOrientationProvider, "removeObserver:forKeyPath:context:", self, CFSTR("value"), CFSTR("STUDisplaysPropertyProviderContext"));
    self->mIsObserving = 0;
    -[STUDevicePropertyProviding endUpdating](self->mInterfaceOrientationProvider, "endUpdating");
    -[STUDisplaysPropertyProvider_iOS updateDisplays](self, "updateDisplays");
  }
}

- (void)updateDisplays
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKMobileGestalt sharedGestalt](CRKMobileGestalt, "sharedGestalt"));
  objc_msgSend(v3, "mainScreenScale");
  v5 = v4;
  objc_msgSend(v3, "mainScreenSizeInPixels");
  v7 = v6;
  v9 = v8;
  if (self->mIsObserving)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProviding value](self->mInterfaceOrientationProvider, "value"));
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(objc_alloc((Class)CRKDeviceDisplay), "initWithScaleFactor:width:height:orientation:", v11, v5, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUDisplaysPropertyProvider_iOS displays](self, "displays"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  if ((objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
  {
    v16 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    -[STUDisplaysPropertyProvider_iOS setDisplays:](self, "setDisplays:", v15);

  }
}

+ (id)keyPathsForValuesAffectingValue
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("displays"), 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("STUDisplaysPropertyProviderContext"))
  {
    -[STUDisplaysPropertyProvider_iOS updateDisplays](self, "updateDisplays", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STUDisplaysPropertyProvider_iOS;
    -[STUDisplaysPropertyProvider_iOS observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (NSArray)displays
{
  return self->_displays;
}

- (void)setDisplays:(id)a3
{
  objc_storeStrong((id *)&self->_displays, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->mInterfaceOrientationProvider, 0);
}

@end
