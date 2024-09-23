@implementation PPTLibraryScrollTest

- (PPTLibraryScrollTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  PPTLibraryScrollTest *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a6;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPTLibraryScrollTest;
  v11 = -[PPTLibraryDependentTest initWithName:options:testDefinition:isMainTest:](&v16, "initWithName:options:testDefinition:isMainTest:", a3, a4, v10, v6);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("warm-scroll")));
    v11->_cold = objc_msgSend(v12, "BOOLValue") ^ 1;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("night-mode")));
    v11->_night = objc_msgSend(v13, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("glitch-free")));
    v11->_glitchFree = objc_msgSend(v14, "BOOLValue");

  }
  return v11;
}

- (void)dealloc
{
  NSTimer *timer;
  objc_super v4;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PPTLibraryScrollTest;
  -[PPTLibraryScrollTest dealloc](&v4, "dealloc");
}

- (int)timeBeforeTest
{
  return 5;
}

- (void)warmImageCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t *v17;
  id v18;
  id location;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PPTLibraryScrollTest timer](self, "timer"));

  if (!v5)
  {
    v6 = sub_1001DA41C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Warming the image cache", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookshelf](self, "bookshelf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));
    objc_msgSend(v9, "setContentOffset:", 0.0, 0.0);
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 0;
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100076C10;
    v14[3] = &unk_1008E72E8;
    objc_copyWeak(&v18, &location);
    v17 = buf;
    v10 = v9;
    v15 = v10;
    v16 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:repeats:block:](NSTimer, "timerWithTimeInterval:repeats:block:", 1, v14, 0.5));
    -[PPTLibraryScrollTest setTimer:](self, "setTimer:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PPTLibraryScrollTest timer](self, "timer"));
    objc_msgSend(v12, "addTimer:forMode:", v13, NSDefaultRunLoopMode);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
}

- (void)startTest
{
  _BOOL4 night;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[5];

  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 590);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  night = self->_night;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = v4;
  if (night)
  {
    objc_msgSend(v4, "setInteger:forKey:", 2, kOverrideLightLevel);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = v4;
    v6 = kOverrideNightMode;
    v7 = 1;
  }
  else
  {
    v6 = kOverrideNightMode;
    v7 = 0;
  }
  objc_msgSend(v4, "setBool:forKey:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "synchronize");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100076E94;
  v11[3] = &unk_1008E72C0;
  v11[4] = self;
  v9 = objc_retainBlock(v11);
  if (!self->_glitchFree)
  {
    if (!self->_cold)
    {
      -[PPTLibraryScrollTest warmImageCache:](self, "warmImageCache:", v9);
      goto LABEL_8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v10, "cleanCache");

  }
  ((void (*)(_QWORD *))v9[2])(v9);
LABEL_8:

}

- (BOOL)cold
{
  return self->_cold;
}

- (void)setCold:(BOOL)a3
{
  self->_cold = a3;
}

- (BOOL)night
{
  return self->_night;
}

- (void)setNight:(BOOL)a3
{
  self->_night = a3;
}

- (BOOL)glitchFree
{
  return self->_glitchFree;
}

- (void)setGlitchFree:(BOOL)a3
{
  self->_glitchFree = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
