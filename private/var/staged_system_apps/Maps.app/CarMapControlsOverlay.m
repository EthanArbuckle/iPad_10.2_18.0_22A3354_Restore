@implementation CarMapControlsOverlay

- (void)dealloc
{
  objc_super v3;

  -[CarMapControlsOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CarMapControlsOverlay;
  -[CarMapControlsOverlay dealloc](&v3, "dealloc");
}

- (void)setConfiguration:(id *)a3
{
  __int128 v5;

  if (a3->var0 != self->_configuration.topElement
    || a3->var1 != self->_configuration.centerElement
    || a3->var2 != self->_configuration.bottomElement)
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_configuration.bottomElement = a3->var2;
    *(_OWORD *)&self->_configuration.topElement = v5;
    -[CarMapControlsOverlay reload](self, "reload");
  }
}

- (void)setConfiguration:(id *)a3 withAnimation:(id)a4
{
  id v6;
  void *v7;
  BOOL v10;
  BOOL v11;
  __int128 v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;
  BOOL v17;
  char v18;
  _QWORD v19[5];
  BOOL v20;
  BOOL v21;
  _QWORD v22[5];
  __int128 v23;
  unint64_t var2;

  v6 = a4;
  v7 = v6;
  if (a3->var0 != self->_configuration.topElement
    || a3->var1 != self->_configuration.centerElement
    || a3->var2 != self->_configuration.bottomElement)
  {
    if ((objc_msgSend(v6, "isAnimated") & 1) != 0)
    {
      v10 = *(_OWORD *)&self->_configuration.topElement == 0 && self->_configuration.bottomElement == 0;
      v11 = *(_OWORD *)&a3->var0 == 0 && a3->var2 == 0;
      v12 = *(_OWORD *)&a3->var0;
      self->_configuration.bottomElement = a3->var2;
      *(_OWORD *)&self->_configuration.topElement = v12;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1006E36CC;
      v19[3] = &unk_1011BF3D8;
      v20 = v10;
      v21 = v11;
      v19[4] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1006E36E8;
      v15[3] = &unk_1011BEF68;
      v16 = v10;
      v17 = v11;
      v15[4] = self;
      v18 = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1006E3774;
      v13[3] = &unk_1011AF4D8;
      v14 = v11;
      v13[4] = self;
      objc_msgSend(v7, "addPreparation:animations:completion:", v19, v15, v13);
    }
    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1006E3694;
      v22[3] = &unk_1011B2488;
      v22[4] = self;
      v23 = *(_OWORD *)&a3->var0;
      var2 = a3->var2;
      objc_msgSend(v7, "addPreparation:", v22);
    }
  }

}

