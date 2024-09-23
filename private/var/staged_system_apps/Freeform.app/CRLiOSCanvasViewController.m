@implementation CRLiOSCanvasViewController

- (CRLiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CRLiOSCanvasViewController *v4;
  CRLiOSCanvasViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSCanvasViewController;
  v4 = -[CRLiOSCanvasViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    sub_1002946C8(v4);
  return v5;
}

- (CRLiOSCanvasViewController)initWithCoder:(id)a3
{
  CRLiOSCanvasViewController *v3;
  CRLiOSCanvasViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSCanvasViewController;
  v3 = -[CRLiOSCanvasViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    sub_1002946C8(v3);
  return v4;
}

- (CRLiOSCanvasViewController)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSCanvasViewController *v5;
  CRLiOSCanvasViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasViewController;
  v5 = -[CRLiOSCanvasViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    sub_1002946C8(v5);
    -[CRLiOSCanvasViewController setInteractiveCanvasController:](v6, "setInteractiveCanvasController:", v4);
  }

  return v6;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 1;
}

- (id)backgroundColorForMagnifier
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *mSceneWillEnterForegroundObserver;
  void *v8;
  NSObject *mSceneDidEnterBackgroundObserver;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->mSceneWillEnterForegroundObserver)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "removeObserver:", self->mSceneWillEnterForegroundObserver);

      mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
      self->mSceneWillEnterForegroundObserver = 0;

    }
    if (self->mSceneDidEnterBackgroundObserver)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "removeObserver:", self->mSceneDidEnterBackgroundObserver);

      mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
      self->mSceneDidEnterBackgroundObserver = 0;

    }
    objc_storeWeak((id *)&self->mDelegate, obj);
    -[CRLiOSCanvasViewController p_setupWillEnterForegroundObserver](self, "p_setupWillEnterForegroundObserver");
    -[CRLiOSCanvasViewController p_setupDidEnterBackgroundObserver](self, "p_setupDidEnterBackgroundObserver");
    v5 = obj;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (!self->mSceneWillEnterForegroundObserver)
    -[CRLiOSCanvasViewController p_setupWillEnterForegroundObserver](self, "p_setupWillEnterForegroundObserver");
  if (!self->mSceneDidEnterBackgroundObserver)
    -[CRLiOSCanvasViewController p_setupDidEnterBackgroundObserver](self, "p_setupDidEnterBackgroundObserver");
  -[CRLiOSCanvasViewController becomeFirstResponderIfAppropriate](self, "becomeFirstResponderIfAppropriate");
}

- (void)p_setupWillEnterForegroundObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *mSceneWillEnterForegroundObserver;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneWillEnterForeground](NSNotification, "CRLiOSSceneWillEnterForeground"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100294AC0;
    v11[3] = &unk_10124B250;
    objc_copyWeak(&v12, &location);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, v5, v8, v11));
    mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
    self->mSceneWillEnterForegroundObserver = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)p_setupDidEnterBackgroundObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *mSceneDidEnterBackgroundObserver;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidEnterBackground](NSNotification, "CRLiOSSceneDidEnterBackground"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100294C68;
    v11[3] = &unk_10124B250;
    objc_copyWeak(&v12, &location);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, v5, v8, v11));
    mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
    self->mSceneDidEnterBackgroundObserver = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLiOSCanvasViewController;
  if (-[CRLiOSCanvasViewController respondsToSelector:](&v13, "respondsToSelector:"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLiOSCanvasViewController;
    v5 = -[CRLiOSCanvasViewController methodSignatureForSelector:](&v12, "methodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)qword_1014152D8;
    if (!qword_1014152D8)
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s%s%s"), "v", "@", ":", "@")));
      v9 = objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", objc_msgSend(v8, "UTF8String")));
      v10 = (void *)qword_1014152D8;
      qword_1014152D8 = v9;

      v7 = (void *)qword_1014152D8;
    }
    v6 = v7;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasViewController;
  if (-[CRLiOSCanvasViewController respondsToSelector:](&v10, "respondsToSelector:", a3))
  {
    v7 = 1;
  }
  else if (+[CRLInteractiveCanvasController selectorIsActionMethod:](CRLInteractiveCanvasController, "selectorIsActionMethod:", a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = objc_msgSend(v8, "respondsToSelector:withSender:", a3, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return -[CRLiOSCanvasViewController respondsToSelector:withSender:](self, "respondsToSelector:withSender:", a3, 0);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "invokeWithTarget:", v5);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->mHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B270);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16C00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B290);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 373, 0, "CVC should have been torn down before dealloc");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController dealloc](&v6, "dealloc");
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC8Freeform20CRLiOSPencilMediator *mPencilMediator;
  _TtC8Freeform30CRLiOSAlignmentToolsController *mAlignmentController;
  _TtC8Freeform30CRLiOSAlignmentToolsController *v9;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *miniFormatterPresenter;
  id WeakRetained;

  if (-[CRLiOSCanvasViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v3, "teardown");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v4, "setGestureRecognizers:", 0);

  }
  +[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:scribbleObserver:scribbleActive:](CRLiOSScribbleInteractionSetupHelper, "setupScribbleEditingProvider:scribbleObserver:scribbleActive:", self, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  objc_msgSend(v6, "removeToolkitObserver:", self);

  -[CRLiOSCanvasViewController leaveQuickSelectModeIfNeeded](self, "leaveQuickSelectModeIfNeeded");
  -[CRLiOSPencilMediator teardown](self->mPencilMediator, "teardown");
  mPencilMediator = self->mPencilMediator;
  self->mPencilMediator = 0;

  mAlignmentController = self->mAlignmentController;
  if (mAlignmentController)
  {
    -[CRLiOSAlignmentToolsController dismissAlignmentTools](mAlignmentController, "dismissAlignmentTools");
    v9 = self->mAlignmentController;
    self->mAlignmentController = 0;

  }
  -[CRLMiniFormatterStateManager teardown](self->_miniFormatterPresenter, "teardown");
  miniFormatterPresenter = self->_miniFormatterPresenter;
  self->_miniFormatterPresenter = 0;

  self->mHasBeenTornDown = 1;
  -[CRLiOSCanvasViewController resignFirstResponder](self, "resignFirstResponder");
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  objc_msgSend(WeakRetained, "layerHostHasBeenTornDown");

}

- (void)viewDidLoad
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  UIDragInteraction *v27;
  UIDragInteraction *mDragInteraction;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  UIPointerInteraction *v42;
  UIPointerInteraction *mPointerInteraction;
  id v44;
  void *v45;
  id v46;
  CRLCanvasRepEnterExitNotifier *v47;
  id v48;
  CRLCanvasRepEnterExitNotifier *v49;
  CRLCanvasRepEnterExitNotifier *mEnterExitNotifier;
  id v51;
  void *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewDidLoad](&v53, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);

    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B2F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E16D0C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B310);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController viewDidLoad]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 411, 0, "invalid nil value for '%{public}s'", "mICC");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v8, "viewScale");
    v10 = v9;

    v11 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v3, "setController:", v11);

    v12 = objc_loadWeakRetained((id *)&self->mICC);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvas"));
    objc_msgSend(v13, "setViewScale:", v10);

    v14 = objc_loadWeakRetained((id *)&self->mICC);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvas"));
    +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
    objc_msgSend(v15, "i_setContentsScale:");

    objc_msgSend(v3, "setMultipleTouchEnabled:", 1);
    objc_msgSend(v3, "setExclusiveTouch:", 1);
    objc_msgSend(v3, "setClearsContextBeforeDrawing:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
    v17 = v16;
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));

      if (!v18)
      {
        v19 = objc_loadWeakRetained((id *)&self->mICC);
        objc_msgSend(v17, "setDelegate:", v19);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasLayer](self, "canvasLayer"));
      objc_msgSend(v20, "fixFrameAndScrollView");

      objc_msgSend(v17, "setAutoresizesSubviews:", 0);
      objc_msgSend(v17, "setDelaysContentTouches:", 0);
      objc_msgSend(v17, "setCanCancelContentTouches:", 1);
    }
    v21 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v21, "setTextGesturesInFlight:", 0);

    -[CRLiOSCanvasViewController setUpGestureRecognizers](self, "setUpGestureRecognizers");
    if (-[CRLiOSCanvasViewController canReceiveSystemDrops](self, "canReceiveSystemDrops"))
    {
      v22 = objc_alloc((Class)UIDropInteraction);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dropInteractionDelegate](self, "dropInteractionDelegate"));
      v24 = objc_msgSend(v22, "initWithDelegate:", v23);
      objc_msgSend(v3, "addInteraction:", v24);

    }
    if (-[CRLiOSCanvasViewController canOriginateSystemDrags](self, "canOriginateSystemDrags"))
    {
      v25 = objc_alloc((Class)UIDragInteraction);
      v26 = objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteractionDelegate](self, "dragInteractionDelegate"));
      v27 = (UIDragInteraction *)objc_msgSend(v25, "initWithDelegate:", v26);
      mDragInteraction = self->mDragInteraction;
      self->mDragInteraction = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
      objc_msgSend(v3, "addInteraction:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
      objc_msgSend(v30, "setAllowsSimultaneousRecognitionDuringLift:", 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
      LOBYTE(v26) = objc_opt_respondsToSelector(v31, "_setAdditionalTouchesCancelLift:");

      if ((v26 & 1) != 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
        objc_msgSend(v32, "_setAdditionalTouchesCancelLift:", 1);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
      objc_msgSend(v33, "setEnabled:", 1);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
      v35 = objc_opt_respondsToSelector(v34, "_setAllowsPointerDragBeforeLiftDelay:");

      if ((v35 & 1) != 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
        objc_msgSend(v36, "_setAllowsPointerDragBeforeLiftDelay:", 0);

      }
      -[CRLiOSCanvasViewController p_setDragLiftDelay:](self, "p_setDragLiftDelay:", 0.7);
    }
    v37 = objc_alloc((Class)UIContextMenuInteraction);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController contextMenuInteractionDelegate](self, "contextMenuInteractionDelegate"));
    v39 = objc_msgSend(v37, "initWithDelegate:", v38);

    objc_msgSend(v3, "addInteraction:", v39);
    v40 = objc_alloc((Class)UIPointerInteraction);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController pointerInteractionDelegate](self, "pointerInteractionDelegate"));
    v42 = (UIPointerInteraction *)objc_msgSend(v40, "initWithDelegate:", v41);
    mPointerInteraction = self->mPointerInteraction;
    self->mPointerInteraction = v42;

    objc_msgSend(v3, "addInteraction:", self->mPointerInteraction);
    v44 = objc_alloc((Class)UIEditMenuInteraction);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController contextMenuInteractionDelegate](self, "contextMenuInteractionDelegate"));
    v46 = objc_msgSend(v44, "initWithDelegate:", v45);

    objc_msgSend(v46, "setPresentsContextMenuAsSecondaryAction:", 0);
    -[CRLiOSCanvasViewController setEditMenuInteraction:](self, "setEditMenuInteraction:", v46);
    objc_msgSend(v3, "addInteraction:", v46);
    v47 = [CRLCanvasRepEnterExitNotifier alloc];
    v48 = objc_loadWeakRetained((id *)&self->mICC);
    v49 = -[CRLCanvasRepEnterExitNotifier initWithInteractiveCanvasController:](v47, "initWithInteractiveCanvasController:", v48);
    mEnterExitNotifier = self->mEnterExitNotifier;
    self->mEnterExitNotifier = v49;

    v51 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v51, "layoutInvalidated");

    if (!-[CRLiOSCanvasViewController shouldPreventBecomingFirstResponderOnViewLoad](self, "shouldPreventBecomingFirstResponderOnViewLoad"))-[CRLiOSCanvasViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B2B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16C80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B2D0);
    v52 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController viewDidLoad]"));
    v39 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v39, 406, 0, "invalid nil value for '%{public}s'", "canvasView");
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v5, "i_setCanvasIsWideGamut:", objc_msgSend(v6, "displayGamut") == (id)1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "p_handleSqueezePaletteViewWillShowNotification:", PKPencilSqueezeInteractionWillShowPaletteViewNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, PKPencilSqueezeInteractionWillShowPaletteViewNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v6, "currentlyScrolling"))
    -[CRLiOSCanvasViewController forceStopScrolling](self, "forceStopScrolling");
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);

}

- (void)setView:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSCanvasViewController;
  v4 = a3;
  -[CRLiOSCanvasViewController setView:](&v12, "setView:", v4);
  *(_QWORD *)&v6 = objc_opt_class(CRLCanvasLayer, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer", v6, v12.receiver, v12.super_class));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_storeWeak((id *)&self->mCanvasLayer, v11);

}

- (CRLCanvasLayer)canvasLayer
{
  return (CRLCanvasLayer *)objc_loadWeakRetained((id *)&self->mCanvasLayer);
}

- (CRLCanvasView)canvasView
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasView, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (CRLCanvasView *)v8;
}

- (CALayer)layer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));

  return (CALayer *)v3;
}

- (BOOL)isInFocusedContainer
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  unsigned __int8 v7;

  if (!-[CRLiOSCanvasViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (objc_msgSend(v4, "isKeyWindow"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textInputResponder"));
    v7 = objc_msgSend(v6, "isFirstResponder");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)willUpdateLayerTree
{
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[UIPointerInteraction invalidate](self->mPointerInteraction, "invalidate");
}

- (void)addCommonObservers
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_accessibilityInvertColorsDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_keyWindowDidChange:", UIWindowDidBecomeKeyNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_keyWindowDidChange:", UIWindowDidResignKeyNotification, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("CRLSelectAndScrollWithApplePencil"), 0, 0);

}

- (void)removeCommonObservers
{
  void *v3;
  NSObject *mSceneWillEnterForegroundObserver;
  NSObject *mSceneDidEnterBackgroundObserver;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = v3;
  if (self->mSceneWillEnterForegroundObserver)
  {
    objc_msgSend(v3, "removeObserver:");
    mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
    self->mSceneWillEnterForegroundObserver = 0;

    v3 = v7;
  }
  if (self->mSceneDidEnterBackgroundObserver)
  {
    objc_msgSend(v7, "removeObserver:");
    mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
    self->mSceneDidEnterBackgroundObserver = 0;

    v3 = v7;
  }
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIAccessibilityInvertColorsStatusDidChangeNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIWindowDidBecomeKeyNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIWindowDidResignKeyNotification, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("CRLSelectAndScrollWithApplePencil"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v13 != v11)
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)CRLiOSCanvasViewController;
    -[CRLiOSCanvasViewController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_6;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("CRLSelectAndScrollWithApplePencil"));

  if (!v14)
    goto LABEL_5;
  -[CRLiOSCanvasViewController p_pencilShouldSelectAndScrollPreferenceDidChange](self, "p_pencilShouldSelectAndScrollPreferenceDidChange");
LABEL_6:

}

- (void)p_accessibilityInvertColorsDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3));
  objc_msgSend(v3, "invalidateAllLayers");

}

- (void)p_willEnterForeground:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelReps"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "willEnterForeground");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)p_didEnterBackground:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelReps"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "didEnterBackground");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)p_applicationDidBecomeActive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelReps"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "i_applicationDidBecomeActive");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)p_keyWindowDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v4 == v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topLevelReps"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "layerHostContainerFocusDidChange");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)hitRepWithTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v10, "convertBoundsToUnscaledPoint:", v7, v9);
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hitRep:", v12, v14));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B330);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16D98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B350);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController hitRepWithTouch:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 652, 0, "invalid nil value for '%{public}s'", "touch");

    v16 = 0;
  }

  return v16;
}

- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v6, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v12, "convertBoundsToUnscaledPoint:", v9, v11);
    v14 = v13;
    v16 = v15;

    v17 = sub_10033831C((_BOOL8)objc_msgSend(v6, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hitKnobAtPoint:inputType:returningRep:", v17, a4, v14, v16));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B370);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16E24();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B390);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController hitKnobWithTouch:returningRep:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 666, 0, "invalid nil value for '%{public}s'", "touch");

    v19 = 0;
    if (a4)
      *a4 = 0;
  }

  return v19;
}

- (BOOL)canvasSubview:(id)a3 shouldHandleEventAtBoundsPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = objc_msgSend(v8, "i_isRepContentPlatformView:", v7) ^ 1;
  if ((v9 & 1) != 0)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_msgSend(v8, "convertBoundsToUnscaledPoint:", x, y);
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitKnobAtPoint:inputType:returningRep:", 1, 0));
    if (v14)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitRep:", v11, v13));
      v17 = v16;
      if (v16
        && objc_msgSend(v16, "directlyManagesContentPlatformView")
        && objc_msgSend(v17, "wantsContentPlatformViewEventHandling"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentPlatformView"));
        if (v18)
          v15 = objc_msgSend(v7, "isDescendantOfView:", v18) | v9;
        else
          LOBYTE(v15) = 0;

      }
      else
      {
        LOBYTE(v15) = 0;
      }

    }
  }

  return v15;
}

- (NSArray)commonGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController multiSelectGestureRecognizer](self, "multiSelectGestureRecognizer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController repDragGestureRecognizer](self, "repDragGestureRecognizer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController repRotateGestureRecognizer](self, "repRotateGestureRecognizer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController repRotateKnobGestureRecognizer](self, "repRotateKnobGestureRecognizer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController nudgeGestureRecognizer](self, "nudgeGestureRecognizer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0));

  return (NSArray *)v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  CRLiOSPencilDownGestureRecognizer *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CRLiOSPencilDownGestureRecognizer *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  unsigned __int8 v40;
  BOOL v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  CRLInteractiveCanvasController **p_mICC;
  id WeakRetained;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  id v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v6 = (CRLiOSPencilDownGestureRecognizer *)a3;
  v7 = a4;
  if (objc_msgSend(v7, "type") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screen"));
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coordinateSpace"));
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v22, v10, v12);
    v24 = v23;
    v26 = v25;

    v58.origin.x = v15;
    v58.origin.y = v17;
    v58.size.width = v19;
    v58.size.height = v21;
    if (v26 >= CGRectGetMaxY(v58) + -30.0)
    {
      v59.origin.x = v15;
      v59.origin.y = v17;
      v59.size.width = v19;
      v59.size.height = v21;
      if (v24 <= CGRectGetMinX(v59) + 30.0
        || (v60.origin.x = v15,
            v60.origin.y = v17,
            v60.size.width = v19,
            v60.size.height = v21,
            v24 >= CGRectGetMaxX(v60) + -30.0))
      {

LABEL_30:
        v41 = 0;
        goto LABEL_31;
      }
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  objc_msgSend(v7, "locationInView:", v8);
  v28 = v27;
  v30 = v29;
  v31 = (CRLiOSPencilDownGestureRecognizer *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"));

  if (v31 == v6)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
    if (objc_msgSend(v32, "isMenuVisible"))
    {
      self->mContextMenuMightBeDisplayed = 1;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController contextMenuInteractionDelegate](self, "contextMenuInteractionDelegate"));
      self->mContextMenuMightBeDisplayed = objc_msgSend(v33, "currentlyDisplayingMenu");

    }
  }
  if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", v28, v30)
    || -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v6, v28, v30))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v34, "crl_isCompactWidth")
      && -[CRLiOSCanvasViewController inInspectorPanZoomMode](self, "inInspectorPanZoomMode")
      || -[CRLiOSCanvasViewController inMediaBrowsingMode](self, "inMediaBrowsingMode"))
    {

LABEL_19:
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "gestureRecognizers"));
      v38 = objc_msgSend(v37, "containsObject:", v6);

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        -[CRLiOSCanvasViewController addInspectorPanZoomModeGRsToArray:](self, "addInspectorPanZoomModeGRsToArray:", v39);
        v40 = objc_msgSend(v39, "containsObject:", v6);

        if ((v40 & 1) == 0)
          goto LABEL_30;
      }
      goto LABEL_26;
    }
    v35 = -[CRLiOSCanvasViewController inInspectorTextEditingMode](self, "inInspectorTextEditingMode");

    if (v35)
      goto LABEL_19;
    if (!-[CRLiOSCanvasViewController inRestrictedGestureMode](self, "inRestrictedGestureMode"))
      goto LABEL_26;
  }
  else if (!-[CRLiOSCanvasViewController inRestrictedGestureMode](self, "inRestrictedGestureMode"))
  {
    goto LABEL_30;
  }
  if (!-[CRLiOSCanvasViewController allowGestureInRestrictedGestureMode:](self, "allowGestureInRestrictedGestureMode:", v6))goto LABEL_30;
