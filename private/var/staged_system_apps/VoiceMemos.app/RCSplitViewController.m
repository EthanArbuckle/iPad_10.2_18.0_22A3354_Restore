@implementation RCSplitViewController

- (void)registerAppIntentsInteractions
{
  RCSplitViewController *v2;

  v2 = self;
  sub_10000AB34();

}

- (void)_setPreferredSplitBehaviorForViewWidth:(double)a3 needsRestyle:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v9, "usesSplitBehavior"))
  {
    v7 = -[RCSplitViewController _willSidebarExceedMaximumAllowedWidthForTotalViewWidth:](self, "_willSidebarExceedMaximumAllowedWidthForTotalViewWidth:", a3);
    if ((objc_msgSend(v9, "supportsDisplaceSplitBehavior") & v7) != 0)
      v8 = 3;
    else
      v8 = 1;
    if (-[RCSplitViewController preferredSplitBehavior](self, "preferredSplitBehavior") != (id)v8)
    {
      -[RCSplitViewController setPreferredSplitBehavior:](self, "setPreferredSplitBehavior:", v8);
      if (v4)
        -[RCSplitViewController _doRestyle](self, "_doRestyle");
    }
  }

}

- (double)_totalViewWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController view](self, "view"));
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (void)loadView
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCSplitViewController;
  -[RCSplitViewController loadView](&v7, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCSplitViewController setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", 1);
  objc_msgSend(v3, "splitViewSeparatorWidth");
  *(float *)&v4 = v4;
  -[RCSplitViewController setGutterWidth:](self, "setGutterWidth:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "currentLocaleDidChange:", NSCurrentLocaleDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "setSplitViewHorizontalSizeClass:", objc_msgSend(v6, "horizontalSizeClass"));

  -[RCSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 2);
  -[RCSplitViewController _totalViewWidth](self, "_totalViewWidth");
  -[RCSplitViewController _setPreferredSplitBehaviorForViewWidth:needsRestyle:](self, "_setPreferredSplitBehaviorForViewWidth:needsRestyle:", 0);

}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];

  v16.receiver = self;
  v16.super_class = (Class)RCSplitViewController;
  -[RCSplitViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = objc_opt_self(UITraitUserInterfaceStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v17[0] = v4;
  v5 = objc_opt_self(UITraitUserInterfaceIdiom);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v17[1] = v6;
  v7 = objc_opt_self(UITraitHorizontalSizeClass);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v17[2] = v8;
  v9 = objc_opt_self(UITraitVerticalSizeClass);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v17[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
  v12 = -[RCSplitViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v11, "_traitCollectionDidChange:previousTraitCollection:");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "splitViewSeparatorColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController view](self, "view"));
  objc_msgSend(v15, "setBackgroundColor:", v14);

}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  objc_super v17;
  objc_super v18;
  id v19;

  v7 = a3;
  if (a4 == 1)
  {
    v8 = objc_opt_class(UINavigationController, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = OSLogForCategory(kVMLogCategoryDefault);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_10010D7F0(v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 1));
    if (-[RCSplitViewController isCollapsed](self, "isCollapsed")
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController viewControllers](self, "viewControllers")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject")),
          v12,
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers")),
          v15 = objc_msgSend(v14, "containsObject:", v11),
          v14,
          v13,
          v15))
    {
      v19 = v7;
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v11, "setViewControllers:animated:", v16, 1);
    }
    else
    {
      v16 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
      v18.receiver = self;
      v18.super_class = (Class)RCSplitViewController;
      -[RCSplitViewController setViewController:forColumn:](&v18, "setViewController:forColumn:", v16, 1);
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RCSplitViewController;
    -[RCSplitViewController setViewController:forColumn:](&v17, "setViewController:forColumn:", v7, a4);
  }

}

- (void)setResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resizingDelegate, a3);
}

- (void)setMainViewController:(id)a3
{
  objc_storeWeak((id *)&self->_mainViewController, a3);
}

