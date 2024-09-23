@implementation CRLiOSImageHUDViewController

- (CRLiOSImageHUDViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSImageHUDViewController;
  return -[CRLiOSImageHUDViewController initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
}

- (void)loadView
{
  UIView *v3;
  UIView *backgroundView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  UIButton *v16;
  UIButton *doneButton;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CRLiOSImageHUDSlider *v29;
  CRLiOSImageHUDSlider *slider;
  double v31;
  double v32;
  void *v33;
  double v34;
  id v35;
  id v36;
  UIButton *v37;
  void *v38;
  id v39;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[10];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v6, "setCornerRadius:", 22.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v7, "setCornerCurve:", kCACornerCurveContinuous);

  -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
  objc_msgSend(v8, "crl_applyDefaultCanvasOverlayUIShadowSettings");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Done"), 0, 0));

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v80[0] = NSFontAttributeName;
  v80[1] = NSForegroundColorAttributeName;
  v81[0] = v76;
  v81[1] = v11;
  v74 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 2));
  v13 = v10;
  objc_msgSend(v10, "sizeWithAttributes:", v12);
  self->_doneStringWidth = v14;
  self->_viewSize.width = v14 + 220.0;
  self->_viewSize.height = 44.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v16 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  doneButton = self->_doneButton;
  self->_doneButton = v16;

  v73 = v10;
  v75 = v12;
  v71 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v10, v12);
  v18 = objc_msgSend(v12, "mutableCopy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.5));
  v72 = v18;
  objc_msgSend(v18, "setValue:forKey:", v19, NSForegroundColorAttributeName);

  v20 = objc_alloc((Class)NSAttributedString);
  v21 = objc_msgSend(v18, "copy");
  v70 = objc_msgSend(v20, "initWithString:attributes:", v13, v21);

  -[UIButton setAttributedTitle:forState:](self->_doneButton, "setAttributedTitle:forState:", v71, 0);
  -[UIButton setAttributedTitle:forState:](self->_doneButton, "setAttributedTitle:forState:", v70, 1);
  v69 = v15;
  objc_msgSend(v15, "setCornerStyle:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  -[UIButton setTintColor:](self->_doneButton, "setTintColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v15, "setBaseForegroundColor:", v23);

  -[UIButton setConfiguration:](self->_doneButton, "setConfiguration:", v15);
  -[UIButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, "buttonPressed:", 64);
  LODWORD(v24) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_doneButton, "setContentCompressionResistancePriority:forAxis:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_doneButton, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_backgroundView, "topAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 8.0));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_doneButton, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_backgroundView, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -8.0));

  v29 = objc_alloc_init(CRLiOSImageHUDSlider);
  slider = self->_slider;
  self->_slider = v29;

  -[CRLiOSImageHUDSlider setParentHUDViewController:](self->_slider, "setParentHUDViewController:", self);
  LODWORD(v31) = 0.25;
  -[CRLiOSImageHUDSlider setMinimumValue:](self->_slider, "setMinimumValue:", v31);
  LODWORD(v32) = 3.0;
  -[CRLiOSImageHUDSlider setMaximumValue:](self->_slider, "setMaximumValue:", v32);
  -[CRLiOSImageHUDSlider setExclusiveTouch:](self->_slider, "setExclusiveTouch:", 1);
  -[CRLiOSImageHUDSlider addTarget:action:forControlEvents:](self->_slider, "addTarget:action:forControlEvents:", self, "sliderStart:", 1);
  -[CRLiOSImageHUDSlider addTarget:action:forControlEvents:](self->_slider, "addTarget:action:forControlEvents:", self, "sliderChanged:", 4096);
  -[CRLiOSImageHUDSlider addTarget:action:forControlEvents:](self->_slider, "addTarget:action:forControlEvents:", self, "sliderEnd:", 448);
  -[CRLiOSImageHUDSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider widthAnchor](self->_slider, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToConstant:", 150.0));

  LODWORD(v34) = 1144766464;
  objc_msgSend(v68, "setPriority:", v34);
  objc_msgSend(v68, "setActive:", 1);
  v35 = objc_alloc_init((Class)UIView);
  objc_msgSend(v35, "addSubview:", self->_slider);
  v36 = objc_alloc((Class)UIStackView);
  v37 = self->_doneButton;
  v79[0] = v35;
  v79[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2));
  v39 = objc_msgSend(v36, "initWithArrangedSubviews:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v39, "setBackgroundColor:", v40);

  objc_msgSend(v39, "setSpacing:", 9.0);
  objc_msgSend(v39, "setDistribution:", 2);
  objc_msgSend(v39, "setAlignment:", 0);
  objc_msgSend(v39, "setLayoutMargins:", 0.0, 9.0, 0.0, 9.0);
  objc_msgSend(v39, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_backgroundView, "addSubview:", v39);
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider topAnchor](self->_slider, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v78[0] = v65;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider bottomAnchor](self->_slider, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
  v78[1] = v61;
  v64 = v35;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leftAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider leftAnchor](self->_slider, "leftAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -9.0));
  v78[2] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "rightAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDSlider rightAnchor](self->_slider, "rightAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 9.0));
  v78[3] = v55;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_backgroundView, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v78[4] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_backgroundView, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v78[5] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leftAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_backgroundView, "leftAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
  v78[6] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "rightAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_backgroundView, "rightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v46));
  v78[7] = v47;
  v78[8] = v77;
  v78[9] = v54;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

  -[CRLiOSImageHUDViewController setView:](self, "setView:", self->_backgroundView);
  -[CRLiOSImageHUDViewController p_updateHUDSize](self, "p_updateHUDSize");

}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD v13[3];

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSImageHUDViewController;
  -[CRLiOSImageHUDViewController viewDidLoad](&v12, "viewDidLoad");
  objc_opt_class(UITraitHorizontalSizeClass, v3);
  v13[0] = v4;
  objc_opt_class(UITraitVerticalSizeClass, v5);
  v13[1] = v6;
  *(_QWORD *)&v8 = objc_opt_class(UITraitUserInterfaceStyle, v7).n128_u64[0];
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3, v8));
  v11 = -[CRLiOSImageHUDViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v10, self, "i_observedTraitsDidUpdate");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_ignoringKeyboard)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FE20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05464();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FE40);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 250, 0, "CRLiOSImageHUDViewController still ignoring keyboard on dealloc");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSImageHUDViewController;
  -[CRLiOSImageHUDViewController dealloc](&v6, "dealloc");
}