LABEL_26:
  if (self->mPencilDownGestureRecognizer == v6)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v43 = objc_opt_respondsToSelector(v42, "currentDocumentMode");

    if ((v43 & 1) == 0
      || (v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate")),
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "currentDocumentMode")),
          v44,
          v46 = objc_msgSend(v45, "pencilModeType"),
          v45,
          !v46))
    {
      p_mICC = &self->mICC;
      WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
      objc_msgSend(v7, "locationInView:", v50);
      objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
      v52 = v51;
      v54 = v53;

      v55 = objc_loadWeakRetained((id *)p_mICC);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "freehandDrawingToolkit"));
      v57 = objc_msgSend(v56, "freehandDrawingBehaviorForTouchType:atUnscaledPoint:", 2, v52, v54);

      v41 = v57 == (id)1;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v41 = 1;
LABEL_31:

  return v41;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  double v11;
  unsigned __int8 v12;
  unsigned int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController rectangularMarqueeGestureRecognizer](self, "rectangularMarqueeGestureRecognizer"));
  if (v8 == v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController gesturesThatImmediateMarqueeShouldRequireToFail](self, "gesturesThatImmediateMarqueeShouldRequireToFail"));
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
    {
      -[CRLiOSRectangularMarqueeGestureRecognizer minimumPressDuration](self->mRectangularMarqueeGestureRecognizer, "minimumPressDuration");
      if (v11 <= 0.02)
      {
        v12 = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {

  }
  v12 = 0;
LABEL_6:
  v13 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1);
  if ((v12 & 1) == 0 && v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v15 = objc_opt_respondsToSelector(v14, "currentDocumentMode");

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentDocumentMode"));

      v12 = objc_msgSend(v17, "gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", v6, v7);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)setUpGestureRecognizers
{
  CRLiOSTapGestureRecognizer *v3;
  CRLiOSPencilDownGestureRecognizer *v4;
  CRLiOSTapGestureRecognizer *v5;
  CRLiOSEditMenuTapGestureRecognizer *v6;
  void *v7;
  CRLiOSKnobDragGestureRecognizer *v8;
  id WeakRetained;
  CRLiOSKnobDragGestureRecognizer *v10;
  CRLiOSMultiSelectGestureRecognizer *v11;
  id v12;
  CRLiOSMultiSelectGestureRecognizer *v13;
  CRLiOSRepDragGestureRecognizer *v14;
  id v15;
  CRLiOSRepDragGestureRecognizer *v16;
  CRLiOSRepNudgeGestureRecognizer *v17;
  id v18;
  CRLiOSRepNudgeGestureRecognizer *v19;
  CRLiOSRepRotateGestureRecognizer *v20;
  id v21;
  CRLiOSRepRotateGestureRecognizer *v22;
  CRLiOSRepRotateKnobGestureRecognizer *v23;
  id v24;
  CRLiOSRepRotateKnobGestureRecognizer *v25;
  CRLiOSAllTouchesDoneGestureRecognizer *v26;
  CRLiOSAllTouchesDoneGestureRecognizer *v27;
  CRLiOSCanvasZoomPinchGestureRecognizer *v28;
  CRLiOSPreventScrollGestureRecognizer *v29;
  id v30;
  CRLiOSPreventScrollGestureRecognizer *v31;
  CRLiOSFreehandDrawingGestureRecognizer *v32;
  id v33;
  CRLiOSFreehandDrawingGestureRecognizer *v34;
  id *p_mFreehandDrawingGestureRecognizer;
  id v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  CRLiOSRectangularMarqueeGestureRecognizer *v47;
  void *v48;
  CRLiOSRectangularMarqueeGestureRecognizer *v49;
  id v50;
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *v51;
  id v52;
  void *v53;
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *v54;
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *mPencilHoverGestureHandler;
  UIHoverGestureRecognizer *v56;
  UIHoverGestureRecognizer *mPencilHoverGestureRecognizer;
  CRLiOSRepRotateKnobGestureRecognizer *v58;
  CRLiOSCanvasZoomPinchGestureRecognizer *v59;
  CRLiOSAllTouchesDoneGestureRecognizer *v60;
  CRLiOSRepRotateGestureRecognizer *v61;
  CRLiOSRepNudgeGestureRecognizer *v62;
  CRLiOSRepDragGestureRecognizer *v63;
  CRLiOSMultiSelectGestureRecognizer *v64;
  CRLiOSKnobDragGestureRecognizer *v65;
  CRLiOSEditMenuTapGestureRecognizer *v66;
  CRLiOSTapGestureRecognizer *v67;
  CRLiOSPencilDownGestureRecognizer *v68;
  void *v69;

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v3 = -[CRLiOSTapGestureRecognizer initWithTarget:action:]([CRLiOSTapGestureRecognizer alloc], "initWithTarget:action:", self, "p_handleSingleTapGesture:");
  -[CRLiOSTapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[CRLiOSTapGestureRecognizer setName:](v3, "setName:", CFSTR("Single Tap"));
  objc_msgSend(v69, "addGestureRecognizer:", v3);
  -[CRLiOSCanvasViewController setSingleTapGestureRecognizer:](self, "setSingleTapGestureRecognizer:", v3);
  v4 = -[CRLiOSPencilDownGestureRecognizer initWithTarget:action:]([CRLiOSPencilDownGestureRecognizer alloc], "initWithTarget:action:", self, "p_handlePencilDown:");
  -[CRLiOSPencilDownGestureRecognizer setName:](v4, "setName:", CFSTR("CVCPencilDown"));
  -[CRLiOSPencilDownGestureRecognizer setDelegate:](v4, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v4);
  v68 = v4;
  -[CRLiOSCanvasViewController setPencilDownGestureRecognizer:](self, "setPencilDownGestureRecognizer:", v4);
  v5 = -[CRLiOSTapGestureRecognizer initWithTarget:action:]([CRLiOSTapGestureRecognizer alloc], "initWithTarget:action:", self, "handleDoubleTap:");
  -[CRLiOSTapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2);
  -[CRLiOSTapGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[CRLiOSTapGestureRecognizer setName:](v5, "setName:", CFSTR("Double tap"));
  objc_msgSend(v69, "addGestureRecognizer:", v5);
  v67 = v5;
  -[CRLiOSCanvasViewController setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v5);
  v6 = -[CRLiOSEditMenuTapGestureRecognizer initWithTarget:action:]([CRLiOSEditMenuTapGestureRecognizer alloc], "initWithTarget:action:", self, "p_handleTapForEditMenu:");
  -[CRLiOSEditMenuTapGestureRecognizer setDelegate:](v6, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"));
  -[CRLiOSEditMenuTapGestureRecognizer requireGestureRecognizerToFail:](v6, "requireGestureRecognizerToFail:", v7);

  objc_msgSend(v69, "addGestureRecognizer:", v6);
  v66 = v6;
  -[CRLiOSCanvasViewController setEditMenuTapGestureRecognizer:](self, "setEditMenuTapGestureRecognizer:", v6);
  v8 = [CRLiOSKnobDragGestureRecognizer alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v10 = -[CRLiOSKnobDragGestureRecognizer initWithInteractiveCanvasController:](v8, "initWithInteractiveCanvasController:", WeakRetained);

  -[CRLiOSKnobDragGestureRecognizer setDelegate:](v10, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v10);
  v65 = v10;
  -[CRLiOSCanvasViewController setKnobDragGestureRecognizer:](self, "setKnobDragGestureRecognizer:", v10);
  v11 = [CRLiOSMultiSelectGestureRecognizer alloc];
  v12 = objc_loadWeakRetained((id *)&self->mICC);
  v13 = -[CRLiOSMultiSelectGestureRecognizer initWithInteractiveCanvasController:](v11, "initWithInteractiveCanvasController:", v12);

  -[CRLiOSMultiSelectGestureRecognizer setDelegate:](v13, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v13);
  v64 = v13;
  -[CRLiOSCanvasViewController setMultiSelectGestureRecognizer:](self, "setMultiSelectGestureRecognizer:", v13);
  v14 = [CRLiOSRepDragGestureRecognizer alloc];
  v15 = objc_loadWeakRetained((id *)&self->mICC);
  v16 = -[CRLiOSRepDragGestureRecognizer initWithInteractiveCanvasController:](v14, "initWithInteractiveCanvasController:", v15);

  -[CRLiOSRepDragGestureRecognizer setDelegate:](v16, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v16);
  v63 = v16;
  -[CRLiOSCanvasViewController setRepDragGestureRecognizer:](self, "setRepDragGestureRecognizer:", v16);
  v17 = [CRLiOSRepNudgeGestureRecognizer alloc];
  v18 = objc_loadWeakRetained((id *)&self->mICC);
  v19 = -[CRLiOSRepNudgeGestureRecognizer initWithInteractiveCanvasController:](v17, "initWithInteractiveCanvasController:", v18);

  -[CRLiOSRepNudgeGestureRecognizer setDelegate:](v19, "setDelegate:", self);
  -[CRLiOSRepNudgeGestureRecognizer setAllowedTouchTypes:](v19, "setAllowedTouchTypes:", &off_1012CB788);
  objc_msgSend(v69, "addGestureRecognizer:", v19);
  v62 = v19;
  -[CRLiOSCanvasViewController setNudgeGestureRecognizer:](self, "setNudgeGestureRecognizer:", v19);
  v20 = [CRLiOSRepRotateGestureRecognizer alloc];
  v21 = objc_loadWeakRetained((id *)&self->mICC);
  v22 = -[CRLiOSRepRotateGestureRecognizer initWithInteractiveCanvasController:](v20, "initWithInteractiveCanvasController:", v21);

  -[CRLiOSRepRotateGestureRecognizer setDelegate:](v22, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v22);
  -[CRLiOSRepRotateGestureRecognizer setName:](v22, "setName:", CFSTR("rotate finger"));
  v61 = v22;
  -[CRLiOSCanvasViewController setRepRotateGestureRecognizer:](self, "setRepRotateGestureRecognizer:", v22);
  v23 = [CRLiOSRepRotateKnobGestureRecognizer alloc];
  v24 = objc_loadWeakRetained((id *)&self->mICC);
  v25 = -[CRLiOSRepRotateKnobGestureRecognizer initWithInteractiveCanvasController:](v23, "initWithInteractiveCanvasController:", v24);

  -[CRLiOSRepRotateKnobGestureRecognizer setDelegate:](v25, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v25);
  -[CRLiOSRepRotateKnobGestureRecognizer setName:](v25, "setName:", CFSTR("rotate knob"));
  v58 = v25;
  -[CRLiOSCanvasViewController setRepRotateKnobGestureRecognizer:](self, "setRepRotateKnobGestureRecognizer:", v25);
  v26 = -[CRLiOSAllTouchesDoneGestureRecognizer initWithTarget:action:]([CRLiOSAllTouchesDoneGestureRecognizer alloc], "initWithTarget:action:", self, "p_allTouchesDone:");
  -[CRLiOSAllTouchesDoneGestureRecognizer setDelegate:](v26, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v26);
  v60 = v26;
  -[CRLiOSCanvasViewController setAllTouchesDoneGestureRecognizer:](self, "setAllTouchesDoneGestureRecognizer:", v26);
  v27 = -[CRLiOSAllTouchesDoneGestureRecognizer initWithTarget:action:]([CRLiOSAllTouchesDoneGestureRecognizer alloc], "initWithTarget:action:", self, "p_allTouchesDone:");
  -[CRLiOSAllTouchesDoneGestureRecognizer setDelegate:](v27, "setDelegate:", self);
  -[CRLiOSAllTouchesDoneGestureRecognizer setAllowedTouchTypes:](v27, "setAllowedTouchTypes:", &off_1012CB7A0);
  objc_msgSend(v69, "addGestureRecognizer:", v27);
  -[CRLiOSAllTouchesDoneGestureRecognizer setName:](v27, "setName:", CFSTR("indirect"));
  objc_storeStrong((id *)&self->mAllIndirectPointerTouchesDoneGestureRecognizer, v27);
  v28 = -[CRLiOSCanvasZoomPinchGestureRecognizer initWithTarget:action:]([CRLiOSCanvasZoomPinchGestureRecognizer alloc], "initWithTarget:action:", self, "p_zoomWithGesture:");
  -[CRLiOSCanvasZoomPinchGestureRecognizer setDelegate:](v28, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v28);
  v59 = v28;
  -[CRLiOSCanvasViewController setZoomGestureRecognizer:](self, "setZoomGestureRecognizer:", v28);
  -[CRLiOSCanvasViewController i_updateZoomGestureRecognizer](self, "i_updateZoomGestureRecognizer");
  v29 = [CRLiOSPreventScrollGestureRecognizer alloc];
  v30 = objc_loadWeakRetained((id *)&self->mICC);
  v31 = -[CRLiOSPreventScrollGestureRecognizer initWithInteractiveCanvasController:](v29, "initWithInteractiveCanvasController:", v30);

  -[CRLiOSPreventScrollGestureRecognizer setDelegate:](v31, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v31);
  objc_storeStrong((id *)&self->mPreventScrollGestureRecognizer, v31);
  v32 = [CRLiOSFreehandDrawingGestureRecognizer alloc];
  v33 = objc_loadWeakRetained((id *)&self->mICC);
  v34 = -[CRLiOSFreehandDrawingGestureRecognizer initWithInteractiveCanvasController:](v32, "initWithInteractiveCanvasController:", v33);

  -[CRLiOSFreehandDrawingGestureRecognizer setDelegate:](v34, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v34);
  p_mFreehandDrawingGestureRecognizer = (id *)&self->mFreehandDrawingGestureRecognizer;
  objc_storeStrong((id *)&self->mFreehandDrawingGestureRecognizer, v34);
  v36 = objc_loadWeakRetained((id *)&self->mDelegate);
  v37 = objc_opt_respondsToSelector(v36, "pencilKitCanvasViewControllerForCanvasViewController:");

  if ((v37 & 1) != 0)
  {
    v38 = objc_loadWeakRetained((id *)&self->mDelegate);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pencilKitCanvasViewControllerForCanvasViewController:", self));

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "pencilKitCanvasView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_hoverGestureRecognizer"));

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_hoverGestureRecognizer"));
      objc_msgSend(v69, "addGestureRecognizer:", v42);

    }
  }
  v43 = *p_mFreehandDrawingGestureRecognizer;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"));
  objc_msgSend(v43, "requireGestureRecognizerToFail:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "freehandDrawingToolkit"));
  objc_msgSend(*p_mFreehandDrawingGestureRecognizer, "setEnabled:", v46 != 0);

  v47 = [CRLiOSRectangularMarqueeGestureRecognizer alloc];
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v49 = -[CRLiOSRectangularMarqueeGestureRecognizer initWithInteractiveCanvasController:](v47, "initWithInteractiveCanvasController:", v48);

  -[CRLiOSRectangularMarqueeGestureRecognizer setDelegate:](v49, "setDelegate:", self);
  objc_msgSend(v69, "addGestureRecognizer:", v49);
  -[CRLiOSCanvasViewController setRectangularMarqueeGestureRecognizer:](self, "setRectangularMarqueeGestureRecognizer:", v49);
  v50 = objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", self, "p_handleHoverGesture:");
  objc_msgSend(v69, "addGestureRecognizer:", v50);
  v51 = [_TtC8Freeform31CRLiOSPencilHoverGestureHandler alloc];
  v52 = objc_loadWeakRetained((id *)&self->mICC);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController pencilMediator](self, "pencilMediator"));
  v54 = -[CRLiOSPencilHoverGestureHandler initWithInteractiveCanvasController:pencilMediator:](v51, "initWithInteractiveCanvasController:pencilMediator:", v52, v53);
  mPencilHoverGestureHandler = self->mPencilHoverGestureHandler;
  self->mPencilHoverGestureHandler = v54;

  v56 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", self->mPencilHoverGestureHandler, "handleHoverGesture:");
  mPencilHoverGestureRecognizer = self->mPencilHoverGestureRecognizer;
  self->mPencilHoverGestureRecognizer = v56;

  -[UIHoverGestureRecognizer setAllowedTouchTypes:](self->mPencilHoverGestureRecognizer, "setAllowedTouchTypes:", &off_1012CB7B8);
  objc_msgSend(v69, "addGestureRecognizer:", self->mPencilHoverGestureRecognizer);
  -[CRLiOSCanvasViewController p_setUpWPGestureRecognizers](self, "p_setUpWPGestureRecognizers");
  -[CRLiOSCanvasViewController setUpCommonGestureAllowedTouchTypes](self, "setUpCommonGestureAllowedTouchTypes");

}

- (id)gesturesSupportingStylusAndIndirectPointer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController immediateDoubleTapGestureRecognizer](self, "immediateDoubleTapGestureRecognizer"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController tapAndTouchGestureRecognizer](self, "tapAndTouchGestureRecognizer"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController doubleTapAndTouchGestureRecognizer](self, "doubleTapAndTouchGestureRecognizer"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController immediatePressGestureRecognizer](self, "immediatePressGestureRecognizer"));
  v9[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));

  return v7;
}