- (void)setIsTransitioningBetweenVisibleColumnStates:(BOOL)a3
{
  self->_isTransitioningBetweenVisibleColumnStates = a3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RCSplitViewController;
  v7 = a4;
  -[RCSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008F36C;
  v8[3] = &unk_1001AD1D0;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _QWORD v15[5];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RCSplitViewController;
  -[RCSplitViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v16, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  v10 = objc_msgSend(v6, "horizontalSizeClass");
  if (v9 != v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController resizingDelegate](self, "resizingDelegate"));
    objc_msgSend(v12, "splitViewController:willTransitionFromHorizontalSizeClass:toHorizontalSizeClass:", self, v9, v11);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v14 = objc_msgSend(v13, "setSplitViewHorizontalSizeClass:", objc_msgSend(v6, "horizontalSizeClass"));

  if (v14)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008F4BC;
    v15[3] = &unk_1001ABA08;
    v15[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, 0);
  }

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[RCSplitViewController _doRestyle](self, "_doRestyle");
}

- (void)_doRestyle
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController resizingDelegate](self, "resizingDelegate"));
  objc_msgSend(v3, "handleRestyleRequest");

  -[RCSplitViewController restyle](self, "restyle");
}

- (BOOL)_canHandleCustomAction:(SEL)a3 withSender:(id)a4
{
  RCMainViewController **p_mainViewController;
  id v6;
  id WeakRetained;

  p_mainViewController = &self->_mainViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "canHandleCustomAction:withSender:", a3, v6);

  return (char)a3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if ("startNewRecording:" == a3)
  {
    if (-[RCSplitViewController canStartNewRecording](self, "canStartNewRecording"))
      goto LABEL_20;
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ("duplicateRecording:" == a3)
  {
    if (-[RCSplitViewController canDuplicateRecording](self, "canDuplicateRecording"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("editRecording:" == a3)
  {
    if (-[RCSplitViewController canEditRecording](self, "canEditRecording"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("trimRecording:" == a3)
  {
    if (-[RCSplitViewController canTrimRecording](self, "canTrimRecording"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("toggleFavorite:" == a3 || "toggleEnhance:" == a3 || "toggleRemoveSilence:" == a3)
    goto LABEL_20;
  if ("renameRecording:" == a3)
  {
    if (-[RCSplitViewController canRenameRecording](self, "canRenameRecording"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("playRecording:" == a3)
  {
    if (-[RCSplitViewController canPlayRecording](self, "canPlayRecording"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("jumpSelectionBackward:" == a3)
  {
    if (-[RCSplitViewController canJumpBackward](self, "canJumpBackward"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("jumpSelectionForward:" == a3)
  {
    if (-[RCSplitViewController canJumpForward](self, "canJumpForward"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("delete:" == a3)
  {
    if (-[RCSplitViewController canDelete](self, "canDelete"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("handleDone:" == a3)
  {
    if (-[RCSplitViewController canHandleDone](self, "canHandleDone"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("handleCancel:" == a3)
  {
    if (-[RCSplitViewController canHandleCancel](self, "canHandleCancel"))
      goto LABEL_20;
    goto LABEL_23;
  }
  if ("shareRecording:" == a3)
  {
    if (!-[RCSplitViewController canShareRecording](self, "canShareRecording"))
      goto LABEL_23;
LABEL_20:
    v7 = -[RCSplitViewController _canHandleCustomAction:withSender:](self, "_canHandleCustomAction:withSender:", a3, v6);
    goto LABEL_21;
  }
  if ("toggleSidebar:" != a3 || !-[RCSplitViewController canToggleSidebar](self, "canToggleSidebar"))
    goto LABEL_23;
  v10.receiver = self;
  v10.super_class = (Class)RCSplitViewController;
  v7 = -[RCSplitViewController canPerformAction:withSender:](&v10, "canPerformAction:withSender:", a3, v6);
LABEL_21:
  v8 = v7;
LABEL_24:

  return v8;
}

- (void)validateCommand:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned int v6;
  id v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "action") == "toggleFavorite:")
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    v6 = objc_msgSend(WeakRetained, "currentSelectionIsFavorite");

    objc_msgSend(v4, "setState:", v6);
    if (-[RCSplitViewController canToggleFavorite](self, "canToggleFavorite"))
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v4, "setAttributes:", 1);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "action") == "toggleEnhance:")
  {
    v7 = objc_loadWeakRetained((id *)&self->_mainViewController);
    v8 = objc_msgSend(v7, "currentSelectionIsEnhanced");

    objc_msgSend(v4, "setState:", v8);
    if (-[RCSplitViewController canToggleEnhance](self, "canToggleEnhance"))
      goto LABEL_7;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "action") == "toggleRemoveSilence:")
  {
    v9 = objc_loadWeakRetained((id *)&self->_mainViewController);
    v10 = objc_msgSend(v9, "currentSelectionHasSilenceRemoved");

    objc_msgSend(v4, "setState:", v10);
    if (-[RCSplitViewController canToggleRemoveSilence](self, "canToggleRemoveSilence"))
      goto LABEL_7;
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)RCSplitViewController;
  -[RCSplitViewController validateCommand:](&v11, "validateCommand:", v4);
LABEL_7:

}

- (BOOL)canStartNewRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canStartNewRecording");

  return v3;
}

- (void)startNewRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "startNewRecordingAction");

}

- (BOOL)canPlayRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canPlayRecording");

  return v3;
}

- (void)playRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "playRecording");

}

- (BOOL)canDuplicateRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canDuplicateRecording");

  return v3;
}

- (void)duplicateRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "duplicateRecording");

}

- (BOOL)canRenameRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canRenameRecording");

  return v3;
}

- (void)renameRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "renameRecording");

}

- (BOOL)canEditRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canEditRecording");

  return v3;
}

- (void)editRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "editRecording");

}

- (BOOL)canTrimRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canTrimRecording");

  return v3;
}

- (void)trimRecording:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "trimRecording");

}

- (BOOL)canToggleFavorite
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canToggleFavoriteRecording");

  return v3;
}

- (void)toggleFavorite:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "toggleFavoriteRecording");

}

