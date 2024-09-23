@implementation TiltedTabViewController

- (TiltedTabViewController)initWithInitialDockedStates:(id)a3 persistence:(id)a4 primaryViewController:(id)a5 daemonInterface:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TiltedTabViewController *v14;
  TiltedTabViewController *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *dockedStates;
  NSMutableDictionary *v20;
  NSMutableDictionary *placeholderFactories;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TiltedTabViewController;
  v14 = -[TiltedTabViewController init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_primaryViewController, a5);
    objc_storeStrong((id *)&v15->_persistence, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reverseObjectEnumerator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
    v18 = (NSMutableArray *)objc_msgSend(v17, "mutableCopy");
    dockedStates = v15->_dockedStates;
    v15->_dockedStates = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    placeholderFactories = v15->_placeholderFactories;
    v15->_placeholderFactories = v20;

    objc_storeStrong((id *)&v15->_daemonInterface, a6);
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  MFTiltedTabView *v5;
  void *v6;
  MFTiltedTabView *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TiltedTabViewController;
  -[TiltedTabViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [MFTiltedTabView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = -[MFTiltedTabView initWithFrame:](v5, "initWithFrame:");

  -[MFTiltedTabView setReorderingEnabled:](v7, "setReorderingEnabled:", 0);
  -[MFTiltedTabView setDelegate:](v7, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v7);

  -[TiltedTabViewController setTiltedTabView:](self, "setTiltedTabView:", v7);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController tiltedTabView](self, "tiltedTabView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13.receiver = self;
  v13.super_class = (Class)TiltedTabViewController;
  -[TiltedTabViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
}

- (void)presentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController tiltedTabView](self, "tiltedTabView"));
  objc_msgSend(v4, "setPresented:animated:", 1, v3);

}

- (void)dismiss
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController tiltedTabView](self, "tiltedTabView"));
  objc_msgSend(v3, "setPresented:animated:", 0, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController tiltedTabView](self, "tiltedTabView"));
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TiltedTabViewController;
  -[TiltedTabViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001DE140;
  v9[3] = &unk_10051C0B8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DE190;
  v8[3] = &unk_10051C0B8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (int64_t)numberOfItemsInTiltedTabView:(id)a3
{
  void *v3;
  char *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates", a3));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (int64_t)v4;
}

- (double)tiltedTabView:(id)a3 alphaValueForItemAtIndex:(unint64_t)a4
{
  return 1.0;
}

- (BOOL)tiltedTabView:(id)a3 canCloseItemAtIndex:(unint64_t)a4
{
  return a4 != 0;
}

- (void)tiltedTabView:(id)a3 closeItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates", a3));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4 - 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
  objc_msgSend(v7, "removeObject:", v15);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController persistence](self, "persistence"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dockIdentifier"));
  objc_msgSend(v8, "removeDockedStateWithIdentifier:sender:", v9, self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSAutosave autosave](MSAutosave, "autosave"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dockIdentifier"));
  objc_msgSend(v10, "removeAutosavedMessageWithIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController delegate](self, "delegate"));
    objc_msgSend(v14, "tiltedTabViewControllerDidCancel:", self);

  }
}

- (void)tiltedTabView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController delegate](self, "delegate"));
  v7 = v6;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a4 - 1));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tabItemAtIndex:", a4));
    objc_msgSend(v7, "tiltedTabViewController:didSelectView:representingState:", self, v10, v9);

  }
  else
  {
    objc_msgSend(v6, "tiltedTabViewControllerDidCancel:", self);
  }

}

- (UIEdgeInsets)tiltedTabView:(id)a3 expanded:(BOOL)a4 edgeInsetsForItemAtIndex:(unint64_t)a5
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CATransform3D)tiltedTabView:(SEL)a3 expanded:(id)a4 layerTransformForItemAtIndex:(BOOL)a5
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v6 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v6;
  v7 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v7;
  v8 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v8;
  v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v9;
  return self;
}

- (CGRect)tiltedTabView:(id)a3 frameForItemAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController primaryViewController](self, "primaryViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v17, "frame");
LABEL_6:
    v10 = v18;
    v12 = v19;
    v14 = v20;
    v16 = v21;

    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "isPresented") & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", a4 - 1));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController delegate](self, "delegate"));
    objc_msgSend(v17, "tiltedTabViewController:dockedFrameForViewRepresentingState:", self, v8);
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
  +[SheetMetrics frameForPresentedSheetIn:](SheetMetrics, "frameForPresentedSheetIn:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
LABEL_7:

  v23 = v10;
  v24 = v12;
  v25 = v14;
  v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)tiltedTabView:(id)a3 headerHeightForItemAtIndex:(unint64_t)a4
{
  double result;

  result = 40.0;
  if (!a4)
    return 0.0;
  return result;
}

- (id)tiltedTabView:(id)a3 headerViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)tiltedTabView:(id)a3 maskCutoutViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
    +[SheetMetrics frameForPresentedSheetIn:](SheetMetrics, "frameForPresentedSheetIn:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", a4 - 1));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController placeholderFactoryForState:](self, "placeholderFactoryForState:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storedUserActivity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](self, "view"));
    objc_msgSend(v20, "layoutMargins");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "placeholderViewForUserActivity:frame:parentMargins:", v19, v9, v11, v13, v15, v21, v22, v23, v24));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController primaryViewController](self, "primaryViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "snapshotViewAfterScreenUpdates:", 0));
  }

  objc_msgSend(v25, "setClipsToBounds:", 1);
  +[SheetMetrics cornerRadius](SheetMetrics, "cornerRadius");
  objc_msgSend(v25, "_setContinuousCornerRadius:");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v25, "setBackgroundColor:", v26);

  return v25;
}

- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)placeholderFactoryForState:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = NSStringFromClass((Class)objc_msgSend(v4, "storedViewControllerClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController placeholderFactories](self, "placeholderFactories"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (!v8)
  {
    v9 = objc_alloc((Class)objc_msgSend(objc_msgSend(v4, "storedViewControllerClass"), "placeholderFactoryClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController daemonInterface](self, "daemonInterface"));
    v8 = objc_msgSend(v9, "initWithDaemonInterface:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController placeholderFactories](self, "placeholderFactories"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v6);

  }
  return v8;
}

- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5
{
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
  v7 = objc_msgSend(v6, "isEqualToArray:", v10);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController dockedStates](self, "dockedStates"));
  objc_msgSend(v8, "setArray:", v10);

  if (!objc_msgSend(v10, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController delegate](self, "delegate"));
    objc_msgSend(v9, "tiltedTabViewControllerDidCancel:", self);
    goto LABEL_5;
  }
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController tiltedTabView](self, "tiltedTabView"));
    objc_msgSend(v9, "layoutItemsAnimated:", 1);
LABEL_5:

  }
}

- (TiltedTabViewControllerDelegate)delegate
{
  return (TiltedTabViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DockContainerPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (NSMutableArray)dockedStates
{
  return self->_dockedStates;
}

- (void)setDockedStates:(id)a3
{
  objc_storeStrong((id *)&self->_dockedStates, a3);
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (void)setPrimaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryViewController, a3);
}

- (MFTiltedTabView)tiltedTabView
{
  return self->_tiltedTabView;
}

- (void)setTiltedTabView:(id)a3
{
  objc_storeStrong((id *)&self->_tiltedTabView, a3);
}

- (NSMutableDictionary)placeholderFactories
{
  return self->_placeholderFactories;
}

- (void)setPlaceholderFactories:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFactories, a3);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_placeholderFactories, 0);
  objc_storeStrong((id *)&self->_tiltedTabView, 0);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