- (void)modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController gesturesSupportingStylusAndIndirectPointer](self, "gesturesSupportingStylusAndIndirectPointer", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allowedTouchTypes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v11));
        objc_msgSend(v9, "setAllowedTouchTypes:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)p_setUpWPGestureRecognizers
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *gestureRecognizers;
  CRLWPTapAndTouchGestureRecognizer *v6;
  void *v7;
  CRLWPTapAndTouchGestureRecognizer *v8;
  void *v9;
  CRLWPLongPressGestureRecognizer *v10;
  void *v11;
  CRLWPImmediatePressGestureRecognizer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLWPTapGestureRecognizer *v17;
  void *v18;
  CRLWPTapGestureRecognizer *v19;
  CRLWPTapGestureRecognizer *secondarySingleTapGestureRecognizer;
  void *v21;
  CRLWPTapGestureRecognizer *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gestureDispatcher"));

  v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  gestureRecognizers = self->_gestureRecognizers;
  self->_gestureRecognizers = v4;

  v6 = -[CRLWPTapAndTouchGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPTapAndTouchGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPDoubleTapAndTouch"));
  -[CRLWPTapAndTouchGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v6));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v6);
  -[CRLiOSCanvasViewController setDoubleTapAndTouchGestureRecognizer:](self, "setDoubleTapAndTouchGestureRecognizer:", v6);
  v8 = -[CRLWPTapAndTouchGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPTapAndTouchGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPTapAndTouch"));
  -[CRLWPTapAndTouchGestureRecognizer setNumberOfTapsRequired:](v8, "setNumberOfTapsRequired:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v8));
  objc_msgSend(v9, "addGestureRecognizer:", v8);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v8);
  -[CRLiOSCanvasViewController setTapAndTouchGestureRecognizer:](self, "setTapAndTouchGestureRecognizer:", v8);
  v10 = -[CRLWPLongPressGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPLongPressGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPLongPress"));
  -[CRLWPLongPressGestureRecognizer setNumberOfTapsRequired:](v10, "setNumberOfTapsRequired:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v10));
  objc_msgSend(v11, "addGestureRecognizer:", v10);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v10);
  -[CRLiOSCanvasViewController setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v10);
  -[CRLWPLongPressGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &off_1012CB7D0);
  v12 = -[CRLWPImmediatePressGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPImmediatePressGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPImmediatePress"));
  -[CRLWPImmediatePressGestureRecognizer setMaximumNumberOfTouches:](v12, "setMaximumNumberOfTouches:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v12));
  objc_msgSend(v13, "addGestureRecognizer:", v12);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v12);
  -[CRLiOSCanvasViewController setImmediatePressGestureRecognizer:](self, "setImmediatePressGestureRecognizer:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController immediatePressGestureRecognizer](self, "immediatePressGestureRecognizer"));
  objc_msgSend(v14, "setDisallowOptionKey:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController immediatePressGestureRecognizer](self, "immediatePressGestureRecognizer"));
  objc_msgSend(v16, "setCanvasView:", v15);

  -[CRLWPImmediatePressGestureRecognizer setAllowedTouchTypes:](v12, "setAllowedTouchTypes:", &off_1012CB7E8);
  v17 = -[CRLWPTapGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPImmediateDoubleTap"));
  -[CRLWPTapGestureRecognizer setNumberOfTapsRequired:](v17, "setNumberOfTapsRequired:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v17));
  objc_msgSend(v18, "addGestureRecognizer:", v17);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v17);
  -[CRLiOSCanvasViewController setImmediateDoubleTapGestureRecognizer:](self, "setImmediateDoubleTapGestureRecognizer:", v17);
  v19 = -[CRLWPTapGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPSecondarySingleTap"));
  secondarySingleTapGestureRecognizer = self->_secondarySingleTapGestureRecognizer;
  self->_secondarySingleTapGestureRecognizer = v19;

  -[CRLWPTapGestureRecognizer setEnabled:](self->_secondarySingleTapGestureRecognizer, "setEnabled:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", self->_secondarySingleTapGestureRecognizer));
  objc_msgSend(v21, "addGestureRecognizer:", self->_secondarySingleTapGestureRecognizer);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", self->_secondarySingleTapGestureRecognizer);
  v22 = -[CRLWPTapGestureRecognizer initWithGestureDispatcher:gestureKind:]([CRLWPTapGestureRecognizer alloc], "initWithGestureDispatcher:gestureKind:", v28, CFSTR("CRLWPImmediateSingleTap"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v22));
  objc_msgSend(v23, "addGestureRecognizer:", v22);

  -[NSMutableArray addObject:](self->_gestureRecognizers, "addObject:", v22);
  -[CRLiOSCanvasViewController setImmediateSingleTapGestureRecognizer:](self, "setImmediateSingleTapGestureRecognizer:", v22);
  -[CRLiOSCanvasViewController modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:](self, "modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:", 3);
  -[CRLiOSCanvasViewController modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:](self, "modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v25 = objc_opt_respondsToSelector(v24, "scribbleInteractionObserverForCanvasViewController:");

  v26 = 0;
  if ((v25 & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "scribbleInteractionObserverForCanvasViewController:", self));

  }
  +[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:scribbleObserver:scribbleActive:](CRLiOSScribbleInteractionSetupHelper, "setupScribbleEditingProvider:scribbleObserver:scribbleActive:", self, v26, 1);
  objc_msgSend(v28, "prioritizeRecognizer:overRecognizer:", v8, v22);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", v22, self->_secondarySingleTapGestureRecognizer, 0);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", self->_secondarySingleTapGestureRecognizer, v10, 0);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", v8, v12, 0);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", v22, v8, 0);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", v6, v17, 0);
  objc_msgSend(v28, "allowSimultaneousRecognitionByRecognizers:", v6, v8, 0);

}

- (BOOL)touchHitsCanvasViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  BOOL v7;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitTest:withEvent:", 0, x, y));
  v7 = v6 == v5;

  return v7;
}

- (NSArray)passthroughViewsToAllowCanvasInteractionDuringPopoverPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  objc_msgSend(v3, "crl_addNonNilObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController i_quickSelectViewController](self, "i_quickSelectViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v3, "crl_addNonNilObject:", v6);

  return (NSArray *)v3;
}

- (BOOL)i_allowCanvasInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  y = a4.y;
  x = a4.x;
  if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", a3))
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitTest:withEvent:", 0, x, y));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = objc_msgSend(v10, "i_isRepContentPlatformView:", v9);

  return v11;
}

- (void)p_handleHoverGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "currentDocumentMode");

  if ((v6 & 1) == 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode")),
        v7,
        v9 = objc_msgSend(v8, "pencilModeType"),
        v8,
        v9 != (id)1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v4, "locationInView:", v10);
    v12 = v11;
    v14 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v12, v14);
    v17 = v16;
    v19 = v18;

    if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", v12, v14))
      v20 = 1;
    else
      v20 = -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v4, v12, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasEnterExitPlatformObject platformObjectWithGesture:](CRLCanvasEnterExitPlatformObject, "platformObjectWithGesture:", v4));
    if (v20)
    {
      switch((unint64_t)objc_msgSend(v4, "state"))
      {
        case 0uLL:
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124B3B0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E16EB0();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124B3D0);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_handleHoverGesture:]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 1133, 0, "Something has gone wrong.");

          break;
        case 1uLL:
          -[CRLCanvasRepEnterExitNotifier cursorEnteredAtPoint:withPlatformObject:](self->mEnterExitNotifier, "cursorEnteredAtPoint:withPlatformObject:", v21, v17, v19);
          break;
        case 2uLL:
          -[CRLCanvasRepEnterExitNotifier updateEnteredExitedRepStateAtPoint:withPlatformObject:](self->mEnterExitNotifier, "updateEnteredExitedRepStateAtPoint:withPlatformObject:", v21, v17, v19);
          break;
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_8;
        default:
          break;
      }
    }
    else
    {
LABEL_8:
      -[CRLCanvasRepEnterExitNotifier cursorExitedAtPoint:withPlatformObject:](self->mEnterExitNotifier, "cursorExitedAtPoint:withPlatformObject:", v21, v17, v19);
    }

  }
}

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)pencilHoverGestureHandler
{
  return self->mPencilHoverGestureHandler;
}

- (NSArray)gesturesToAdjustIfStylusShouldSelectAndScroll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController repDragGestureRecognizer](self, "repDragGestureRecognizer"));
  objc_msgSend(v3, "crl_addNonNilObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  objc_msgSend(v3, "crl_addNonNilObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"));
  objc_msgSend(v3, "crl_addNonNilObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController rectangularMarqueeGestureRecognizer](self, "rectangularMarqueeGestureRecognizer"));
  objc_msgSend(v3, "crl_addNonNilObject:", v7);

  return (NSArray *)v3;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3.x, a3.y));
  if ((objc_msgSend(v3, "currentlyScrolling") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
    v4 = objc_msgSend(v5, "isInOperation");

  }
  return v4;
}

- (id)gesturesThatImmediateMarqueeShouldRequireToFail
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v2));

  return v3;
}

- (void)setUpCommonGestureAllowedTouchTypes
{
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (-[CRLiOSCanvasViewController shouldSelectAndScrollWithApplePencil](self, "shouldSelectAndScrollWithApplePencil"))
    v3 = &off_1012CB800;
  else
    v3 = &off_1012CB818;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController gesturesToAdjustIfStylusShouldSelectAndScroll](self, "gesturesToAdjustIfStylusShouldSelectAndScroll"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "currentDocumentMode");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode"));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:", v4));
    v4 = (void *)v9;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "setAllowedTouchTypes:", v3, (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)resetGesturesForContextSwitch
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  CRLiOSCanvasViewController *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gestureRecognizers"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isEnabled"))
        {
          v10 = (CRLiOSCanvasViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));

          if (v10 == self)
          {
            objc_msgSend(v9, "setEnabled:", 0);
            objc_msgSend(v9, "setEnabled:", 1);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"));
  v12 = objc_msgSend(v11, "isEnabled");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"));
    objc_msgSend(v13, "setIgnoreTargetAction:", 1);

  }
}

- (void)i_updateZoomGestureRecognizer
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasLayer](self, "canvasLayer"));
  v3 = objc_msgSend(v5, "allowsPinchZoom");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  id WeakRetained;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  _BOOL8 v23;
  CRLInteractiveCanvasController **p_mICC;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  id v33;
  id v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->mLastTapPoint.x = x;
  self->mLastTapPoint.y = y;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "currentDocumentMode");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentDocumentMode"));

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B3F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E16F30();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B410);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1231, 0, "invalid nil value for '%{public}s'", "currentMode");

    }
    v15 = objc_msgSend(v11, "handleSingleTapAtPoint:touchType:", objc_msgSend(v7, "touchTypeForTap"), x, y);

    if ((v15 & 1) != 0)
    {
      v16 = 1;
      goto LABEL_32;
    }
  }
  if (-[CRLiOSCanvasViewController inMediaBrowsingMode](self, "inMediaBrowsingMode"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v18 = objc_opt_respondsToSelector(WeakRetained, "handleMediaBrowsingModeTap");

    if ((v18 & 1) == 0)
      goto LABEL_23;
    v19 = objc_loadWeakRetained((id *)&self->mDelegate);
    objc_msgSend(v19, "handleMediaBrowsingModeTap");
  }
  else
  {
    if (!-[CRLiOSCanvasViewController inInspectorPanZoomMode](self, "inInspectorPanZoomMode")
      && !-[CRLiOSCanvasViewController inInspectorTextEditingMode](self, "inInspectorTextEditingMode"))
    {
      goto LABEL_23;
    }
    v20 = objc_loadWeakRetained((id *)&self->mDelegate);
    v21 = objc_opt_respondsToSelector(v20, "handleInspectorPanZoomModeTap");

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->mDelegate);
      objc_msgSend(v22, "handleInspectorPanZoomModeTap");

    }
    v19 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v19, "resumeEditing");
  }

LABEL_23:
  v23 = sub_10033831C((_BOOL8)objc_msgSend(v7, "touchTypeForTap"));
  p_mICC = &self->mICC;
  v25 = objc_loadWeakRetained((id *)&self->mICC);
  v35 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hitKnobAtPoint:inputType:returningRep:", v23, &v35, x, y));
  v27 = v35;

  if (v26 && (objc_msgSend(v27, "handleSingleTapAtPoint:onKnob:inputType:", v26, v23, x, y) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v28 = objc_loadWeakRetained((id *)&self->mICC);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hitRep:", x, y));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "repForSelecting"));
    if (v30 || (objc_msgSend(v29, "shouldIgnoreSingleTapAtPoint:withRecognizer:", v7, x, y) & 1) == 0)
    {
      v31 = ((unint64_t)objc_msgSend(v7, "modifierFlags") & 0x120000) != 0;
      v32 = -[CRLiOSCanvasViewController isCurrentlyInQuickSelectMode](self, "isCurrentlyInQuickSelectMode") ^ v31;
      v33 = objc_loadWeakRetained((id *)p_mICC);
      v16 = objc_msgSend(v33, "handleSingleTapAtPoint:extendingSelection:inputType:", v32, v23, x, y);

    }
    else
    {
      v16 = 1;
    }

  }
LABEL_32:

  return v16;
}

- (void)handleDoubleTap:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;

  v4 = a3;
  objc_opt_class(CRLiOSTapGestureRecognizer, v5);
  v7 = sub_100221D0C(v6, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v14, "firstTapLocation");
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
    v10 = v9;
    v12 = v11;

    if (!-[CRLiOSCanvasViewController handleDoubleTapAtPoint:withRecognizer:](self, "handleDoubleTapAtPoint:withRecognizer:", v14, v10, v12))
    {
      v13 = objc_loadWeakRetained((id *)&self->mICC);
      objc_msgSend(v13, "handleDoubleTapAtPoint:inputType:", sub_10033831C((_BOOL8)objc_msgSend(v14, "touchTypeForTap")), v10, v12);

    }
  }

}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  id WeakRetained;
  void *v14;
  id v15;
  unsigned __int8 v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  id v47;
  id v48;
  id v49;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_opt_class(CRLiOSTapGestureRecognizer, v8);
  v10 = sub_100221D0C(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_10033831C((_BOOL8)objc_msgSend(v11, "touchTypeForTap"));

  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v49 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitKnobAtPoint:inputType:returningRep:", v12, &v49, x, y));
  v15 = v49;

  if (v14)
  {
    v16 = objc_msgSend(v15, "handleDoubleTapAtPoint:onKnob:inputType:", v14, v12, x, y);
    if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
    {
LABEL_15:
      if ((v16 & 1) != 0)
        goto LABEL_16;
      goto LABEL_8;
    }
  }
  else
  {
    if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
      goto LABEL_8;
    v16 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v18 = objc_opt_respondsToSelector(v17, "currentDocumentMode");

  if ((v18 & 1) == 0)
    goto LABEL_15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentDocumentMode"));

  objc_opt_class(CRLiOSTapGestureRecognizer, v21);
  v23 = sub_100221D0C(v22, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_msgSend(v24, "touchTypeForTap");

  v26 = objc_msgSend(v20, "shouldHandleDoubleTapAtPoint:touchType:", v25, x, y) | v16;
  if ((v26 & 1) != 0)
  {
LABEL_16:
    v45 = 1;
    goto LABEL_17;
  }
LABEL_8:
  v27 = objc_loadWeakRetained((id *)&self->mICC);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hitRep:", x, y));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "repForSelecting"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "info"));

    if (v30)
    {
      v47 = v7;
      v48 = v15;
      v31 = objc_loadWeakRetained((id *)&self->mICC);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "selectionModelTranslator"));
      v33 = objc_loadWeakRetained((id *)&self->mICC);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "editorController"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "selectionPath"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "boardItemsForSelectionPath:", v35));

      v37 = objc_loadWeakRetained((id *)&self->mICC);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "canvasEditor"));

      if (objc_msgSend(v36, "count") != (id)1
        || (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "info")),
            v40 = objc_msgSend(v36, "containsObject:", v39),
            v39,
            (v40 & 1) == 0))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "info"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "selectionPathWithInfo:", v41));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "editorController"));
        objc_msgSend(v44, "setSelectionPath:", v42);

      }
      v7 = v47;
      v15 = v48;
    }
  }

  v45 = 0;
LABEL_17:

  return v45;
}

- (void)p_handleTapForEditMenu:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  id WeakRetained;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_opt_class(CRLiOSEditMenuTapGestureRecognizer, v5);
  v7 = sub_100221D0C(v6, v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v8 = v37;
  if (v37)
  {
    v9 = objc_msgSend(v37, "ignoreTargetAction");
    v8 = v37;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      if (!objc_msgSend(v10, "shouldAllowKeyCommands"))
        goto LABEL_25;
      v11 = -[CRLiOSCanvasViewController isCurrentlyInQuickSelectMode](self, "isCurrentlyInQuickSelectMode");

      v8 = v37;
      if ((v11 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
        objc_msgSend(v37, "locationInView:", v13);
        objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
        v15 = v14;
        v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "touchedRep"));
        v10 = v18;
        if (!v18)
          goto LABEL_25;
        if ((objc_msgSend(v18, "hasBeenRemoved") & 1) != 0)
          goto LABEL_25;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForSelecting"));

        if (v19 != v10)
          goto LABEL_25;
        if ((objc_msgSend(v10, "isSelectedIgnoringLocking") & 1) == 0
          && -[CRLiOSCanvasViewController shouldSelectAndShowEditMenuOnFirstTapForRep:](self, "shouldSelectAndShowEditMenuOnFirstTapForRep:", v10))
        {
          v20 = objc_loadWeakRetained((id *)&self->mICC);
          objc_msgSend(v20, "endEditing");

          v21 = objc_loadWeakRetained((id *)&self->mICC);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasEditor"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectionPathWithInfo:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "editorController"));
          objc_msgSend(v26, "setSelectionPath:", v24);

        }
        self->mLastTapPoint = CGPointZero;
        if (!objc_msgSend(v10, "isSelectedIgnoringLocking")
          || (objc_msgSend(v10, "shouldIgnoreEditMenuTapAtPoint:withRecognizer:", v37, v15, v17) & 1) != 0)
        {
          goto LABEL_25;
        }
        if (objc_msgSend(v10, "wantsToManuallyHandleEditMenuTapAtPoint:", v15, v17))
        {
          objc_msgSend(v10, "handleEditMenuTapAtPoint:inputType:", sub_10033831C((_BOOL8)objc_msgSend(v37, "touchTypeForTap")), v15, v17);
        }
        else
        {
          if (!self->mContextMenuMightBeDisplayed)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "editorController"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "selectionPath"));
            v30 = -[CRLiOSCanvasViewController p_shouldShowMiniFormatterForSelectionPath:](self, "p_shouldShowMiniFormatterForSelectionPath:", v29);

            if (v30)
            {
              if ((objc_msgSend(v10, "manuallyControlsMiniFormatter") & 1) != 0)
                goto LABEL_25;
              if (UIAccessibilityIsVoiceOverRunning() && objc_msgSend(v10, "isSelected"))
              {
                objc_msgSend(v10, "accessibilityActivationPoint");
                objc_msgSend(v10, "handleDoubleTapAtPoint:inputType:", 1);
                goto LABEL_25;
              }
              v31 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "editorController"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "selectionPath"));
              objc_msgSend(v31, "handleSingleTapOnRep:withSelectionPath:", v10, v36);

            }
            else
            {
              v31 = objc_loadWeakRetained((id *)&self->mICC);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "editorController"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "selectionPath"));
              -[CRLiOSCanvasViewController showEditUIForSelectionPath:](self, "showEditUIForSelectionPath:", v33);

            }
            goto LABEL_25;
          }
          -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
        }
LABEL_25:

        v8 = v37;
      }
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  CRLiOSRepNudgeGestureRecognizer *v6;
  CRLiOSEditMenuTapGestureRecognizer *v7;
  CRLiOSRepNudgeGestureRecognizer *v8;
  UITapGestureRecognizer *mSingleTapGestureRecognizer;
  CRLiOSEditMenuTapGestureRecognizer *mEditMenuTapGestureRecognizer;
  CRLiOSRepDragGestureRecognizer *mRepDragGestureRecognizer;
  BOOL v14;
  CRLiOSEditMenuTapGestureRecognizer *v15;
  unsigned __int8 v16;
  UITapGestureRecognizer *v17;
  CRLiOSRepNudgeGestureRecognizer *v18;
  CRLiOSRepNudgeGestureRecognizer *v19;
  void *v20;
  void *v21;
  CRLiOSRepNudgeGestureRecognizer *v22;
  void *v23;
  void *v24;
  CRLiOSRepNudgeGestureRecognizer *v25;
  BOOL v26;
  void *v28;
  char v29;
  void *v30;
  void *v31;

  v6 = (CRLiOSRepNudgeGestureRecognizer *)a3;
  v7 = (CRLiOSEditMenuTapGestureRecognizer *)a4;
  v8 = (CRLiOSRepNudgeGestureRecognizer *)v7;
  mSingleTapGestureRecognizer = self->mSingleTapGestureRecognizer;
  mEditMenuTapGestureRecognizer = self->mEditMenuTapGestureRecognizer;
  if (mSingleTapGestureRecognizer == (UITapGestureRecognizer *)v6 && mEditMenuTapGestureRecognizer == v7)
    goto LABEL_33;
  if (mSingleTapGestureRecognizer == (UITapGestureRecognizer *)v7
    && mEditMenuTapGestureRecognizer == (CRLiOSEditMenuTapGestureRecognizer *)v6)
  {
    goto LABEL_33;
  }
  mRepDragGestureRecognizer = self->mRepDragGestureRecognizer;
  if ((mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v6
     || self->mNudgeGestureRecognizer == v6
     || (CRLiOSRepNudgeGestureRecognizer *)self->mMultiSelectGestureRecognizer == v6)
    && (mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v8
     || self->mNudgeGestureRecognizer == v8
     || (CRLiOSRepNudgeGestureRecognizer *)self->mMultiSelectGestureRecognizer == v8))
  {
    goto LABEL_33;
  }
  v14 = mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v6
     || mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v8;
  if (!v14
    || -[CRLiOSRepDragGestureRecognizer state](mRepDragGestureRecognizer, "state") != (id)3
    || (v15 = self->mEditMenuTapGestureRecognizer, v16 = 1, v15 != (CRLiOSEditMenuTapGestureRecognizer *)v6)
    && v15 != (CRLiOSEditMenuTapGestureRecognizer *)v8
    && (v17 = self->mSingleTapGestureRecognizer, v17 != (UITapGestureRecognizer *)v6)
    && v17 != (UITapGestureRecognizer *)v8)
  {
    v18 = (CRLiOSRepNudgeGestureRecognizer *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController preventScrollGestureRecognizer](self, "preventScrollGestureRecognizer"));
    if (v18 != v6)
    {
      v19 = (CRLiOSRepNudgeGestureRecognizer *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController preventScrollGestureRecognizer](self, "preventScrollGestureRecognizer"));
      if (v19 != v8)
      {

LABEL_36:
        if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1)&& (v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate")), v29 = objc_opt_respondsToSelector(v28, "currentDocumentMode"), v28, (v29 & 1) != 0))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentDocumentMode"));

          v16 = objc_msgSend(v31, "gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", v6, v8);
        }
        else
        {
          v16 = 0;
        }
        goto LABEL_34;
      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "enclosingScrollView"));
    v22 = (CRLiOSRepNudgeGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "panGestureRecognizer"));
    if (v22 == v6)
    {
      v26 = 0;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enclosingScrollView"));
      v25 = (CRLiOSRepNudgeGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "panGestureRecognizer"));
      v26 = v25 != v8;

    }
    if (v18 == v6)
    {

      if (!v26)
        goto LABEL_36;
    }
    else
    {

      if (!v26)
        goto LABEL_36;
    }