- (BOOL)canToggleEnhance
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canToggleEnhanceRecording");

  return v3;
}

- (void)toggleEnhance:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "toggleEnhanceRecording");

}

- (BOOL)canToggleRemoveSilence
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canToggleRemoveSilence");

  return v3;
}

- (void)toggleRemoveSilence:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "toggleRemoveSilence");

}

- (BOOL)canDelete
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canDelete");

  return v3;
}

- (void)delete:(id)a3
{
  RCMainViewController **p_mainViewController;
  id v4;
  id WeakRetained;

  p_mainViewController = &self->_mainViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  objc_msgSend(WeakRetained, "delete:", v4);

}

- (BOOL)canJumpForward
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canJumpForward");

  return v3;
}

- (void)jumpSelectionForward:(id)a3
{
  id WeakRetained;

  if (-[RCSplitViewController canJumpForward](self, "canJumpForward", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    objc_msgSend(WeakRetained, "jumpSelectionForward");

  }
}

- (BOOL)canJumpBackward
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canJumpBackward");

  return v3;
}

- (void)jumpSelectionBackward:(id)a3
{
  id WeakRetained;

  if (-[RCSplitViewController canJumpBackward](self, "canJumpBackward", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    objc_msgSend(WeakRetained, "jumpSelectionBackward");

  }
}

- (BOOL)canShareRecording
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canShareRecording");

  return v3;
}

- (void)shareRecording:(id)a3
{
  RCMainViewController **p_mainViewController;
  id v4;
  id WeakRetained;

  p_mainViewController = &self->_mainViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
  objc_msgSend(WeakRetained, "shareRecording:", v4);

}

- (BOOL)canHandleDone
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canHandleDone");

  return v3;
}

- (void)handleDone:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "handleDone");

}

- (BOOL)canHandleCancel
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canHandleCancel");

  return v3;
}

- (void)handleCancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  objc_msgSend(WeakRetained, "handleCancel");

}

- (BOOL)canToggleSidebar
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v3 = objc_msgSend(WeakRetained, "canToggleSidebar");

  return v3;
}

- (BOOL)areAllColumnsVisible
{
  if ((-[RCSplitViewController isCollapsed](self, "isCollapsed") & 1) != 0)
    return 0;
  else
    return -[RCSplitViewController _isPrimaryColumnVisible](self, "_isPrimaryColumnVisible");
}

- (BOOL)isCollapsedAndShowingPrimary
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[RCSplitViewController isCollapsed](self, "isCollapsed"))
    return 0;
  v3 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 1));
  if (objc_msgSend(v4, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v3 = v6 == 0;

  }
  return v3;
}