- (void)setView:(id)a3
{
  id v4;
  CRLiOSImageHUDSlider *slider;
  CRLMaskResizing *maskResizer;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    slider = self->_slider;
    self->_slider = 0;

    maskResizer = self->_maskResizer;
    self->_maskResizer = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDViewController;
  -[CRLiOSImageHUDViewController setView:](&v7, "setView:", v4);

}

- (void)i_observedTraitsDidUpdate
{
  -[CRLiOSImageHUDSlider layoutIfNeeded](self->_slider, "layoutIfNeeded");
  -[CRLiOSImageHUDViewController p_updateHUDAppearance](self, "p_updateHUDAppearance");
}

- (void)buttonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  objc_msgSend(WeakRetained, "endEditingMask");

}

- (void)p_startIgnoringKeyboardIfNeeded
{
  if (!self->_ignoringKeyboard)
    self->_ignoringKeyboard = 1;
}

- (void)p_stopIgnoringKeyboardIfNeeded
{
  if (self->_ignoringKeyboard)
    self->_ignoringKeyboard = 0;
}

- (void)p_suspendCollaborationIfNeeded
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (!self->_didSuspendCollaboration)
  {
    self->_didSuspendCollaboration = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));
    objc_msgSend(v3, "suspendCollaborationWithReason:", CFSTR("CRLImageHUDSliderDrag"));

  }
}

- (void)p_resumeCollaborationIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;

  if (self->_didSuspendCollaboration)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
    objc_msgSend(v5, "resumeCollaborationWithReason:", CFSTR("CRLImageHUDSliderDrag"));

    self->_didSuspendCollaboration = 0;
  }
}