LABEL_33:
    v16 = 1;
  }
LABEL_34:

  return v16;
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  return 1;
}

- (id)appSpecificGestureRecognizersAllowedDuringFreehandDrawing
{
  return +[NSSet set](NSSet, "set");
}

- (BOOL)shouldIgnoreTextGesture:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v15;
  id v16;
  unsigned __int8 v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", a3, a4.x, a4.y));
  v6 = objc_opt_respondsToSelector(v5, "currentDocumentMode");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode"));

    v9 = objc_msgSend(v8, "shouldAllowTextGesturesInRestrictedGestureMode");
  }
  else
  {
    v9 = 0;
  }
  if (-[CRLiOSCanvasViewController inInspectorPanZoomMode](self, "inInspectorPanZoomMode"))
  {
    v10 = 1;
    if ((v9 & 1) != 0)
      goto LABEL_10;
  }
  else
  {
    v10 = -[CRLiOSCanvasViewController inInspectorTextEditingMode](self, "inInspectorTextEditingMode");
    if ((v9 & 1) != 0)
      goto LABEL_10;
  }
  if (-[CRLiOSCanvasViewController inRestrictedGestureMode](self, "inRestrictedGestureMode"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v12 = objc_msgSend(v11, "editingDisabled") ^ 1;

    goto LABEL_11;
  }
LABEL_10:
  LOBYTE(v12) = 0;
LABEL_11:
  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    v15 = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(v15, "shouldIgnoreTextGestures") & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)p_mDelegate);
      v17 = objc_msgSend(v16, "shouldIgnoreTextGestures");

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v10 | v12 | v17;
}

- (BOOL)i_isCurrentlyTrackingTouch
{
  return self->mIsCurrentlyTrackingTouch;
}

- (void)p_allTouchesDone:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "makeKeyWindow");

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("CRLInteractiveCanvasControllerAllTouchesInGestureFinished"), self);

}

- (id)p_reasonStringForIgnoringKeyboardInputWithAllTouchesDoneGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("All Touches Gestures In Flight (%@)"), v3));

  return v4;
}

- (void)didStartCountingTouches:(id)a3 touchType:(int64_t)a4 atSomeTouchPoint:(CGPoint)a5
{
  double y;
  double x;
  CRLiOSAllTouchesDoneGestureRecognizer *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  y = a5.y;
  x = a5.x;
  v9 = (CRLiOSAllTouchesDoneGestureRecognizer *)a3;
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "userDidInteractWithCanvas:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v12, "userDidInteractWithCanvas:", self);

    }
  }
  -[CRLiOSCanvasViewController p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:](self, "p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:", a4, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v13, "suspendCollaborationWithReason:", CFSTR("CRLCanvasTouches"));

  if (self->mAllIndirectPointerTouchesDoneGestureRecognizer == v9)
  {
    if (-[CRLiOSCanvasViewController currentlyTrackingIndirectPointerTouch](self, "currentlyTrackingIndirectPointerTouch"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B430);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E16FBC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B450);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStartCountingTouches:touchType:atSomeTouchPoint:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1457, 0, "Should not be told twice about indirect touches!");

    }
    -[CRLiOSCanvasViewController setCurrentlyTrackingIndirectPointerTouch:](self, "setCurrentlyTrackingIndirectPointerTouch:", 1);
  }
  else if (self->mAllTouchesDoneGestureRecognizer == v9)
  {
    if (self->mIsCurrentlyTrackingTouch)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B470);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1703C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B490);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStartCountingTouches:touchType:atSomeTouchPoint:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1460, 0, "Should not be told twice about touches!");

    }
    self->mIsCurrentlyTrackingTouch = 1;
  }
  -[CRLiOSPencilHoverGestureHandler removeHoverEffect](self->mPencilHoverGestureHandler, "removeHoverEffect");

}

- (BOOL)p_shouldIgnoreKeyboardInputForTouchType:(int64_t)a3 atSomeTouchPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  id WeakRetained;
  id v18;

  if (a3 == 2)
  {
    y = a4.y;
    x = a4.x;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "currentDocumentMode");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentDocumentMode"));

      if (!v10)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124B4B0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E170BC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124B4D0);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:]"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1475, 0, "invalid nil value for '%{public}s'", "currentMode");

      }
      v14 = objc_msgSend(v10, "pencilModeType");
      if (v14 == (id)2)
      {
        v15 = 0;
        goto LABEL_18;
      }
      if (v14 == (id)1)
      {
        v15 = 1;
LABEL_18:

        return v15;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController pencilMediator](self, "pencilMediator"));
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", x, y);
    v18 = objc_msgSend(v16, "pencilBehaviorOutsideModesAtUnscaledPoint:");

    return v18 != (id)2;
  }
  return 1;
}

- (void)didStopCountingTouches:(id)a3
{
  CRLiOSAllTouchesDoneGestureRecognizer *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (CRLiOSAllTouchesDoneGestureRecognizer *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editingCoordinator](self, "editingCoordinator"));
  objc_msgSend(v5, "resumeCollaborationWithReason:", CFSTR("CRLCanvasTouches"));

  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textInputResponder"));
  objc_msgSend(v7, "becomeFirstResponder");

  if (self->mAllIndirectPointerTouchesDoneGestureRecognizer == v4)
  {
    if (!-[CRLiOSCanvasViewController currentlyTrackingIndirectPointerTouch](self, "currentlyTrackingIndirectPointerTouch"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B4F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E17148();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B510);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStopCountingTouches:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1499, 0, "Should not be told twice about indirect touches!");

    }
    -[CRLiOSCanvasViewController setCurrentlyTrackingIndirectPointerTouch:](self, "setCurrentlyTrackingIndirectPointerTouch:", 0);
  }
  else if (self->mAllTouchesDoneGestureRecognizer == v4)
  {
    if (!self->mIsCurrentlyTrackingTouch)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B530);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E171C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B550);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStopCountingTouches:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1502, 0, "Should not be told twice about touches!");

    }
    self->mIsCurrentlyTrackingTouch = 0;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _OWORD v14[3];
  _QWORD v15[3];
  char v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(v14, 0, sizeof(v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  v11 = sub_1000799EC((uint64_t)v14, v9, v10);

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10029A7C8;
    v13[3] = &unk_10124B578;
    v13[4] = self;
    v13[5] = v15;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10029A9A0;
    v12[3] = &unk_10124B5A0;
    v12[4] = self;
    v12[5] = v15;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);
  }
  _Block_object_dispose(v15, 8);

}

- (BOOL)allowTouchOutsideCanvasViewAtPoint:(CGPoint)a3 forGesture:(id)a4
{
  double y;
  double x;
  CRLiOSAllTouchesDoneGestureRecognizer *v7;
  CRLiOSAllTouchesDoneGestureRecognizer *v8;
  CRLiOSAllTouchesDoneGestureRecognizer *mAllIndirectPointerTouchesDoneGestureRecognizer;
  unsigned __int8 v10;
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v7 = (CRLiOSAllTouchesDoneGestureRecognizer *)a4;
  v8 = v7;
  mAllIndirectPointerTouchesDoneGestureRecognizer = self->mAllIndirectPointerTouchesDoneGestureRecognizer;
  v10 = mAllIndirectPointerTouchesDoneGestureRecognizer == v7;
  if (v7 && mAllIndirectPointerTouchesDoneGestureRecognizer != v7)
  {
    p_mDelegate = &self->mDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v13 = objc_opt_respondsToSelector(WeakRetained, "allowTouchOutsideCanvasViewAtPoint:forGesture:");

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_mDelegate);
      v10 = objc_msgSend(v14, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v8, x, y);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)viewForGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "viewForGestureRecognizer:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->mDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewForGestureRecognizer:", v4));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  }

  return v8;
}

- (BOOL)canOriginateSystemDrags
{
  return 1;
}

- (BOOL)canReceiveSystemDrops
{
  return 1;
}

- (CRLiOSCanvasDropInteractionDelegate)dropInteractionDelegate
{
  CRLiOSCanvasDropInteractionDelegate *mDropInteractionDelegate;
  CRLiOSCanvasDropInteractionDelegate *v4;
  void *v5;
  CRLiOSCanvasDropInteractionDelegate *v6;
  CRLiOSCanvasDropInteractionDelegate *v7;

  mDropInteractionDelegate = self->mDropInteractionDelegate;
  if (!mDropInteractionDelegate)
  {
    v4 = [CRLiOSCanvasDropInteractionDelegate alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLiOSCanvasDropInteractionDelegate initWithICC:](v4, "initWithICC:", v5);
    v7 = self->mDropInteractionDelegate;
    self->mDropInteractionDelegate = v6;

    mDropInteractionDelegate = self->mDropInteractionDelegate;
  }
  return mDropInteractionDelegate;
}

- (CRLiOSCanvasDragInteractionDelegate)dragInteractionDelegate
{
  CRLiOSCanvasDragInteractionDelegate *mDragInteractionDelegate;
  CRLiOSCanvasDragInteractionDelegate *v4;
  void *v5;
  CRLiOSCanvasDragInteractionDelegate *v6;
  CRLiOSCanvasDragInteractionDelegate *v7;

  mDragInteractionDelegate = self->mDragInteractionDelegate;
  if (!mDragInteractionDelegate)
  {
    v4 = [CRLiOSCanvasDragInteractionDelegate alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLiOSCanvasDragInteractionDelegate initWithInteractiveCanvasController:](v4, "initWithInteractiveCanvasController:", v5);
    v7 = self->mDragInteractionDelegate;
    self->mDragInteractionDelegate = v6;

    mDragInteractionDelegate = self->mDragInteractionDelegate;
  }
  return mDragInteractionDelegate;
}

- (id)contextMenuInteractionDelegate
{
  CRLiOSCanvasContextMenuInteractionDelegate *mContextMenuInteractionDelegate;
  CRLiOSCanvasContextMenuInteractionDelegate *v4;
  void *v5;
  CRLiOSCanvasContextMenuInteractionDelegate *v6;
  CRLiOSCanvasContextMenuInteractionDelegate *v7;

  mContextMenuInteractionDelegate = self->mContextMenuInteractionDelegate;
  if (!mContextMenuInteractionDelegate)
  {
    v4 = [CRLiOSCanvasContextMenuInteractionDelegate alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLiOSCanvasContextMenuInteractionDelegate initWithInteractiveCanvasController:](v4, "initWithInteractiveCanvasController:", v5);
    v7 = self->mContextMenuInteractionDelegate;
    self->mContextMenuInteractionDelegate = v6;

    mContextMenuInteractionDelegate = self->mContextMenuInteractionDelegate;
  }
  return mContextMenuInteractionDelegate;
}

- (id)pointerInteractionDelegate
{
  CRLiOSCanvasPointerInteractionDelegate *mPointerInteractionDelegate;
  CRLiOSCanvasPointerInteractionDelegate *v4;
  void *v5;
  CRLiOSCanvasPointerInteractionDelegate *v6;
  CRLiOSCanvasPointerInteractionDelegate *v7;

  mPointerInteractionDelegate = self->mPointerInteractionDelegate;
  if (!mPointerInteractionDelegate)
  {
    v4 = [CRLiOSCanvasPointerInteractionDelegate alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLiOSCanvasPointerInteractionDelegate initWithInteractiveCanvasController:](v4, "initWithInteractiveCanvasController:", v5);
    v7 = self->mPointerInteractionDelegate;
    self->mPointerInteractionDelegate = v6;

    mPointerInteractionDelegate = self->mPointerInteractionDelegate;
  }
  return mPointerInteractionDelegate;
}

- (id)newDragAndDropController
{
  CRLiOSDragAndDropController *v3;
  void *v4;
  CRLiOSDragAndDropController *v5;

  v3 = [CRLiOSDragAndDropController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = -[CRLDragAndDropController initWithDelegate:interactiveCanvasController:](v3, "initWithDelegate:interactiveCanvasController:", self, v4);

  return v5;
}

- (id)modelContainerForLocalDragContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "board"));

  return v3;
}

- (void)dragSessionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panGestureRecognizer"));
  objc_msgSend(v6, "setState:", 4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  objc_msgSend(v7, "setState:", 4);

}

- (BOOL)allowsSystemDragSession
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "allowsSystemDragSession");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "allowsSystemDragSession");

  return v6;
}

- (void)p_setDragLiftDelay:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
  v6 = objc_opt_respondsToSelector(v5, "_setLiftDelay:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
    objc_msgSend(v7, "_setLiftDelay:", a3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
  v9 = objc_opt_respondsToSelector(v8, "_setPointerLiftDelay:");

  if ((v9 & 1) != 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController dragInteraction](self, "dragInteraction"));
    objc_msgSend(v10, "_setPointerLiftDelay:", a3);

  }
}

- (BOOL)canInsertBoardItemsFromDragOperationForDragInfo:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLiOSCanvasDraggingContext, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformDraggingInfo", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localDragSession"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localContext"));
  v12 = sub_100221D0C(v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelContainer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "board"));
    v17 = v14 != v16;

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)shouldAllowDragOperationForDragInfo:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "shouldRejectDragOperationForDragInfo:") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    goto LABEL_5;
  }
  v6 = objc_msgSend(v5, "shouldRejectDragOperationForDragInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  if ((v6 & 1) == 0)
  {
LABEL_5:
    v8 = objc_msgSend(v7, "isInDynamicOperation") ^ 1;
    goto LABEL_6;
  }
  LOBYTE(v8) = 0;
LABEL_6:

  return v8;
}

- (BOOL)shouldAllowDynamicInsertForDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canEditRepWithDragOperation:(id)a3
{
  return 1;
}

- (CGRect)targetRectForEditMenu:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CRLInteractiveCanvasController **p_mICC;
  id WeakRetained;
  id v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CKRecordID v34;
  Swift::String v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *i;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CGAffineTransform v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect result;

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentEditors"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v93;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v93 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v16);
      if ((objc_opt_respondsToSelector(v17, "targetRectForEditMenu") & 1) != 0)
      {
        objc_msgSend(v17, "targetRectForEditMenu");
        x = v99.origin.x;
        y = v99.origin.y;
        width = v99.size.width;
        height = v99.size.height;
        if (!CGRectIsNull(v99))
          break;
      }
      if (v14 == (id)++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  if (CGRectIsNull(v100))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "infosForSelectionPath:", v4));

    if (objc_msgSend(v19, "count"))
    {
      p_mICC = &self->mICC;
      WeakRetained = objc_loadWeakRetained((id *)p_mICC);
      objc_msgSend(WeakRetained, "layoutIfNeeded");

      if (objc_msgSend(v19, "count") == (id)1)
      {
        v22 = objc_loadWeakRetained((id *)p_mICC);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "anyObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "repForInfo:", v23));

        objc_msgSend(v24, "targetRectForEditMenu");
        v25 = v101.origin.x;
        v26 = v101.origin.y;
        v27 = v101.size.width;
        v28 = v101.size.height;
        if (!CGRectIsNull(v101))
        {
          if (v24)
            objc_msgSend(v24, "transformToConvertNaturalToLayerRelative");
          else
            memset(&v91, 0, sizeof(v91));
          v102.origin.x = v25;
          v102.origin.y = v26;
          v102.size.width = v27;
          v102.size.height = v28;
          v103 = CGRectApplyAffineTransform(v102, &v91);
          v40 = v103.origin.x;
          v41 = v103.origin.y;
          width = v103.size.width;
          height = v103.size.height;
          objc_msgSend(v24, "layerFrameInScaledCanvas");
          x = sub_1000603D0(v40, v41, v42);
          y = v43;
        }

      }
      v104.origin.x = x;
      v104.origin.y = y;
      v104.size.width = width;
      v104.size.height = height;
      if (CGRectIsNull(v104))
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v44 = v19;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        if (v45)
        {
          v46 = v45;
          v81 = v19;
          v82 = v4;
          v47 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v46; i = (char *)i + 1)
            {
              if (*(_QWORD *)v88 != v47)
                objc_enumerationMutation(v44);
              v49 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
              v83 = 0u;
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v50 = objc_loadWeakRetained((id *)p_mICC);
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "repsForInfo:", v49));

              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v84;
                do
                {
                  for (j = 0; j != v53; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v84 != v54)
                      objc_enumerationMutation(v51);
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1)
                                                                                       + 8 * (_QWORD)j), "layout", v81, v82));
                    objc_msgSend(v56, "insertionFrameInRoot");
                    v58 = v57;
                    v60 = v59;
                    v62 = v61;
                    v64 = v63;

                    v65 = objc_loadWeakRetained((id *)p_mICC);
                    objc_msgSend(v65, "convertUnscaledToBoundsRect:", v58, v60, v62, v64);
                    v67 = v66;
                    v69 = v68;
                    v71 = v70;
                    v73 = v72;

                    v105.origin.x = x;
                    v105.origin.y = y;
                    v105.size.width = width;
                    v105.size.height = height;
                    if (CGRectIsNull(v105))
                    {
                      height = v73;
                      width = v71;
                      y = v69;
                      x = v67;
                    }
                    else
                    {
                      x = sub_100060C2C(x, y, width, height, v67, v69, v71, v73);
                      y = v74;
                      width = v75;
                      height = v76;
                    }
                  }
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
                }
                while (v53);
              }

            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
          }
          while (v46);
          v19 = v81;
          v4 = v82;
        }

        v106.origin.x = x;
        v106.origin.y = y;
        v106.size.width = width;
        v106.size.height = height;
        if (CGRectIsNull(v106))
        {
          x = CGRectZero.origin.x;
          y = CGRectZero.origin.y;
          width = CGRectZero.size.width;
          height = CGRectZero.size.height;
        }
      }
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      -[CRLiOSCanvasViewController lastTapPoint](self, "lastTapPoint");
      objc_msgSend(v29, "convertUnscaledToBoundsPoint:");
      v31 = v30;
      v33 = v32;

      sub_1000603D0(v31, v33, 0.0);
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v34, v35);
      x = v36;
      y = v37;
      width = v38;
      height = v39;
    }

  }
  v77 = x;
  v78 = y;
  v79 = width;
  v80 = height;
  result.size.height = v80;
  result.size.width = v79;
  result.origin.y = v78;
  result.origin.x = v77;
  return result;
}

