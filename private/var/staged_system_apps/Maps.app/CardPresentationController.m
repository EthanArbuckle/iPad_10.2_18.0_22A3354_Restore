@implementation CardPresentationController

- (CardPresentationController)initWithViewController:(id)a3
{
  id v4;
  CardPresentationController *v5;
  CardPresentationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CardPresentationController;
  v5 = -[CardPresentationController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CardPresentationController setDefaultContaineeLayout:](v5, "setDefaultContaineeLayout:", 0);
    -[CardPresentationController setContentAlpha:](v6, "setContentAlpha:", 1.0);
    -[CardPresentationController setHeaderTransitionHeight:](v6, "setHeaderTransitionHeight:", 30.0);
    -[CardPresentationController setViewController:](v6, "setViewController:", v4);
    -[CardPresentationController setHideContentInSmallLayout:](v6, "setHideContentInSmallLayout:", 1);
    -[CardPresentationController setBlurInCardView:](v6, "setBlurInCardView:", 1);
    -[CardPresentationController setAllowsSwipeToDismiss:](v6, "setAllowsSwipeToDismiss:", 1);
  }

  return v6;
}

- (void)setHideGrabber:(BOOL)a3
{
  if (self->_hideGrabber != a3)
  {
    self->_hideGrabber = a3;
    -[CardPresentationController _updateStyle](self, "_updateStyle");
  }
}

- (void)setPresentedModally:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    v7 = sub_1008DBB48();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting presentedModally to NO on Mac", v9, 2u);
    }

    v3 = 0;
  }
  if (self->_presentedModally != v3)
  {
    self->_presentedModally = v3;
    -[CardPresentationController _updateStyle](self, "_updateStyle");
  }
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[CardPresentationController _updateStyle](self, "_updateStyle");
  }
}

- (unint64_t)containeeLayout
{
  id WeakRetained;
  ContainerViewController **p_containerViewController;
  id v5;
  void *v6;
  void *v7;

  if (!-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    p_containerViewController = &self->_containerViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

    if (!WeakRetained)
      return (unint64_t)WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_containerViewController);
    WeakRetained = objc_msgSend(v5, "containeeLayout");
LABEL_8:

    return (unint64_t)WeakRetained;
  }
  if (-[CardPresentationController allowResizeInFloatingStyle](self, "allowResizeInFloatingStyle")
    || (id)-[CardPresentationController containerStyle](self, "containerStyle") != (id)6)
  {
    v5 = objc_loadWeakRetained((id *)&self->_viewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sheetPresentationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedDetentIdentifier"));
    WeakRetained = -[CardPresentationController _layoutforDetentIdentifier:](self, "_layoutforDetentIdentifier:", v7);

    goto LABEL_8;
  }
  return 3;
}

- (unint64_t)containerStyle
{
  unsigned int v3;
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;

  v3 = -[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation");
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = WeakRetained;
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));

    v8 = objc_loadWeakRetained((id *)&self->_viewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sheetPresentationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerView"));

    v11 = objc_loadWeakRetained((id *)p_containerViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));

    if (!v13 && v10)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));

      v7 = (void *)v14;
    }
    v15 = objc_loadWeakRetained((id *)p_containerViewController);
    v16 = objc_msgSend(v15, "allowOnlyStandardStyle");
    v17 = v7;
    v18 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "userInterfaceIdiom") == (id)5)
      {
        v19 = 6;
LABEL_27:

        goto LABEL_28;
      }
      v20 = objc_msgSend(v18, "horizontalSizeClass");
      if (v16)
      {
        if (v20 == (id)2
          || objc_msgSend(v18, "horizontalSizeClass") == (id)1 && objc_msgSend(v18, "verticalSizeClass") == (id)1)
        {
          v19 = 2;
        }
        else if (objc_msgSend(v18, "userInterfaceIdiom") == (id)5)
        {
          v19 = 2;
        }
        else
        {
          v19 = 1;
        }
        goto LABEL_27;
      }
      if (v20 == (id)1 && objc_msgSend(v18, "verticalSizeClass") == (id)2)
      {
        v19 = 1;
        goto LABEL_27;
      }
      if (objc_msgSend(v18, "horizontalSizeClass") == (id)1 && objc_msgSend(v18, "verticalSizeClass") == (id)1
        || objc_msgSend(v18, "horizontalSizeClass") == (id)2 && objc_msgSend(v18, "verticalSizeClass") == (id)1
        || objc_msgSend(v18, "horizontalSizeClass") == (id)2 && objc_msgSend(v18, "verticalSizeClass") == (id)2)
      {
        v19 = 4;
        goto LABEL_27;
      }
    }
    v19 = 0;
    goto LABEL_27;
  }

  if (v6)
  {
    v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v19 = (unint64_t)objc_msgSend(v18, "containerStyle");
LABEL_28:

    return v19;
  }
  return 0;
}

- (double)bottomSafeOffset
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  id v4;
  double v5;
  double v6;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (!WeakRetained)
    return 0.0;
  v4 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v4, "bottomSafeOffset");
  v6 = v5;

  return v6;
}

- (double)availableHeight
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  ContaineeProtocol **p_viewController;
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (!WeakRetained)
    return 0.0;
  p_viewController = &self->_viewController;
  v6 = objc_loadWeakRetained((id *)p_viewController);

  v7 = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = v7;
  if (v6)
  {
    v9 = objc_loadWeakRetained((id *)p_viewController);
    objc_msgSend(v8, "availableHeightForViewController:", v9);
    v11 = v10;

  }
  else
  {
    objc_msgSend(v7, "availableHeight");
    v11 = v12;
  }

  return v11;
}

- (void)wantsLayout:(unint64_t)a3
{
  -[CardPresentationController wantsLayout:animated:](self, "wantsLayout:animated:", a3, 1);
}

