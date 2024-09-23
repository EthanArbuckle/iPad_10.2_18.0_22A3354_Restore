@implementation RCPlaybackView

- (RCRecordingDescriptionView)descriptionView
{
  RCRecordingDescriptionView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackView;
  v2 = -[RCRecordingView descriptionView](&v4, "descriptionView");
  return (RCRecordingDescriptionView *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackView;
  -[RCPlaybackView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[RCPlaybackView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDisablesActionButtons:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  self->_disablesActionButtons = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v9 = !v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setEnabled:", v9);
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setEditingInFlight:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackView;
  -[RCRecordingView setEditingInFlight:](&v6, "setEditingInFlight:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar"));
  objc_msgSend(v5, "setHidden:", v3);

}

- (RCPlaybackView)initWithFrame:(CGRect)a3
{
  RCPlaybackView *v3;
  RCPlaybackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackView;
  v3 = -[RCRecordingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (void)_applyFixedOverviewWaveformViewConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformView](self, "fixedOverviewWaveformView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "playbackViewWaveformOverviewSidePadding");
  v6 = v5;
  objc_msgSend(v4, "playbackViewVerticalSpacingAboveOverviewWaveform");
  v8 = v7;
  objc_msgSend(v4, "playbackViewVerticalSpacingBelowOverviewWaveform");
  v10 = v9;
  objc_msgSend(v11, "alignCenterTopToCenterTopOfView:padding:", v3, v8);
  objc_msgSend(v11, "alignCenterBottomToCenterBottomOfView:padding:", v3, -v10);
  objc_msgSend(v11, "constrainWidthWithView:padding:", v3, v6 * -2.0);

}

- (BOOL)_showsEditingToolbar
{
  return 0;
}

- (void)_classSpecificInit
{
  UIToolbar *v3;
  UIImage *v4;
  void *v5;
  UIView *v6;
  void *v7;
  double v8;
  SettableIntrinsicSizeView *v9;
  SettableIntrinsicSizeView *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SettableIntrinsicSizeView *v25;
  RCTimeLabel *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v29, "showsVirtualNavBarInPlaybackView"))
  {
    v3 = objc_opt_new(UIToolbar);
    -[RCPlaybackView setVirtualNavigationToolbar:](self, "setVirtualNavigationToolbar:", v3);
    -[RCPlaybackView addSubview:](self, "addSubview:", v3);
    v4 = objc_opt_new(UIImage);
    -[UIToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v3, "setBackgroundImage:forToolbarPosition:barMetrics:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIToolbar setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[UIToolbar setShadowImage:forToolbarPosition:](v3, "setShadowImage:forToolbarPosition:", v4, 0);
  }
  -[RCPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", 1);
  if (objc_msgSend(v29, "presentsTitleAndAdditionalEditingControlsInPlaybackCard"))
  {
    v6 = objc_opt_new(UIView);
    -[RCPlaybackView setDescriptionContainerView:](self, "setDescriptionContainerView:", v6);
    -[RCPlaybackView addSubview:](self, "addSubview:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionView descriptionViewWithStyle:](RCRecordingDescriptionView, "descriptionViewWithStyle:", 1));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RCRecordingView setDescriptionView:](self, "setDescriptionView:", v7);
    -[UIView addSubview:](v6, "addSubview:", v7);
    objc_msgSend(v7, "constrainSizeAndAlignCenterToCenterOfView:", v6);
    objc_msgSend(v7, "setRecordingDescriptionViewDelegate:", self);
    objc_msgSend(v29, "fullScreenDescriptionHeight");
    -[UIView setFrame:](v6, "setFrame:", 0.0, 0.0, 100.0, v8);

  }
  v9 = objc_alloc_init(SettableIntrinsicSizeView);
  -[RCRecordingView setCenterContentContainerView:](self, "setCenterContentContainerView:", v9);
  -[RCPlaybackView addSubview:](self, "addSubview:", v9);
  v10 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setFixedOverviewWaveformContainerView:](self, "setFixedOverviewWaveformContainerView:", v10);
  -[RCPlaybackView addSubview:](self, "addSubview:", v10);
  if (objc_msgSend(v29, "hasBeginAndEndTimeLabelAtOverviewWaveform"))
  {
    v11 = objc_opt_new(UILabel);
    -[RCRecordingView setOverviewBeginTimeLabel:](self, "setOverviewBeginTimeLabel:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "beginEndLabelsPlaybackColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
    objc_msgSend(v13, "setTextColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
    objc_msgSend(v14, "setTextAlignment:", 4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
    objc_msgSend(v15, "setNumberOfLines:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "beginEndLabelsFont"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
    objc_msgSend(v17, "setFont:", v16);

    v18 = objc_opt_new(UILabel);
    -[RCRecordingView setOverviewEndTimeLabel:](self, "setOverviewEndTimeLabel:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "beginEndLabelsPlaybackColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v20, "setTextColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v21, "setTextAlignment:", 4);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v22, "setNumberOfLines:", 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "beginEndLabelsFont"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v24, "setFont:", v23);

  }
  v25 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setBottomControlsContainerView:](self, "setBottomControlsContainerView:", v25);
  -[SettableIntrinsicSizeView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RCPlaybackView addSubview:](self, "addSubview:", v25);
  v26 = objc_opt_new(RCTimeLabel);
  -[RCRecordingView setCurrentTimeLabel:](self, "setCurrentTimeLabel:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "playbackViewTimeLabelFont"));
  -[RCTimeLabel setFont:](v26, "setFont:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "playbackCardTimeLabelFontColor"));
  -[RCTimeLabel setTextColor:](v26, "setTextColor:", v28);

  -[RCTimeLabel setTextAlignment:](v26, "setTextAlignment:", 1);
  -[RCPlaybackView addSubview:](self, "addSubview:", v26);
  -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", 0, 0, 1);
  -[RCPlaybackView _setupConstraints](self, "_setupConstraints");

}

- (void)_setupConstraints
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
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
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;

  v70 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v70, "showsVirtualNavBarInPlaybackView"))
    -[RCPlaybackView _setupVirtualNavigationBarConstraints](self, "_setupVirtualNavigationBarConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView descriptionContainerView](self, "descriptionContainerView"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView leadingAnchor](self, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView trailingAnchor](self, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    objc_msgSend(v10, "setActive:", 1);

    -[RCPlaybackView _constrainDescriptionContainerViewToVirtualNavigationBar](self, "_constrainDescriptionContainerViewToVirtualNavigationBar");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v11, "playbackViewControlSectionHeight");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView leadingAnchor](self, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", v13));
  objc_msgSend(v22, "setActive:", 1);

  -[RCPlaybackView _constrainBottomControlsContainerViewToWindowIfNeeded](self, "_constrainBottomControlsContainerViewToWindowIfNeeded");
  objc_msgSend(v70, "playbackViewTimeSectionBottomPadding");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView centerXAnchor](self, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  objc_msgSend(v28, "setActive:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -v24));
  objc_msgSend(v32, "setActive:", 1);

  if (objc_msgSend(v70, "playbackViewTimeSectionNeedsHeightPadding"))
  {
    objc_msgSend(v70, "playbackViewTimeSectionHeight");
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", v34));
    objc_msgSend(v36, "setActive:", 1);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView leadingAnchor](self, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  objc_msgSend(v40, "setActive:", 1);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView trailingAnchor](self, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  objc_msgSend(v43, "setActive:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
  objc_msgSend(v47, "setActive:", 1);

  objc_msgSend(v70, "playbackViewVerticalSpacingAboveOverviewWaveform");
  v49 = v48;
  objc_msgSend(v70, "overviewWaveformHeight");
  v51 = v50;
  objc_msgSend(v70, "playbackViewVerticalSpacingBelowOverviewWaveform");
  v53 = v49 + v51 + v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "heightAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", v53));
  objc_msgSend(v55, "setActive:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView leadingAnchor](self, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v58));
  objc_msgSend(v59, "setActive:", 1);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView trailingAnchor](self, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  objc_msgSend(v62, "setActive:", 1);

  v63 = -[RCPlaybackView _shouldConstrainCenterContentContainerToWindow](self, "_shouldConstrainCenterContentContainerToWindow");
  if (v4 && (v63 & 1) == 0)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));
    objc_msgSend(v66, "setActive:", 1);

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v68));
  objc_msgSend(v69, "setActive:", 1);

}

- (void)_setupVirtualNavigationBarConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView leadingAnchor](self, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  objc_msgSend(v5, "setActive:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView trailingAnchor](self, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  objc_msgSend(v8, "setActive:", 1);

  -[RCPlaybackView _constrainVirtualNavigationToolbarToWindowIfNeeded](self, "_constrainVirtualNavigationToolbarToWindowIfNeeded");
}

- (void)_setupShuttleBarConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "playbackViewControlSectionHeight");
  v5 = v4;

  -[RCPlaybackView _shuttleBarWidth](self, "_shuttleBarWidth");
  v7 = v6;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v16, "setCenterClusterWidthCard:", v7);
  objc_msgSend(v16, "setIntrinsicHeight:", v5);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

}

- (void)_constrainDescriptionContainerViewToVirtualNavigationBar
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v10, "playbackViewTopPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView descriptionContainerView](self, "descriptionContainerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));
  objc_msgSend(v9, "setActive:", 1);

}

