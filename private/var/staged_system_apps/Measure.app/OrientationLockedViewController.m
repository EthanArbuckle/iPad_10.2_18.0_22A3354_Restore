@implementation OrientationLockedViewController

- (OrientationLockedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  OrientationLockedViewController *v4;
  OrientationLockedViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OrientationLockedViewController;
  v4 = -[OrientationLockedViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[OrientationLockedViewController configure](v4, "configure");
  return v5;
}

- (OrientationLockedViewController)initWithCoder:(id)a3
{
  OrientationLockedViewController *v3;
  OrientationLockedViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OrientationLockedViewController;
  v3 = -[OrientationLockedViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[OrientationLockedViewController configure](v3, "configure");
  return v4;
}

- (OrientationLockedViewController)init
{
  return -[OrientationLockedViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (void)configure
{
  NSArray *viewControllers;
  UIView *v4;
  UIView *orientationLockedView;

  viewControllers = self->_viewControllers;
  self->_viewControllers = 0;

  self->_previousOrientation = 0;
  self->_orientationToLockTo = 1;
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
  orientationLockedView = self->_orientationLockedView;
  self->_orientationLockedView = v4;

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OrientationLockedViewController;
  -[OrientationLockedViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_orientationLockedView);

  -[OrientationLockedViewController counterRotateChildrenForBoundsOrOrientationChange](self, "counterRotateChildrenForBoundsOrOrientationChange");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v6, "setClipsToBounds:", 0);

  v9.receiver = self;
  v9.super_class = (Class)OrientationLockedViewController;
  -[OrientationLockedViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController transitionCoordinator](self, "transitionCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000ADDC;
  v8[3] = &unk_10043BB60;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)setOrientationToLockTo:(int64_t)a3
{
  self->_orientationToLockTo = a3;
  -[OrientationLockedViewController counterRotateChildrenForBoundsOrOrientationChange](self, "counterRotateChildrenForBoundsOrOrientationChange");
}

- (void)setViewControllers:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  UIView *orientationLockedView;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  objc_storeStrong((id *)&self->_viewControllers, a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        -[OrientationLockedViewController addChildViewController:](self, "addChildViewController:", v11, (_QWORD)v14);
        orientationLockedView = self->_orientationLockedView;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
        -[UIView addSubview:](orientationLockedView, "addSubview:", v13);

        objc_msgSend(v11, "didMoveToParentViewController:", self);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[OrientationLockedViewController counterRotateChildrenForBoundsOrOrientationChange](self, "counterRotateChildrenForBoundsOrOrientationChange");
}

- (void)counterRotateChildrenForBoundsOrOrientationChange
{
  char *v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  int64_t previousOrientation;
  BOOL v18;
  BOOL v19;
  double v20;
  CGAffineTransform *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  _BYTE v46[128];

  v3 = (char *)-[OrientationLockedViewController interfaceOrientation](self, "interfaceOrientation");
  v4 = -[OrientationLockedViewController orientationToLockTo](self, "orientationToLockTo");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[OrientationLockedViewController correctionRotationBoundsForReferenceOrientation:targetOrientation:bounds:](self, "correctionRotationBoundsForReferenceOrientation:targetOrientation:bounds:", v3, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[OrientationLockedViewController correctionRotationAngleForReferenceOrientation:targetOrientation:](self, "correctionRotationAngleForReferenceOrientation:targetOrientation:", v3, v4);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController orientationLockedView](self, "orientationLockedView"));
  previousOrientation = self->_previousOrientation;
  if ((char *)previousOrientation == v3)
    goto LABEL_24;
  if ((unint64_t)(previousOrientation - 3) <= 1)
  {
    if ((unint64_t)(v3 - 3) >= 2)
      goto LABEL_24;
    goto LABEL_14;
  }
  v18 = previousOrientation == 2 && v3 == (char *)1;
  if (v18 || (previousOrientation == 1 ? (v19 = v3 == (char *)2) : (v19 = 0), v19))
  {
LABEL_14:
    -[OrientationLockedViewController correctionRotationAngleForReferenceOrientation:targetOrientation:](self, "correctionRotationAngleForReferenceOrientation:targetOrientation:");
    if (v20 == -3.14159265)
    {
      CGAffineTransformMakeRotation(&v45, 1.57079633);
      v44 = v45;
      v21 = &v44;
    }
    else if (v20 == -1.57079633)
    {
      CGAffineTransformMakeRotation(&v43, 3.14159265);
      v42 = v43;
      v21 = &v42;
    }
    else if (v20 == 1.57079633)
    {
      CGAffineTransformMakeRotation(&v41, 0.0);
      v40 = v41;
      v21 = &v40;
    }
    else if (v20 == 3.14159265)
    {
      CGAffineTransformMakeRotation(&v39, -1.57079633);
      v38 = v39;
      v21 = &v38;
    }
    else
    {
      CGAffineTransformMakeRotation(&v37, 6.28318531);
      v36 = v37;
      v21 = &v36;
    }
    objc_msgSend(v16, "setTransform:", v21);
  }
LABEL_24:
  CGAffineTransformMakeRotation(&v35, v15);
  v34 = v35;
  objc_msgSend(v16, "setTransform:", &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController view](self, "view"));
  objc_msgSend(v22, "bounds");
  objc_msgSend(v16, "setFrame:");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController childViewControllers](self, "childViewControllers", 0));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v28, "isViewLoaded"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
          objc_msgSend(v29, "setFrame:", v7, v9, v11, v13);

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v25);
  }

  -[OrientationLockedViewController setPreviousOrientation:](self, "setPreviousOrientation:", v3);
}

