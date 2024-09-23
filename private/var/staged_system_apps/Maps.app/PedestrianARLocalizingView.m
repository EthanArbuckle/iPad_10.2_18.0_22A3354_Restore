@implementation PedestrianARLocalizingView

- (PedestrianARLocalizingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  os_activity_t v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  VLFScanningAnimationManager *v47;
  void *v48;
  void *v49;
  VLFScanningAnimationManager *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  os_activity_scope_state_s state;
  objc_super v58;
  _QWORD v59[3];
  _QWORD v60[4];
  uint8_t buf[4];
  id v62;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v58.receiver = self;
  v58.super_class = (Class)PedestrianARLocalizingView;
  v7 = -[PedestrianARLocalizingView initWithFrame:](&v58, "initWithFrame:");
  if (v7)
  {
    v8 = _os_activity_create((void *)&_mh_execute_header, "Visual Localization", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    objc_msgSend(v7, "setActivity:", v8);

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*((os_activity_t *)v7 + 9), &state);
    v9 = sub_10043D9D8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v62 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11 = objc_msgSend(objc_alloc((Class)ARCoachingOverlayView), "initWithFrame:", x, y, width, height);
    v12 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v11;

    objc_msgSend(*((id *)v7 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v7 + 3), "setGoal:", 4);
    objc_msgSend(*((id *)v7 + 3), "setHideCoachingMessageLabel:", 1);
    objc_msgSend(*((id *)v7 + 3), "setDelegate:", v7);
    objc_msgSend(*((id *)v7 + 3), "setActivatesAutomatically:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 3), "layer"));
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setOpacity:", v14);

    objc_msgSend(v7, "addSubview:", *((_QWORD *)v7 + 3));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 3), "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v60[0] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 3), "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v15));
    v60[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 3), "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v60[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 3), "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    v60[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    v24 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v25 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v24;

    objc_msgSend(*((id *)v7 + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "layer"));
    LODWORD(v27) = 0;
    objc_msgSend(v26, "setOpacity:", v27);

    objc_msgSend(*((id *)v7 + 4), "setNumberOfLines:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(*((id *)v7 + 4), "setTextColor:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "layer"));
    LODWORD(v30) = 0;
    objc_msgSend(v29, "setOpacity:", v30);

    objc_msgSend(v7, "addSubview:", *((_QWORD *)v7 + 4));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
    v35 = (void *)*((_QWORD *)v7 + 5);
    *((_QWORD *)v7 + 5) = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
    v40 = (void *)*((_QWORD *)v7 + 6);
    *((_QWORD *)v7 + 6) = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
    v45 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = v44;

    v59[0] = *((_QWORD *)v7 + 5);
    v59[1] = *((_QWORD *)v7 + 6);
    v59[2] = *((_QWORD *)v7 + 7);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);

    v47 = [VLFScanningAnimationManager alloc];
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v7 + 4), "layer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    v50 = -[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:](v47, "initWithLayer:animationDuration:timingFunction:", v48, v49, 0.2);
    v51 = (void *)*((_QWORD *)v7 + 8);
    *((_QWORD *)v7 + 8) = v50;

    objc_msgSend(v7, "_updateUI");
    os_activity_scope_leave(&state);
  }
  return (PedestrianARLocalizingView *)v7;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  objc_super v6;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARLocalizingView *v9;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = sub_10043D9D8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[ARCoachingOverlayView setActive:animated:](self->_coachingOverlayView, "setActive:animated:", 0, 0);
  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  os_activity_scope_leave(&state);
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARLocalizingView;
  -[PedestrianARLocalizingView dealloc](&v6, "dealloc");
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_super v10;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARLocalizingView *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity"));
  os_activity_scope_enter(v5, &state);

  v10.receiver = self;
  v10.super_class = (Class)PedestrianARLocalizingView;
  -[PedestrianARLocalizingView willMoveToWindow:](&v10, "willMoveToWindow:", v4);
  v6 = sub_10043D9D8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Moving to window: %@", buf, 0x16u);
  }

  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "removeAllAnimations");

  }
  os_activity_scope_leave(&state);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARLocalizingView;
  -[PedestrianARLocalizingView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
  objc_msgSend(v3, "setActive:animated:", 1, 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARLocalizingView;
  -[PedestrianARLocalizingView layoutSubviews](&v3, "layoutSubviews");
  -[PedestrianARLocalizingView _updateUI](self, "_updateUI");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARLocalizingView;
  -[PedestrianARLocalizingView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    -[PedestrianARLocalizingView _updateUI](self, "_updateUI");
  }

}

- (void)setSession:(id)a3
{
  ARSession *v5;
  ARSession **p_session;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  ARSession *v15;
  ARSession *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  ARSession *v21;
  void *v22;
  void *v23;
  os_activity_scope_state_s v24;
  uint8_t buf[4];
  PedestrianARLocalizingView *v26;
  __int16 v27;
  ARSession *v28;

  v5 = (ARSession *)a3;
  p_session = &self->_session;
  if (self->_session != v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity", 0, 0));
    os_activity_scope_enter(v7, &v24);

    v8 = sub_10043D9D8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v26 = self;
      v27 = 2112;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Setting session: %@", buf, 0x16u);
    }

    -[ARSession _removeObserver:](*p_session, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_session, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](*p_session, "configuration"));
    if (v10
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](*p_session, "configuration")),
          v12 = objc_msgSend(v11, "isPedestrianAR"),
          v11,
          v10,
          !v12))
    {
      v19 = sub_10043D9D8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (ARSession *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](*p_session, "configuration"));
        *(_DWORD *)buf = 134349314;
        v26 = self;
        v27 = 2112;
        v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Session is NOT configured with a Pedestrian AR configuration (%@); will wait until it is",
          buf,
          0x16u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
      objc_msgSend(v22, "setSession:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
      objc_msgSend(v23, "setActive:animated:", 0, 0);

      -[ARSession _addObserver:](*p_session, "_addObserver:", self);
    }
    else
    {
      v13 = sub_10043D9D8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (ARSession *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](*p_session, "configuration"));
        *(_DWORD *)buf = 134349314;
        v26 = self;
        v27 = 2112;
        v28 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Session is configured with a nil or Pedestrian AR configuration (%@); activating coaching overlay",
          buf,
          0x16u);

      }
      v16 = *p_session;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
      objc_msgSend(v17, "setSession:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
      objc_msgSend(v18, "setActive:animated:", 1, 0);

    }
    os_activity_scope_leave(&v24);
  }

}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  _QWORD v18[5];
  _QWORD v19[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARLocalizingView *v22;
  __int16 v23;
  __CFString *v24;

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity"));
  os_activity_scope_enter(v7, &state);

  v8 = sub_10043D9D8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v11 = v10;
    *(_DWORD *)buf = 134349314;
    v22 = self;
    v23 = 2112;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Will show animated: %@", buf, 0x16u);

  }
  -[PedestrianARLocalizingView setVisible:](self, "setVisible:", 1);
  -[PedestrianARLocalizingView setFadingOut:](self, "setFadingOut:", 0);
  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10043E32C;
    v19[3] = &unk_1011AC860;
    v19[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v19, 0, 0.3, 0.0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10043E378;
    v18[3] = &unk_1011AC860;
    v18[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v18, v6, 0.75, 0.0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    LODWORD(v14) = 1.0;
    objc_msgSend(v13, "setOpacity:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    LODWORD(v17) = 1.0;
    objc_msgSend(v16, "setOpacity:", v17);

    if (v6)
      v6[2](v6, 1);
  }
  os_activity_scope_leave(&state);

}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void **v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARLocalizingView *v32;
  __int16 v33;
  __CFString *v34;

  v4 = a3;
  v6 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity"));
  os_activity_scope_enter(v7, &state);

  v8 = sub_10043D9D8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v11 = v10;
    *(_DWORD *)buf = 134349314;
    v32 = self;
    v33 = 2112;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Will hide animated: %@", buf, 0x16u);

  }
  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v13, "removeAllAnimations");

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10043E6E8;
    v29[3] = &unk_1011AC860;
    v29[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v29, 0, 0.5, 0.1);
    objc_initWeak((id *)buf, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10043E734;
    v28[3] = &unk_1011AC860;
    v28[4] = self;
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_10043E780;
    v25 = &unk_1011AE988;
    objc_copyWeak(&v27, (id *)buf);
    v26 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v28, &v22, 0.75, 0.0);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    objc_msgSend(v15, "removeAllAnimations");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    LODWORD(v18) = 0;
    objc_msgSend(v17, "setOpacity:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView coachingOverlayView](self, "coachingOverlayView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
    LODWORD(v21) = 0;
    objc_msgSend(v20, "setOpacity:", v21);

    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
  -[PedestrianARLocalizingView setVisible:](self, "setVisible:", 0, v22, v23, v24, v25);
  -[PedestrianARLocalizingView setFadingOut:](self, "setFadingOut:", v4);
  os_activity_scope_leave(&state);

}