- (void)sliderStart:(id)a3
{
  id WeakRetained;
  CRLMaskResizing *v5;
  CRLMaskResizing *maskResizer;
  CRLMaskResizing *v7;
  id v8;
  double v9;
  id v10;

  -[CRLiOSImageHUDViewController p_startIgnoringKeyboardIfNeeded](self, "p_startIgnoringKeyboardIfNeeded", a3);
  -[CRLiOSImageHUDViewController p_suspendCollaborationIfNeeded](self, "p_suspendCollaborationIfNeeded");
  if (!self->_maskResizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    v5 = (CRLMaskResizing *)objc_msgSend(WeakRetained, "newMaskResizer");
    maskResizer = self->_maskResizer;
    self->_maskResizer = v5;

    v7 = self->_maskResizer;
    v8 = objc_loadWeakRetained((id *)&self->_rep);
    -[CRLMaskResizing beginResizingRep:](v7, "beginResizingRep:", v8);

    v10 = objc_loadWeakRetained((id *)&self->_rep);
    objc_msgSend(v10, "maskScale");
    self->_lastValue = v9;

  }
}

- (void)sliderChanged:(id)a3
{
  CRLMaskResizing *maskResizer;
  float v5;
  float v6;

  maskResizer = self->_maskResizer;
  if (maskResizer)
  {
    -[CRLiOSImageHUDSlider value](self->_slider, "value", a3);
    -[CRLMaskResizing updateResizeToScale:](maskResizer, "updateResizeToScale:", v5);
    -[CRLiOSImageHUDSlider value](self->_slider, "value");
    self->_lastValue = v6;
  }
}

- (void)sliderEnd:(id)a3
{
  CRLMaskResizing *maskResizer;
  CRLMaskResizing *v5;

  maskResizer = self->_maskResizer;
  if (maskResizer)
  {
    -[CRLMaskResizing endResizingRepAtScale:](maskResizer, "endResizingRepAtScale:", a3, self->_lastValue);
    self->_animateNextTransition = 1;
    v5 = self->_maskResizer;
    self->_maskResizer = 0;

  }
  -[CRLiOSImageHUDViewController p_stopIgnoringKeyboardIfNeeded](self, "p_stopIgnoringKeyboardIfNeeded", a3);
  -[CRLiOSImageHUDViewController p_resumeCollaborationIfNeeded](self, "p_resumeCollaborationIfNeeded");
}

- (void)updateControlsForRep:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  CRLiOSImageHUDViewController *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v7 = objc_loadWeakRetained((id *)&self->_rep);
  if (v7 == v4 && !self->_maskResizer)
  {
    v8 = objc_msgSend(v6, "isInDynamicOperation");

    if ((v8 & 1) == 0)
    {
      v23 = 0;
      v22 = 0;
      objc_msgSend(v4, "maskScaleLimitsReturningMin:max:", &v23, &v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskScaleDetents"));
      v10 = 0;
      if (objc_msgSend(v4, "isMaskScaleFromLayout"))
      {
        objc_msgSend(v4, "maskScale");
        v10 = v11;
      }
      v12 = +[NSThread isMainThread](NSThread, "isMainThread");
      v14 = sub_1001A2060;
      v15 = &unk_10123FE68;
      v18 = v23;
      v19 = v22;
      v16 = self;
      v17 = v9;
      v20 = v10;
      v21 = v12;
      if (+[NSThread isMainThread](NSThread, "isMainThread", _NSConcreteStackBlock, 3221225472))
        v14((uint64_t)&v13);
      else
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v13);

    }
  }
  else
  {

  }
}