- (void)_constrainBottomControlsContainerViewToWindowIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView window](self, "window"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView bottomControlsContainerViewBottomConstraint](self, "bottomControlsContainerViewBottomConstraint"));
  if (!v4 && v10)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    -[RCPlaybackView setBottomControlsContainerViewBottomConstraint:](self, "setBottomControlsContainerViewBottomConstraint:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView bottomControlsContainerViewBottomConstraint](self, "bottomControlsContainerViewBottomConstraint"));
    objc_msgSend(v9, "setActive:", 1);

  }
}

- (void)_constrainVirtualNavigationToolbarToWindowIfNeeded
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView window](self, "window"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbarTopConstraint](self, "virtualNavigationToolbarTopConstraint"));
  v5 = v13;
  if (!v4 && v13)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar"));
    if (objc_msgSend(v6, "showsVirtualNavBarInPlaybackView"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
        -[RCPlaybackView setVirtualNavigationToolbarTopConstraint:](self, "setVirtualNavigationToolbarTopConstraint:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbarTopConstraint](self, "virtualNavigationToolbarTopConstraint"));
        objc_msgSend(v12, "setActive:", 1);

      }
    }

    v5 = v13;
  }

}

- (void)_constrainCenterContentContainerViewToWindowIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView window](self, "window"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));

  v4 = -[RCPlaybackView _shouldConstrainCenterContentContainerToWindow](self, "_shouldConstrainCenterContentContainerToWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView centerContentContainerTopAnchorToWindowConstraint](self, "centerContentContainerTopAnchorToWindowConstraint"));

  v6 = v15;
  if (v4 && !v5 && v15)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v7, "playbackViewTopPadding");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v9));
    -[RCPlaybackView setCenterContentContainerTopAnchorToWindowConstraint:](self, "setCenterContentContainerTopAnchorToWindowConstraint:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView centerContentContainerTopAnchorToWindowConstraint](self, "centerContentContainerTopAnchorToWindowConstraint"));
    objc_msgSend(v14, "setActive:", 1);

    v6 = v15;
  }

}

