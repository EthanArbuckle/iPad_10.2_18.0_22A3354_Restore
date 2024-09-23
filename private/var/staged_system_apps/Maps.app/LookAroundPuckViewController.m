@implementation LookAroundPuckViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  MKHapticEngine *v4;
  MKHapticEngine *hapticEngine;
  LookAroundPuckView *v6;
  LookAroundPuckView *puckView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)LookAroundPuckViewController;
  -[LookAroundPuckViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4 = (MKHapticEngine *)objc_alloc_init((Class)MKHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v4;

  v6 = -[LookAroundPuckView initWithFrame:]([LookAroundPuckView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  puckView = self->_puckView;
  self->_puckView = v6;

  -[LookAroundPuckView setTranslatesAutoresizingMaskIntoConstraints:](self->_puckView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LookAroundPuckView setUserInteractionEnabled:](self->_puckView, "setUserInteractionEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_puckView);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView bottomAnchor](self->_puckView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v27[0] = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView topAnchor](self->_puckView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v27[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView leadingAnchor](self->_puckView, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v27[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckView trailingAnchor](self->_puckView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v27[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (BOOL)isDimmed
{
  return self->_lookAroundAvailability != 2;
}

- (void)setPitch:(double)a3
{
  if (self->_pitch != a3)
  {
    self->_pitch = a3;
    -[LookAroundPuckView setPitch:](self->_puckView, "setPitch:", a3 * 0.0174532925);
    -[LookAroundPuckView updateSubviewsIfNeeded](self->_puckView, "updateSubviewsIfNeeded");
  }
}

- (void)setCanEnterLookAroundPIP
{
  void *v3;
  void (**v4)(void);

  if (!self->_canEnterLookAroundPIP)
  {
    self->_canEnterLookAroundPIP = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController didEnterLookAroundPIP](self, "didEnterLookAroundPIP"));

    if (v3)
    {
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController didEnterLookAroundPIP](self, "didEnterLookAroundPIP"));
      v4[2]();

      -[LookAroundPuckViewController setDidEnterLookAroundPIP:](self, "setDidEnterLookAroundPIP:", 0);
    }
  }
}

- (void)lookAroundPIPDataCoordinatorWillEnterLookArounPIP:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapView"));
  self->_lookAroundAvailability = (int64_t)objc_msgSend(v4, "_lookAroundAvailability");

  -[LookAroundPuckView setState:](self->_puckView, "setState:", 1);
  -[LookAroundPuckView updateSubviewsIfNeeded](self->_puckView, "updateSubviewsIfNeeded");
}

- (void)lookAroundPIPDataCoordinatorDidEnterLookAroundPIP:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void ***v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  LookAroundPuckViewController *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  self->_lookAroundAvailability = (int64_t)objc_msgSend(v5, "_lookAroundAvailability");

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100C02980;
  v12 = &unk_1011AC8B0;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = objc_retainBlock(&v9);
  v8 = v7;
  if (self->_canEnterLookAroundPIP)
    ((void (*)(void ***))v7[2])(v7);
  else
    -[LookAroundPuckViewController setDidEnterLookAroundPIP:](self, "setDidEnterLookAroundPIP:", v7, v9, v10, v11, v12, v13, v14);

}

- (void)lookAroundPIPDataCoordinatorFailedToEnterLookArounPIP:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapView"));
  self->_lookAroundAvailability = (int64_t)objc_msgSend(v4, "_lookAroundAvailability");

  -[LookAroundPuckView setDimmed:](self->_puckView, "setDimmed:", 1);
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);
}

- (void)lookAroundPIPDataCoordinatorWillExitLookAroundPIP:(id)a3
{
  LookAroundPuckView *puckView;
  _QWORD v5[5];

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", a3, 3.14159265);
  puckView = self->_puckView;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C02B04;
  v5[3] = &unk_1011AE8F8;
  v5[4] = self;
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:completion:](puckView, "updateSubviewsIfNeededAnimated:completion:", 1, v5);
}