- (void)showHUDForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIAccessibilityNotifications v16;
  void *v17;
  _QWORD v18[5];

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FE88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05564();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FEA8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController showHUDForRep:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 396, 0, "invalid nil value for '%{public}s'", "rep");

  }
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FEC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E054E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FEE8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController showHUDForRep:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 397, 0, "This operation must only be performed on the main thread.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_rep, v4);
    self->_pinnedToTopOfImage = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
    objc_msgSend(v12, "addDecorator:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasView"));
    objc_msgSend(v13, "setHidden:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

    if (v15 != v14)
    {
      objc_msgSend(v13, "removeFromSuperview");
      objc_msgSend(v14, "addSubview:", v13);
    }
    -[CRLiOSImageHUDViewController updateControlsForRep:](self, "updateControlsForRep:", v4);
    if (objc_msgSend(v12, "isInDynamicOperation"))
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001A26C4;
      v18[3] = &unk_10122D110;
      v18[4] = v13;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v18, 0, *(double *)&qword_1013DBEE0, *(double *)&qword_1013DBEE8);
    }
    else
    {
      -[CRLiOSImageHUDViewController p_updateViewPosition](self, "p_updateViewPosition");
      objc_msgSend(v13, "setAlpha:", 1.0);
    }
    v16 = UIAccessibilityLayoutChangedNotification;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
    UIAccessibilityPostNotification(v16, v17);

  }
}

- (void)hideHUDForRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FF08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E055F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FF28);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController hideHUDForRep:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 444, 0, "This operation must only be performed on the main thread.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  if (WeakRetained != v4 || !-[CRLiOSImageHUDViewController isViewLoaded](self, "isViewLoaded"))
    goto LABEL_15;
  v9 = -[CRLiOSImageHUDViewController notAllowedToHideHUD](self, "notAllowedToHideHUD");

  if ((v9 & 1) == 0)
  {
    -[CRLiOSImageHUDViewController p_stopIgnoringKeyboardIfNeeded](self, "p_stopIgnoringKeyboardIfNeeded");
    -[CRLiOSImageHUDViewController p_resumeCollaborationIfNeeded](self, "p_resumeCollaborationIfNeeded");
    objc_storeWeak((id *)&self->_rep, 0);
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
    objc_msgSend(WeakRetained, "removeDecorator:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
    v12 = *(double *)&qword_1013DBED8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A29AC;
    v14[3] = &unk_10122D110;
    v15 = v10;
    v13 = v10;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v14, 0, v12);

LABEL_15:
  }

}

- (void)closeHUDWithAnimation:(BOOL)a3
{
  id WeakRetained;
  id v6;

  if (!-[CRLiOSImageHUDViewController notAllowedToHideHUD](self, "notAllowedToHideHUD"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    -[CRLiOSImageHUDViewController hideHUDForRep:](self, "hideHUDForRep:", WeakRetained);

    if (!a3)
    {
      if (-[CRLiOSImageHUDViewController isViewLoaded](self, "isViewLoaded"))
      {
        v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
        objc_msgSend(v6, "removeFromSuperview");

      }
    }
  }
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)willBeginDynamicOperation
{
  _QWORD v2[5];

  if (!self->_maskResizer)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1001A2ACC;
    v2[3] = &unk_10122D110;
    v2[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.200000003);
  }
}

- (void)didEndDynamicOperation
{
  if (!self->_maskResizer)
    -[CRLiOSImageHUDViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_didEndDynamicOperation:", 0, 0.0);
}

- (void)didEndScrollingOperation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  -[CRLiOSImageHUDViewController updateControlsForRep:](self, "updateControlsForRep:", WeakRetained);

}

- (void)willBeginZoomingOperation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)didEndZoomingOperation
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  objc_msgSend(v3, "setHidden:", 0);

  -[CRLiOSImageHUDViewController p_updateViewPosition](self, "p_updateViewPosition");
}

- (void)p_updateHUDSize
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double doneStringWidth;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  objc_msgSend(v4, "visibleScaledRectForCanvasUI");
  v6 = v5;
  doneStringWidth = self->_doneStringWidth;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FF48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05678();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FF68);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateHUDSize]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 542, 0, "This operation must only be performed on the main thread.");

  }
  if (doneStringWidth + 220.0 >= v6 + -8.0)
    v18 = v6 + -8.0;
  else
    v18 = doneStringWidth + 220.0;
  if (v6 + -8.0 <= 0.0)
    v19 = doneStringWidth + 220.0;
  else
    v19 = v18;
  v20 = v19 - (doneStringWidth + 220.0) + 150.0;
  v21 = 75.0 - v20;
  v22 = v20 < 75.0;
  v23 = -0.0;
  if (v22)
    v23 = v21;
  v24 = v19 + v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  objc_msgSend(v25, "setFrame:", v10, v12, v24, v14);

}