- (CarCameraToggleButton)cameraToggleButton
{
  CarCameraToggleButton *cameraToggleButton;
  CarCameraToggleButton *v4;
  CarCameraToggleButton *v5;
  double v6;
  double v7;

  cameraToggleButton = self->_cameraToggleButton;
  if (!cameraToggleButton)
  {
    v4 = -[CarCameraToggleButton initWithFrame:]([CarCameraToggleButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_cameraToggleButton;
    self->_cameraToggleButton = v4;

    -[CarCameraToggleButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cameraToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[CarCameraToggleButton setContentCompressionResistancePriority:forAxis:](self->_cameraToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[CarCameraToggleButton setContentHuggingPriority:forAxis:](self->_cameraToggleButton, "setContentHuggingPriority:forAxis:", 1, v7);
    -[CarCameraToggleButton addTarget:action:forControlEvents:](self->_cameraToggleButton, "addTarget:action:forControlEvents:", self, "_cameraToggleButtonPressed", 64);
    cameraToggleButton = self->_cameraToggleButton;
  }
  return cameraToggleButton;
}

- (CarAudioControlView)audioControlView
{
  CarAudioControlView *audioControlView;
  CarAudioControlView *v4;
  CarAudioControlView *v5;
  double v6;
  double v7;
  double v8;

  audioControlView = self->_audioControlView;
  if (!audioControlView)
  {
    v4 = -[NavAudioControlView initWithDelegate:]([CarAudioControlView alloc], "initWithDelegate:", self);
    v5 = self->_audioControlView;
    self->_audioControlView = v4;

    -[NavAudioControlView setAvailableAudioTypes:](self->_audioControlView, "setAvailableAudioTypes:", &off_101273AE8);
    -[CarAudioControlView setTranslatesAutoresizingMaskIntoConstraints:](self->_audioControlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[CarAudioControlView setContentCompressionResistancePriority:forAxis:](self->_audioControlView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[CarAudioControlView setContentHuggingPriority:forAxis:](self->_audioControlView, "setContentHuggingPriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[CarAudioControlView setContentHuggingPriority:forAxis:](self->_audioControlView, "setContentHuggingPriority:forAxis:", 0, v8);
    -[CarAudioControlView _setTouchInsets:](self->_audioControlView, "_setTouchInsets:", -8.5, -8.5, -8.5, -8.5);
    audioControlView = self->_audioControlView;
  }
  return audioControlView;
}

- (CarFloatingControlsButtonView)floatingControls
{
  CarFloatingControlsButtonView *floatingControls;
  CarFloatingControlsButtonView *v4;
  CarFloatingControlsButtonView *v5;
  CarFloatingControlsButtonView *v6;
  void *v7;

  floatingControls = self->_floatingControls;
  if (!floatingControls)
  {
    v4 = -[CarFloatingControlsButtonView initWithFrame:]([CarFloatingControlsButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_floatingControls;
    self->_floatingControls = v4;

    -[CarFloatingControlsButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_floatingControls, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarFloatingControlsButtonView setDelegate:](self->_floatingControls, "setDelegate:", self);
    v6 = self->_floatingControls;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay trackingController](self, "trackingController"));
    -[CarFloatingControlsButtonView setTrackingController:](v6, "setTrackingController:", v7);

    -[CarFloatingControlsButtonView setEnableTrackingButton:](self->_floatingControls, "setEnableTrackingButton:", -[CarMapControlsOverlay trackingButtonEnabled](self, "trackingButtonEnabled"));
    -[CarFloatingControlsButtonView setEnable3DButton:](self->_floatingControls, "setEnable3DButton:", -[CarMapControlsOverlay mode3DEnabled](self, "mode3DEnabled"));
    -[CarFloatingControlsButtonView set3DButtonState:](self->_floatingControls, "set3DButtonState:", -[CarMapControlsOverlay mode3DState](self, "mode3DState"));
    floatingControls = self->_floatingControls;
  }
  return floatingControls;
}

- (CarFocusableImageButton)reportIncidentButton
{
  CarFocusableImageButton *reportIncidentButton;
  CarFocusableImageButton *v4;
  void *v5;
  CarFocusableImageButton *v6;
  CarFocusableImageButton *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  reportIncidentButton = self->_reportIncidentButton;
  if (!reportIncidentButton)
  {
    v4 = [CarFocusableImageButton alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("exclamationmark.bubble.fill"), UIFontTextStyleSubheadline));
    v6 = -[CarFocusableImageButton initWithImage:](v4, "initWithImage:", v5);
    v7 = self->_reportIncidentButton;
    self->_reportIncidentButton = v6;

    -[CarFocusableImageButton setAccessibilityIdentifier:](self->_reportIncidentButton, "setAccessibilityIdentifier:", CFSTR("ReportIncidentButton"));
    -[CarFocusableImageButton setTranslatesAutoresizingMaskIntoConstraints:](self->_reportIncidentButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v8) = 1132068864;
    -[CarFocusableImageButton setContentCompressionResistancePriority:forAxis:](self->_reportIncidentButton, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    -[CarFocusableImageButton addTarget:action:forControlEvents:](self->_reportIncidentButton, "addTarget:action:forControlEvents:", self, "_reportIncidentButtonPressed", 64);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CarPlay_Report_Incident"), CFSTR("localized string not found"), 0));
    v15[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CarPlay_Exclamation"), CFSTR("localized string not found"), 0));
    v15[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    -[CarFocusableImageButton setAccessibilityUserInputLabels:](self->_reportIncidentButton, "setAccessibilityUserInputLabels:", v13);

    reportIncidentButton = self->_reportIncidentButton;
  }
  return reportIncidentButton;
}

- (CarFocusableImageButton)recenterButton
{
  CarFocusableImageButton *recenterButton;
  CarFocusableImageButton *v4;
  void *v5;
  CarFocusableImageButton *v6;
  CarFocusableImageButton *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  recenterButton = self->_recenterButton;
  if (!recenterButton)
  {
    v4 = [CarFocusableImageButton alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("location"), UIFontTextStyleSubheadline));
    v6 = -[CarFocusableImageButton initWithImage:](v4, "initWithImage:", v5);
    v7 = self->_recenterButton;
    self->_recenterButton = v6;

    -[CarFocusableImageButton setAccessibilityIdentifier:](self->_recenterButton, "setAccessibilityIdentifier:", CFSTR("RecenterButton"));
    -[CarFocusableImageButton setTranslatesAutoresizingMaskIntoConstraints:](self->_recenterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarFocusableImageButton addTarget:action:forControlEvents:](self->_recenterButton, "addTarget:action:forControlEvents:", self, "_navRecenterButtonPressed", 64);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CarPlay_Recenter"), CFSTR("localized string not found"), 0));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[CarFocusableImageButton setAccessibilityUserInputLabels:](self->_recenterButton, "setAccessibilityUserInputLabels:", v10);

    recenterButton = self->_recenterButton;
  }
  return recenterButton;
}

- (CarZoomButtonView)zoomControls
{
  CarZoomButtonView *zoomControls;
  CarZoomButtonView *v4;
  CarZoomButtonView *v5;
  double v6;
  double v7;

  zoomControls = self->_zoomControls;
  if (!zoomControls)
  {
    v4 = -[CarZoomButtonView initWithVisiblePanButton:]([CarZoomButtonView alloc], "initWithVisiblePanButton:", 1);
    v5 = self->_zoomControls;
    self->_zoomControls = v4;

    -[CarZoomButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_zoomControls, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarZoomButtonView setDelegate:](self->_zoomControls, "setDelegate:", self);
    LODWORD(v6) = 1132068864;
    -[CarZoomButtonView setContentHuggingPriority:forAxis:](self->_zoomControls, "setContentHuggingPriority:forAxis:", 1, v6);
    LODWORD(v7) = 1132068864;
    -[CarZoomButtonView setContentCompressionResistancePriority:forAxis:](self->_zoomControls, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[CarZoomButtonView setZoomInEnabled:](self->_zoomControls, "setZoomInEnabled:", -[CarMapControlsOverlay zoomInEnabled](self, "zoomInEnabled"));
    -[CarZoomButtonView setZoomOutEnabled:](self->_zoomControls, "setZoomOutEnabled:", -[CarMapControlsOverlay zoomOutEnabled](self, "zoomOutEnabled"));
    zoomControls = self->_zoomControls;
  }
  return zoomControls;
}

- (void)setTrackingButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_trackingButtonEnabled != a3)
  {
    v3 = a3;
    self->_trackingButtonEnabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay floatingControls](self, "floatingControls"));
    objc_msgSend(v4, "setEnableTrackingButton:", v3);

  }
}

- (void)setMode3DEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_mode3DEnabled != a3)
  {
    v3 = a3;
    self->_mode3DEnabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay floatingControls](self, "floatingControls"));
    objc_msgSend(v4, "setEnable3DButton:", v3);

  }
}

- (void)setMode3DState:(unint64_t)a3
{
  id v4;

  if (self->_mode3DState != a3)
  {
    self->_mode3DState = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay floatingControls](self, "floatingControls"));
    objc_msgSend(v4, "set3DButtonState:", a3);

  }
}