- (void)_updateUI
{
  -[PedestrianARLocalizingView _updateFonts](self, "_updateFonts");
  -[PedestrianARLocalizingView _updateConstraints](self, "_updateConstraints");
}

- (void)_updateFonts
{
  unsigned int v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[PedestrianARLocalizingView _isLandscape](self, "_isLandscape");
  v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  if (!v3)
    v4 = (id *)&UIContentSizeCategoryAccessibilityLarge;
  v5 = *v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView traitCollection](self, "traitCollection"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_traitCollectionWithMaximumContentSizeCategory:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v9, UIFontWeightBold));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
  objc_msgSend(v8, "setFont:", v7);

}

- (void)_updateConstraints
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = -[PedestrianARLocalizingView _isLandscape](self, "_isLandscape");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabelLeadingConstraint](self, "instructionLabelLeadingConstraint"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setConstant:", 0.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabelTrailingConstraint](self, "instructionLabelTrailingConstraint"));
    objc_msgSend(v6, "setConstant:", 0.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView traitCollection](self, "traitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    v9 = sub_1002A8950(v8, UIContentSizeCategoryExtraExtraExtraLarge);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabelBottomConstraint](self, "instructionLabelBottomConstraint"));
    v11 = v10;
    v12 = -18.0;
    if (v9 == 1)
      v12 = -16.0;
    objc_msgSend(v10, "setConstant:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    objc_msgSend(v13, "setNumberOfLines:", 2);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v19 = v14;
    v15 = 1;
  }
  else
  {
    objc_msgSend(v4, "setConstant:", 26.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabelTrailingConstraint](self, "instructionLabelTrailingConstraint"));
    objc_msgSend(v16, "setConstant:", -26.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabelBottomConstraint](self, "instructionLabelBottomConstraint"));
    objc_msgSend(v17, "setConstant:", -24.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    objc_msgSend(v18, "setNumberOfLines:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView instructionLabel](self, "instructionLabel"));
    v19 = v14;
    v15 = 0;
  }
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", v15);

}

- (BOOL)_isLandscape
{
  double Width;
  CGRect v5;
  CGRect v6;

  -[PedestrianARLocalizingView frame](self, "frame");
  Width = CGRectGetWidth(v5);
  -[PedestrianARLocalizingView frame](self, "frame");
  return Width > CGRectGetHeight(v6);
}

- (void)displayCoachingMessage:(id)a3 forCoachingView:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  PedestrianARLocalizingView *v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView activity](self, "activity"));
  os_activity_scope_enter(v8, &state);

  v9 = -[PedestrianARLocalizingView isFadingOut](self, "isFadingOut");
  v10 = sub_10043D9D8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134349314;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Got a coaching message (%@) while fading out; ignoring it",
        buf,
        0x16u);
    }

  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134349314;
      v25 = self;
      v26 = 2112;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Updating coaching message: '%@'", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10043ED7C;
    v19[3] = &unk_1011AD1E8;
    objc_copyWeak(&v21, &location);
    v20 = v6;
    v13 = objc_retainBlock(v19);
    v14 = -[PedestrianARLocalizingView isVisible](self, "isVisible");
    v15 = sub_10043D9D8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if ((v14 & 1) != 0)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating text with animation", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARLocalizingView animationManager](self, "animationManager"));
      objc_msgSend(v18, "fadeWithFadeOutCompletion:", v13);

    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 134349056;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating text without animation", buf, 0xCu);
      }

      ((void (*)(_QWORD *))v13[2])(v13);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  os_activity_scope_leave(&state);

}