- (void)wantsLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  ContaineeProtocol **p_viewController;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  CardPresentationController *v20;
  id *p_isa;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  void *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  id v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  ContainerViewController **p_containerViewController;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  CardPresentationController *v55;
  CardPresentationController *v56;
  objc_class *v57;
  NSString *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  __CFString *v63;
  id v64;
  void *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  __CFString *v72;
  id v73;
  void *v74;
  objc_class *v75;
  NSString *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  NSObject *v81;
  __CFString *v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[6];
  uint8_t buf[4];
  __CFString *v88;
  __int16 v89;
  unint64_t v90;
  __int16 v91;
  __CFString *v92;
  __int16 v93;
  __CFString *v94;

  v4 = a4;
  if (!-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    v84 = (id)objc_claimAutoreleasedReturnValue(-[CardPresentationController containerViewController](self, "containerViewController"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v84, "controller:wantsLayout:", WeakRetained, a3);

    return;
  }
  p_viewController = &self->_viewController;
  v83 = objc_loadWeakRetained((id *)&self->_viewController);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "sheetPresentationController"));
  if (!v8)
  {

    return;
  }
  v9 = (void *)v8;
  v10 = objc_loadWeakRetained((id *)&self->_viewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));

  if (v12)
  {
    if (a3 == 2 && (id)-[CardPresentationController containerStyle](self, "containerStyle") == (id)4)
    {
      +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, 0);
      return;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController _detentIdentifierForContaineeLayout:](self, "_detentIdentifierForContaineeLayout:", a3));
    v15 = objc_loadWeakRetained((id *)&self->_viewController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sheetPresentationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedDetentIdentifier"));

    if (v17 == v14)
      goto LABEL_66;
    v18 = sub_1008DBB48();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
LABEL_37:

      p_containerViewController = &self->_containerViewController;
      v47 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v48 = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(v47, "containee:willChangeLayout:source:", v48, a3, 0);

      if (v4)
      {
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_1008DC8A8;
        v86[3] = &unk_1011AD518;
        v86[4] = self;
        v86[5] = a3;
        -[CardPresentationController _animateToDesiredDetentIdentifier:completion:](self, "_animateToDesiredDetentIdentifier:completion:", v14, v86);
LABEL_66:

        return;
      }
      v49 = objc_loadWeakRetained((id *)&self->_viewController);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "sheetPresentationController"));
      objc_msgSend(v50, "setSelectedDetentIdentifier:", v14);

      v51 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v52 = objc_loadWeakRetained((id *)&self->_viewController);
      objc_msgSend(v51, "containee:didChangeLayout:", v52, a3);

      v53 = sub_1008DBB48();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
LABEL_65:

        goto LABEL_66;
      }
      v55 = self;
      v56 = v55;
      if (!v55)
      {
        v62 = CFSTR("<nil>");
LABEL_48:

        v63 = v62;
        v64 = objc_loadWeakRetained((id *)p_containerViewController);
        v65 = v64;
        if (!v64)
        {
          v71 = CFSTR("<nil>");
LABEL_56:

          v72 = v71;
          v73 = objc_loadWeakRetained((id *)p_viewController);
          v74 = v73;
          if (!v73)
          {
            v80 = CFSTR("<nil>");
            goto LABEL_64;
          }
          v75 = (objc_class *)objc_opt_class(v73);
          v76 = NSStringFromClass(v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          if ((objc_opt_respondsToSelector(v74, "accessibilityIdentifier") & 1) != 0)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "performSelector:", "accessibilityIdentifier"));
            v79 = v78;
            if (v78 && !objc_msgSend(v78, "isEqualToString:", v77))
            {
              v80 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v77, v74, v79));

              goto LABEL_62;
            }

          }
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v77, v74));
LABEL_62:

LABEL_64:
          *(_DWORD *)buf = 138544130;
          v88 = v63;
          v89 = 2048;
          v90 = a3;
          v91 = 2112;
          v92 = v72;
          v93 = 2112;
          v94 = v80;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "[%{public}@] Did change layout: %lu for container: %@ continee: %@", buf, 0x2Au);

          goto LABEL_65;
        }
        v66 = (objc_class *)objc_opt_class(v64);
        v67 = NSStringFromClass(v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if ((objc_opt_respondsToSelector(v65, "accessibilityIdentifier") & 1) != 0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "performSelector:", "accessibilityIdentifier"));
          v70 = v69;
          if (v69 && !objc_msgSend(v69, "isEqualToString:", v68))
          {
            v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v68, v65, v70));

            goto LABEL_54;
          }

        }
        v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v68, v65));
LABEL_54:

        goto LABEL_56;
      }
      v57 = (objc_class *)objc_opt_class(v55);
      v58 = NSStringFromClass(v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      if ((objc_opt_respondsToSelector(v56, "accessibilityIdentifier") & 1) != 0)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController performSelector:](v56, "performSelector:", "accessibilityIdentifier"));
        v61 = v60;
        if (v60 && !objc_msgSend(v60, "isEqualToString:", v59))
        {
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v59, v56, v61));

          goto LABEL_46;
        }

      }
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v59, v56));
LABEL_46:

      goto LABEL_48;
    }
    v85 = v14;
    v20 = self;
    p_isa = (id *)&v20->super.isa;
    v81 = v19;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
LABEL_20:

      v28 = v27;
      v29 = objc_loadWeakRetained(p_isa + 11);
      v30 = v29;
      v82 = v28;
      if (!v29)
      {
        v36 = CFSTR("<nil>");
LABEL_28:

        v37 = v36;
        v38 = objc_loadWeakRetained((id *)&self->_viewController);
        v39 = v38;
        if (!v38)
        {
          v45 = CFSTR("<nil>");
          goto LABEL_36;
        }
        v40 = (objc_class *)objc_opt_class(v38);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "performSelector:", "accessibilityIdentifier"));
          v44 = v43;
          if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
          {
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

            goto LABEL_34;
          }

        }
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_34:

LABEL_36:
        v19 = v81;

        *(_DWORD *)buf = 138544130;
        v88 = v82;
        v89 = 2048;
        v90 = a3;
        v91 = 2112;
        v92 = v37;
        v93 = 2112;
        v94 = v45;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "[%{public}@] Will change layout: %lu for container: %@ containee: %@", buf, 0x2Au);

        v14 = v85;
        goto LABEL_37;
      }
      v31 = (objc_class *)objc_opt_class(v29);
      v32 = NSStringFromClass(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "performSelector:", "accessibilityIdentifier"));
        v35 = v34;
        if (v34 && !objc_msgSend(v34, "isEqualToString:", v33))
        {
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v33, v30, v35));

          goto LABEL_26;
        }

      }
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v33, v30));
LABEL_26:

      goto LABEL_28;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, p_isa, v26));

        goto LABEL_18;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, p_isa));
LABEL_18:

    goto LABEL_20;
  }
}

- (void)_animateToDesiredDetentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  if (sub_100609AB8())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1008DCDC8;
    v22[3] = &unk_1011AC8B0;
    v10 = &v23;
    v22[4] = self;
    v23 = v6;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1008DCE38;
    v20[3] = &unk_1011DB340;
    v11 = &v21;
    v21 = v7;
    v12 = v7;
    v13 = v6;
    objc_msgSend(v9, "_animateChanges:completion:", v22, v20);

  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008DCE44;
    v18[3] = &unk_1011AC8B0;
    v10 = &v19;
    v18[4] = self;
    v19 = v6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1008DCEEC;
    v16[3] = &unk_1011B1B90;
    v11 = &v17;
    v17 = v7;
    v14 = v7;
    v15 = v6;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v16, 0.25);
  }

}

- (void)wantsExpandLayout
{
  CardPresentationController *v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if (-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    if ((id)-[CardPresentationController containeeLayout](self, "containeeLayout") == (id)1)
    {
      v3 = self;
      v4 = 2;
    }
    else
    {
      v3 = self;
      v4 = 3;
    }
    -[CardPresentationController wantsLayout:](v3, "wantsLayout:", v4);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CardPresentationController containerViewController](self, "containerViewController"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v6, "expandContainee:", WeakRetained);

  }
}

- (void)wantsMinimizeLayout
{
  CardPresentationController *v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if (-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    if ((id)-[CardPresentationController containeeLayout](self, "containeeLayout") == (id)3)
    {
      v3 = self;
      v4 = 2;
    }
    else
    {
      v3 = self;
      v4 = 1;
    }
    -[CardPresentationController wantsLayout:](v3, "wantsLayout:", v4);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CardPresentationController containerViewController](self, "containerViewController"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v6, "minimizeContainee:", WeakRetained);

  }
}

- (void)applyWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CardPresentationController containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardHeightAnimation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "coordinatedUnitAnimation"));
  objc_msgSend(v9, "applyWithAnimations:completion:", v7, v6);

}

- (void)dismiss:(BOOL)a3
{
  _BOOL8 v3;
  CardPresentationController *v4;
  ContaineeProtocol **p_viewController;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a3;
  v4 = self;
  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v4 = (CardPresentationController *)((char *)v4 + 88);
  v7 = objc_loadWeakRetained((id *)&v4->super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

  v10 = objc_loadWeakRetained((id *)&v4->super.isa);
  v9 = objc_loadWeakRetained((id *)p_viewController);
  if (WeakRetained == v8)
    objc_msgSend(v10, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v9, v3, 0);
  else
    objc_msgSend(v10, "removeControllerFromStack:", v9);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  ContainerViewController **p_containerViewController;
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  p_containerViewController = &self->_containerViewController;
  v11 = objc_loadWeakRetained((id *)p_containerViewController);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController"));

  if (WeakRetained == v12)
  {
    v13 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v13, "presentController:animated:completion:", v14, v6, v8);

  }
}

- (BOOL)_wantsSheetGrabber
{
  if (-[CardPresentationController isFloating](self, "isFloating"))
    return -[CardPresentationController allowResizeInFloatingStyle](self, "allowResizeInFloatingStyle");
  if (-[CardPresentationController hideGrabber](self, "hideGrabber"))
    return 0;
  return !-[CardPresentationController presentedModally](self, "presentedModally");
}

- (void)_updateStyle
{
  CardView **p_cardView;
  id WeakRetained;
  id v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  ContaineeProtocol **p_viewController;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _BOOL8 hidden;
  _BOOL8 v28;
  void *v29;
  id v30;
  _QWORD v31[5];

  p_cardView = &self->_cardView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_cardView);
    v6 = v5;
    v7 = self->_hideGrabber || self->_presentedModally;
    objc_msgSend(v5, "setHideGrabber:", v7);

    v26 = objc_loadWeakRetained((id *)p_cardView);
    objc_msgSend(v26, "setShowFooterGrabber:", self->_allowResizeInFloatingStyle);

    hidden = self->_hidden;
    v30 = objc_loadWeakRetained((id *)p_cardView);
    objc_msgSend(v30, "setHidden:", hidden);
    goto LABEL_15;
  }
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    if (!-[CardPresentationController wantsFullscreen](self, "wantsFullscreen"))
    {
      v8 = objc_loadWeakRetained((id *)&self->_viewController);
      v9 = objc_msgSend(v8, "modalPresentationStyle");

      if (v9 != (id)2)
      {
        v10 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v10, "setModalPresentationStyle:", 2);

      }
    }
    v11 = -[CardPresentationController _wantsSheetGrabber](self, "_wantsSheetGrabber");
    p_viewController = &self->_viewController;
    v13 = objc_loadWeakRetained((id *)&self->_viewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sheetPresentationController"));
    objc_msgSend(v14, "setPrefersGrabberVisible:", v11);

    v15 = objc_loadWeakRetained((id *)&self->_viewController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sheetPresentationController"));
    LODWORD(v14) = objc_msgSend(v16, "_isHidden");
    v17 = -[CardPresentationController hidden](self, "hidden");

    if ((_DWORD)v14 != v17)
    {
      v18 = objc_loadWeakRetained((id *)&self->_viewController);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = objc_loadWeakRetained((id *)&self->_viewController);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "presentedViewController"));

        if (!v23)
        {
          v24 = objc_loadWeakRetained((id *)&self->_viewController);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sheetPresentationController"));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1008DD4E8;
          v31[3] = &unk_1011AC860;
          v31[4] = self;
          objc_msgSend(v25, "animateChanges:", v31);

          return;
        }
      }
      else
      {

      }
      v28 = -[CardPresentationController hidden](self, "hidden");
      v30 = objc_loadWeakRetained((id *)p_viewController);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "sheetPresentationController"));
      objc_msgSend(v29, "_setHidden:", v28);