- (void)_createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView window](self, "window"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint](self, "overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint"));
  if (!v4 && v12)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v5, "recordingViewExpandedTranscriptAdditionalSpaceBetweenOverviewAndTimeLabel");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -v7));
    -[RCPlaybackView setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:](self, "setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:", v11);

  }
}

- (BOOL)_shouldConstrainCenterContentContainerToWindow
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "presentsTitleAndAdditionalEditingControlsInPlaybackCard") ^ 1;

  return v3;
}

- (void)didMoveToWindow
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView window](self, "window"));

  if (v3)
    -[RCPlaybackView _constrainViewsToWindowIfNeeded](self, "_constrainViewsToWindowIfNeeded");
  else
    -[RCPlaybackView _clearWindowConstraints](self, "_clearWindowConstraints");
}

- (void)_constrainViewsToWindowIfNeeded
{
  -[RCPlaybackView _constrainBottomControlsContainerViewToWindowIfNeeded](self, "_constrainBottomControlsContainerViewToWindowIfNeeded");
  -[RCPlaybackView _constrainVirtualNavigationToolbarToWindowIfNeeded](self, "_constrainVirtualNavigationToolbarToWindowIfNeeded");
  -[RCPlaybackView _constrainCenterContentContainerViewToWindowIfNeeded](self, "_constrainCenterContentContainerViewToWindowIfNeeded");
  -[RCPlaybackView _createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint](self, "_createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint");
}