- (void)showEditMenuForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CRLiOSContextMenuController *v33;
  CRLiOSContextMenuController *mContextMenuController;
  void *v35;
  void *v36;
  void *v37;
  CRLiOSContextMenuController *v38;
  void *v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "allowEditMenuToAppear") & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->mDelegate);
    v8 = objc_msgSend(v7, "allowEditMenuToAppear");

    if (!v8)
      goto LABEL_20;
  }
  else
  {

  }
  if (-[CRLiOSCanvasViewController becomeFirstResponderIfAppropriate](self, "becomeFirstResponderIfAppropriate"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    objc_msgSend(v10, "makeKeyWindow");

    if (self->mContextMenuController)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
      objc_msgSend(v11, "hideMenu");

    }
    v12 = objc_loadWeakRetained((id *)&self->mICC);
    objc_msgSend(v12, "visibleBoundsRect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[CRLiOSCanvasViewController targetRectForEditMenu:](self, "targetRectForEditMenu:", v4);
    v42.origin.x = v14;
    v42.origin.y = v16;
    v42.size.width = v18;
    v42.size.height = v20;
    v41 = CGRectIntersection(v40, v42);
    v43.origin.x = CGRectNull.origin.x;
    v43.origin.y = CGRectNull.origin.y;
    v43.size.width = CGRectNull.size.width;
    v43.size.height = CGRectNull.size.height;
    if (!CGRectEqualToRect(v41, v43))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[CRLiOSCanvasViewController p_buildMenuItems:forSelectionPath:](self, "p_buildMenuItems:forSelectionPath:", v21, v4);
      objc_msgSend(v5, "setMenuItems:", v21);
      -[CRLiOSCanvasViewController p_targetRectForMenuControllerPositionForSelectionPath:](self, "p_targetRectForMenuControllerPositionForSelectionPath:", v4);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      self->mTargetRectForContextMenuController.origin.x = v22;
      self->mTargetRectForContextMenuController.origin.y = v24;
      self->mTargetRectForContextMenuController.size.width = v26;
      self->mTargetRectForContextMenuController.size.height = v28;
      if (self->mContextMenuController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124B5C0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E17248();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124B5E0);
        v30 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController showEditMenuForSelectionPath:]"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 1783, 0, "expected nil value for '%{public}s'", "mContextMenuController");

      }
      v33 = -[CRLiOSContextMenuController initWithDelegate:]([CRLiOSContextMenuController alloc], "initWithDelegate:", self);
      mContextMenuController = self->mContextMenuController;
      self->mContextMenuController = v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "infosForSelectionPath:", v4));

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v36));
      v38 = self->mContextMenuController;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
      -[CRLiOSContextMenuController showContextMenuFromView:rect:animated:withChangeSources:](v38, "showContextMenuFromView:rect:animated:withChangeSources:", v39, 1, v37, v23, v25, v27, v29);

      self->mContextMenuMightBeDisplayed = 1;
    }
  }
LABEL_20:

}

- (CGRect)p_targetRectForMenuControllerPositionForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double MinY;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double height;
  double width;
  double y;
  double x;
  CGFloat v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect result;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  objc_msgSend(WeakRetained, "visibleBoundsRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CRLiOSCanvasViewController targetRectForEditMenu:](self, "targetRectForEditMenu:", v4);
  y = v55.origin.y;
  x = v55.origin.x;
  height = v55.size.height;
  width = v55.size.width;
  v45 = v12;
  v60.origin.x = v8;
  v48 = v14;
  v49 = v10;
  v60.origin.y = v10;
  v60.size.width = v12;
  v60.size.height = v14;
  v56 = CGRectIntersection(v55, v60);
  v15 = v56.origin.x;
  v16 = v56.origin.y;
  v17 = v56.size.width;
  v18 = v56.size.height;
  v19 = CGRectNull.origin.y;
  v21 = CGRectNull.size.width;
  v20 = CGRectNull.size.height;
  v61.origin.x = CGRectNull.origin.x;
  v61.origin.y = v19;
  v61.size.width = v21;
  v61.size.height = v20;
  v22 = CGRectEqualToRect(v56, v61);
  if (v22)
  {
    v18 = height;
    v23 = width;
  }
  else
  {
    v23 = v17;
  }
  if (v22)
    v24 = y;
  else
    v24 = v16;
  if (v22)
    v15 = x;
  v25 = v15;
  v26 = v24;
  v54 = v23;
  v27 = v18;
  v62.origin.x = CGRectNull.origin.x;
  v62.origin.y = v19;
  v62.size.width = v21;
  v62.size.height = v20;
  if (CGRectEqualToRect(*(CGRect *)(&v23 - 2), v62))
  {
    v28 = v54;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "infosForSelectionPath:", v4));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectsPassingTest:", &stru_10124B600));
    v32 = objc_msgSend(v31, "count");
    v33 = v18 * 0.5;
    if ((unint64_t)v32 <= 1)
      v33 = -0.0;
    v24 = v24 + v33;
    objc_msgSend(v5, "setArrowDirection:", 0, *(_QWORD *)&v45, *(_QWORD *)&v8);
    if (v24 > v49 + 100.0 || v18 < v48 + -100.0)
    {
      v28 = v54;
    }
    else
    {
      v57.origin.x = v15;
      v57.origin.y = v24;
      v57.size.width = v54;
      v57.size.height = v18;
      v58.origin.x = CGRectGetMidX(v57);
      v15 = v58.origin.x;
      v58.origin.y = v24;
      v58.size.width = v54;
      v58.size.height = v18;
      MinY = CGRectGetMinY(v58);
      v37 = v46;
      v36 = v47;
      v38 = v49;
      v39 = v48;
      v40 = CGRectGetMinY(*(CGRect *)&v36) + 6.0;
      if (MinY >= v40)
        v24 = MinY;
      else
        v24 = v40;
      v28 = CGSizeZero.width;
      v18 = CGSizeZero.height;
      objc_msgSend(v5, "setArrowDirection:", 1);
    }

  }
  v41 = v15;
  v42 = v24;
  v43 = v28;
  v44 = v18;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)p_buildMenuTitles:(id)a3 forSelectionPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Select Objects…"), 0, 0));

  objc_msgSend(v5, "addObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  v10 = objc_msgSend(v9, "canvasEditorCanUngroupWithSender:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
  v13 = objc_msgSend(v12, "canvasEditorCanGroupWithSender:", 0);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("GROUP_EDIT_MENU");
    v17 = CFSTR("Group");
  }
  else
  {
    if (!v10)
      goto LABEL_6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Ungroup");
    v17 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, v17, 0));

  objc_msgSend(v5, "addObject:", v18);
LABEL_6:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));

  v36 = (void *)v20;
  objc_msgSend(v5, "addObject:", v20);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editorController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentEditors"));

  obj = v23;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v28, "addContextualMenuItemsToArray:") & 1) != 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v28, "addContextualMenuItemsToArray:", v29);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v30 = v29;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v32; j = (char *)j + 1)
              {
                if (*(_QWORD *)v39 != v33)
                  objc_enumerationMutation(v30);
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1)
                                                                                   + 8 * (_QWORD)j), "title"));
                objc_msgSend(v5, "addObject:", v35);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v32);
          }

        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v25);
  }

}

- (void)p_buildMenuItems:(id)a3 forSelectionPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  char **v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id WeakRetained;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Select Objects…"), 0, 0));

  v10 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v9, "enterQuickSelectMode:");
  objc_msgSend(v6, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v49 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infosForSelectionPath:", v7));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasEditor"));
  v15 = objc_msgSend(v14, "canvasEditorCanUngroupWithSender:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasEditor"));
  v18 = objc_msgSend(v17, "canvasEditorCanGroupWithSender:", 0);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("GROUP_EDIT_MENU"), CFSTR("Group"), 0));
    v21 = &selRef_group_;
  }
  else
  {
    if (!v15)
      goto LABEL_6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Ungroup"), 0, 0));
    v21 = &selRef_ungroup_;
  }

  v22 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v20, *v21);
  objc_msgSend(v6, "addObject:", v22);

LABEL_6:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "canvasEditor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasEditorHelper"));
  v26 = objc_msgSend(v25, "canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:", 0);

  if (v26 == (id)1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Edit"), 0, 0));

    v29 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v28, "showMiniFormatterToExitDrawingMode:");
    objc_msgSend(v6, "addObject:", v29);

  }
  if (objc_msgSend(v12, "count") == (id)1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "anyObject"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "repForInfo:", v31));

    if ((objc_msgSend(v32, "isLocked") & 1) != 0)
    {
      v33 = 0;
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "itemsToAddToEditMenu"));
      objc_msgSend(v6, "addObjectsFromArray:", v34);

      v33 = 1;
    }
  }
  else
  {
    v33 = 0;
    v32 = 0;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));

  v37 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v36, "unlock:");
  objc_msgSend(v6, "addObject:", v37);
  if (v33)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController itemsToAddToEditMenuForRep:](self, "itemsToAddToEditMenuForRep:", v32));
    v39 = v38;
    if (v38 && objc_msgSend(v38, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v39);

  }
  v48 = v32;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "editorController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "currentEditors"));

  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v47, "addContextualMenuItemsToArray:") & 1) != 0)
          objc_msgSend(v47, "addContextualMenuItemsToArray:", v6);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v44);
  }

}

- (void)toggleEditMenuForCurrentSelection
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (self->mContextMenuMightBeDisplayed)
  {
    -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionPath"));
    -[CRLiOSCanvasViewController showEditMenuForSelectionPath:](self, "showEditMenuForSelectionPath:", v4);

  }
}

- (void)toggleDefaultEditUIForCurrentSelection
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  if (self->mContextMenuMightBeDisplayed)
  {
    -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
    v4 = objc_msgSend(v3, "isPresentingMiniFormatter");

    if (v4)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
      objc_msgSend(v9, "dismissMiniFormatter");

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));
      v8 = objc_msgSend(v7, "isCurrentlyInQuickSelectMode");

      if ((v8 & 1) == 0)
        -[CRLiOSCanvasViewController showDefaultEditUIForCurrentSelection](self, "showDefaultEditUIForCurrentSelection");
    }
  }
}

- (void)showDefaultEditUIForCurrentSelection
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));

  if (!-[CRLiOSCanvasViewController p_shouldShowMiniFormatterForSelectionPath:](self, "p_shouldShowMiniFormatterForSelectionPath:", v10))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v6, "currentDocumentMode") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode"));
      v9 = objc_msgSend(v8, "wantsLegacyEditMenu");

      if (v9)
      {
        -[CRLiOSCanvasViewController showEditMenuForSelectionPath:](self, "showEditMenuForSelectionPath:", v10);
        goto LABEL_8;
      }
    }
    else
    {

    }
    -[CRLiOSCanvasViewController showEditUIForSelectionPath:](self, "showEditUIForSelectionPath:", v10);
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
  objc_msgSend(v5, "presentMiniFormatterForSelectionPath:", v10);

LABEL_8:
}

- (id)editMenuConfigrationForSelectionPath:(id)a3 withConfigurationIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  v6 = a4;
  -[CRLiOSCanvasViewController p_targetPointForEditMenuForSelectionPath:outModifiedDirection:](self, "p_targetPointForEditMenuForSelectionPath:outModifiedDirection:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v6));

  objc_msgSend(v7, "setPreferredArrowDirection:", v9);
  return v7;
}

- (CGPoint)p_targetPointForEditMenuForSelectionPath:(id)a3 outModifiedDirection:(int64_t *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  NSString *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double MaxY;
  double v29;
  BOOL v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  CGFloat rect;
  CGFloat v36;
  double v37;
  double v38;
  CGPoint result;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[CRLiOSCanvasViewController targetRectForEditMenu:](self, "targetRectForEditMenu:", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "preferredContentSizeCategory"));

  if (UIContentSizeCategoryIsAccessibilityCategory(v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v16, "visibleBoundsRect");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v40.origin.x = v18;
    v40.origin.y = v20;
    v40.size.width = v22;
    v40.size.height = v24;
    v43.origin.x = v7;
    v43.origin.y = v9;
    v43.size.width = v11;
    v43.size.height = v13;
    v41 = CGRectIntersection(v40, v43);
    v36 = v13;
    v37 = v11;
    x = v41.origin.x;
    v38 = v7;
    y = v41.origin.y;
    width = v41.size.width;
    rect = v41.size.height;
    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    MaxY = CGRectGetMaxY(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v11 = v37;
    v7 = v38;
    v42.size.height = rect;
    v29 = MaxY - CGRectGetMaxY(v42);
    v30 = v29 < v9;
    v31 = 2;
    if (v29 >= v9)
      v31 = 1;
    v32 = -0.0;
    if (!v30)
      v32 = v36;
    v9 = v9 + v32;
    *a4 = v31;
  }

  v33 = v7 + v11 * 0.5;
  v34 = v9;
  result.y = v34;
  result.x = v33;
  return result;
}

- (void)showEditUIForSelectionPath:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuConfigrationForSelectionPath:withConfigurationIdentifier:](self, "editMenuConfigrationForSelectionPath:withConfigurationIdentifier:", a3, CFSTR("CRLDefault")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuInteraction](self, "editMenuInteraction"));
  objc_msgSend(v4, "presentEditMenuWithConfiguration:", v5);

}

- (void)hideEditMenu
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editMenuInteraction](self, "editMenuInteraction"));
  objc_msgSend(v3, "dismissMenu");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  objc_msgSend(v4, "hideMenu");

  self->mContextMenuMightBeDisplayed = 0;
}

- (id)itemsToAddToEditMenuForRep:(id)a3
{
  return 0;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (void)contextMenuDidHideForContextMenuController:(id)a3
{
  CRLiOSContextMenuController *mContextMenuController;
  CRLiOSContextMenuController *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLiOSContextMenuController *v9;
  void *v10;

  mContextMenuController = (CRLiOSContextMenuController *)a3;
  v5 = mContextMenuController;
  if (self->mContextMenuController != mContextMenuController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B620);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E172D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B640);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController contextMenuDidHideForContextMenuController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2050, 0, "Unexpected context menu controller closing!");

    mContextMenuController = self->mContextMenuController;
  }
  -[CRLiOSContextMenuController setDelegate:](mContextMenuController, "setDelegate:", 0);
  v9 = self->mContextMenuController;
  self->mContextMenuController = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  objc_msgSend(v10, "setMenuItems:", &__NSArray0__struct);

}

- (BOOL)contextMenuPositionShouldUpdateForContextMenuController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;

  if (self->mContextMenuController != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B660);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17354();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B680);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController contextMenuPositionShouldUpdateForContextMenuController:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 2059, 0, "Unexpected context menu controller updating!");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  -[CRLiOSCanvasViewController p_targetRectForMenuControllerPositionForSelectionPath:](self, "p_targetRectForMenuControllerPositionForSelectionPath:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  return !CGRectEqualToRect(v19, self->mTargetRectForContextMenuController);
}

- (BOOL)crl_representsPhysicalKeyboard
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return !self->mHasBeenTornDown;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;

  v6 = a4;
  if (-[CRLiOSCanvasViewController p_isAccessibilityTextResponderAction:](self, "p_isAccessibilityTextResponderAction:", a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputResponder"));

    if ((objc_opt_respondsToSelector(v8, a3) & 1) != 0)
      goto LABEL_9;

  }
  if (!sel_isEqual(a3, "find:"))
  {
LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)CRLiOSCanvasViewController;
    v15 = -[CRLiOSCanvasViewController targetForAction:withSender:](&v17, "targetForAction:withSender:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_9;
  }
  *(_QWORD *)&v10 = objc_opt_class(UIResponder, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", v10));
  v14 = sub_1002223BC(v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (!v8 || (objc_msgSend(v8, "canPerformAction:withSender:", a3, v6) & 1) == 0)
  {

    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  CRLInteractiveCanvasController **p_mICC;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  if (self->mHasBeenTornDown || -[CRLiOSCanvasViewController p_currentModeIsFind](self, "p_currentModeIsFind"))
  {
    v7 = 0;
  }
  else
  {
    v9 = "bringToFront:" == a3 || "sendToBack:" == a3;
    if (v9
      && (v10 = objc_opt_self(UICommand),
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10),
          isKindOfClass = objc_opt_isKindOfClass(v6, v11),
          v11,
          (isKindOfClass & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      p_mICC = &self->mICC;
      WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "controllingTM"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tracker"));

      if (v17
        && (objc_opt_respondsToSelector(v17, "disallowAllActionsWhileTracking") & 1) != 0
        && (objc_msgSend(v17, "disallowAllActionsWhileTracking") & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        v18 = objc_loadWeakRetained((id *)p_mICC);
        if ((objc_msgSend(v18, "isInDynamicOperation") & 1) != 0)
        {
          v7 = 0;
        }
        else
        {
          v19 = objc_loadWeakRetained((id *)p_mICC);
          v7 = objc_msgSend(v19, "canPerformInteractiveAction:withSender:", a3, v6);

        }
      }

    }
  }

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v4;
  char *v5;
  const char *v6;
  unsigned __int8 v7;
  unsigned int v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "action") == "sendToBack:")
  {
    v6 = "bringToFront:";
  }
  else
  {
    v5 = (char *)objc_msgSend(v4, "action");
    if (v5 != "bringToFront:")
      goto LABEL_11;
    v6 = v5;
  }
  v7 = -[CRLiOSCanvasViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", "sendToBack:", self);
  v8 = -[CRLiOSCanvasViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", v6, self);
  if ((v7 & 1) == 0 && !v8)
  {
    v9 = 4;
LABEL_10:
    objc_msgSend(v4, "setAttributes:", v9);
    goto LABEL_11;
  }
  if (!-[CRLiOSCanvasViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", objc_msgSend(v4, "action"), self))
  {
    v9 = 1;
    goto LABEL_10;
  }
LABEL_11:
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController validateCommand:](&v10, "validateCommand:", v4);

}

- (void)setContextMenuMightBeDisplayed:(BOOL)a3
{
  void *v5;
  unsigned int v6;

  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
    v6 = objc_msgSend(v5, "isMenuVisible");

    if (v6)
      -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  }
  self->mContextMenuMightBeDisplayed = a3;
}

- (void)cut:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  objc_opt_class(UIMenuController, v5);
  if ((objc_opt_isKindOfClass(v8, v6) & 1) == 0)
    -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  objc_msgSend(WeakRetained, "makeEditorPerformAction:withSender:", a2, v8);

}

- (void)showMiniFormatterToExitDrawingMode:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class(UIMenuController, v4);
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
    -[CRLiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditorHelper"));
  objc_msgSend(v8, "showMiniFormatterToExitDrawingMode:", v9);

}

- (void)unlock:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v6, "makeEditorPerformAction:withSender:", a2, v5);

  objc_opt_class(UIMenuController, v7);
  LOBYTE(a2) = objc_opt_isKindOfClass(v5, v8);

  if ((a2 & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
    -[CRLiOSCanvasViewController showEditMenuForSelectionPath:](self, "showEditMenuForSelectionPath:", v10);

  }
}

- (void)forceStopScrolling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B6A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E173D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B6C0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController forceStopScrolling]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2187, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enclosingScrollView"));

  if (objc_msgSend(v7, "isScrollEnabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = objc_msgSend(v8, "currentlyScrolling");

    if (v9)
    {
      objc_msgSend(v7, "setScrollEnabled:", 0);
      objc_msgSend(v7, "setScrollEnabled:", 1);
      objc_msgSend(v7, "contentOffset");
      objc_msgSend(v7, "setContentOffset:animated:", 0);
    }
  }

}

- (void)scrollViewDidScroll
{
  void *v3;
  char v4;
  id v5;

  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v4 = objc_opt_respondsToSelector(v3, "userDidInteractWithCanvas:");

    if ((v4 & 1) != 0)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v5, "userDidInteractWithCanvas:", self);

    }
  }
}

- (BOOL)shouldOptOutOfUIScrollViewContentOffsetAnimation
{
  return 1;
}