- (CGRect)p_viewPositionAtTop:(BOOL)a3 inside:(BOOL)a4 ofUnscaledRect:(CGRect)a5
{
  CGFloat height;
  CGFloat y;
  CGFloat x;
  _BOOL4 v8;
  _BOOL4 v9;
  CRLMaskEditing **p_rep;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double MinY;
  double v33;
  double v34;
  double MidX;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double MaxY;
  double MinX;
  double MaxX;
  double v89;
  CGFloat rect;
  double v91;
  double v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect result;

  height = a5.size.height;
  rect = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v8 = a4;
  v9 = a3;
  p_rep = &self->_rep;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  objc_msgSend(v15, "frame");
  v91 = v17;
  v92 = v16;
  v18 = objc_loadWeakRetained((id *)p_rep);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "knobForTag:", 1));

  objc_msgSend(v19, "unscaledBoundingBoxOfHitRegionWithAdditionalScale:", 0.7);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = objc_loadWeakRetained((id *)p_rep);
  objc_msgSend(v19, "position");
  objc_msgSend(v28, "convertNaturalPointToUnscaledCanvas:");
  v30 = v29;
  v89 = v31;

  v93.origin.x = v21;
  v93.origin.y = v23;
  v93.size.width = v25;
  v93.size.height = v27;
  MaxX = CGRectGetMaxX(v93);
  v94.origin.x = v21;
  v94.origin.y = v23;
  v94.size.width = v25;
  v94.size.height = v27;
  MinX = CGRectGetMinX(v94);
  v95.origin.x = v21;
  v95.origin.y = v23;
  v95.size.width = v25;
  v95.size.height = v27;
  MaxY = CGRectGetMaxY(v95);
  v96.origin.x = v21;
  v96.origin.y = v23;
  v96.size.width = v25;
  v96.size.height = v27;
  MinY = CGRectGetMinY(v96);
  objc_msgSend(v13, "viewScale");
  v34 = v33;
  v97.origin.x = x;
  v97.origin.y = y;
  v97.size.width = rect;
  v97.size.height = height;
  MidX = CGRectGetMidX(v97);
  v36 = x;
  v37 = y;
  v38 = rect;
  v39 = height;
  if (v9)
    v40 = CGRectGetMinY(*(CGRect *)&v36);
  else
    v40 = CGRectGetMaxY(*(CGRect *)&v36);
  v41 = fmax(fmax(fmax(MaxX - v30, v30 - MinX), fmax(MaxY - v89, v89 - MinY)) * v34 + 1.0, 16.0);
  v42 = v9 ^ v8;
  objc_msgSend(v13, "convertUnscaledToBoundsPoint:", MidX, v40);
  v44 = v43;
  v46 = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));
  objc_msgSend(v47, "convertPoint:toView:", v14, v44, v46);
  v49 = v48;
  v51 = v50;

  v52 = -v41 - v91;
  if (!v42)
    v52 = v41;
  v53 = v52 + v51;
  objc_msgSend(v13, "visibleScaledRectForCanvasUI");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));
  objc_msgSend(v62, "convertRect:toView:", v14, v55, v57, v59, v61);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;

  v98.origin.x = v64;
  v98.origin.y = v66;
  v98.size.width = v68;
  v98.size.height = v70;
  v99 = CGRectInset(v98, 5.0, 5.0);
  v71 = sub_100061AD8(v49 + v92 * -0.5, v53, v92, v91, v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
  v75 = sub_100063148(v71, v72, v73, v74);
  v77 = v76;
  v79 = v78;
  v81 = v80;

  v82 = v75;
  v83 = v77;
  v84 = v79;
  v85 = v81;
  result.size.height = v85;
  result.size.width = v84;
  result.origin.y = v83;
  result.origin.x = v82;
  return result;
}