- (unint64_t)cameraToggleButtonState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
  v3 = objc_msgSend(v2, "buttonState");

  return (unint64_t)v3;
}

- (void)setCameraToggleButtonState:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
  objc_msgSend(v4, "setButtonState:", a3);

}

- (void)setTrackingController:(id)a3
{
  CarMapTrackingController *v5;
  void *v6;
  CarMapTrackingController *v7;

  v5 = (CarMapTrackingController *)a3;
  if (self->_trackingController != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_trackingController, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay floatingControls](self, "floatingControls"));
    objc_msgSend(v6, "setTrackingController:", self->_trackingController);

    v5 = v7;
  }

}

- (void)setZoomInEnabled:(BOOL)a3
{
  id v4;

  if (self->_zoomInEnabled != a3)
  {
    self->_zoomInEnabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay zoomControls](self, "zoomControls"));
    objc_msgSend(v4, "setZoomInEnabled:", self->_zoomInEnabled);

  }
}

- (void)setZoomOutEnabled:(BOOL)a3
{
  id v4;

  if (self->_zoomOutEnabled != a3)
  {
    self->_zoomOutEnabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay zoomControls](self, "zoomControls"));
    objc_msgSend(v4, "setZoomOutEnabled:", self->_zoomOutEnabled);

  }
}