- (void)enterQuickSelectMode
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  CRLiOSQuickSelectViewController *v9;
  CRLiOSQuickSelectViewController *mQuickSelectViewController;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id WeakRetained;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
  v4 = objc_msgSend(v3, "isPresentingMiniFormatter");

  if (-[CRLiOSCanvasViewController allowedToEnterQuickSelectMode](self, "allowedToEnterQuickSelectMode") && v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
    objc_msgSend(v5, "dismissMiniFormatter");

  }
  if (-[CRLiOSCanvasViewController isCurrentlyInQuickSelectMode](self, "isCurrentlyInQuickSelectMode")
    || !-[CRLiOSCanvasViewController allowedToEnterQuickSelectMode](self, "allowedToEnterQuickSelectMode"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B6E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17454();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B700);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController enterQuickSelectMode]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 2226, 0, "Attempting to enter Quick Select mode at an inappropriate time.");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "willEnterQuickSelectModeForCanvasViewController:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v8, "willEnterQuickSelectModeForCanvasViewController:", self);

    }
    -[CRLiOSCanvasViewController beginPreventingDefaultPencilBehaviors](self, "beginPreventingDefaultPencilBehaviors");
    v9 = -[CRLiOSQuickSelectViewController initWithDelegate:]([CRLiOSQuickSelectViewController alloc], "initWithDelegate:", self);
    mQuickSelectViewController = self->mQuickSelectViewController;
    self->mQuickSelectViewController = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v12 = objc_opt_respondsToSelector(v11, "didEnterQuickSelectModeForCanvasViewController:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v13, "didEnterQuickSelectModeForCanvasViewController:", self);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v15 = objc_opt_respondsToSelector(v14, "quickSelectHUDParentViewForCanvasViewController:");

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "quickSelectHUDParentViewForCanvasViewController:", self));

    }
    else
    {
      v17 = 0;
    }
    v35 = (void *)v17;
    -[CRLiOSQuickSelectViewController presentOnCanvasViewController:parentView:](self->mQuickSelectViewController, "presentOnCanvasViewController:parentView:", self, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "enclosingScrollView"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "panGestureRecognizer"));
    self->mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect = (int64_t)objc_msgSend(v22, "minimumNumberOfTouches");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "panGestureRecognizer"));
    objc_msgSend(v23, "setMinimumNumberOfTouches:", 2);

    self->mEditMenuTapGestureRecognizerEnabledBeforeQuickSelect = -[CRLiOSEditMenuTapGestureRecognizer isEnabled](self->mEditMenuTapGestureRecognizer, "isEnabled");
    -[CRLiOSEditMenuTapGestureRecognizer setEnabled:](self->mEditMenuTapGestureRecognizer, "setEnabled:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v25 = objc_opt_respondsToSelector(v24, "updateToolbarButtons");

    if ((v25 & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v26, "updateToolbarButtons");

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topLevelReps"));

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v34, "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
          objc_msgSend(v34, "recursivelyPerformSelectorIfImplemented:", "stopPlaybackIfNeeded");
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v31);
    }

    v19 = v35;
  }

}

- (void)leaveQuickSelectModeIfNeeded
{
  if (-[CRLiOSCanvasViewController isCurrentlyInQuickSelectMode](self, "isCurrentlyInQuickSelectMode"))
    -[CRLiOSCanvasViewController p_leaveQuickSelectMode](self, "p_leaveQuickSelectMode");
}

- (void)temporarilyHideQuickSelectHUDIfNecessary
{
  -[CRLiOSQuickSelectViewController temporarilyHideUI](self->mQuickSelectViewController, "temporarilyHideUI");
}

- (void)unhideQuickSelectHUDIfNecessary
{
  -[CRLiOSQuickSelectViewController unhideUI](self->mQuickSelectViewController, "unhideUI");
}

- (BOOL)shouldExitQuickSelectModeForQuickSelectViewController:(id)a3
{
  return !-[CRLiOSCanvasViewController allowedToEnterQuickSelectMode](self, "allowedToEnterQuickSelectMode", a3);
}

- (CGRect)visibleCanvasRectForQuickSelectViewController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double left;
  double v19;
  double bottom;
  double v21;
  double right;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "visibleScaledRectForCanvasUI");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v15 = objc_opt_respondsToSelector(v14, "safeInsetsForTemporaryHUDsToAvoidViewsObscuringCanvasScrollViewForCanvasViewController:");

  if ((v15 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    objc_msgSend(v16, "safeInsetsForTemporaryHUDsToAvoidViewsObscuringCanvasScrollViewForCanvasViewController:", self);
    left = v17;
    bottom = v19;
    right = v21;

  }
  else
  {
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v23 = v7 + 0.0;
  v24 = v9 + 0.0;
  v25 = v13 - (bottom + 0.0);
  if (left >= right)
    v26 = left;
  else
    v26 = right;
  v27 = v7 + v26;
  v28 = v11 - (v26 + v26);
  v29 = objc_msgSend(v4, "isInCompactViewModeForCompactFrame:andRegularSizeFrame:", v23, v24, v11, v25, v27, v24, v28, v13);
  if (v29)
    v13 = v25;
  else
    v11 = v28;
  if (v29)
    v27 = v23;

  v30 = v27;
  v31 = v24;
  v32 = v11;
  v33 = v13;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)allowedToEnterQuickSelectMode
{
  _BOOL4 v3;

  v3 = -[CRLiOSCanvasViewController p_currentModeAllowsQuickSelect](self, "p_currentModeAllowsQuickSelect");
  if (v3)
    LOBYTE(v3) = -[CRLiOSCanvasViewController p_editorAllowsQuickSelect](self, "p_editorAllowsQuickSelect");
  return v3;
}

- (BOOL)isCurrentlyInQuickSelectMode
{
  return self->mQuickSelectViewController != 0;
}

- (BOOL)p_currentModeAllowsQuickSelect
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "currentDocumentMode");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDocumentMode"));

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B720);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E174D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B740);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_currentModeAllowsQuickSelect]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2326, 0, "invalid nil value for '%{public}s'", "currentMode");

  }
  v10 = objc_msgSend(v6, "allowedToEnterQuickSelectModeForCanvasViewController:", self);

  return v10;
}

- (BOOL)p_currentModeIsFind
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "currentDocumentMode");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDocumentMode"));

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B760);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E17560();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B780);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_currentModeIsFind]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 2340, 0, "invalid nil value for '%{public}s'", "currentMode");

    }
    objc_opt_class(CRLiOSDocumentModeFindReplace, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v11);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)p_editorAllowsQuickSelect
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editorController](self, "editorController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10029E490;
  v4[3] = &unk_101232970;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateEditorsOnStackUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (void)p_leaveQuickSelectMode
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect;
  uint64_t v9;
  CRLiOSQuickSelectViewController *mQuickSelectViewController;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "willLeaveQuickSelectModeForCanvasViewController:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    objc_msgSend(v5, "willLeaveQuickSelectModeForCanvasViewController:", self);

  }
  -[CRLiOSQuickSelectViewController dismiss](self->mQuickSelectViewController, "dismiss");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enclosingScrollView"));

  mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect = self->mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "panGestureRecognizer"));
  objc_msgSend((id)v9, "setMinimumNumberOfTouches:", mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect);

  -[CRLiOSEditMenuTapGestureRecognizer setEnabled:](self->mEditMenuTapGestureRecognizer, "setEnabled:", self->mEditMenuTapGestureRecognizerEnabledBeforeQuickSelect);
  mQuickSelectViewController = self->mQuickSelectViewController;
  self->mQuickSelectViewController = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  LOBYTE(v9) = objc_opt_respondsToSelector(v11, "didLeaveQuickSelectModeForCanvasViewController:");

  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    objc_msgSend(v12, "didLeaveQuickSelectModeForCanvasViewController:", self);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "updateToolbarButtons");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    objc_msgSend(v15, "updateToolbarButtons");

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas", 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topLevelReps"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "invalidateKnobs");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

  -[CRLiOSCanvasViewController endPreventingDefaultPencilBehaviors](self, "endPreventingDefaultPencilBehaviors");
}

- (id)i_quickSelectViewController
{
  return self->mQuickSelectViewController;
}

- (CGRect)visibleScaledRectForCanvasUI
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v2, "visibleScaledRectForCanvasUI");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CRLEditorController)editorController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));

  return (CRLEditorController *)v3;
}

- (void)didDismissQuickSelectViewController:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->mQuickSelectViewController == a3)
  {
    v4 = -[CRLiOSCanvasViewController shouldExitQuickSelectModeForQuickSelectViewController:](self, "shouldExitQuickSelectModeForQuickSelectViewController:");
    -[CRLiOSCanvasViewController leaveQuickSelectModeIfNeeded](self, "leaveQuickSelectModeIfNeeded");
    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      v6 = objc_msgSend(v5, "editingDisabled");

      if ((v6 & 1) == 0)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionModelTranslator"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItemsForSelectionPath:", v11));
        v13 = objc_msgSend(v12, "count");

        if (v13)
          -[CRLiOSCanvasViewController showDefaultEditUIForCurrentSelection](self, "showDefaultEditUIForCurrentSelection");
      }
    }
  }
}

- (void)presentAlignmentTools
{
  _TtC8Freeform30CRLiOSAlignmentToolsController *v3;
  void *v4;
  _TtC8Freeform30CRLiOSAlignmentToolsController *mAlignmentController;

  if (!self->mAlignmentController)
  {
    v3 = -[CRLiOSAlignmentToolsController initWithDelegate:]([_TtC8Freeform30CRLiOSAlignmentToolsController alloc], "initWithDelegate:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAlignmentToolsController viewController](v3, "viewController"));
    -[CRLiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

    mAlignmentController = self->mAlignmentController;
    self->mAlignmentController = v3;

  }
}

- (void)userDismissedAlignmentToolsController:(id)a3
{
  _TtC8Freeform30CRLiOSAlignmentToolsController *v4;
  _TtC8Freeform30CRLiOSAlignmentToolsController *mAlignmentController;
  void *v6;
  void *v7;
  void *v8;

  v4 = (_TtC8Freeform30CRLiOSAlignmentToolsController *)a3;
  mAlignmentController = v4;
  if (self->mAlignmentController != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B7A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E175EC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B7C0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController userDismissedAlignmentToolsController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2438, 0, "expected equality between %{public}s and %{public}s", "alignmentController", "mAlignmentController");

    mAlignmentController = self->mAlignmentController;
  }
  self->mAlignmentController = 0;

}

- (void)alignmentToolsControllerShouldDismiss:(id)a3
{
  _TtC8Freeform30CRLiOSAlignmentToolsController *v4;
  _TtC8Freeform30CRLiOSAlignmentToolsController *mAlignmentController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC8Freeform30CRLiOSAlignmentToolsController *v14;

  v4 = (_TtC8Freeform30CRLiOSAlignmentToolsController *)a3;
  mAlignmentController = v4;
  if (self->mAlignmentController != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B7E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17724();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B800);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController alignmentToolsControllerShouldDismiss:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2443, 0, "expected equality between %{public}s and %{public}s", "alignmentController", "mAlignmentController");

    mAlignmentController = self->mAlignmentController;
  }
  if (mAlignmentController)
    goto LABEL_21;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124B820);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E17698();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124B840);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController alignmentToolsControllerShouldDismiss:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2444, 0, "invalid nil value for '%{public}s'", "mAlignmentController");

  if (self->mAlignmentController)
  {
LABEL_21:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController presentedViewController](self, "presentedViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAlignmentToolsController viewController](self->mAlignmentController, "viewController"));

    if (v12 == v13)
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
    v14 = self->mAlignmentController;
    self->mAlignmentController = 0;

  }
}

- (BOOL)inRestrictedGestureMode
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v2, "currentDocumentMode") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentDocumentMode"));
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "wantsCanvasInRestrictedGestureMode");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "currentDocumentMode") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDocumentMode"));
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "allowGestureInRestrictedGestureMode:", v4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)inInspectorPanZoomMode
{
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "inInspectorPanZoomMode");

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_mDelegate);
  v6 = objc_msgSend(v5, "inInspectorPanZoomMode");

  return v6;
}

- (BOOL)inInspectorTextEditingMode
{
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "inInspectorTextEditingMode");

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_mDelegate);
  v6 = objc_msgSend(v5, "inInspectorTextEditingMode");

  return v6;
}

- (void)addInspectorPanZoomModeGRsToArray:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
  objc_msgSend(v7, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  objc_msgSend(v7, "addObject:", v5);

  if (-[CRLiOSCanvasViewController inMediaBrowsingMode](self, "inMediaBrowsingMode"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"));
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (BOOL)inMediaBrowsingMode
{
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  char v4;
  id v5;
  unsigned __int8 v6;

  p_mDelegate = &self->mDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "inMediaBrowsingMode");

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_mDelegate);
  v6 = objc_msgSend(v5, "inMediaBrowsingMode");

  return v6;
}

- (BOOL)documentModeWantsToSuppressMediaReplacementKnobs
{
  return 0;
}

- (void)p_handlePencilDown:(id)a3
{
  CRLInteractiveCanvasController **p_mICC;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  p_mICC = &self->mICC;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mICC);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v9, v11);
  v13 = v12;
  v15 = v14;

  v16 = objc_loadWeakRetained((id *)p_mICC);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "freehandDrawingToolkit"));
  v18 = objc_msgSend(v17, "freehandDrawingBehaviorForTouchType:atUnscaledPoint:", 2, v13, v15);

  if (v18 == (id)1)
  {
    v19 = objc_loadWeakRetained((id *)p_mICC);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvasEditor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathWithInfos:", v21));

    v22 = objc_loadWeakRetained((id *)p_mICC);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editorController"));
    objc_msgSend(v23, "setSelectionPath:", v26);

    v24 = objc_loadWeakRetained((id *)p_mICC);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "freehandDrawingToolkit"));
    objc_msgSend(v25, "beginDrawingModeIfNeededForTouchType:", 2);

  }
}

- (void)p_handleSingleTapGesture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;

  v4 = a3;
  objc_opt_class(CRLiOSTapGestureRecognizer, v5);
  v7 = sub_100221D0C(v6, v4);
  v23 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = v23;
  if (v23)
  {
    v9 = objc_msgSend(v23, "state") == (id)4;
    v8 = v23;
    if (!v9)
    {
      *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform25CRLScenesViewController_i, v10).n128_u64[0];
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController presentedViewController](self, "presentedViewController", v11));
      v15 = sub_100221D0C(v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      if (v16 && (objc_msgSend(v16, "isBeingDismissed") & 1) == 0)
      {
        objc_msgSend(v16, "dismissScenesPopover");
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
        objc_msgSend(v23, "firstTapLocation");
        objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
        v19 = v18;
        v21 = v20;

        if (!-[CRLiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:](self, "handleSingleTapAtPoint:withRecognizer:", v23, v19, v21))
        {
          v22 = objc_loadWeakRetained((id *)&self->mICC);
          objc_msgSend(v22, "tappedCanvasBackgroundAtPoint:inputType:", sub_10033831C((_BOOL8)objc_msgSend(v23, "touchTypeForTap")), v19, v21);

        }
      }

      v8 = v23;
    }
  }

}

- (void)p_zoomWithGesture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  CRLCanvasZoomTracker *v11;
  void *v12;
  CRLCanvasZoomTracker *v13;
  CRLCanvasZoomTracker *mCanvasZoomTracker;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CRLCanvasZoomTracker *v28;
  double v29;
  double v30;
  double v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == (id)3)
  {
    v9 = 0;
    v10 = 2;
  }
  else if (v5 == (id)2)
  {
    v9 = 1;
    v10 = 1;
  }
  else if (v5 == (id)1)
  {
    if (self->mCanvasZoomTracker)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B860);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E177D0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124B880);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_zoomWithGesture:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2577, 0, "expected nil value for '%{public}s'", "mCanvasZoomTracker");

    }
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 3;
  }
  if (!self->mCanvasZoomTracker)
  {
    v11 = [CRLCanvasZoomTracker alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasLayer](self, "canvasLayer"));
    v13 = -[CRLCanvasZoomTracker initWithCanvasLayer:](v11, "initWithCanvasLayer:", v12);
    mCanvasZoomTracker = self->mCanvasZoomTracker;
    self->mCanvasZoomTracker = v13;

    -[CRLCanvasZoomTracker setDelegate:](self->mCanvasZoomTracker, "setDelegate:", self);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
  objc_msgSend(v4, "locationInView:", v16);
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "superview"));
  objc_msgSend(v21, "convertPoint:fromView:", v23, v18, v20);
  v25 = v24;
  v27 = v26;

  if (!v9 || objc_msgSend(v4, "numberOfTouches") == (id)2 || !objc_msgSend(v4, "numberOfTouches"))
  {
    v28 = self->mCanvasZoomTracker;
    objc_msgSend(v4, "scale");
    v30 = v29;
    objc_msgSend(v4, "velocity");
    -[CRLCanvasZoomTracker zoomWithScale:velocity:locationInView:phase:](v28, "zoomWithScale:velocity:locationInView:phase:", v10, v30, v31, v25, v27);
  }

}

- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithZoomMethod:(int64_t)a4
{
  CRLiOSCanvasZoomPinchGestureRecognizer *v6;
  CRLiOSCanvasZoomPinchGestureRecognizer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  id v40;

  v40 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView", a3));
  v6 = self->mZoomGestureRecognizer;
  v7 = v6;
  self->mCanvasZoomMethod = a4;
  if (a4 || -[CRLiOSCanvasZoomPinchGestureRecognizer numberOfTouches](v6, "numberOfTouches") != (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "enclosingScrollView"));
    objc_msgSend(v16, "center");
    v18 = v17;
    v20 = v19 + -120.0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
    objc_msgSend(v21, "convertPoint:toView:", v40, v18, v20);
    v13 = v22;
    v15 = v23;

    v11 = v15;
    v9 = v13;
  }
  else
  {
    -[CRLiOSCanvasZoomPinchGestureRecognizer locationOfTouch:inView:](v7, "locationOfTouch:inView:", 0, v40);
    v9 = v8;
    v11 = v10;
    -[CRLiOSCanvasZoomPinchGestureRecognizer locationOfTouch:inView:](v7, "locationOfTouch:inView:", 1, v40);
    v13 = v12;
    v15 = v14;
  }
  v24 = sub_1000603D0(v9, v11, v13);
  v26 = sub_1000603DC(v24, v25, 0.5);
  v28 = v27;
  if (vabdd_f64(v9, v13) >= 40.0)
  {
    if (v9 >= v13)
      v29 = v9;
    else
      v29 = v13;
    if (v9 >= v13)
      v30 = v11;
    else
      v30 = v15;
    if (v9 >= v13)
      v31 = v13;
    else
      v31 = v9;
    v32 = sub_1000603B8(v29, v30, v31);
    v34 = sub_1000618B4(v32, v33);
    v35 = sub_100061F64(v34 + -1.57079633);
    v37 = sub_1000603DC(v35, v36, 120.0);
    v26 = sub_1000603D0(v26, v28, v37);
    v28 = v38;
  }
  self->mLastZoomHUDLocation.x = sub_1000630C4(v26, v28);
  self->mLastZoomHUDLocation.y = v39;

}

- (void)canvasZoomTracker:(id)a3 willUpdateViewScaleFeedbackWithScale:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasLayer](self, "canvasLayer", a3));
  objc_msgSend(v19, "minimumPinchViewScale");
  v7 = v6;
  objc_msgSend(v19, "maximumPinchViewScale");
  v9 = sub_1003C65EC(a4, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "i_descriptionForViewScale:zoomMethod:", self->mCanvasZoomMethod, v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v12, "allowsZoomHUD") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v14 = objc_msgSend(v13, "allowsZoomHUD") ^ 1;

  }
  else
  {
    v14 = 0;
  }

  v15 = objc_msgSend(v11, "length");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
  v17 = v16;
  if (!v15 || (v14 & 1) != 0)
  {
    objc_msgSend(v16, "hideHUDForKey:", self);
  }
  else
  {
    objc_msgSend(v16, "setLabelText:", v11);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
    objc_msgSend(v17, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:size:", self, v18, 1, self->mLastZoomHUDLocation.x, self->mLastZoomHUDLocation.y, 0.0);

  }
}

- (void)canvasZoomTrackerDidEndViewScaleFeedback:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController", a3));
  objc_msgSend(v4, "hideHUDForKey:", self);

}

- (CGRect)rectToIncludeWhenGrowingCanvasToFitContent
{
  CRLCanvasZoomTracker *mCanvasZoomTracker;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  mCanvasZoomTracker = self->mCanvasZoomTracker;
  if (mCanvasZoomTracker)
  {
    -[CRLCanvasZoomTracker visibleUnscaledBoundsAtEndOfZoom](mCanvasZoomTracker, "visibleUnscaledBoundsAtEndOfZoom");
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController crl_windowWrapper](self, "crl_windowWrapper", a3));
  v5 = objc_msgSend(v4, "newWrapperBeginningIgnoringUserInteractionSafely");

  -[CRLiOSCanvasViewController setZoomTrackerIgnoreInteractionEventsSafeWrapper:](self, "setZoomTrackerIgnoreInteractionEventsSafeWrapper:", v5);
}

- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController zoomTrackerIgnoreInteractionEventsSafeWrapper](self, "zoomTrackerIgnoreInteractionEventsSafeWrapper", a3));
  objc_msgSend(v4, "endIgnoringUserInteractionSafely");

  -[CRLiOSCanvasViewController setZoomTrackerIgnoreInteractionEventsSafeWrapper:](self, "setZoomTrackerIgnoreInteractionEventsSafeWrapper:", 0);
}

- (void)canvasZoomTrackerDidFinish:(id)a3
{
  CRLCanvasZoomTracker *mCanvasZoomTracker;

  -[CRLCanvasZoomTracker setDelegate:](self->mCanvasZoomTracker, "setDelegate:", 0);
  mCanvasZoomTracker = self->mCanvasZoomTracker;
  self->mCanvasZoomTracker = 0;

}

- (id)p_willPresentError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedRecoveryOptions"));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recoveryAttempter"));
    v7 = (void *)v6;
    if (!v6
      || (objc_opt_respondsToSelector(v6, "attemptRecoveryFromError:optionIndex:") & 1) == 0
      && (objc_opt_respondsToSelector(v7, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:") & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
      v9 = objc_msgSend(v8, "mutableCopy");

      objc_msgSend(v9, "removeObjectForKey:", NSLocalizedRecoverySuggestionErrorKey);
      objc_msgSend(v9, "removeObjectForKey:", NSLocalizedRecoveryOptionsErrorKey);
      objc_msgSend(v9, "removeObjectForKey:", NSRecoveryAttempterErrorKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
      v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v3, "code"), v9));

      v3 = (id)v11;
    }

  }
  return v3;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController p_willPresentError:](self, "p_willPresentError:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionAwareAlertController crl_alertControllerWithError:preferredStyle:completion:](_TtC8Freeform32CRLSelectionAwareAlertController, "crl_alertControllerWithError:preferredStyle:completion:", v7, 1, v6));

  if (qword_10147E388 != -1)
    dispatch_once(&qword_10147E388, &stru_10124B8A0);
  v9 = off_1013D9088;
  if (os_log_type_enabled((os_log_t)off_1013D9088, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "title: %@, message: %@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController presentedViewController](self, "presentedViewController"));
  v14 = objc_msgSend(v13, "isBeingDismissed");
  if (!v13 || (v14 & 1) != 0)
  {
    -[CRLiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002A0080;
    v15[3] = &unk_10122D3D8;
    v15[4] = self;
    v16 = v8;
    -[CRLiOSCanvasViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v15);

  }
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002A0280;
    v20[3] = &unk_10122F678;
    v12 = &v21;
    v21 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionAwareAlertController crl_alertControllerWithError:preferredStyle:completion:](_TtC8Freeform32CRLSelectionAwareAlertController, "crl_alertControllerWithError:preferredStyle:completion:", v11, 1, v20));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionAwareAlertController alertControllerWithTitle:message:preferredStyle:](_TtC8Freeform32CRLSelectionAwareAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002A0294;
    v18[3] = &unk_1012326E0;
    v12 = &v19;
    v19 = v10;
    objc_msgSend(v13, "crl_addSimpleOKButtonWithHandler:", v18);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController presentedViewController](self, "presentedViewController"));
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "isBeingDismissed") & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002A02A8;
    v16[3] = &unk_10122D3D8;
    v16[4] = self;
    v17 = v13;
    -[CRLiOSCanvasViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v16);

  }
  else
  {
    -[CRLiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B8C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E178E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B8E0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2773, 0, "Modal operations must be started on the main thread,");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController userDialogPresenter](self, "userDialogPresenter"));
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B900);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1785C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B920);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2777, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "beginModalOperationWithLocalizedMessage:progress:cancelHandler:", v8, v9, v10));

  return v18;
}

- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B940);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E179F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B960);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2784, 0, "Modal operations must be started on the main thread,");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController userDialogPresenter](self, "userDialogPresenter"));
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B980);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17968();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B9A0);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2788, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:", v8, v9, v10));

  return v18;
}

- (void)endModalOperationWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B9C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17B00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B9E0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endModalOperationWithToken:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2794, 0, "Modal operations must be ended on the main thread,");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController userDialogPresenter](self, "userDialogPresenter"));
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BA00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17A74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BA20);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endModalOperationWithToken:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2798, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");

  }
  objc_msgSend(v8, "endModalOperationWithToken:", v4);

}

- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, a3);
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a5;
  v10 = a6;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController userDialogPresenter](self, "userDialogPresenter"));
  objc_msgSend(v11, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", a3, a4, v6, v10);

}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knobValidatorBlock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"));
  objc_msgSend(v10, "setKnobValidatorBlock:", v9);

  if (objc_msgSend(v7, "wantsToSuppressMiniFormatter")
    && (objc_msgSend(v8, "wantsToSuppressMiniFormatter") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
    objc_msgSend(v11, "dismissMiniFormatter");
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "wantsToSuppressMiniFormatter") & 1) == 0
    && objc_msgSend(v8, "wantsToSuppressMiniFormatter"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController miniFormatterPresenter](self, "miniFormatterPresenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editorController](self, "editorController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
    objc_msgSend(v11, "presentMiniFormatterForSelectionPath:", v13);

LABEL_7:
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvas"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topLevelReps"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "documentModeDidChange");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

}

- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)miniFormatterPresenter
{
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *miniFormatterPresenter;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v4;
  void *v5;
  void *v6;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v7;
  _TtC8Freeform28CRLiOSMiniFormatterPresenter *v8;

  miniFormatterPresenter = self->_miniFormatterPresenter;
  if (!miniFormatterPresenter)
  {
    if (self->mHasBeenTornDown)
    {
      miniFormatterPresenter = 0;
    }
    else
    {
      v4 = [_TtC8Freeform28CRLiOSMiniFormatterPresenter alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
      v7 = -[CRLiOSMiniFormatterPresenter initWithEditorController:canvasLayerHosting:](v4, "initWithEditorController:canvasLayerHosting:", v6, self);
      v8 = self->_miniFormatterPresenter;
      self->_miniFormatterPresenter = v7;

      miniFormatterPresenter = self->_miniFormatterPresenter;
    }
  }
  return miniFormatterPresenter;
}

- (void)updateToolbarButtons
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "updateToolbarButtons");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    objc_msgSend(v5, "updateToolbarButtons");

  }
}

- (BOOL)p_shouldShowMiniFormatterForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  id WeakRetained;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "documentIsSharedReadOnly");

  if ((v6 & 1) != 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC")),
        v10 = objc_msgSend(v9, "isCurrentlyInQuickSelectMode"),
        v9,
        v8,
        v7,
        (v10 & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "boardItemsForSelectionPath:", v4));

    v11 = objc_msgSend(v14, "count") != 0;
  }

  return v11;
}

- (CRLiOSPencilMediating)pencilMediator
{
  _TtC8Freeform20CRLiOSPencilMediator *mPencilMediator;
  _TtC8Freeform20CRLiOSPencilMediator *v4;
  void *v5;
  _TtC8Freeform20CRLiOSPencilMediator *v6;
  _TtC8Freeform20CRLiOSPencilMediator *v7;

  mPencilMediator = self->mPencilMediator;
  if (!mPencilMediator)
  {
    v4 = [_TtC8Freeform20CRLiOSPencilMediator alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = -[CRLiOSPencilMediator initWithInteractiveCanvasController:](v4, "initWithInteractiveCanvasController:", v5);
    v7 = self->mPencilMediator;
    self->mPencilMediator = v6;

    mPencilMediator = self->mPencilMediator;
  }
  return (CRLiOSPencilMediating *)mPencilMediator;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
  if (!v2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BA40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17B80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BA60);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController shouldSelectAndScrollWithApplePencil]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2875, 0, "invalid nil value for '%{public}s'", "delegate");

  }
  v6 = objc_msgSend(v2, "shouldSelectAndScrollWithApplePencil");

  return v6;
}

- (BOOL)shouldPreventDefaultPencilBehaviors
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->mPreventStandardPencilBehaviorsCounter);
  return v2 > 0;
}

- (void)beginPreventingDefaultPencilBehaviors
{
  int *p_mPreventStandardPencilBehaviorsCounter;
  unsigned int v3;

  p_mPreventStandardPencilBehaviorsCounter = &self->mPreventStandardPencilBehaviorsCounter;
  do
    v3 = __ldaxr((unsigned int *)p_mPreventStandardPencilBehaviorsCounter);
  while (__stlxr(v3 + 1, (unsigned int *)p_mPreventStandardPencilBehaviorsCounter));
}

- (void)endPreventingDefaultPencilBehaviors
{
  int *p_mPreventStandardPencilBehaviorsCounter;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  p_mPreventStandardPencilBehaviorsCounter = &self->mPreventStandardPencilBehaviorsCounter;
  do
    v3 = __ldaxr((unsigned int *)p_mPreventStandardPencilBehaviorsCounter);
  while (__stlxr(v3 - 1, (unsigned int *)p_mPreventStandardPencilBehaviorsCounter));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BA80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17C0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BAA0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endPreventingDefaultPencilBehaviors]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 2890, 0, "Uneven calls to begin/endPreventingDefaultPencilBehaviors!");

    do
      v7 = __ldaxr((unsigned int *)p_mPreventStandardPencilBehaviorsCounter);
    while (__stlxr(v7 + 1, (unsigned int *)p_mPreventStandardPencilBehaviorsCounter));
  }
}

- (BOOL)isShowingRadialPalette
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v4));
    v6 = objc_msgSend(v5, "_paletteViewVisible");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)p_handleSqueezePaletteViewWillShowNotification:(id)a3
{
  CRLInteractiveCanvasController **p_mICC;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  p_mICC = &self->mICC;
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode"));
  v9 = objc_msgSend(v8, "pencilModeType");

  if (!v9)
  {
    v11 = objc_loadWeakRetained((id *)p_mICC);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingToolkit"));
    objc_msgSend(v10, "beginDrawingModeIfNeededForTouchType:", 2);

  }
}

- (void)i_startObservingFreehandDrawingToolkit
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  objc_msgSend(v3, "addToolkitObserver:", self);

}

- (BOOL)isHandlingScribbleWriting
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController scribbleInteraction](self, "scribbleInteraction"));
  if ((objc_msgSend(v3, "isHandlingWriting") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController directScribbleInteraction](self, "directScribbleInteraction"));
    v4 = objc_msgSend(v5, "isHandlingWriting");

  }
  return v4;
}

- (UIView)presentedHUDView
{
  return (UIView *)-[CRLiOSQuickSelectViewController view](self->mQuickSelectViewController, "view");
}

- (UITextInput)currentEditingTextInputResponder
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputResponder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editor"));
  objc_opt_class(NSObject, v5);
  v12 = sub_1002220C8(v4, v6, 1, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLEditor);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    *(_QWORD *)&v15 = objc_opt_class(CRLWPSelection, v14).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController", v15));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionForEditor:", v13));
    v20 = sub_100221D0C(v17, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (v21 && objc_msgSend(v21, "range") != (id)0x7FFFFFFFFFFFFFFFLL)
      v22 = v3;
    else
      v22 = 0;

  }
  else
  {
    v22 = 0;
  }

  return (UITextInput *)v22;
}

- (BOOL)p_scribblePreventedRegardlessOfPoint
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v3, "editingDisabled") & 1) != 0
    || (objc_msgSend(v3, "isInDynamicOperation") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = -[CRLiOSCanvasViewController shouldPreventDefaultPencilBehaviors](self, "shouldPreventDefaultPencilBehaviors");
  }

  return v4;
}

- (BOOL)shouldBeginScribblingAtPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  y = a3.y;
  x = a3.x;
  if (!-[CRLiOSCanvasViewController p_scribblePreventedRegardlessOfPoint](self, "p_scribblePreventedRegardlessOfPoint"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v7, "convertBoundsToUnscaledPoint:", x, y);
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "currentDocumentMode");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentDocumentMode"));
      v16 = objc_msgSend(v15, "pencilModeType");

      if (v16 == (id)1)
        goto LABEL_9;
      if (v16 == (id)2)
      {
LABEL_7:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hitKnobAtPoint:inputType:returningRep:", 2, 0, v9, v11));

        if ((objc_msgSend(v20, "worksWithStylus") & 1) != 0)
        {
          v6 = 0;
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hitRep:", v9, v11));
          v22 = v21;
          if (v21
            && (objc_msgSend(v21, "convertNaturalPointFromUnscaledCanvas:", v9, v11),
                !objc_msgSend(v22, "shouldBeginScribbleAtPoint:")))
          {
            v6 = 0;
          }
          else if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", x, y))
          {
            v6 = 1;
          }
          else
          {
            v6 = -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", 0, x, y);
          }

        }
        goto LABEL_18;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController pencilMediator](self, "pencilMediator"));
    v18 = objc_msgSend(v17, "pencilBehaviorOutsideModesAtUnscaledPoint:", v9, v11);

    if (v18 == (id)2)
      goto LABEL_7;
LABEL_9:
    v6 = 0;
LABEL_18:

    return v6;
  }
  return 0;
}

- (id)containedScribbleElementForContainerScribbleElement:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = sub_100221DDC(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containedRep"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scribbleCapableElements"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)wantsSystemInputAssistantForScribble
{
  return 0;
}

- (id)scribbleCapableElementsForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLiOSCanvasViewController p_scribblePreventedRegardlessOfPoint](self, "p_scribblePreventedRegardlessOfPoint"))
  {
    v8 = &__NSArray0__struct;
  }
  else
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController p_allRepsForHitTestingOrdered](self, "p_allRepsForHitTestingOrdered"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v18 = v11;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v10);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v22 = sub_100221DDC(v21, 1, v12, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLiOSScribbleElementProvider);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          if (v23
            && (objc_msgSend(v21, "isLocked") & 1) == 0
            && -[CRLiOSCanvasViewController shouldIncludeObjectInScribbleCapableElements:](self, "shouldIncludeObjectInScribbleCapableElements:", v23))
          {
            objc_msgSend(v9, "addObject:", v23);
          }

        }
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v18);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController _scribbleCapableElementsForReps:forRect:](self, "_scribbleCapableElementsForReps:forRect:", v9, x, y, width, height));

  }
  return v8;
}

- (id)p_allRepsForHitTestingOrdered
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelReps"));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childRepsForHitTesting"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", ++v6, objc_msgSend(v8, "count")));
      objc_msgSend(v5, "insertObjects:atIndexes:", v8, v9);

    }
    while (v6 < (unint64_t)objc_msgSend(v5, "count"));
  }
  v10 = objc_msgSend(v5, "copy");

  return v10;
}

- (BOOL)shouldIncludeObjectInScribbleCapableElements:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  BOOL v25;
  BOOL v26;

  v3 = a3;
  objc_opt_class(CRLCanvasRep, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v14 = sub_100221DDC(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentRep"));
  v23 = sub_100221DDC(v16, 1, v17, v18, v19, v20, v21, v22, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (v24)
    v25 = v15 == 0;
  else
    v25 = 0;
  v26 = !v25;

  return v26;
}

- (id)scribbleCapableElementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char **v19;
  __objc2_prot **v20;
  void *v21;
  char *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t v36;
  id v37;
  char *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v4 = a3;
  if (-[CRLiOSCanvasViewController p_scribblePreventedRegardlessOfPoint](self, "p_scribblePreventedRegardlessOfPoint"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allRepsOrdered"));

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v10)
    {
      v17 = v10;
      v18 = *(_QWORD *)v45;
      v19 = &selRef_removeCollaboratorHUDController_;
      v20 = &off_1012C6000;
      v36 = *(_QWORD *)v45;
      v37 = v9;
      while (2)
      {
        v21 = 0;
        v22 = v19[283];
        v38 = v22;
        v39 = v17;
        do
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v9);
          v23 = sub_100221DDC(*(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v21), 1, v11, v12, v13, v14, v15, v16, (uint64_t)v20[276]);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (v24)
          {
            v25 = (void *)v24;
            if ((objc_opt_respondsToSelector(v24, v22) & 1) != 0)
            {
              v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scribbleCapableElementWithIdentifier:", v4));
              if (v26)
                goto LABEL_28;
            }
            else
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scribbleCapableElements"));
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v28 = v27;
              v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              if (v26)
              {
                v29 = *(_QWORD *)v41;
                while (2)
                {
                  for (i = 0; i != v26; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v41 != v29)
                      objc_enumerationMutation(v28);
                    v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "scribbleIdentifier"));
                    v33 = objc_msgSend(v32, "isEqual:", v4);

                    if (v33)
                    {
                      v26 = v31;
                      goto LABEL_22;
                    }
                  }
                  v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                  if (v26)
                    continue;
                  break;
                }
LABEL_22:
                v18 = v36;
                v9 = v37;
                v20 = &off_1012C6000;
                v22 = v38;
                v17 = v39;
              }

              if (v26)
              {
LABEL_28:
                v34 = v26;

                v5 = v34;
                goto LABEL_29;
              }
            }

          }
          v21 = (char *)v21 + 1;
        }
        while (v21 != v17);
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        v19 = &selRef_removeCollaboratorHUDController_;
        if (v17)
          continue;
        break;
      }
    }
    v5 = 0;
    v34 = v9;
LABEL_29:

  }
  return v5;
}

- (id)_scribbleCapableElementsForReps:(id)a3 forRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  CGRect v33;
  CGRect v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v9 = objc_alloc_init((Class)NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, "scribbleCapableElementsForRect:") & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scribbleCapableElementsForRect:", x, y, width, height));
          objc_msgSend(v9, "crl_addObjectsFromNonNilArray:", v15);
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scribbleCapableElements"));
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v24 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v20, "scaledScribbleEditingFrame");
                v34.origin.x = x;
                v34.origin.y = y;
                v34.size.width = width;
                v34.size.height = height;
                if (CGRectIntersectsRect(v33, v34))
                  objc_msgSend(v9, "crl_addNonNilObject:", v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v17);
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  return v9;
}

- (void)scribbleInteractionWillBeginWritingScribbleElementWillBeInserted:(BOOL)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textInputResponder"));
  objc_msgSend(v6, "scribbleWillBegin");

  if (!a3)
    -[CRLiOSCanvasViewController p_schedulePreventInsertScribbleElementTimer](self, "p_schedulePreventInsertScribbleElementTimer");
}

- (void)scribbleInteractionDidFinishWriting
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CRLiOSCanvasViewController p_schedulePreventInsertScribbleElementTimer](self, "p_schedulePreventInsertScribbleElementTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textInputResponder"));
  objc_msgSend(v4, "reloadInputViews");

  if (!-[CRLiOSCanvasViewController wantsSystemInputAssistantForScribble](self, "wantsSystemInputAssistantForScribble"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "beginHandwritingModeIfNeeded");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v7, "beginHandwritingModeIfNeeded");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController pencilMediator](self, "pencilMediator"));
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124BAC0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E17C8C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124BAE0);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController scribbleInteractionDidFinishWriting]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 3179, 0, "invalid nil value for '%{public}s'", "pencilMediator");

    }
    objc_msgSend(v8, "markPencilUsedForMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textInputResponder"));
    objc_msgSend(v13, "scribbleDidEnd");

  }
}

- (void)p_schedulePreventInsertScribbleElementTimer
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController preventInsertScribbleElementTimer](self, "preventInsertScribbleElementTimer"));
  objc_msgSend(v3, "invalidate");

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1002A2880;
  v8 = &unk_10124BB08;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 2.5));
  -[CRLiOSCanvasViewController setPreventInsertScribbleElementTimer:](self, "setPreventInsertScribbleElementTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (CGRect)rectForInsertingScribbleElements
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v2, "visibleBoundsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)canInsertScribbleElementAtPoint:(CGPoint)a3
{
  _BOOL4 v4;
  void *v5;

  v4 = -[CRLiOSCanvasViewController shouldBeginScribblingAtPoint:](self, "shouldBeginScribblingAtPoint:", a3.x, a3.y);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController preventInsertScribbleElementTimer](self, "preventInsertScribbleElementTimer"));

    LOBYTE(v4) = v5 == 0;
  }
  return v4;
}