LABEL_15:
    }
  }
}

- (void)setCardView:(id)a3 fromContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CardPresentationController *v20;
  void *v21;
  double cardHeight;
  id v23;
  void *v24;
  id *location;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->_cardView, v6);
  objc_storeWeak((id *)&self->_containerViewController, v7);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));

    v11 = objc_loadWeakRetained((id *)&self->_viewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));

    objc_msgSend(v10, "addSubview:", v12);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = objc_loadWeakRetained((id *)&self->_cardView);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v32[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v32[1] = v24;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v32[2] = v16;
    location = (id *)&self->_cardView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v31 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v32[3] = v19;
    v20 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    cardHeight = v20->_cardHeight;
    v23 = objc_loadWeakRetained(location);
    objc_msgSend(v23, "setHeight:", cardHeight);

    v6 = v31;
    -[CardPresentationController _updateStyle](v20, "_updateStyle");

  }
}

- (BOOL)_supportDragMultiLayout
{
  if (-[CardPresentationController takesAvailableHeight](self, "takesAvailableHeight"))
    return 0;
  else
    return !-[CardPresentationController presentedModally](self, "presentedModally");
}

- (void)updateHeightForCurrentLayout
{
  -[CardPresentationController updateHeightForCurrentLayoutAnimated:](self, "updateHeightForCurrentLayoutAnimated:", 0);
}

- (void)updateHeightForCurrentLayoutAnimated:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ContaineeProtocol **p_viewController;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];

  if (-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    if (a3 || +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1008DD9D4;
      v16[3] = &unk_1011AC860;
      v16[4] = self;
      objc_msgSend(v6, "animateChanges:", v16);

    }
    else
    {
      p_viewController = &self->_viewController;
      v11 = objc_loadWeakRetained((id *)p_viewController);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sheetPresentationController"));
      objc_msgSend(v12, "invalidateDetents");

      v15 = objc_loadWeakRetained((id *)p_viewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
      objc_msgSend(v13, "setNeedsLayout");

    }
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));

    if (v8 == v9)
    {
      v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
      -[CardPresentationController updateHeightForLayout:](self, "updateHeightForLayout:", objc_msgSend(v14, "containeeLayout"));

    }
  }
}

- (void)updateHeightForLayout:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  if (!-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
    objc_msgSend(v5, "heightForLayout:", a3);
    v7 = v6;

    if (v7 != -1.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      if (objc_msgSend(WeakRetained, "layoutModalPresenter") == (id)3)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardPresentationController"));
        v11 = objc_msgSend(v10, "presentedModally");

        if (!v11)
        {
LABEL_7:
          -[CardPresentationController updateHeightConstraintWithValue:](self, "updateHeightConstraintWithValue:", v7);
          return;
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "modalPresenter"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardPresentationController"));
        objc_msgSend(v13, "updateHeightConstraintWithValue:", v7);

      }
      goto LABEL_7;
    }
  }
}

- (BOOL)updateHeightConstraintWithValue:(double)a3
{
  double v5;

  -[CardPresentationController headerTransitionHeight](self, "headerTransitionHeight");
  return -[CardPresentationController updateHeightConstraintWithValue:transitionHeight:](self, "updateHeightConstraintWithValue:transitionHeight:", a3, v5);
}

- (BOOL)updateHeightConstraintWithValue:(double)a3 transitionHeight:(double)a4
{
  CardView **p_cardView;
  id WeakRetained;
  double v9;
  double v10;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  unsigned int v37;
  id v38;
  double v39;

  p_cardView = &self->_cardView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
  objc_msgSend(WeakRetained, "height");
  v10 = v9;

  if (v10 == a3)
    return 0;
  v12 = objc_loadWeakRetained((id *)&self->_viewController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

  if (!v14)
    return 0;
  v15 = 30.0;
  if (a4 >= 30.0)
    v16 = a4;
  else
    v16 = 30.0;
  v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v18 = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(v17, "availableHeightForViewController:", v18);
  v20 = v19;

  v21 = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(v21, "heightForLayout:", 1);
  if (v22 >= 30.0)
  {
    v23 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v23, "heightForLayout:", 1);
    v15 = v24;

  }
  if (v15 <= a3 && v20 >= a3)
  {
    v25 = fmin((a3 - v15) / v16, 1.0);
    if (v25 >= 0.0)
      v26 = v25;
    else
      v26 = 0.0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cardPresentationController"));
    if (objc_msgSend(v28, "presentedModally"))
    {

    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cardPresentationController"));
      v37 = objc_msgSend(v36, "hidesContentInSmallLayout");

      if (v37)
        -[CardPresentationController setContentAlpha:](self, "setContentAlpha:", v26);
    }
    v32 = objc_loadWeakRetained((id *)p_cardView);
    v33 = v32;
    v34 = a3;
    goto LABEL_25;
  }
  if (v15 > a3)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cardPresentationController"));
    v31 = objc_msgSend(v30, "hidesContentInSmallLayout");

    if (v31)
      -[CardPresentationController setContentAlpha:](self, "setContentAlpha:", 0.0);
    v32 = objc_loadWeakRetained((id *)p_cardView);
    v33 = v32;
    v34 = v15;
    goto LABEL_25;
  }
  if (v20 >= a3)
    return 0;
  -[CardPresentationController setContentAlpha:](self, "setContentAlpha:", 1.0);
  v32 = objc_loadWeakRetained((id *)p_cardView);
  v33 = v32;
  v34 = v20;
