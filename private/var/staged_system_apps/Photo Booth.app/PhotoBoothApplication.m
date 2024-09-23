@implementation PhotoBoothApplication

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PhotoBoothApplication;
  -[PhotoBoothApplication dealloc](&v3, "dealloc");
}

- (id)mainWindow
{
  id result;
  id v4;

  result = self->_window;
  if (!result)
  {
    v4 = objc_alloc((Class)UIWindow);
    -[UIScreen bounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "bounds");
    result = objc_msgSend(v4, "initWithContentRect:");
    self->_window = (UIWindow *)result;
  }
  return result;
}

- (id)rootViewController
{
  return self->_photoBoothController;
}

- (void)prepareForDefaultImageSnapshot
{
  -[PBController prepareForDefaultImageSnapshot](self->_photoBoothController, "prepareForDefaultImageSnapshot");
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4;
  id v5;
  PBController *v6;

  v4 = -[PhotoBoothApplication isRunningTest](self, "isRunningTest", a3);
  if ((_DWORD)v4)
    v4 = -[NSUserDefaults removePersistentDomainForName:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "removePersistentDomainForName:", -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier"));
  PLDebugEnableCoreDataMultithreadedAsserts(v4);
  v5 = -[PhotoBoothApplication mainWindow](self, "mainWindow");
  v6 = objc_alloc_init(PBController);
  self->_photoBoothController = v6;
  -[PhotoBoothApplication setDelegate:](self, "setDelegate:", v6);
  objc_msgSend(v5, "setRootViewController:", self->_photoBoothController);
  objc_msgSend(-[PBController view](self->_photoBoothController, "view"), "setNeedsLayout");
  objc_msgSend(v5, "makeKeyAndVisible");
  if ((objc_opt_respondsToSelector(-[PhotoBoothApplication delegate](self, "delegate"), "applicationDidFinishLaunching:") & 1) != 0)objc_msgSend(-[PhotoBoothApplication delegate](self, "delegate"), "applicationDidFinishLaunching:", self);
}

- (NSString)currentTestName
{
  return self->currentTestName;
}

- (void)setCurrentTestName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)animationDidStart
{
  -[PhotoBoothApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("animation"), -[PhotoBoothApplication currentTestName](self, "currentTestName"));
}

- (void)animationDidStop
{
  -[PhotoBoothApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", CFSTR("animation"), -[PhotoBoothApplication currentTestName](self, "currentTestName"));
  +[PhotoBoothApplication notifyAnimationTestCompletedIfNecessary](PhotoBoothApplication, "notifyAnimationTestCompletedIfNecessary");
}

+ (id)testingAnimationDelegate
{
  id v2;

  v2 = objc_msgSend(a1, "sharedApplication");
  if (objc_msgSend(v2, "isRunningTest"))
    return v2;
  else
    return 0;
}

- (id)_extendLaunchTest
{
  return CFSTR("curtainOpened");
}

+ (void)notifyAnimationTestCompletedIfNecessary
{
  NSNotificationCenter *v2;

  if (objc_msgSend(objc_msgSend(a1, "sharedApplication"), "isRunningTest"))
  {
    v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v2, "postNotificationName:object:", off_100043470, 0);
  }
}

- (void)startedAnimationTest:(id)a3 cleanupBlock:(id)a4
{
  NSNotificationCenter *v7;
  id v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_10001B814;
  v14 = sub_10001B824;
  v15 = 0;
  v7 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B830;
  v9[3] = &unk_100034F30;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = &v10;
  v8 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v7, "addObserverForName:object:queue:usingBlock:", off_100043470, 0, 0, v9);
  v11[5] = (uint64_t)v8;
  -[PhotoBoothApplication startedTest:](self, "startedTest:", a3);
  _Block_object_dispose(&v10, 8);
}

- (void)startedAnimationTest:(id)a3
{
  -[PhotoBoothApplication startedAnimationTest:cleanupBlock:](self, "startedAnimationTest:cleanupBlock:", a3, 0);
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  unsigned __int8 v7;
  objc_super v8;

  if ((objc_msgSend(a3, "isEqualToString:", -[PhotoBoothApplication _launchTestName](self, "_launchTestName")) & 1) != 0|| !-[PhotoBoothApplication isRunningTest](self, "isRunningTest"))
  {
    v8.receiver = self;
    v8.super_class = (Class)PhotoBoothApplication;
    -[PhotoBoothApplication finishedTest:extraResults:](&v8, "finishedTest:extraResults:", a3, a4);
    -[PhotoBoothApplication setCurrentTestName:](self, "setCurrentTestName:", 0);
  }
  else
  {
    v7 = -[PhotoBoothApplication currentTestRequestsShelfSuppression](self, "currentTestRequestsShelfSuppression");
    v8.receiver = self;
    v8.super_class = (Class)PhotoBoothApplication;
    -[PhotoBoothApplication finishedTest:extraResults:](&v8, "finishedTest:extraResults:", a3, a4);
    -[PhotoBoothApplication setCurrentTestName:](self, "setCurrentTestName:", 0);
    if ((v7 & 1) == 0)
      -[PBController hideShelf:](self->_photoBoothController, "hideShelf:", 0);
  }
}