- (id)insertedScribbleElementAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, double, double);

  y = a3.y;
  x = a3.x;
  if (-[CRLiOSCanvasViewController canInsertScribbleElementAtPoint:](self, "canInsertScribbleElementAtPoint:"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v6, "convertBoundsToUnscaledPoint:", x, y);
    v8 = v7;
    v10 = v9;
    objc_opt_class(CRLWPShapeRep, v11);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController insertTextBoxForScribbleAtUnscaledCanvasPoint:](self, "insertTextBoxForScribbleAtUnscaledCanvasPoint:", v8, v10));
    v15 = sub_100221D0C(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scribbleCapableElements"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scribbleEditingBlock"));
    if (v19)
    {
      v20 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scribbleEditingBlock"));
      v20[2](v20, 0, v8, v10);

    }
    -[CRLiOSCanvasViewController p_schedulePreventInsertScribbleElementTimer](self, "p_schedulePreventInsertScribbleElementTimer");

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)insertTextBoxForScribbleAtUnscaledCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  _TtC8Freeform23CRLWPReplaceTextCommand *v20;
  id v21;
  uint64_t v22;
  _TtC8Freeform23CRLWPReplaceTextCommand *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  void *v50;
  void *v51;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v6, "openGroup");
  objc_msgSend(v6, "enableProgressiveEnqueuingInCurrentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemFactory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeShapeItemWithShapeType:", 0));

  v10 = objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 1, 0, 0, 0, x, y));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v51 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  objc_msgSend(v11, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v12, v10);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v50 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v43 = (void *)v10;
  objc_msgSend(v13, "insertBoardItems:withInsertionContext:postProcessBlock:", v14, v10, 0);

  objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v15);
  v17 = sub_1002223BC(v16, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
  if (v19)
  {
    v20 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    v21 = objc_msgSend(v19, "range");
    v23 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v20, "initWithShapeItem:range:text:", v18, v21, v22, &stru_1012A72B0);
    objc_msgSend(v6, "enqueueCommand:", v23);

  }
  v44 = v18;
  objc_msgSend(v6, "closeGroup");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  objc_msgSend(v24, "layoutInvalidated");

  objc_msgSend(v5, "layoutIfNeeded");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allRepsOrdered"));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v46;
LABEL_5:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "info"));

      if (v33 == v9)
        break;
      if (v29 == (id)++v31)
      {
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v29)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    objc_opt_class(CRLWPShapeRep, v34);
    v37 = sub_100221D0C(v36, v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    v35 = v43;
    if (v38)
      goto LABEL_22;
  }
  else
  {
LABEL_11:

    v35 = v43;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124BB28);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E17D18();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124BB48);
  v39 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController insertTextBoxForScribbleAtUnscaledCanvasPoint:]"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v41, 3266, 0, "invalid nil value for '%{public}s'", "result");

  v38 = 0;
LABEL_22:

  return v38;
}

- (void)insertStencilFromLibrary:(id)a3
{
  NSSet *v4;

  v4 = objc_opt_new(NSSet);
  -[CRLiOSCanvasViewController p_presentStencilLibraryWithBoardItemsToSave:](self, "p_presentStencilLibraryWithBoardItemsToSave:", v4);

}

- (void)saveSelectedBoardItemsAsStencil:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionModelTranslator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unlockedBoardItemsForSelectionPath:", v6));

  -[CRLiOSCanvasViewController p_presentStencilLibraryWithBoardItemsToSave:](self, "p_presentStencilLibraryWithBoardItemsToSave:", v7);
}

- (void)p_presentStencilLibraryWithBoardItemsToSave:(id)a3
{
  id v4;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *v5;
  void *v6;
  void *v7;
  _TtC8Freeform34CRLiOSStencilLibraryViewController *v8;

  v4 = a3;
  v5 = [_TtC8Freeform34CRLiOSStencilLibraryViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController editingCoordinator](self, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = -[CRLiOSStencilLibraryViewController initWithEditingCoordinator:interactiveCanvasController:boardItemsToSave:](v5, "initWithEditingCoordinator:interactiveCanvasController:boardItemsToSave:", v6, v7, v4);

  -[CRLiOSStencilLibraryViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  -[CRLiOSStencilLibraryViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
  -[CRLiOSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, &stru_10124BB68);

}

- (Class)movieInspectorPaneClass
{
  return 0;
}

- (Class)audioInspectorPaneClass
{
  return 0;
}

- (Class)webVideoInspectorPaneClass
{
  return 0;
}

- (Class)taggedPlaceholderInfoPaneClass
{
  return 0;
}

- (Class)recordingInspectorPaneClass
{
  return 0;
}

- (CRLCanvasImageHUDController)imageHUDController
{
  CRLOnce *mImageHUDOnce;
  _QWORD v5[5];

  mImageHUDOnce = self->mImageHUDOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002A31BC;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](mImageHUDOnce, "performBlockOnce:", v5);
  return self->mImageHUDController;
}

- (BOOL)preserveEditorSelection
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;

  *(_QWORD *)&v3 = objc_opt_class(UIViewController, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  if (!v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v13, "preserveEditorSelection") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      v15 = objc_msgSend(v14, "preserveEditorSelection");

      if ((v15 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController crl_windowWrapper](self, "crl_windowWrapper"));
    if (objc_msgSend(v16, "isInSplitViewMode"))
    {
      v17 = -[CRLiOSCanvasViewController shouldPreserveEditorSelectionInSplitViewMode](self, "shouldPreserveEditorSelectionInSplitViewMode");

      if ((v17 & 1) != 0)
      {
LABEL_11:
        v11 = 1;
        goto LABEL_4;
      }
    }
    else
    {

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "editorController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textInputEditor"));

    if (v10 && (objc_opt_respondsToSelector(v10, "wantsToPreserveEditorSelection") & 1) != 0)
      v11 = objc_msgSend(v10, "wantsToPreserveEditorSelection");
    else
      v11 = 0;
    goto LABEL_3;
  }
  v10 = (void *)v9;
  v11 = 1;
LABEL_3:

LABEL_4:
  return v11;
}

- (BOOL)shouldPreserveEditorSelectionInSplitViewMode
{
  return 1;
}

- (BOOL)shouldIgnoreKeyboardInput
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  CRLiOSCanvasViewControllerDelegate **p_mDelegate;
  id WeakRetained;
  id v13;
  void *v14;
  int64_t v15;
  BOOL v16;

  *(_QWORD *)&v3 = objc_opt_class(UIViewController, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    p_mDelegate = &self->mDelegate;
    WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "printerOptionsShowing") & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)p_mDelegate);
      v10 = objc_msgSend(v13, "printerOptionsShowing");

    }
    else
    {
      v10 = 0;
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  v15 = +[CRLPresentedPopoverTextEditingBehaviorProvidingSwiftHelper allowTextInputWhilePresentingFor:](_TtC8Freeform58CRLPresentedPopoverTextEditingBehaviorProvidingSwiftHelper, "allowTextInputWhilePresentingFor:", v14);

  if (v15 == 2)
    v16 = v10;
  else
    v16 = v15 == 0;

  return v16;
}

- (BOOL)shouldPreventBecomingFirstResponderOnViewLoad
{
  return 0;
}

- (BOOL)becomeFirstResponderIfAppropriate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  unsigned int v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textInputResponder"));
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) != 0)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textInputResponder"));
  v8 = objc_msgSend(v7, "canBecomeFirstResponder");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textInputResponder"));
    v11 = objc_msgSend(v10, "becomeFirstResponder");

    if ((v11 & 1) != 0)
      goto LABEL_5;
  }
  if ((-[CRLiOSCanvasViewController isFirstResponder](self, "isFirstResponder") & 1) != 0)
  {
LABEL_5:
    LOBYTE(v12) = 1;
  }
  else
  {
    v12 = -[CRLiOSCanvasViewController canBecomeFirstResponder](self, "canBecomeFirstResponder");
    if (v12)
      LOBYTE(v12) = -[CRLiOSCanvasViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  return v12;
}

- (BOOL)allowsCanvasScrollingFromKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  BOOL v24;
  CGRect v26;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfo:", 0));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController canvasView](self, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enclosingScrollView"));

  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "contentSize");
  v20 = v19;
  v22 = v21;
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  if (v20 <= CGRectGetWidth(v26))
  {
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    v23 = v22 > CGRectGetHeight(v27);
  }
  else
  {
    v23 = 1;
  }
  v24 = v8 & v23;

  return v24;
}

- (BOOL)allowUndoRedoOperations
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controllingTM"));

  if (v5)
  {
    if ((objc_opt_respondsToSelector(v5, "allowUndoRedoOperations") & 1) == 0)
    {
      objc_msgSend(v3, "isInDynamicOperation");
      LOBYTE(v7) = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(v5, "allowUndoRedoOperations") ^ 1;
  }
  else
  {
    v6 = 0;
  }
  LOBYTE(v7) = 0;
  if ((objc_msgSend(v3, "isInDynamicOperation") & 1) == 0 && (v6 & 1) == 0)
    v7 = !-[CRLiOSCanvasViewController shouldIgnoreKeyboardInput](self, "shouldIgnoreKeyboardInput");
LABEL_9:

  return v7;
}

- (BOOL)allowOpenLinkOnSingleTapForRepWhenEditingDisabled:(id)a3
{
  return 0;
}

- (BOOL)documentChromeHasPresentedViewController
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(UIViewController, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  LOBYTE(v6) = v9 != 0;

  return (char)v6;
}

- (void)dismissDocumentChromePresentedViewController
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  *(_QWORD *)&v3 = objc_opt_class(UIViewController, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate", v3));
  v7 = sub_100221D0C(v5, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "dismissPresentedViewController");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController delegate](self, "delegate"));
      objc_msgSend(v11, "dismissPresentedViewController");

    }
  }

}

- (BOOL)p_isAccessibilityTextResponderAction:(SEL)a3
{
  NSString *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(&off_1012CB830, "containsObject:", v4);

  return v5;
}

- (id)editingCoordinatorForShapeLibraryViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingCoordinator"));

  return v4;
}

- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3
{
  return &stru_1012A72B0;
}

- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3
{
  return 0;
}

- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3
{
  return 0;
}

- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager
{
  id WeakRetained;
  void *v4;
  void *v5;

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForCanvasViewController:", self));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "smartSelectionManager"));
  }
  else
  {
    v5 = 0;
  }
  return (CRLFreehandDrawingPKSelectionManager *)v5;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->mICC);
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->mICC, a3);
}

- (CRLiOSCanvasViewControllerDelegate)delegate
{
  return (CRLiOSCanvasViewControllerDelegate *)objc_loadWeakRetained((id *)&self->mDelegate);
}

- (CRLUserDialogPresenter)userDialogPresenter
{
  return (CRLUserDialogPresenter *)objc_loadWeakRetained((id *)&self->mUserDialogPresenter);
}

- (void)setUserDialogPresenter:(id)a3
{
  objc_storeWeak((id *)&self->mUserDialogPresenter, a3);
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->mSingleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mSingleTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->mDoubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mDoubleTapGestureRecognizer, a3);
}

- (CRLiOSEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer
{
  return self->mEditMenuTapGestureRecognizer;
}

- (void)setEditMenuTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mEditMenuTapGestureRecognizer, a3);
}

- (CRLiOSMultiSelectGestureRecognizer)multiSelectGestureRecognizer
{
  return self->mMultiSelectGestureRecognizer;
}

- (void)setMultiSelectGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mMultiSelectGestureRecognizer, a3);
}

- (CRLiOSKnobDragGestureRecognizer)knobDragGestureRecognizer
{
  return self->mKnobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mKnobDragGestureRecognizer, a3);
}

- (CRLiOSRepDragGestureRecognizer)repDragGestureRecognizer
{
  return self->mRepDragGestureRecognizer;
}

- (void)setRepDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mRepDragGestureRecognizer, a3);
}

- (CRLiOSRepRotateGestureRecognizer)repRotateGestureRecognizer
{
  return self->mRepRotateGestureRecognizer;
}

- (void)setRepRotateGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mRepRotateGestureRecognizer, a3);
}

- (CRLiOSRepRotateKnobGestureRecognizer)repRotateKnobGestureRecognizer
{
  return self->mRepRotateKnobGestureRecognizer;
}

- (void)setRepRotateKnobGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mRepRotateKnobGestureRecognizer, a3);
}

- (CRLiOSRepNudgeGestureRecognizer)nudgeGestureRecognizer
{
  return self->mNudgeGestureRecognizer;
}

- (void)setNudgeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mNudgeGestureRecognizer, a3);
}

- (UIGestureRecognizer)zoomGestureRecognizer
{
  return &self->mZoomGestureRecognizer->super.super;
}

- (void)setZoomGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mZoomGestureRecognizer, a3);
}

- (CRLiOSAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer
{
  return self->mAllTouchesDoneGestureRecognizer;
}

- (void)setAllTouchesDoneGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mAllTouchesDoneGestureRecognizer, a3);
}

- (UIGestureRecognizer)preventScrollGestureRecognizer
{
  return &self->mPreventScrollGestureRecognizer->super;
}

- (CRLiOSFreehandDrawingGestureRecognizer)freehandDrawingGestureRecognizer
{
  return self->mFreehandDrawingGestureRecognizer;
}

- (void)setFreehandDrawingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mFreehandDrawingGestureRecognizer, a3);
}

- (CRLiOSPencilDownGestureRecognizer)pencilDownGestureRecognizer
{
  return self->mPencilDownGestureRecognizer;
}

- (void)setPencilDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mPencilDownGestureRecognizer, a3);
}

- (CRLiOSRectangularMarqueeGestureRecognizer)rectangularMarqueeGestureRecognizer
{
  return self->mRectangularMarqueeGestureRecognizer;
}

- (void)setRectangularMarqueeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->mRectangularMarqueeGestureRecognizer, a3);
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->mEditMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->mEditMenuInteraction, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->mContextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->mContextMenuInteraction, a3);
}

- (BOOL)contextMenuMightBeDisplayed
{
  return self->mContextMenuMightBeDisplayed;
}

- (CGPoint)lastTapPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastTapPoint.x;
  y = self->mLastTapPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTapPoint:(CGPoint)a3
{
  self->mLastTapPoint = a3;
}

- (CGRect)targetRectForContextMenuController
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mTargetRectForContextMenuController.origin.x;
  y = self->mTargetRectForContextMenuController.origin.y;
  width = self->mTargetRectForContextMenuController.size.width;
  height = self->mTargetRectForContextMenuController.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)currentlyTrackingIndirectPointerTouch
{
  return self->mIsCurrentlyTrackingIndirectPointerTouch;
}

- (void)setCurrentlyTrackingIndirectPointerTouch:(BOOL)a3
{
  self->mIsCurrentlyTrackingIndirectPointerTouch = a3;
}

- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)zoomTrackerIgnoreInteractionEventsSafeWrapper
{
  return self->mZoomTrackerIgnoreInteractionEventsSafeWrapper;
}

- (void)setZoomTrackerIgnoreInteractionEventsSafeWrapper:(id)a3
{
  objc_storeStrong((id *)&self->mZoomTrackerIgnoreInteractionEventsSafeWrapper, a3);
}

- (NSMutableArray)disabledGesturesWhileInEyeDropperMode
{
  return self->mDisabledGesturesWhileInEyeDropperMode;
}

- (void)setDisabledGesturesWhileInEyeDropperMode:(id)a3
{
  objc_storeStrong((id *)&self->mDisabledGesturesWhileInEyeDropperMode, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->mDragInteraction;
}

- (CRLiOSScribbleInteractionDelegate)scribbleInteractionDelegate
{
  return self->mScribbleInteractionDelegate;
}

- (void)setScribbleInteractionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->mScribbleInteractionDelegate, a3);
}

- (UIScribbleInteraction)directScribbleInteraction
{
  return self->mDirectScribbleInteraction;
}

- (void)setDirectScribbleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->mDirectScribbleInteraction, a3);
}

- (UIIndirectScribbleInteraction)scribbleInteraction
{
  return self->mScribbleInteraction;
}

- (void)setScribbleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->mScribbleInteraction, a3);
}

- (NSTimer)preventInsertScribbleElementTimer
{
  return self->mPreventInsertScribbleElementTimer;
}

- (void)setPreventInsertScribbleElementTimer:(id)a3
{
  objc_storeStrong((id *)&self->mPreventInsertScribbleElementTimer, a3);
}

- (NSMutableArray)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizers, a3);
}

- (CRLWPTapAndTouchGestureRecognizer)doubleTapAndTouchGestureRecognizer
{
  return self->_doubleTapAndTouchGestureRecognizer;
}

- (void)setDoubleTapAndTouchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapAndTouchGestureRecognizer, a3);
}

- (CRLWPTapAndTouchGestureRecognizer)tapAndTouchGestureRecognizer
{
  return self->_tapAndTouchGestureRecognizer;
}

- (void)setTapAndTouchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapAndTouchGestureRecognizer, a3);
}

- (CRLWPLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (CRLWPImmediatePressGestureRecognizer)immediatePressGestureRecognizer
{
  return self->_immediatePressGestureRecognizer;
}

- (void)setImmediatePressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_immediatePressGestureRecognizer, a3);
}

- (CRLWPTapGestureRecognizer)immediateDoubleTapGestureRecognizer
{
  return self->_immediateDoubleTapGestureRecognizer;
}

- (void)setImmediateDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_immediateDoubleTapGestureRecognizer, a3);
}

- (CRLWPTapGestureRecognizer)immediateSingleTapGestureRecognizer
{
  return self->_immediateSingleTapGestureRecognizer;
}

- (void)setImmediateSingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_immediateSingleTapGestureRecognizer, a3);
}

- (CRLWPTapGestureRecognizer)secondarySingleTapGestureRecognizer
{
  return self->_secondarySingleTapGestureRecognizer;
}

- (void)setSecondarySingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySingleTapGestureRecognizer, a3);
}

- (void)setMiniFormatterPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_miniFormatterPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniFormatterPresenter, 0);
  objc_storeStrong((id *)&self->_secondarySingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediateSingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediateDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediatePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapAndTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapAndTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->mPreventInsertScribbleElementTimer, 0);
  objc_storeStrong((id *)&self->mScribbleInteraction, 0);
  objc_storeStrong((id *)&self->mDirectScribbleInteraction, 0);
  objc_storeStrong((id *)&self->mScribbleInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDragInteraction, 0);
  objc_storeStrong((id *)&self->mDisabledGesturesWhileInEyeDropperMode, 0);
  objc_storeStrong((id *)&self->mZoomTrackerIgnoreInteractionEventsSafeWrapper, 0);
  objc_storeStrong((id *)&self->mContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->mEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->mRepRotateKnobGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->mUserDialogPresenter);
  objc_storeStrong((id *)&self->mAlignmentController, 0);
  objc_storeStrong((id *)&self->mPencilMediator, 0);
  objc_storeStrong((id *)&self->mQuickSelectViewController, 0);
  objc_storeStrong((id *)&self->mEnterExitNotifier, 0);
  objc_storeStrong((id *)&self->mPointerInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mPointerInteraction, 0);
  objc_storeStrong((id *)&self->mContextMenuInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDragInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDropInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mCanvasZoomTracker, 0);
  objc_storeStrong((id *)&self->mImageHUDOnce, 0);
  objc_storeStrong((id *)&self->mImageHUDController, 0);
  objc_storeStrong((id *)&self->mRectangularMarqueeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPencilDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPencilHoverGestureHandler, 0);
  objc_storeStrong((id *)&self->mPencilHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mFreehandDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPreventScrollGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mAllIndirectPointerTouchesDoneGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mAllTouchesDoneGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mNudgeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mRepRotateGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mRepDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mMultiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mKnobDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mEditMenuTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mSingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mSceneDidEnterBackgroundObserver, 0);
  objc_storeStrong((id *)&self->mSceneWillEnterForegroundObserver, 0);
  objc_storeStrong((id *)&self->mContextMenuController, 0);
  objc_destroyWeak((id *)&self->mCanvasLayer);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_destroyWeak((id *)&self->mICC);
}

@end