LABEL_25:
  objc_msgSend(v32, "setHeight:", v34);

  v38 = objc_loadWeakRetained((id *)p_cardView);
  objc_msgSend(v38, "height");
  self->_cardHeight = v39;

  return 1;
}

- (double)cardHeight
{
  id WeakRetained;
  void *v4;
  double Height;
  double v6;
  CGRect v8;

  if (-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    objc_msgSend(v4, "frame");
    Height = CGRectGetHeight(v8);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cardView);
    objc_msgSend(WeakRetained, "height");
    Height = v6;
  }

  return Height;
}

- (void)setContentAlpha:(double)a3
{
  void *v3;
  id WeakRetained;

  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (double)contentAlpha
{
  double v3;
  ContaineeProtocol **p_viewController;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  __CFString *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  double Height;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;

  v3 = 1.0;
  if (-[CardPresentationController hidesContentInSmallLayout](self, "hidesContentInSmallLayout"))
  {
    if (!-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
      return self->_contentAlpha;
    if (!-[CardPresentationController isFloating](self, "isFloating")
      && !-[CardPresentationController presentedModally](self, "presentedModally"))
    {
      p_viewController = &self->_viewController;
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_detentValues"));
      v8 = objc_msgSend(v7, "count");

      if ((unint64_t)v8 >= 2)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
        if (objc_msgSend(v9, "isBeingPresented"))
        {

LABEL_11:
          v13 = objc_loadWeakRetained((id *)&self->_viewController);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sheetPresentationController"));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectedDetentIdentifier"));
          if (v15 == CFSTR("SmallLayoutDetentIdentifier"))
            v3 = 0.0;
          else
            v3 = 1.0;

          return v3;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController viewController](self, "viewController"));
        v12 = objc_msgSend(v11, "isBeingDismissed");

        if (v12)
          goto LABEL_11;
        -[CardPresentationController headerTransitionHeight](self, "headerTransitionHeight");
        v16 = 30.0;
        if (v17 >= 30.0)
        {
          -[CardPresentationController headerTransitionHeight](self, "headerTransitionHeight");
          v16 = v18;
        }
        v19 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v19, "heightForLayout:", 1);
        v21 = v20;

        v22 = objc_loadWeakRetained((id *)&self->_viewController);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sheetPresentationController"));
        objc_msgSend(v23, "_currentPresentedViewFrame");
        Height = CGRectGetHeight(v31);

        v25 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v26 = objc_loadWeakRetained((id *)p_viewController);
        objc_msgSend(v25, "availableHeightForViewController:", v26);
        v28 = v27;

        if (v21 >= 30.0)
          v29 = v21;
        else
          v29 = 30.0;
        if (Height < v29 || Height > v28)
        {
          if (Height <= v28)
            return 0.0;
          else
            return 1.0;
        }
        else
        {
          v30 = fmin((Height - v29) / v16, 1.0);
          if (v30 >= 0.0)
            return v30;
          else
            return 0.0;
        }
      }
    }
  }
  return v3;
}

- (id)_detentIdentifierForContaineeLayout:(unint64_t)a3
{
  ContaineeProtocol **p_viewController;
  id WeakRetained;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  id v12;

  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));

  if (!v7)
    return CFSTR("SmallLayoutDetentIdentifier");
  if (a3 - 3 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v9 = objc_loadWeakRetained((id *)p_viewController);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sheetPresentationController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detents"));
      v12 = objc_msgSend(v11, "count");

      if ((unint64_t)v12 > 2)
        return CFSTR("MediumLayoutDetentIdentifier");
    }
    return CFSTR("SmallLayoutDetentIdentifier");
  }
  if ((id)-[CardPresentationController containerStyle](self, "containerStyle") == (id)4)
    return CFSTR("MediumLayoutDetentIdentifier");
  else
    return CFSTR("FullLayoutDetentIdentifier");
}

- (unint64_t)_layoutforDetentIdentifier:(id)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));

  if (!v6)
    return 1;
  if (a3 == CFSTR("FullLayoutDetentIdentifier"))
    return 3;
  if (a3 != CFSTR("MediumLayoutDetentIdentifier"))
    return 1;
  if ((id)-[CardPresentationController containerStyle](self, "containerStyle") == (id)4)
    return 3;
  else
    return 2;
}

- (BOOL)_fullHeightFixed
{
  unsigned int v3;
  unsigned int v4;

  if (-[CardPresentationController isFloating](self, "isFloating"))
    v3 = !-[CardPresentationController allowResizeInFloatingStyle](self, "allowResizeInFloatingStyle");
  else
    LOBYTE(v3) = 0;
  v4 = -[CardPresentationController takesAvailableHeight](self, "takesAvailableHeight");
  if (v4)
    LOBYTE(v4) = -[CardPresentationController presentedModally](self, "presentedModally");
  return v3 | v4;
}

- (BOOL)isFloating
{
  return (id)-[CardPresentationController containerStyle](self, "containerStyle") == (id)6;
}

- (double)grabberSafeAreaHeight
{
  unsigned __int8 v3;
  double result;

  if (!-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
    return 0.0;
  if (!-[CardPresentationController isFloating](self, "isFloating"))
    return 0.0;
  v3 = -[CardPresentationController allowResizeInFloatingStyle](self, "allowResizeInFloatingStyle");
  result = 20.0;
  if ((v3 & 1) == 0)
    return 0.0;
  return result;
}

- (id)detents
{
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  double (*v12)(uint64_t, void *);
  void *v13;
  CardPresentationController *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[3];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1008DE4C8;
  v19[3] = &unk_1011DB368;
  v19[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("SmallLayoutDetentIdentifier"), v19));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1008DE54C;
  v18[3] = &unk_1011DB368;
  v18[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008DE5F0;
  v16[3] = &unk_1011DB390;
  v16[4] = self;
  v4 = objc_retainBlock(v18);
  v17 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("MediumLayoutDetentIdentifier"), v16));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1008DE6B4;
  v13 = &unk_1011DB390;
  v14 = self;
  v15 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UISheetPresentationControllerDetent customDetentWithIdentifier:resolver:](UISheetPresentationControllerDetent, "customDetentWithIdentifier:resolver:", CFSTR("FullLayoutDetentIdentifier"), &v10));
  v20[0] = v3;
  v20[1] = v5;
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3, v10, v11, v12, v13, v14));

  return v8;
}