- (void)lookAroundPIPDataCoordinatorDidChangeLookAroundAvailability:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = self->_lookAroundAvailability != 2;
  v9 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  self->_lookAroundAvailability = (int64_t)objc_msgSend(v6, "_lookAroundAvailability");

  if (v5 == (self->_lookAroundAvailability == 2) || (-[LookAroundPuckView alpha](self->_puckView, "alpha"), v7 == 0.0))
  {
    if (-[LookAroundPuckViewController isDimmed](self, "isDimmed"))
      v8 = 1;
    else
      v8 = objc_msgSend(v9, "isMapViewInSyncWithLookAroundView") ^ 1;
    -[LookAroundPuckView setDimmed:](self->_puckView, "setDimmed:", v8);
    -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);
  }

}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[MKHapticEngine draggedObjectLifted](self->_hapticEngine, "draggedObjectLifted");
  v10 = v4;
  objc_msgSend(v10, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView setState:](self->_puckView, "setState:", 3);
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);

}

- (void)lookAroundPIPDataCoordinatorIsPanningMapView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[LookAroundPuckView setDimmed:](self->_puckView, "setDimmed:", -[LookAroundPuckViewController isDimmed](self, "isDimmed"));
  v10 = v4;
  objc_msgSend(v10, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);

}

- (void)lookAroundPIPDataCoordinatorDidEndPanningMapView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[MKHapticEngine draggedObjectLanded](self->_hapticEngine, "draggedObjectLanded");
  v10 = v4;
  objc_msgSend(v10, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView setState:](self->_puckView, "setState:", 2);
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);

}

- (void)lookAroundPIPDataCoordinatorIsRotatingMapView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView updateSubviewsIfNeeded](self->_puckView, "updateSubviewsIfNeeded");
}

- (void)lookAroundPIPDataCoordinatorDidPanLookAroundView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView updateSubviewsIfNeeded](self->_puckView, "updateSubviewsIfNeeded");
}

- (void)lookAroundPIPDataCoordinatorDidSynchronizeMapView:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isMapViewInSyncWithLookAroundView");
  v5 = objc_msgSend(v12, "isLookAroundDataAvailable");
  if (v4 && v5)
  {
    v6 = v12;
    objc_msgSend(v6, "lookAroundViewHeading");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));

    objc_msgSend(v9, "presentationYaw");
    v11 = (v8 - v10) * 0.0174532925;

    -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v11);
    -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);
  }

}

- (void)lookAroundPIPDataCoordinatorIsMovingLookAroundView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "lookAroundViewHeading");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  objc_msgSend(v7, "presentationYaw");
  v9 = (v6 - v8) * 0.0174532925;

  -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v9);
  -[LookAroundPuckView updateSubviewsIfNeeded](self->_puckView, "updateSubviewsIfNeeded");
}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isMapViewInSyncWithLookAroundView");
  v5 = objc_msgSend(v12, "isLookAroundDataAvailable");
  -[LookAroundPuckView setDimmed:](self->_puckView, "setDimmed:", -[LookAroundPuckViewController isDimmed](self, "isDimmed"));
  if (v4 && v5)
  {
    v6 = v12;
    objc_msgSend(v6, "lookAroundViewHeading");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));

    objc_msgSend(v9, "presentationYaw");
    v11 = (v8 - v10) * 0.0174532925;

    -[LookAroundPuckView setHeading:](self->_puckView, "setHeading:", v11);
  }
  -[LookAroundPuckView updateSubviewsIfNeededAnimated:](self->_puckView, "updateSubviewsIfNeededAnimated:", 1);

}

- (double)pitch
{
  return self->_pitch;
}

- (int64_t)lookAroundAvailability
{
  return self->_lookAroundAvailability;
}

- (void)setLookAroundAvailability:(int64_t)a3
{
  self->_lookAroundAvailability = a3;
}

- (LookAroundPuckView)puckView
{
  return self->_puckView;
}

- (void)setPuckView:(id)a3
{
  objc_storeStrong((id *)&self->_puckView, a3);
}

- (MKHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticEngine, a3);
}

- (BOOL)canEnterLookAroundPIP
{
  return self->_canEnterLookAroundPIP;
}

- (void)setCanEnterLookAroundPIP:(BOOL)a3
{
  self->_canEnterLookAroundPIP = a3;
}

- (id)didEnterLookAroundPIP
{
  return self->_didEnterLookAroundPIP;
}

- (void)setDidEnterLookAroundPIP:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEnterLookAroundPIP, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_puckView, 0);
}

@end