- (void)_clearWindowConstraints
{
  -[RCPlaybackView setBottomControlsContainerViewBottomConstraint:](self, "setBottomControlsContainerViewBottomConstraint:", 0);
  -[RCPlaybackView setVirtualNavigationToolbarTopConstraint:](self, "setVirtualNavigationToolbarTopConstraint:", 0);
  -[RCPlaybackView setCenterContentContainerTopAnchorToWindowConstraint:](self, "setCenterContentContainerTopAnchorToWindowConstraint:", 0);
  -[RCPlaybackView setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:](self, "setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:", 0);
}

- (void)_createShuttleBarIfNeeded
{
  void *v3;
  RCShuttleBar *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  if (!v3)
  {
    v4 = -[RCShuttleBar initWithShuttleBarStyle:]([RCShuttleBar alloc], "initWithShuttleBarStyle:", 1);
    -[RCRecordingView setShuttleBar:](self, "setShuttleBar:", v4);
    -[RCShuttleBar setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[RCShuttleBar setPresentedControlsOptions:](v4, "setPresentedControlsOptions:", 0);
    -[RCShuttleBar setActionDelegate:](v4, "setActionDelegate:", self);
    -[RCShuttleBar setEnabled:](v4, "setEnabled:", 1);
    -[RCPlaybackView updateColors](self, "updateColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
    objc_msgSend(v5, "addSubview:", v4);

    -[RCPlaybackView _setupShuttleBarConstraints](self, "_setupShuttleBarConstraints");
    v3 = 0;
  }

}

- (void)_classSpecificSyncTranscriptViewState
{
  _BOOL8 v3;
  _BOOL8 v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v3 = -[RCRecordingView _shouldHideBottomElements](self, "_shouldHideBottomElements");
  v4 = v3;
  if (v3)
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = v3 ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView bottomControlsContainerViewBottomConstraint](self, "bottomControlsContainerViewBottomConstraint"));
  objc_msgSend(v7, "setActive:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint](self, "overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint"));
  objc_msgSend(v8, "setActive:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v9, "setUserInteractionEnabled:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v10, "setUserInteractionEnabled:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView createTranscriptViewExpansionAnimator](self, "createTranscriptViewExpansionAnimator"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000723F4;
  v12[3] = &unk_1001ABE10;
  v12[4] = self;
  *(double *)&v12[5] = v5;
  objc_msgSend(v11, "addAnimations:", v12);
  objc_msgSend(v11, "startAnimation");

}

- (double)_shuttleBarWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "playbackViewShuttleBarWidth");
  v4 = v3;

  return v4;
}

- (void)_classSpecificLayout
{
  double v3;
  double v4;
  void *v6;
  id v7;

  -[RCPlaybackView frame](self, "frame");
  if (v4 >= 10.0 && v3 >= 10.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
    -[RCPlaybackView bringSubviewToFront:](self, "bringSubviewToFront:", v6);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
    -[RCPlaybackView bringSubviewToFront:](self, "bringSubviewToFront:", v7);

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateToolbarWithLeadingItems:(id)a3 trailingItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v7, "showsVirtualNavBarInPlaybackView"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView _insertSpacingBetweenElements:](self, "_insertSpacingBetweenElements:", v13));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView _insertSpacingBetweenElements:](self, "_insertSpacingBetweenElements:", v6));
    v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(v11, "addObjectsFromArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView virtualNavigationToolbar](self, "virtualNavigationToolbar"));
    objc_msgSend(v12, "setItems:", v11);

  }
}