- (void)configureForSheetPresentationWithContainer:(id)a3 layout:(unint64_t)a4
{
  ContaineeProtocol **p_viewController;
  id v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  _BOOL8 v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  unsigned int v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  CGRect v35;

  p_viewController = &self->_viewController;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(WeakRetained, "setModalPresentationStyle:", 2);

  -[CardPresentationController setUsingSheetPresentation:](self, "setUsingSheetPresentation:", 1);
  objc_storeWeak((id *)&self->_containerViewController, v7);
  v9 = sub_1002A8AA0(v7);
  v10 = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);

  v11 = objc_loadWeakRetained((id *)p_viewController);
  v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sheetPresentationController"));

  v12 = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(v12, "loadViewIfNeeded");

  v13 = -[CardPresentationController modalPresentStyle](self, "modalPresentStyle");
  v14 = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(v14, "setModalTransitionStyle:", v13);

  v15 = -[CardPresentationController _supportDragMultiLayout](self, "_supportDragMultiLayout");
  v16 = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(v16, "setModalInPresentation:", v15);

  -[CardPresentationController sheetContentSize](self, "sheetContentSize");
  v18 = v17;
  v20 = v19;
  v21 = objc_loadWeakRetained((id *)p_viewController);
  objc_msgSend(v21, "setPreferredContentSize:", v18, v20);

  objc_msgSend(v34, "_setForcePresentationInPresenterScene:", v9 == 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController detents](self, "detents"));
  objc_msgSend(v34, "setDetents:", v22);

  objc_msgSend(v34, "setDelegate:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CardPresentationController _detentIdentifierForContaineeLayout:](self, "_detentIdentifierForContaineeLayout:", a4));
  objc_msgSend(v34, "setSelectedDetentIdentifier:", v23);

  if (-[CardPresentationController isFirstCard](self, "isFirstCard"))
  {
    objc_msgSend(v34, "_setSheetID:", CFSTR("ShowsMapID"));
  }
  else
  {
    v24 = -[CardPresentationController _fullHeightFixed](self, "_fullHeightFixed");
    v25 = -[CardPresentationController containerStyle](self, "containerStyle");
    if (v24)
      v26 = 0;
    else
      v26 = CFSTR("ShowsMapID");
    if (((1 << v25) & 0xE3) != 0)
      v27 = v26;
    else
      v27 = CFSTR("ShowsMapID");
    if (v25 <= 7)
      v28 = v27;
    else
      v28 = CFSTR("ShowsMapID");
    objc_msgSend(v34, "_setHiddenAncestorSheetID:", v28);
  }
  if (-[CardPresentationController presentedModally](self, "presentedModally"))
    objc_msgSend(v34, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v34, "_setHidden:", -[CardPresentationController hidden](self, "hidden"));
  objc_msgSend(v34, "setPrefersGrabberVisible:", -[CardPresentationController _wantsSheetGrabber](self, "_wantsSheetGrabber"));
  objc_msgSend(v34, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
  objc_msgSend(v34, "setPrefersEdgeAttachedInCompactHeight:", 1);
  objc_msgSend(v34, "_setDetentDirectionWhenFloating:", 1);
  objc_msgSend(v34, "_setPeeksWhenFloating:", 0);
  objc_msgSend(v34, "_setPrefersScrollingResizesWhenDetentDirectionIsDown:", 0);
  objc_msgSend(v34, "_setWantsFloatingInRegularWidthCompactHeight:", 0);
  if (v9 == 5)
    v29 = 2;
  else
    v29 = 1;
  objc_msgSend(v34, "_setHorizontalAlignment:", v29);
  objc_msgSend(v34, "_setMarginInCompactHeight:", 8.0);
  v30 = -[CardPresentationController takesAvailableWidth](self, "takesAvailableWidth");
  v31 = 10.0;
  if (v30)
    v31 = 0.0;
  objc_msgSend(v34, "_setMarginInRegularWidthRegularHeight:", v31);
  objc_msgSend(v34, "_setTucksIntoUnsafeAreaInCompactHeight:", 1);
  objc_msgSend(v34, "_setAllowsAsymmetricVerticalMargins:", 1);
  v32 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "statusBarSupplementaryView"));
  objc_msgSend(v33, "frame");
  objc_msgSend(v34, "_setAdditionalMinimumTopInset:", CGRectGetHeight(v35));

  -[CardPresentationController updateGrabber](self, "updateGrabber");
  -[CardPresentationController updateDimmingBehavior](self, "updateDimmingBehavior");

}

