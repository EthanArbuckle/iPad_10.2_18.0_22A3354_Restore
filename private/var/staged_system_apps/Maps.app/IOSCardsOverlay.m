@implementation IOSCardsOverlay

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

- (BOOL)supportsEmptyStack
{
  return 1;
}

- (void)setChromeHidden:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v5 = -[ContainerViewController chromeHidden](self, "chromeHidden");
  v9.receiver = self;
  v9.super_class = (Class)IOSCardsOverlay;
  -[ContainerViewController setChromeHidden:](&v9, "setChromeHidden:", v3);
  if (v5 != v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
    v7 = v3 ^ 1;
    objc_msgSend(v6, "setViewportConstraintsEnabled:forOverlay:", v7, self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
    objc_msgSend(v8, "setMapInsetsConstraintsEnabled:forOverlay:", v7, self);

  }
}

- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100C3005C;
  v12[3] = &unk_1011AE988;
  objc_copyWeak(&v14, &location);
  v10 = v9;
  v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)IOSCardsOverlay;
  -[ContainerViewController setControllerStack:animated:completion:](&v11, "setControllerStack:animated:completion:", v8, v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)updateMapEdgeInsets
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  objc_super v47;

  v3 = objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay viewIfLoaded](self, "viewIfLoaded"));
  if (!v3)
    return;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v6)
    return;
  v7 = objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
  if (!v7)
    goto LABEL_19;
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (!v9)
  {
    v10 = -[ContainerViewController containeeLayout](self, "containeeLayout");

    if (v10)
      goto LABEL_7;
LABEL_19:
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
    objc_msgSend(v44, "setViewportConstraintsEnabled:forOverlay:", 0, self);

    v46 = (id)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
    objc_msgSend(v46, "setMapInsetsConstraintsEnabled:forOverlay:", 0, self);

    return;
  }

LABEL_7:
  v47.receiver = self;
  v47.super_class = (Class)IOSCardsOverlay;
  -[ContainerViewController _calculateMapEdgeInsets](&v47, "_calculateMapEdgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_overlayMapInsetsConstraints, "topConstraint"));
  objc_msgSend(v19, "constant");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_overlayMapInsetsConstraints, "leadingConstraint"));
  objc_msgSend(v22, "constant");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_overlayMapInsetsConstraints, "bottomConstraint"));
  objc_msgSend(v25, "constant");
  v45 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_overlayMapInsetsConstraints, "trailingConstraint"));
  objc_msgSend(v27, "constant");
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
  v31 = objc_msgSend(v30, "effectiveUserInterfaceLayoutDirection");

  if (v31 == (id)1)
    v32 = v18;
  else
    v32 = v14;
  if (v31 != (id)1)
    v14 = v18;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_overlayViewportConstraints, "topConstraint"));
  objc_msgSend(v33, "setConstant:", v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_overlayMapInsetsConstraints, "topConstraint"));
  objc_msgSend(v34, "setConstant:", v12);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_overlayViewportConstraints, "leadingConstraint"));
  objc_msgSend(v35, "setConstant:", v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_overlayMapInsetsConstraints, "leadingConstraint"));
  objc_msgSend(v36, "setConstant:", v32);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_overlayViewportConstraints, "bottomConstraint"));
  objc_msgSend(v37, "setConstant:", -v16);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_overlayMapInsetsConstraints, "bottomConstraint"));
  objc_msgSend(v38, "setConstant:", -v16);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_overlayViewportConstraints, "trailingConstraint"));
  objc_msgSend(v39, "setConstant:", -v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_overlayMapInsetsConstraints, "trailingConstraint"));
  objc_msgSend(v40, "setConstant:", -v14);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
  objc_msgSend(v41, "setViewportConstraintsEnabled:forOverlay:", -[ContainerViewController chromeHidden](self, "chromeHidden") ^ 1, self);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
  objc_msgSend(v42, "setMapInsetsConstraintsEnabled:forOverlay:", -[ContainerViewController chromeHidden](self, "chromeHidden") ^ 1, self);

  if (!-[ContainerViewController chromeHidden](self, "chromeHidden")
    && (v32 != v24 || v12 != v21 || v14 != v29 || v16 != *(double *)&v45))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay host](self, "host"));
    objc_msgSend(v43, "overlayDidUpdateExistingMapInsetConstraints:", self);

  }
}