- (id)_insertSpacingBetweenElements:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "virtualNavBarButtonItemSpacing");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v3, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
      objc_msgSend(v7, "addObject:", v9);
      if (v8 < (char *)objc_msgSend(v3, "count") - 1)
      {
        v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
        objc_msgSend(v10, "setWidth:", v6);
        objc_msgSend(v7, "addObject:", v10);

      }
      ++v8;
    }
    while (v8 < objc_msgSend(v3, "count"));
  }

  return v7;
}

- (void)setSubviewsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackView subviews](self, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setHidden:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateUIForContentUnavailable:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!a3)
    -[RCPlaybackView _createShuttleBarIfNeeded](self, "_createShuttleBarIfNeeded");
  -[RCPlaybackView _updateAccessibilityStateForContentUnavailable:](self, "_updateAccessibilityStateForContentUnavailable:", v3);
}

- (void)_updateAccessibilityStateForContentUnavailable:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = !a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v6, "setIsAccessibilityElement:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
  objc_msgSend(v7, "setAccessibilityElementsHidden:", v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v8, "setAccessibilityElementsHidden:", v3);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  objc_msgSend(v9, "setAccessibilityElementsHidden:", v3);

}

- (void)updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginEndLabelsPlaybackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginEndLabelsPlaybackColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackViewBackgroundColor"));
  -[RCPlaybackView setBackgroundColor:](self, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackCardTimeLabelFontColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  -[RCPlaybackView updateShuttleBarControlsColor](self, "updateShuttleBarControlsColor");
}

- (void)updateShuttleBarControlsColor
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportControlsColorForPlaybackCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v4, "setControlsColor:", v3);

}

- (void)restyle
{
  void *v3;
  id v4;

  -[RCPlaybackView setNeedsLayout](self, "setNeedsLayout");
  -[RCRecordingView _applyDimmingColorToProgressOverlay](self, "_applyDimmingColorToProgressOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  objc_msgSend(v3, "restyle");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v4, "restyle");

}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (BOOL)disablesActionButtons
{
  return self->_disablesActionButtons;
}

- (NSLayoutConstraint)centerContentContainerTopAnchorToWindowConstraint
{
  return self->_centerContentContainerTopAnchorToWindowConstraint;
}

- (void)setCenterContentContainerTopAnchorToWindowConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerContentContainerTopAnchorToWindowConstraint, a3);
}

- (NSLayoutConstraint)bottomControlsContainerViewBottomConstraint
{
  return self->_bottomControlsContainerViewBottomConstraint;
}

- (void)setBottomControlsContainerViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsContainerViewBottomConstraint, a3);
}

- (NSLayoutConstraint)virtualNavigationToolbarTopConstraint
{
  return self->_virtualNavigationToolbarTopConstraint;
}

- (void)setVirtualNavigationToolbarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_virtualNavigationToolbarTopConstraint, a3);
}

- (NSLayoutConstraint)overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint
{
  return self->_overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint;
}

- (void)setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint, a3);
}

- (UIToolbar)virtualNavigationToolbar
{
  return self->_virtualNavigationToolbar;
}

- (void)setVirtualNavigationToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_virtualNavigationToolbar, a3);
}

- (UIBarButtonItem)shareButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_shareButtonItem);
}

- (void)setShareButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_shareButtonItem, a3);
}

- (UIBarButtonItem)deleteOrUndeleteButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_deleteOrUndeleteButtonItem);
}

- (void)setDeleteOrUndeleteButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_deleteOrUndeleteButtonItem, a3);
}

- (UIBarButtonItem)editButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_editButtonItem);
}

- (void)setEditButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_editButtonItem, a3);
}

- (UIView)descriptionContainerView
{
  return self->_descriptionContainerView;
}

- (void)setDescriptionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionContainerView, 0);
  objc_destroyWeak((id *)&self->_editButtonItem);
  objc_destroyWeak((id *)&self->_deleteOrUndeleteButtonItem);
  objc_destroyWeak((id *)&self->_shareButtonItem);
  objc_storeStrong((id *)&self->_virtualNavigationToolbar, 0);
  objc_storeStrong((id *)&self->_overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_virtualNavigationToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_centerContentContainerTopAnchorToWindowConstraint, 0);
}

@end