- (void)updateGrabber
{
  double v3;
  ContaineeProtocol **p_viewController;
  id WeakRetained;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  if (-[CardPresentationController isFloating](self, "isFloating"))
    v3 = 7.0;
  else
    v3 = 5.0;
  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));
  objc_msgSend(v6, "_setGrabberTopSpacing:", v3);

  v7 = -[CardPresentationController _wantsSheetGrabber](self, "_wantsSheetGrabber");
  v8 = objc_loadWeakRetained((id *)&self->_viewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sheetPresentationController"));
  objc_msgSend(v9, "setPrefersGrabberVisible:", v7);

  v10 = -[CardPresentationController grabberBlurEnabled](self, "grabberBlurEnabled");
  v12 = objc_loadWeakRetained((id *)p_viewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sheetPresentationController"));
  objc_msgSend(v11, "_setGrabberBlurEnabled:", v10);

}

- (void)updateDimmingBehavior
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 0));
  objc_msgSend(v14, "_setFloatingAppearance:", v4);

  v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = sub_1002A8AA0(v5);

  v7 = v14;
  if (v6 != 5)
  {
    objc_msgSend(v14, "_setWantsBottomAttached:", 1);
    v8 = -[CardPresentationController containerStyle](self, "containerStyle");
    if (v8 > 7 || ((1 << v8) & 0xA3) == 0)
      goto LABEL_12;
    if (-[CardPresentationController presentedModally](self, "presentedModally"))
      v9 = !-[CardPresentationController takesAvailableHeight](self, "takesAvailableHeight");
    else
      v9 = 0;
    v10 = -[CardPresentationController edgeAttachedRegularHeightDimmingBehavior](self, "edgeAttachedRegularHeightDimmingBehavior");
    if (v10 == 2)
    {
      v11 = CFSTR("SmallLayoutDetentIdentifier");
      goto LABEL_14;
    }
    if (v10 == 1)
    {
LABEL_12:
      v12 = objc_claimAutoreleasedReturnValue(+[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 0));
LABEL_15:
      v13 = (void *)v12;
      objc_msgSend(v14, "_setStandardAppearance:", v12);

      v7 = v14;
      goto LABEL_16;
    }
    v7 = v14;
    if (!v10)
    {
      if (!v9)
      {
        v11 = CFSTR("MediumLayoutDetentIdentifier");
LABEL_14:
        v12 = objc_claimAutoreleasedReturnValue(+[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:](_UISheetPresentationControllerAppearance, "appearanceWithLargestUndimmedDetentIdentifier:", v11));
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
LABEL_16:

}

- (void)updateAdditionalTopMargin
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008DED28;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(v4, "animateChanges:", v5);

}

- (CGSize)sheetContentSize
{
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double Width;
  id v11;
  double v12;
  CGFloat Height;
  uint64_t *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  if (!v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_viewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sheetPresentationController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerView"));

    v5 = (void *)v9;
  }
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v23);
  if (-[CardPresentationController isFloating](self, "isFloating"))
  {
    v11 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v11, "availableHeight");
    Height = v12;

  }
  else
  {
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v24);
  }
  if ((id)-[CardPresentationController containerStyle](self, "containerStyle") != (id)1
    && !-[CardPresentationController takesAvailableWidth](self, "takesAvailableWidth"))
  {
    if (Width <= 825.0)
    {
      if (Width < 700.0)
        v14 = &MapsConfig_iPadCardWidthOverrideMinBucket;
      else
        v14 = &MapsConfig_iPadCardWidthOverrideMiddleBucket;
      v15 = &off_1014B5698;
      if (Width >= 700.0)
        v15 = &off_1014B5688;
    }
    else
    {
      v14 = &MapsConfig_iPadCardWidthOverrideMaxBucket;
      v15 = &off_1014B5678;
    }
    Width = GEOConfigGetDouble(*v14, *v15);
  }
  v16 = objc_loadWeakRetained((id *)p_containerViewController);
  if (v16)
  {
    v17 = v16;
    v18 = objc_loadWeakRetained((id *)p_containerViewController);
    v19 = sub_1002A8AA0(v18);

    if (v19 == 5)
      Width = 282.0;
  }

  v20 = Width;
  v21 = Height;
  result.height = v21;
  result.width = v20;
  return result;
}

- (int64_t)_modalPresentationStyleIsDismissing:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  id v7;
  int64_t v8;
  int64_t v9;

  v3 = a3;
  if ((id)-[CardPresentationController containerStyle](self, "containerStyle") != (id)6)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v7 = objc_msgSend(v6, "layoutDirection");

  v8 = 15;
  if (v7 == (id)1)
    v9 = 15;
  else
    v9 = 16;
  if (v7 == (id)1)
    v8 = 16;
  if (v3)
    return v9;
  else
    return v8;
}

- (int64_t)modalPresentStyle
{
  return -[CardPresentationController _modalPresentationStyleIsDismissing:](self, "_modalPresentationStyleIsDismissing:", 0);
}

- (int64_t)modalDismissStyle
{
  return -[CardPresentationController _modalPresentationStyleIsDismissing:](self, "_modalPresentationStyleIsDismissing:", 1);
}

- (int64_t)_detentIndexForContaineeLayout:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  int64_t v7;
  int64_t v8;

  v4 = a3 - 3;
  v5 = -[CardPresentationController containerStyle](self, "containerStyle");
  v7 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 && v5 != 4;
  v8 = 1;
  if (v5 != 4)
    v8 = 2;
  if (v4 <= 2)
    return v8;
  else
    return v7;
}