- (void)setHost:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  MapsEdgeConstraints *overlayViewportConstraints;
  MapsEdgeConstraints *overlayMapInsetsConstraints;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_host);

    if (v6)
    {
      overlayViewportConstraints = self->_overlayViewportConstraints;
      self->_overlayViewportConstraints = 0;

      overlayMapInsetsConstraints = self->_overlayMapInsetsConstraints;
      self->_overlayMapInsetsConstraints = 0;

      -[IOSCardsOverlay willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
      objc_msgSend(v9, "removeFromSuperview");

      -[IOSCardsOverlay removeFromParentViewController](self, "removeFromParentViewController");
    }
    objc_storeWeak((id *)&self->_host, obj);
    v5 = obj;
    if (obj)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "overlayContentView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "containingViewController"));
      v12 = sub_1002A8AA0(v10);
      v13 = v12 == 5;
      -[ContainerViewController setStackOnOppositeSide:](self, "setStackOnOppositeSide:", v13);
      -[ContainerViewController macSetEnableExtendedPresentationStyles:](self, "macSetEnableExtendedPresentationStyles:", v13);
      objc_msgSend(v11, "addChildViewController:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
      objc_msgSend(v10, "addSubview:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
      v18 = v16;
      if (v12 == 5)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "contentLayoutGuide"));
        LODWORD(v20) = 1148846080;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v19, v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

      }
      else
      {
        LODWORD(v17) = 1148846080;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_constraintsEqualToEdgesOfView:priority:", v10, v17));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);
      }

      -[PassThroughViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", v11);
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.OverlayVC"), v25));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSCardsOverlay view](self, "view"));
      objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

      v28 = (objc_class *)objc_opt_class(self);
      v29 = NSStringFromClass(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.OverlayVC.OverlayView"), v30));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
      objc_msgSend(v32, "setAccessibilityIdentifier:", v31);

      -[IOSCardsOverlay _refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle](self, "_refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle");
      v5 = obj;
    }
  }

}

- (void)_refreshViewportAndMapInsetConstraintsForCurrentLayoutStyle
{
  ChromeOverlayHosting **p_host;
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapsEdgeConstraints *v16;
  MapsEdgeConstraints *overlayViewportConstraints;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  IOSCardsOverlay *v31;
  uint64_t v32;
  MapsEdgeConstraints *overlayMapInsetsConstraints;
  IOSCardsOverlay *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  MapsEdgeConstraints *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  IOSCardsOverlay *v78;
  id v79;

  p_host = &self->_host;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained)
  {
    v79 = objc_loadWeakRetained((id *)p_host);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "overlayContentView"));
    v6 = -[ContainerViewController containerStyle](self, "containerStyle");
    v78 = self;
    v74 = v5;
    if (v6 <= 7 && ((1 << v6) & 0xA3) != 0
      || (v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController")),
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "cardPresentationController")),
          v39 = objc_msgSend(v38, "takesAvailableWidth"),
          v38,
          v37,
          (v39 & 1) != 0))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:", v68));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v59));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
      v9 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
      v16 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v7, v8, v11, v15));
      overlayViewportConstraints = self->_overlayViewportConstraints;
      self->_overlayViewportConstraints = v16;

      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v69 = v18;
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v66));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
      v60 = v20;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v57));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28));
      v76 = (void *)v19;
      v30 = (void *)v19;
      v31 = v78;
    }
    else
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:", v70));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:", v61));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
      v43 = v5;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v44));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "viewportLayoutGuide"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v48));
      v50 = objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v40, v41, v45, v49));
      v51 = v78->_overlayViewportConstraints;
      v78->_overlayViewportConstraints = (MapsEdgeConstraints *)v50;

      v31 = v78;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
      v69 = v52;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:", v66));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
      v60 = v53;
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v57));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "mapInsetsLayoutGuide"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28));
      v30 = v76;
    }
    v32 = objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v30, v21, v25, v29, v21));
    overlayMapInsetsConstraints = v31->_overlayMapInsetsConstraints;
    v31->_overlayMapInsetsConstraints = (MapsEdgeConstraints *)v32;

    v34 = v31;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](v31->_overlayViewportConstraints, "allConstraints"));
    objc_msgSend(v79, "setViewportConstraints:forOverlay:", v35, v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](v34->_overlayMapInsetsConstraints, "allConstraints"));
    objc_msgSend(v79, "setMapInsetsConstraints:forOverlay:", v36, v34);

    objc_msgSend(v79, "setViewportConstraintsEnabled:forOverlay:", 0, v34);
    objc_msgSend(v79, "setMapInsetsConstraintsEnabled:forOverlay:", 0, v34);

  }
}

- (void)setHidden:(BOOL)a3
{
  -[IOSCardsOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];
  BOOL v6;

  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    v4 = 0.2;
    if (!a4)
      v4 = 0.0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100C30FB0;
    v5[3] = &unk_1011ACE58;
    v5[4] = self;
    v6 = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, v4);
  }
}

- (id)passThroughView
{
  return 0;
}

- (double)statusBarHeight
{
  uint64_t v3;
  double result;
  objc_super v5;

  v3 = sub_1002A8AA0(self);
  result = 0.0;
  if (v3 != 5)
  {
    v5.receiver = self;
    v5.super_class = (Class)IOSCardsOverlay;
    -[ContainerViewController statusBarHeight](&v5, "statusBarHeight", 0.0);
  }
  return result;
}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_overlayMapInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_overlayViewportConstraints, 0);
}

@end