- (void)p_updateViewPosition
{
  CRLMaskEditing **p_rep;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL8 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _BOOL8 v52;
  double v53;
  double v54;
  double v55;
  double v56;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;

  p_rep = &self->_rep;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSImageHUDViewController view](self, "view"));
  v7 = objc_loadWeakRetained((id *)p_rep);
  if ((objc_msgSend(v7, "isInDynamicOperation") & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v6, "frame");
    v9 = v8;
    objc_msgSend(v5, "visibleScaledRectForCanvasUI");
    v11 = v10;

    if (v9 <= v11)
    {
      -[CRLiOSImageHUDViewController p_updateHUDSize](self, "p_updateHUDSize");
      v12 = objc_loadWeakRetained((id *)p_rep);
      objc_msgSend(v12, "frameInUnscaledCanvas");
      v14 = v13;
      v16 = v15;

      v17 = objc_loadWeakRetained((id *)p_rep);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layout"));
      objc_msgSend(v18, "frameInRoot");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v97 = v16;
      v98 = v14;
      -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v14, v24, v16);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
      if (v35 > 0.0)
      {
        -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v22, v24, v26);
        v28 = v36;
        v30 = v37;
        v32 = v38;
        v34 = v39;
        -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
        if (v40 > 0.0)
        {
          v41 = !self->_pinnedToTopOfImage;
          self->_pinnedToTopOfImage ^= 1u;
          -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", v41, 0, v20, v98, v24, v97);
          v28 = v42;
          v30 = v43;
          v32 = v44;
          v34 = v45;
          -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
          if (v46 > 0.0)
          {
            -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v22, v24, v26);
            v28 = v47;
            v30 = v48;
            v32 = v49;
            v34 = v50;
            -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
            if (v51 > 0.0)
            {
              v52 = !self->_pinnedToTopOfImage;
              self->_pinnedToTopOfImage ^= 1u;
              -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", v52, 1, v20, v98, v24, v97);
              v28 = v53;
              v30 = v54;
              v32 = v55;
              v34 = v56;
            }
          }
        }
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasView"));
      if (!v57)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123FF88);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0580C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123FFA8);
        v58 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v59, v60, 658, 0, "invalid nil value for '%{public}s'", "canvasView");

      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "asiOSCVC"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "view"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "window"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "rootViewController"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "view"));

      if (v66)
      {
        if (v57)
        {
          objc_msgSend(v66, "safeAreaInsets");
          v68 = v67;
          v70 = v69;
          v72 = v71;
          v74 = v73;
          objc_msgSend(v66, "convertRect:fromCoordinateSpace:", v57, v28, v30, v32, v34);
          v76 = v75;
          v78 = v77;
          v80 = v79;
          v82 = v81;
          objc_msgSend(v66, "bounds");
          objc_msgSend(v57, "convertRect:fromCoordinateSpace:", v66, sub_100061AD8(v76, v78, v80, v82, v70 + v83, v68 + v84, v85 - (v70 + v74), v86 - (v68 + v72)));
          v28 = v87;
          v30 = v88;
          v32 = v89;
          v34 = v90;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123FFC8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E05778();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10123FFE8);
        v91 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v92, v93, 660, 0, "invalid nil value for '%{public}s'", "rootView");

      }
      if (!+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101240008);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E056F8();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101240028);
        v94 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v95, v96, 669, 0, "This operation must only be performed on the main thread.");

      }
      objc_msgSend(v6, "setFrame:", v28, v30, v32, v34);

    }
  }

}