- (double)transitionProgressFromLayout:(unint64_t)a3 toLayout:(unint64_t)a4
{
  double v7;
  ContaineeProtocol **p_viewController;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  double Height;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v35;
  double v36;
  _QWORD v38[5];
  CGRect v39;

  v7 = 0.0;
  if (-[CardPresentationController usingSheetPresentation](self, "usingSheetPresentation"))
  {
    p_viewController = &self->_viewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sheetPresentationController"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_detentValues"));
    v12 = objc_msgSend(v11, "count");

    if (v12 == (id)3)
    {
      v13 = -[CardPresentationController _detentIndexForContaineeLayout:](self, "_detentIndexForContaineeLayout:", a3);
      v14 = -[CardPresentationController _detentIndexForContaineeLayout:](self, "_detentIndexForContaineeLayout:", a4);
      if (a3 > a4)
        v15 = v13;
      else
        v15 = v14;
      if (a3 > a4)
        v13 = v14;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1008DF2A4;
      v38[3] = &unk_1011DB3B8;
      v38[4] = self;
      v16 = objc_retainBlock(v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_detentValues"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v13));
      objc_msgSend(v18, "floatValue");
      v20 = ((double (*)(_QWORD *, unint64_t, double))v16[2])(v16, a3, v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_detentValues"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v15));
      objc_msgSend(v22, "floatValue");
      v24 = ((double (*)(_QWORD *, unint64_t, double))v16[2])(v16, a4, v23);

      objc_msgSend(v10, "_currentPresentedViewFrame");
      Height = CGRectGetHeight(v39);
      v26 = objc_loadWeakRetained((id *)p_viewController);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sheetPresentationController"));
      objc_msgSend(v27, "_additionalMinimumTopInset");
      v29 = Height + v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
      objc_msgSend(v30, "displayScale");
      v32 = 1.0 / v31;

      if (vabdd_f64(v29, v20) <= v32 || v29 < v20)
      {
        if (a3 <= a4)
          v7 = 0.0;
        else
          v7 = 1.0;
      }
      else if (vabdd_f64(v29, v24) > v32 && v29 <= v24)
      {
        v35 = v29 - v20;
        v7 = 0.0;
        if (v35 != 0.0)
        {
          v36 = v35 / (v24 - v20);
          if (a3 > a4)
            v7 = 1.0 - v36;
          else
            v7 = v36;
        }
      }
      else if (a3 > a4)
      {
        v7 = 0.0;
      }
      else
      {
        v7 = 1.0;
      }

    }
  }
  return v7;
}

- (double)transitionProgressToAscendingLayoutFromLayout:(unint64_t)a3
{
  double result;

  -[CardPresentationController transitionProgressFromLayout:toLayout:](self, "transitionProgressFromLayout:toLayout:");
  return result;
}

- (unint64_t)edgeAttachedRegularHeightDimmingBehavior
{
  return self->_edgeAttachedRegularHeightDimmingBehavior;
}

- (void)setEdgeAttachedRegularHeightDimmingBehavior:(unint64_t)a3
{
  self->_edgeAttachedRegularHeightDimmingBehavior = a3;
}

- (BOOL)isFirstCard
{
  return self->_firstCard;
}

- (void)setFirstCard:(BOOL)a3
{
  self->_firstCard = a3;
}

- (unint64_t)defaultContaineeLayout
{
  return self->_defaultContaineeLayout;
}

- (void)setDefaultContaineeLayout:(unint64_t)a3
{
  self->_defaultContaineeLayout = a3;
}

- (BOOL)alwaysUseDefaultContaineeLayout
{
  return self->_alwaysUseDefaultContaineeLayout;
}

- (void)setAlwaysUseDefaultContaineeLayout:(BOOL)a3
{
  self->_alwaysUseDefaultContaineeLayout = a3;
}

- (BOOL)hidesContentInSmallLayout
{
  return self->_hideContentInSmallLayout;
}

- (void)setHideContentInSmallLayout:(BOOL)a3
{
  self->_hideContentInSmallLayout = a3;
}

- (double)headerTransitionHeight
{
  return self->_headerTransitionHeight;
}

- (void)setHeaderTransitionHeight:(double)a3
{
  self->_headerTransitionHeight = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)blurInCardView
{
  return self->_blurInCardView;
}

- (void)setBlurInCardView:(BOOL)a3
{
  self->_blurInCardView = a3;
}

- (UIColor)cardColor
{
  return self->_cardColor;
}

- (void)setCardColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)allowsSwipeToDismiss
{
  return self->_allowsSwipeToDismiss;
}

- (void)setAllowsSwipeToDismiss:(BOOL)a3
{
  self->_allowsSwipeToDismiss = a3;
}

- (BOOL)presentedModally
{
  return self->_presentedModally;
}

- (BOOL)hideGrabber
{
  return self->_hideGrabber;
}

- (BOOL)grabberBlurEnabled
{
  return self->_grabberBlurEnabled;
}

- (void)setGrabberBlurEnabled:(BOOL)a3
{
  self->_grabberBlurEnabled = a3;
}

- (BOOL)takesAvailableHeight
{
  return self->_takesAvailableHeight;
}

- (void)setTakesAvailableHeight:(BOOL)a3
{
  self->_takesAvailableHeight = a3;
}

- (BOOL)takesAvailableWidth
{
  return self->_takesAvailableWidth;
}

- (void)setTakesAvailableWidth:(BOOL)a3
{
  self->_takesAvailableWidth = a3;
}

- (BOOL)allowResizeInFloatingStyle
{
  return self->_allowResizeInFloatingStyle;
}

- (void)setAllowResizeInFloatingStyle:(BOOL)a3
{
  self->_allowResizeInFloatingStyle = a3;
}

- (BOOL)shouldHidePreviousCards
{
  return self->_shouldHidePreviousCards;
}

- (void)setShouldHidePreviousCards:(BOOL)a3
{
  self->_shouldHidePreviousCards = a3;
}

- (BOOL)wantsFullscreen
{
  return self->_wantsFullscreen;
}

- (void)setWantsFullscreen:(BOOL)a3
{
  self->_wantsFullscreen = a3;
}

- (BOOL)useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls
{
  return self->_useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls;
}

- (void)setUseDefaultLayoutWhenCalculatingBottomInsetForFloatingControls:(BOOL)a3
{
  self->_useDefaultLayoutWhenCalculatingBottomInsetForFloatingControls = a3;
}

- (BOOL)usingSheetPresentation
{
  return self->_usingSheetPresentation;
}

- (void)setUsingSheetPresentation:(BOOL)a3
{
  self->_usingSheetPresentation = a3;
}

- (void)setCardHeight:(double)a3
{
  self->_cardHeight = a3;
}

- (ContaineeProtocol)viewController
{
  return (ContaineeProtocol *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (CardView)cardView
{
  return (CardView *)objc_loadWeakRetained((id *)&self->_cardView);
}

- (void)setCardView:(id)a3
{
  objc_storeWeak((id *)&self->_cardView, a3);
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_cardView);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_cardColor, 0);
}

@end