- (void)setAudioSettings:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
  v6 = objc_msgSend(v5, "currentAudioType");

  if (v6 != (id)a3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
    objc_msgSend(v7, "setCurrentAudioType:", a3);

  }
}

- (unint64_t)audioSettings
{
  return -[NavAudioControlView currentAudioType](self->_audioControlView, "currentAudioType");
}

- (id)_viewForElement:(unint64_t)a3
{
  uint64_t v4;
  CarMapControlsAutohidingContainerView *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
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
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  _QWORD v44[7];

  switch(a3)
  {
    case 1uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay floatingControls](self, "floatingControls"));
      goto LABEL_10;
    case 2uLL:
      v5 = objc_opt_new(CarMapControlsAutohidingContainerView);
      -[CarMapControlsAutohidingContainerView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
      -[CarMapControlsAutohidingContainerView addSubview:](v5, "addSubview:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
      -[CarMapControlsAutohidingContainerView addSubview:](v5, "addSubview:", v7);

      LODWORD(v8) = 1148846080;
      -[CarMapControlsAutohidingContainerView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v8);
      LODWORD(v9) = 1148846080;
      -[CarMapControlsAutohidingContainerView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v9);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView topAnchor](v5, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
      v44[0] = v40;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView leadingAnchor](v5, "leadingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
      v44[1] = v36;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView trailingAnchor](v5, "trailingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v44[2] = v32;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay cameraToggleButton](self, "cameraToggleButton"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 8.5));
      v44[3] = v27;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView leadingAnchor](v5, "leadingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
      v44[4] = v23;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView trailingAnchor](v5, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v44[5] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlView](self, "audioControlView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView bottomAnchor](v5, "bottomAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v44[6] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 7));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

      return v5;
    case 3uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay reportIncidentButton](self, "reportIncidentButton"));
      goto LABEL_10;
    case 4uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay zoomControls](self, "zoomControls"));
      v20 = v19;
      v21 = 0;
      goto LABEL_8;
    case 5uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay zoomControls](self, "zoomControls"));
      v20 = v19;
      v21 = 1;
LABEL_8:
      objc_msgSend(v19, "setPanButtonVisible:", v21);

      v4 = objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay zoomControls](self, "zoomControls"));
      goto LABEL_10;
    case 6uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay recenterButton](self, "recenterButton"));
LABEL_10:
      v5 = (CarMapControlsAutohidingContainerView *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)_configureContainer:(id)a3 withElement:(unint64_t)a4 preferredEdgeLocation:(unint64_t)a5 priority:(float)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  _QWORD *v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _BYTE v45[128];

  v10 = a3;
  v11 = v10;
  if (a5 == 1 || a5 == 4)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subviews"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v16), "removeFromSuperview");
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "invalidateIntrinsicContentSize");
    v17 = objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay _viewForElement:](self, "_viewForElement:", a4));
    if (v17)
    {
      objc_msgSend(v11, "addSubview:", v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject leadingAnchor](v17, "leadingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
      v44[0] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject trailingAnchor](v17, "trailingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
      v44[1] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject topAnchor](v17, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
      if (a5 == 1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
        v43[0] = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v17, "bottomAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        *(float *)&v31 = a6;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:constant:priority:", v30, 0.0, v31));
        v43[1] = v32;
        v33 = v43;
      }
      else
      {
        *(float *)&v27 = a6;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v26, 0.0, v27));
        v42[0] = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v17, "bottomAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
        v42[1] = v32;
        v33 = v42;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
      objc_msgSend(v36, "addObjectsFromArray:", v35);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);
    }
  }
  else
  {
    v34 = sub_10043364C();
    v17 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Unsupported edge location.", buf, 2u);
    }
  }

}