- (void)hidePrimaryColumnIfNeeded
{
  unsigned int v3;
  id v4;

  v3 = -[RCSplitViewController _isPrimaryColumnVisible](self, "_isPrimaryColumnVisible");
  v4 = -[RCSplitViewController splitBehavior](self, "splitBehavior");
  if (v3)
  {
    if (v4 == (id)3)
      -[RCSplitViewController hideColumn:](self, "hideColumn:", 0);
  }
}

- (void)hidePrimaryColumnForEnteringEditModeIfNeeded
{
  if (-[RCSplitViewController areAllColumnsVisible](self, "areAllColumnsVisible"))
  {
    -[RCSplitViewController hideColumn:](self, "hideColumn:", 0);
    self->_didHidePrimaryColumnForEditMode = 1;
  }
}

- (void)showPrimaryColumnForExitingEditModeIfNeeded
{
  if (self->_didHidePrimaryColumnForEditMode)
  {
    -[RCSplitViewController showColumn:](self, "showColumn:", 0);
    self->_didHidePrimaryColumnForEditMode = 0;
  }
}

- (BOOL)_willSidebarExceedMaximumAllowedWidthForTotalViewWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[RCSplitViewController _totalSidebarWidth](self, "_totalSidebarWidth");
  if (a3 <= 0.0)
    return 0;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v6, "minimumSecondaryColumnWidth");
  v8 = v7;

  return a3 - v5 < v8;
}

- (BOOL)_isPrimaryColumnVisible
{
  id v3;

  v3 = -[RCSplitViewController displayMode](self, "displayMode");
  return v3 == (id)-[RCSplitViewController _displayModeForPrimaryColumnVisible](self, "_displayModeForPrimaryColumnVisible");
}

- (int64_t)_displayModeForPrimaryColumnVisible
{
  if (-[RCSplitViewController splitBehavior](self, "splitBehavior") == (id)1)
    return 4;
  else
    return 6;
}

- (double)_totalSidebarWidth
{
  double v3;
  double v4;
  double v5;

  -[RCSplitViewController _primaryColumnWidth](self, "_primaryColumnWidth");
  v4 = v3;
  -[RCSplitViewController _supplementaryColumnWidth](self, "_supplementaryColumnWidth");
  return v4 + v5;
}

- (double)_primaryColumnWidth
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
    v6 = !-[RCSplitViewController _isPrimaryColumnVisible](self, "_isPrimaryColumnVisible");
  else
    v6 = 1;

  -[RCSplitViewController primaryColumnWidth](self, "primaryColumnWidth");
  if (v6)
  {
    -[RCSplitViewController minimumPrimaryColumnWidth](self, "minimumPrimaryColumnWidth");
    v9 = v8;
    -[RCSplitViewController primaryColumnWidth](self, "primaryColumnWidth");
    if (v9 < v10)
      v9 = v10;
    -[RCSplitViewController maximumPrimaryColumnWidth](self, "maximumPrimaryColumnWidth");
    if (v11 < v9)
      v9 = v11;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (double)_supplementaryColumnWidth
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  -[RCSplitViewController supplementaryColumnWidth](self, "supplementaryColumnWidth");
  if (v5)
  {
    v7 = v6;
  }
  else
  {
    -[RCSplitViewController minimumSupplementaryColumnWidth](self, "minimumSupplementaryColumnWidth");
    v7 = v8;
    -[RCSplitViewController supplementaryColumnWidth](self, "supplementaryColumnWidth");
    if (v7 < v9)
      v7 = v9;
    -[RCSplitViewController maximumSupplementaryColumnWidth](self, "maximumSupplementaryColumnWidth");
    if (v10 < v7)
      v7 = v10;
  }

  return v7;
}

- (RCSplitViewResizingDelegate)resizingDelegate
{
  return (RCSplitViewResizingDelegate *)objc_loadWeakRetained((id *)&self->_resizingDelegate);
}

- (RCMainViewController)mainViewController
{
  return (RCMainViewController *)objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (BOOL)isTransitioningBetweenVisibleColumnStates
{
  return self->_isTransitioningBetweenVisibleColumnStates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_destroyWeak((id *)&self->_resizingDelegate);
}

@end