- (BOOL)coachingOverlayViewShouldShowSessionFailure:(id)a3 error:(id)a4
{
  return 0;
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  PedestrianARLocalizingView *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isPedestrianAR");
  v9 = sub_10043D9D8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] ARSession will run with PedestrianAR configuration", buf, 0xCu);
    }

    objc_msgSend(v6, "_removeObserver:", self);
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10043EF74;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v15 = self;
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}p] ARSession will run with a non-pedestrianAR configuration: %@", buf, 0x16u);
    }

  }
}

- (ARSession)session
{
  return self->_session;
}

- (ARCoachingOverlayView)coachingOverlayView
{
  return self->_coachingOverlayView;
}

- (void)setCoachingOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_coachingOverlayView, a3);
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabel, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isFadingOut
{
  return self->_fadingOut;
}

- (void)setFadingOut:(BOOL)a3
{
  self->_fadingOut = a3;
}

- (NSLayoutConstraint)instructionLabelLeadingConstraint
{
  return self->_instructionLabelLeadingConstraint;
}

- (void)setInstructionLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)instructionLabelTrailingConstraint
{
  return self->_instructionLabelTrailingConstraint;
}

- (void)setInstructionLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabelTrailingConstraint, a3);
}

- (NSLayoutConstraint)instructionLabelBottomConstraint
{
  return self->_instructionLabelBottomConstraint;
}

- (void)setInstructionLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabelBottomConstraint, a3);
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
  objc_storeStrong((id *)&self->_animationManager, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_instructionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_coachingOverlayView, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