- (double)p_overlapOfViewRectWithKnobs:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CRLMaskEditing **p_rep;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGFloat v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  CGFloat v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t r1;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_rep = &self->_rep;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  objc_msgSend(v10, "convertRect:toView:", v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v9, "convertBoundsToUnscaledRect:", v13, v15, v17, v19);
  v85 = v21;
  v86 = v20;
  v84 = v22;
  v91 = v23;
  v24 = objc_loadWeakRetained((id *)p_rep);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "knobForTag:", 1));
  objc_msgSend(v25, "unscaledBoundingBoxOfHitRegionWithAdditionalScale:", 0.7);
  r1 = v27;
  v83 = v26;
  v80 = v28;
  v81 = v29;

  v30 = objc_loadWeakRetained((id *)p_rep);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "knobForTag:", 3));
  objc_msgSend(v31, "unscaledBoundingBoxOfHitRegionWithAdditionalScale:", 0.7);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v79 = v38;

  v39 = objc_loadWeakRetained((id *)p_rep);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "knobForTag:", 7));
  objc_msgSend(v40, "unscaledBoundingBoxOfHitRegionWithAdditionalScale:", 0.7);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  v49 = objc_loadWeakRetained((id *)p_rep);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "knobForTag:", 9));
  objc_msgSend(v50, "unscaledBoundingBoxOfHitRegionWithAdditionalScale:", 0.7);
  v89 = v52;
  v90 = v51;
  v87 = v54;
  v88 = v53;

  v55 = objc_loadWeakRetained((id *)p_rep);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "info"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "geometry"));
  objc_msgSend(v57, "angle");
  sub_1000618C4(v58);
  v60 = v59;

  if (v60 <= 45.0)
    goto LABEL_7;
  v61 = v46;
  v62 = v60 >= 135.0;
  if (v60 > 225.0)
    v62 = 0;
  if (v60 > 315.0)
  {
LABEL_7:
    v68 = v33;
    v69 = v35;
    v70 = v37;
    v71 = v79;
    v78 = v42;
    v67 = v44;
    v73 = v85;
    v72 = v86;
    v65 = v83;
    v74 = v84;
    v63 = v80;
    v64 = v81;
    v66 = r1;
  }
  else
  {
    v63 = v80;
    v64 = v81;
    v66 = r1;
    v65 = v83;
    v46 = v37;
    v67 = v35;
    if (v62)
    {
      v68 = v33;
      v69 = v35;
      v70 = v46;
      v71 = v79;
      v78 = v42;
      v67 = v44;
      v46 = v61;
      v73 = v85;
      v72 = v86;
      v74 = v84;
    }
    else
    {
      v68 = v42;
      v69 = v44;
      v70 = v61;
      v71 = v48;
      v73 = v85;
      v72 = v86;
      v74 = v84;
      v48 = v79;
      v78 = v33;
    }
  }
  v96 = CGRectUnion(*(CGRect *)&v65, *(CGRect *)&v68);
  v92.origin.x = v72;
  v92.origin.y = v73;
  v92.size.width = v74;
  v92.size.height = v91;
  v93 = CGRectIntersection(v92, v96);
  v75 = v93.size.width * v93.size.height + 0.0;
  v93.origin.x = v78;
  v93.origin.y = v67;
  v93.size.width = v46;
  v93.size.height = v48;
  v97.origin.y = v89;
  v97.origin.x = v90;
  v97.size.height = v87;
  v97.size.width = v88;
  v98 = CGRectUnion(v93, v97);
  v94.origin.x = v72;
  v94.origin.y = v73;
  v94.size.width = v74;
  v94.size.height = v91;
  v95 = CGRectIntersection(v94, v98);
  v76 = v75 + v95.size.width * v95.size.height;

  return v76;
}

- (void)p_didEndDynamicOperation:(id)a3
{
  _QWORD v4[5];

  -[CRLiOSImageHUDViewController p_updateViewPosition](self, "p_updateViewPosition", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A3E38;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.200000003, *(double *)&qword_1013DBEE8);
}

- (void)p_updateHUDAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Done"), 0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10[0] = NSFontAttributeName;
  v10[1] = NSForegroundColorAttributeName;
  v11[0] = v6;
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v5, v8);
  -[UIButton setAttributedTitle:forState:](self->_doneButton, "setAttributedTitle:forState:", v9, 0);

}

- (BOOL)accessibilityPerformEscape
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  objc_msgSend(WeakRetained, "endEditingMask");

  return 1;
}

- (BOOL)notAllowedToHideHUD
{
  return self->_notAllowedToHideHUD;
}

- (void)setNotAllowedToHideHUD:(BOOL)a3
{
  self->_notAllowedToHideHUD = a3;
}

- (CRLiOSImageHUDSlider)i_slider
{
  return self->_slider;
}

- (void)setI_slider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIButton)i_doneButton
{
  return self->_doneButton;
}

- (void)setI_doneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_maskResizer, 0);
  objc_destroyWeak((id *)&self->_rep);
}

@end