- (CGRect)correctionRotationBoundsForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 bounds:(CGRect)result
{
  CGFloat width;
  double v6;

  width = result.size.width;
  if ((unint64_t)(a3 - 3) > 1)
  {
    if (((a4 - 3) | (unint64_t)(a3 - 1)) > 1)
      goto LABEL_3;
LABEL_5:
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.width = result.size.height;
    goto LABEL_6;
  }
  if ((unint64_t)(a4 - 1) < 2)
    goto LABEL_5;
LABEL_3:
  width = result.size.height;
LABEL_6:
  v6 = width;
  result.size.height = v6;
  return result;
}

- (double)correctionRotationAngleForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4
{
  double v6;
  double v7;
  double v8;

  -[OrientationLockedViewController rotationAngleForOrientation:](self, "rotationAngleForOrientation:", a3);
  v7 = v6;
  -[OrientationLockedViewController rotationAngleForOrientation:](self, "rotationAngleForOrientation:", a4);
  return v8 - v7;
}

- (double)rotationAngleForOrientation:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2)
    return dbl_1003AE790[a3 - 2];
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OrientationLockedViewController;
  v7 = a4;
  -[OrientationLockedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B48C;
  v8[3] = &unk_10043BB60;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  unsigned __int8 v4;
  uint64_t (**v5)(void);
  char v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {

LABEL_4:
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[OrientationLockedViewController isAutorotationEnabled](self, "isAutorotationEnabled"));
    v6 = v5[2]();

    return v6;
  }
  v4 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");

  if ((v4 & 1) != 0)
    goto LABEL_4;
  return 0;
}

- (int64_t)orientationToLockTo
{
  return self->_orientationToLockTo;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (id)isAutorotationEnabled
{
  return self->_isAutorotationEnabled;
}

- (void)setIsAutorotationEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIView)orientationLockedView
{
  return self->_orientationLockedView;
}

- (void)setOrientationLockedView:(id)a3
{
  objc_storeStrong((id *)&self->_orientationLockedView, a3);
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationLockedView, 0);
  objc_storeStrong(&self->_isAutorotationEnabled, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