- (void)reload
{
  double v2;
  double v4;
  double v5;
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  if (self->_mapControlsStackView)
  {
    LODWORD(v2) = 1148846080;
    -[CarMapControlsOverlay _configureContainer:withElement:preferredEdgeLocation:priority:](self, "_configureContainer:withElement:preferredEdgeLocation:priority:", self->_topContainerView, self->_configuration.topElement, 1, v2);
    LODWORD(v4) = 1148846080;
    -[CarMapControlsOverlay _configureContainer:withElement:preferredEdgeLocation:priority:](self, "_configureContainer:withElement:preferredEdgeLocation:priority:", self->_centerContainerView, self->_configuration.centerElement, 1, v4);
    LODWORD(v5) = 1144750080;
    -[CarMapControlsOverlay _configureContainer:withElement:preferredEdgeLocation:priority:](self, "_configureContainer:withElement:preferredEdgeLocation:priority:", self->_bottomContainerView, self->_configuration.bottomElement, 4, v5);
    -[NSLayoutConstraint setActive:](self->_stackViewTopConstraint, "setActive:", self->_configuration.topElement != 0);
    if (-[CarMapControlsOverlay isHidden](self, "isHidden"))
      v6 = 0;
    else
      v6 = *(_OWORD *)&self->_configuration.topElement != 0 || self->_configuration.bottomElement != 0;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay host](self, "host"));
    objc_msgSend(v9, "setCollisionConstraintsEnabled:forOverlay:", v6, self);

  }
  else
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will not reload map controls, overlay is not active", buf, 2u);
    }

  }
}

- (BOOL)isHidden
{
  double v2;

  -[UIStackView alpha](self->_mapControlsStackView, "alpha");
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
  -[CarMapControlsOverlay setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  CarMapControlsOverlay *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  int v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD v24[6];
  BOOL v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;

  if (!self->_mapControlsStackView)
    return;
  v4 = a3;
  if (!a4)
    goto LABEL_12;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      v15 = 0;
      goto LABEL_14;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running map controls update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  v15 = 1;
LABEL_14:
  if (v4)
    v16 = 0.0;
  else
    v16 = 1.0;
  -[UIStackView alpha](self->_mapControlsStackView, "alpha");
  if (v16 != v17)
  {
    v18 = sub_10043364C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      if (v4)
        v20 = "hide";
      else
        v20 = "show";
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_mapControlsStackView, "arrangedSubviews"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count")));
      *(_DWORD *)buf = 136315394;
      v27 = v20;
      v28 = 2112;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Will %s map control view using alpha (controls: %@)", buf, 0x16u);

    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1006E4D80;
    v24[3] = &unk_1011AFB78;
    v24[4] = self;
    *(double *)&v24[5] = v16;
    v25 = v4;
    v23 = objc_retainBlock(v24);
    if (v15)
    {
      if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
        ((void (*)(_QWORD *))v23[2])(v23);
      else
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v23, 0, 0.1, 0.0);
    }
    else
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
    }

  }
}