- (BOOL)currentTestRequestsShelfSuppression
{
  NSString *v2;

  v2 = -[PhotoBoothApplication currentTestName](self, "currentTestName");
  if (v2)
    LOBYTE(v2) = -[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("Shelf")) == (id)0x7FFFFFFFFFFFFFFFLL;
  return (char)v2;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  PBController *photoBoothController;
  id v8;
  BOOL v9;
  dispatch_time_t v10;
  _QWORD *v11;
  dispatch_time_t v13;
  objc_super v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD block[7];
  _QWORD v19[8];
  _QWORD v20[7];

  photoBoothController = self->_photoBoothController;
  v8 = objc_msgSend(-[PBController effectsController](photoBoothController, "effectsController"), "effectsView");
  -[PhotoBoothApplication setCurrentTestName:](self, "setCurrentTestName:", a3);
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("SwitchCamera")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
    -[PBController hideShelf:](self->_photoBoothController, "hideShelf:", 0);
    v10 = dispatch_time(0, 2000000000);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001BD74;
    v20[3] = &unk_100034A98;
    v20[4] = self;
    v20[5] = a3;
    v20[6] = photoBoothController;
    v11 = v20;
LABEL_11:
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
    return 1;
  }
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("PresentSingleEffect")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
    v10 = dispatch_time(0, 2000000000);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001BDA4;
    v19[3] = &unk_100034F58;
    v19[4] = self;
    v19[5] = v8;
    v19[6] = a3;
    v19[7] = photoBoothController;
    v11 = v19;
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("PresentEffectGrid")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
    -[PBController hideShelf:](self->_photoBoothController, "hideShelf:", 0);
    v10 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BE64;
    block[3] = &unk_100034A98;
    block[4] = self;
    block[5] = a3;
    block[6] = photoBoothController;
    v11 = block;
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("ScrollShelf")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BE94;
    v17[3] = &unk_100034AE8;
    v17[4] = self;
    v17[5] = a3;
    -[PhotoBoothApplication _ensureMinimumShelfAssetCount:thenRun:](self, "_ensureMinimumShelfAssetCount:thenRun:", 40, v17);
    return 1;
  }
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("RotateSingleEffect")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a3, "rangeOfString:", CFSTR("RotateSelectedImage")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[PhotoBoothApplication setCurrentTestName:](self, "setCurrentTestName:", 0);
      v14.receiver = self;
      v14.super_class = (Class)PhotoBoothApplication;
      return -[PhotoBoothApplication runTest:options:](&v14, "runTest:options:", a3, a4);
    }
    else
    {
      -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
      v9 = 1;
      -[PhotoBoothApplication rotateIfNeeded:](self, "rotateIfNeeded:", 1);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001BFE0;
      v15[3] = &unk_100034AE8;
      v15[4] = self;
      v15[5] = a3;
      -[PhotoBoothApplication _ensureMinimumShelfAssetCount:thenRun:](self, "_ensureMinimumShelfAssetCount:thenRun:", 1, v15);
    }
  }
  else
  {
    -[PhotoBoothApplication _ensureEffectsView:mode:](self, "_ensureEffectsView:mode:", v8, 0);
    v9 = 1;
    -[PhotoBoothApplication rotateIfNeeded:](self, "rotateIfNeeded:", 1);
    v13 = dispatch_time(0, 2000000000);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001BFB0;
    v16[3] = &unk_100034AE8;
    v16[4] = self;
    v16[5] = a3;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v16);
  }
  return v9;
}

+ (id)dummyButton
{
  if (qword_100043570 != -1)
    dispatch_once(&qword_100043570, &stru_100034FA0);
  return (id)qword_100043568;
}

- (void)_ensureMinimumShelfAssetCount:(unint64_t)a3 thenRun:(id)a4
{
  id v7;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD block[7];

  if (-[PBController shelfAssetCount](self->_photoBoothController, "shelfAssetCount") >= a3)
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    v7 = -[PBController effectsController](self->_photoBoothController, "effectsController");
    objc_msgSend(v7, "takePicture:", objc_msgSend((id)objc_opt_class(self, v8), "dummyButton"));
    v9 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C248;
    block[3] = &unk_100034FC8;
    block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_ensureEffectsView:(id)a3 mode:(int64_t)a4
{
  id v7;

  v7 = objc_msgSend(a3, "mode");
  if (a4)
  {
    if (a4 == 1 && v7 != (id)1)
      -[PBController toggleEffectsMode:](self->_photoBoothController, "toggleEffectsMode:", self);
  }
  else
  {
    if (v7)
      objc_msgSend(a3, "ppt_simulateEffectLayerTap:", CFSTR("PBThermalFilter"));
    -[PBController setCurrentMode:](self->_photoBoothController, "setCurrentMode:", 1);
  }
}

@end