- (void)setHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overlayContentView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutGuideForOverlay:", self));
      -[CarMapControlsOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", v6, v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_mapControlsStackView, "_maps_leftRHDAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapInsetsLayoutGuide"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_rightRHDAnchor"));
      LODWORD(v11) = 1148846080;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v10, 1, 0.0, v11));
      v21 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      objc_msgSend(v4, "setMapInsetsConstraints:forOverlay:", v13, self);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_mapControlsStackView, "_maps_leftRHDAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewportLayoutGuide"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_rightRHDAnchor"));
      LODWORD(v17) = 1148846080;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v16, 1, 0.0, v17));
      v20 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      objc_msgSend(v4, "setViewportConstraints:forOverlay:", v19, self);

    }
    else
    {
      -[CarMapControlsOverlay setContentView:layoutGuide:](self, "setContentView:layoutGuide:", 0, 0);
    }
  }

}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6;
  id v7;
  id v8;
  UIStackView *mapControlsStackView;
  id v10;
  NSObject *v11;
  PassThroughStackView *v12;
  UIStackView *v13;
  UIStackView *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *stackViewTopConstraint;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  CarMapControlsAutohidingContainerView *v52;
  CarMapControlsAutohidingContainerView *topContainerView;
  double v54;
  CarMapControlsAutohidingContainerView *v55;
  CarMapControlsAutohidingContainerView *centerContainerView;
  double v57;
  CarMapControlsAutohidingContainerView *v58;
  CarMapControlsAutohidingContainerView *bottomContainerView;
  double v60;
  UIStackView *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  CarMapControlsAutohidingContainerView *v67;
  CarMapControlsAutohidingContainerView *v68;
  CarMapControlsAutohidingContainerView *v69;
  CarFloatingControlsButtonView *floatingControls;
  CarZoomButtonView *zoomControls;
  CarCameraToggleButton *cameraToggleButton;
  CarAudioControlView *audioControlView;
  CarFocusableImageButton *recenterButton;
  CarFocusableImageButton *reportIncidentButton;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint8_t buf[8];
  __int128 v82;
  CarMapControlsAutohidingContainerView *v83;
  _QWORD v84[2];
  _QWORD v85[4];
  _QWORD v86[2];

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView superview](self->_mapControlsStackView, "superview"));
  if (v8 != v6)
  {
    -[UIStackView removeFromSuperview](self->_mapControlsStackView, "removeFromSuperview");
    mapControlsStackView = self->_mapControlsStackView;
    self->_mapControlsStackView = 0;

    if (v6)
    {
      v78 = v8;
      v10 = sub_10043364C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will create new map control container view", buf, 2u);
      }

      v12 = -[PassThroughStackView initWithArrangedSubviews:]([PassThroughStackView alloc], "initWithArrangedSubviews:", &__NSArray0__struct);
      v13 = self->_mapControlsStackView;
      self->_mapControlsStackView = &v12->super;

      -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapControlsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIStackView setAxis:](self->_mapControlsStackView, "setAxis:", 1);
      -[UIStackView setAlignment:](self->_mapControlsStackView, "setAlignment:", 3);
      -[UIStackView setDistribution:](self->_mapControlsStackView, "setDistribution:", 3);
      -[UIStackView setSpacing:](self->_mapControlsStackView, "setSpacing:", 8.5);
      -[UIStackView setLayoutMarginsRelativeArrangement:](self->_mapControlsStackView, "setLayoutMarginsRelativeArrangement:", 1);
      -[UIStackView setDirectionalLayoutMargins:](self->_mapControlsStackView, "setDirectionalLayoutMargins:", 8.5, 0.0, 8.5, 0.0);
      -[UIStackView setAlpha:](self->_mapControlsStackView, "setAlpha:", 0.0);
      v14 = self->_mapControlsStackView;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](v14, "heightAnchor"));
      LODWORD(v16) = 1112014848;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:priority:", 0.0, v16));
      v86[0] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](self->_mapControlsStackView, "widthAnchor"));
      -[CarMapControlsOverlay _mapControlGutterWidth](self, "_mapControlGutterWidth");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:"));
      v86[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 2));
      -[UIStackView addConstraints:](v14, "addConstraints:", v20);

      LODWORD(v21) = 1148846080;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_mapControlsStackView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
      LODWORD(v22) = 1148846080;
      -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_mapControlsStackView, "setContentCompressionResistancePriority:forAxis:", 0, v22);
      objc_msgSend(v6, "addSubview:", self->_mapControlsStackView);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_mapControlsStackView, "topAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      LODWORD(v25) = 1148846080;
      v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:priority:", v24, 0.0, v25));
      stackViewTopConstraint = self->_stackViewTopConstraint;
      self->_stackViewTopConstraint = v26;

      v85[0] = self->_stackViewTopConstraint;
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_mapControlsStackView, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:constant:", v28, 0.0));
      v85[1] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_mapControlsStackView, "bottomAnchor"));
      v80 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -0.0));
      v85[2] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_rightRHDAnchor](self->_mapControlsStackView, "_maps_rightRHDAnchor"));
      v79 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "_maps_rightRHDAnchor"));
      LODWORD(v35) = 1148846080;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v34, 0, -0.0, v35));
      v85[3] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      if (objc_msgSend(v38, "rightHandDrive"))
        v39 = 2;
      else
        v39 = 8;

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay host](self, "host"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "collisionGuideForEdge:", v39));

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay host](self, "host"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "collisionGuideForEdge:", 4));

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay host](self, "host"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_mapControlsStackView, "topAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "bottomAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:", v45));
      v84[0] = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_leftRHDAnchor](self->_mapControlsStackView, "_maps_leftRHDAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_maps_rightRHDAnchor"));
      LODWORD(v49) = 1148846080;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v48, 1, 0.0, v49));
      v84[1] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 2));
      objc_msgSend(v43, "setCollisionConstraints:forOverlay:", v51, self);

      v7 = v80;
      v52 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      topContainerView = self->_topContainerView;
      self->_topContainerView = v52;

      -[CarMapControlsAutohidingContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_topContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v54) = 1148846080;
      -[CarMapControlsAutohidingContainerView setContentHuggingPriority:forAxis:](self->_topContainerView, "setContentHuggingPriority:forAxis:", 1, v54);
      v55 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      centerContainerView = self->_centerContainerView;
      self->_centerContainerView = v55;

      -[CarMapControlsAutohidingContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_centerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v57) = 1148846080;
      -[CarMapControlsAutohidingContainerView setContentHuggingPriority:forAxis:](self->_centerContainerView, "setContentHuggingPriority:forAxis:", 1, v57);
      v58 = objc_alloc_init(CarMapControlsAutohidingContainerView);
      bottomContainerView = self->_bottomContainerView;
      self->_bottomContainerView = v58;

      -[CarMapControlsAutohidingContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v60) = 1148846080;
      -[CarMapControlsAutohidingContainerView setContentHuggingPriority:forAxis:](self->_bottomContainerView, "setContentHuggingPriority:forAxis:", 1, v60);
      v61 = self->_mapControlsStackView;
      v82 = *(_OWORD *)&self->_topContainerView;
      v83 = self->_bottomContainerView;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 3));
      -[UIStackView _maps_setArrangedSubviews:](v61, "_maps_setArrangedSubviews:", v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsAutohidingContainerView centerYAnchor](self->_centerContainerView, "centerYAnchor"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "centerYAnchor"));
      LODWORD(v65) = 1144750080;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:priority:", v64, 0.0, v65));
      objc_msgSend(v66, "setActive:", 1);

      v6 = v79;
      -[CarMapControlsOverlay reload](self, "reload");

      v8 = v78;
    }
    else
    {
      v67 = self->_topContainerView;
      self->_topContainerView = 0;

      v68 = self->_centerContainerView;
      self->_centerContainerView = 0;

      v69 = self->_bottomContainerView;
      self->_bottomContainerView = 0;

      floatingControls = self->_floatingControls;
      self->_floatingControls = 0;

      zoomControls = self->_zoomControls;
      self->_zoomControls = 0;

      cameraToggleButton = self->_cameraToggleButton;
      self->_cameraToggleButton = 0;

      audioControlView = self->_audioControlView;
      self->_audioControlView = 0;

      recenterButton = self->_recenterButton;
      self->_recenterButton = 0;

      reportIncidentButton = self->_reportIncidentButton;
      self->_reportIncidentButton = 0;

    }
  }

}

- (double)_mapControlGutterWidth
{
  return 45.0;
}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlDelegate](self, "audioControlDelegate"));
  objc_msgSend(v7, "audioControlView:didSelectAudioType:", v6, a4);

}

- (void)audioControlView:(id)a3 willChangeSizeWithAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  CarMapControlsOverlay *v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlDelegate](self, "audioControlDelegate"));
  v9 = objc_opt_respondsToSelector(v8, "audioControlView:willChangeSizeWithAnimation:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay audioControlDelegate](self, "audioControlDelegate"));
    objc_msgSend(v10, "audioControlView:willChangeSizeWithAnimation:", v6, v7);

  }
  if (objc_msgSend(v6, "isDescendantOfView:", self->_mapControlsStackView))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006E5870;
    v14[3] = &unk_1011AC860;
    v14[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006E587C;
    v11[3] = &unk_1011AC8B0;
    v12 = v6;
    v13 = self;
    objc_msgSend(v7, "addPreparation:animations:completion:", v14, v11, 0);

  }
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  id v4;
  void *v5;
  UIStackView *mapControlsStackView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_mapControlsStackView, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    mapControlsStackView = self->_mapControlsStackView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mapControlsStackView, 1));
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id obj;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  __int128 v38;
  CarMapControlsAutohidingContainerView *bottomContainerView;
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_mapControlsStackView, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSArray *)&__NSArray0__struct;
  v38 = *(_OWORD *)&self->_topContainerView;
  bottomContainerView = self->_bottomContainerView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 3));
  v6 = sub_10039E080(v5, &stru_1011C09B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subviews"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", &stru_1011C0A18));

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v20, "conformsToProtocol:", &OBJC_PROTOCOL___CarFocusOrderCollection))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "focusOrderSubItems"));
                objc_msgSend(v12, "addObjectsFromArray:", v21);

              }
              else
              {
                objc_msgSend(v12, "addObject:", v20);
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
          }
          while (v17);
        }

        v22 = objc_msgSend(v12, "copy");
        objc_msgSend(v28, "addObjectsFromArray:", v22);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v9);
  }

  v23 = sub_10039E080(v28, &stru_1011C09D8);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  return (NSArray *)v24;
}

- (void)_navRecenterButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 1);

}

- (void)_cameraToggleButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 6);

}

- (void)_reportIncidentButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 7);

}

- (void)panButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 2);

}

- (void)zoomInButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 3);

}

- (void)zoomOutButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 4);

}

- (void)mode3DButtonPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarMapControlsOverlay delegate](self, "delegate"));
  objc_msgSend(v3, "carMapControls:didTriggerAction:", self, 5);

}

- (ChromeOverlayHosting)host
{
  return (ChromeOverlayHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (CarMapControlsDelegate)delegate
{
  return (CarMapControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NavAudioControlViewDelegate)audioControlDelegate
{
  return (NavAudioControlViewDelegate *)objc_loadWeakRetained((id *)&self->_audioControlDelegate);
}

- (void)setAudioControlDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioControlDelegate, a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)configuration
{
  *($FA60EBF46223DE135220C488449FC0D5 *)retstr = *($FA60EBF46223DE135220C488449FC0D5 *)&self->var1;
  return self;
}

- (BOOL)zoomInEnabled
{
  return self->_zoomInEnabled;
}

- (BOOL)zoomOutEnabled
{
  return self->_zoomOutEnabled;
}

- (BOOL)trackingButtonEnabled
{
  return self->_trackingButtonEnabled;
}

- (BOOL)mode3DEnabled
{
  return self->_mode3DEnabled;
}

- (unint64_t)mode3DState
{
  return self->_mode3DState;
}

- (CarMapTrackingController)trackingController
{
  return self->_trackingController;
}

- (void)setCameraToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_cameraToggleButton, a3);
}

- (void)setAudioControlView:(id)a3
{
  objc_storeStrong((id *)&self->_audioControlView, a3);
}

- (void)setFloatingControls:(id)a3
{
  objc_storeStrong((id *)&self->_floatingControls, a3);
}

- (void)setReportIncidentButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportIncidentButton, a3);
}

- (void)setRecenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_recenterButton, a3);
}

- (void)setZoomControls:(id)a3
{
  objc_storeStrong((id *)&self->_zoomControls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomControls, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_reportIncidentButton, 0);
  objc_storeStrong((id *)&self->_floatingControls, 0);
  objc_storeStrong((id *)&self->_audioControlView, 0);
  objc_storeStrong((id *)&self->_cameraToggleButton, 0);
  objc_storeStrong((id *)&self->_trackingController, 0);
  objc_destroyWeak((id *)&self->_audioControlDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_stackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_centerContainerView, 0);
  objc_storeStrong((id *)&self->_topContainerView, 0);
  objc_storeStrong((id *)&self->_mapControlsStackView, 0);
}

@end
