@implementation TraceControlView

- (TraceControlView)initWithFrame:(CGRect)a3
{
  TraceControlView *v3;
  void *v4;
  id v5;
  UIStackView *v6;
  UIStackView *firstLineStack;
  uint64_t v8;
  UIButton *viewCameraSnapshotsButton;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIButton *saveCameraSnapshotButton;
  UIButton *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  UIButton *jumpBackButton;
  UIButton *v23;
  void *v24;
  double v25;
  uint64_t v26;
  UIButton *frButton;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  UIButton *playButton;
  UIButton *v37;
  void *v38;
  double v39;
  uint64_t v40;
  UIButton *ffButton;
  UIButton *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  UILabel *v49;
  UILabel *positionLabel;
  void *v51;
  void *v52;
  double v53;
  uint64_t v54;
  UIButton *bookmarksButton;
  UIButton *v56;
  void *v57;
  double v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSLayoutConstraint *firstLineBottomToBottomConstraint;
  void *v82;
  objc_super v83;

  v83.receiver = self;
  v83.super_class = (Class)TraceControlView;
  v3 = -[TraceControlView initWithFrame:](&v83, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TraceControlView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_playSpeed = 1.0;
    v5 = objc_alloc((Class)UIStackView);
    -[TraceControlView bounds](v3, "bounds");
    v6 = (UIStackView *)objc_msgSend(v5, "initWithFrame:");
    firstLineStack = v3->_firstLineStack;
    v3->_firstLineStack = v6;

    -[UIStackView setAxis:](v3->_firstLineStack, "setAxis:", 0);
    -[UIStackView setDistribution:](v3->_firstLineStack, "setDistribution:", 4);
    -[UIStackView setAlignment:](v3->_firstLineStack, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_firstLineStack, "setSpacing:", 0.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_firstLineStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TraceControlView addSubview:](v3, "addSubview:", v3->_firstLineStack);
    v8 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    viewCameraSnapshotsButton = v3->_viewCameraSnapshotsButton;
    v3->_viewCameraSnapshotsButton = (UIButton *)v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_viewCameraSnapshotsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v3->_viewCameraSnapshotsButton;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("navigation-view-snapshots")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithRenderingMode:", 2));
    -[UIButton setImage:forState:](v10, "setImage:forState:", v12, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_viewCameraSnapshotsButton, "addTarget:action:forControlEvents:", v3, "_viewCameraSnapshotsButtonPressed:", 64);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](v3->_viewCameraSnapshotsButton, "setTintColor:", v13);

    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_viewCameraSnapshotsButton);
    v14 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    saveCameraSnapshotButton = v3->_saveCameraSnapshotButton;
    v3->_saveCameraSnapshotButton = (UIButton *)v14;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_saveCameraSnapshotButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = v3->_saveCameraSnapshotButton;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("navigation-save-snapshot")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));
    -[UIButton setImage:forState:](v16, "setImage:forState:", v18, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_saveCameraSnapshotButton, "addTarget:action:forControlEvents:", v3, "_saveCameraSnapshotButtonPressed:", 64);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](v3->_saveCameraSnapshotButton, "setTintColor:", v19);

    LODWORD(v20) = 1140129792;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_saveCameraSnapshotButton, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_saveCameraSnapshotButton);
    v21 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    jumpBackButton = v3->_jumpBackButton;
    v3->_jumpBackButton = (UIButton *)v21;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_jumpBackButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = v3->_jumpBackButton;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-skipback.png")));
    -[UIButton setImage:forState:](v23, "setImage:forState:", v24, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_jumpBackButton, "addTarget:action:forControlEvents:", v3, "_jumpBackButtonPressed:", 64);
    LODWORD(v25) = 1140785152;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_jumpBackButton, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_jumpBackButton);
    v26 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    frButton = v3->_frButton;
    v3->_frButton = (UIButton *)v26;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_frButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-fastforward.png"))));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v28, "CGImage"), 4, 1.0));

    -[UIButton setImage:forState:](v3->_frButton, "setImage:forState:", v82, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_frButton, "titleLabel"));
    objc_msgSend(v29, "setTextAlignment:", 4);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_frButton, "titleLabel"));
    objc_msgSend(v31, "setFont:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_frButton, "titleLabel"));
    objc_msgSend(v33, "setTextColor:", v32);

    -[UIButton addTarget:action:forControlEvents:](v3->_frButton, "addTarget:action:forControlEvents:", v3, "_frButtonPressed:", 64);
    LODWORD(v34) = 1135509504;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_frButton, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_frButton);
    v35 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    playButton = v3->_playButton;
    v3->_playButton = (UIButton *)v35;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_playButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = v3->_playButton;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-pause.png")));
    -[UIButton setImage:forState:](v37, "setImage:forState:", v38, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_playButton, "addTarget:action:forControlEvents:", v3, "_playButtonPressed:", 64);
    LODWORD(v39) = 1144766464;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_playButton, "setContentCompressionResistancePriority:forAxis:", 0, v39);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_playButton);
    v40 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    ffButton = v3->_ffButton;
    v3->_ffButton = (UIButton *)v40;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_ffButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v42 = v3->_ffButton;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-fastforward.png")));
    -[UIButton setImage:forState:](v42, "setImage:forState:", v43, 0);

    -[UIButton setTitle:forState:](v3->_ffButton, "setTitle:forState:", CFSTR(" "), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 10.0));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_ffButton, "titleLabel"));
    objc_msgSend(v45, "setFont:", v44);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_ffButton, "titleLabel"));
    objc_msgSend(v47, "setTextColor:", v46);

    -[UIButton addTarget:action:forControlEvents:](v3->_ffButton, "addTarget:action:forControlEvents:", v3, "_ffButtonPressed:", 64);
    LODWORD(v48) = 1135575040;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_ffButton, "setContentCompressionResistancePriority:forAxis:", 0, v48);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_ffButton);
    v3->_useDistanceAsPosition = 0;
    v49 = (UILabel *)objc_alloc_init((Class)UILabel);
    positionLabel = v3->_positionLabel;
    v3->_positionLabel = v49;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_positionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 13.0));
    -[UILabel setFont:](v3->_positionLabel, "setFont:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_positionLabel, "setTextColor:", v52);

    -[UILabel setText:](v3->_positionLabel, "setText:", 0);
    LODWORD(v53) = 1132134400;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_positionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v53);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_positionLabel);
    v54 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    bookmarksButton = v3->_bookmarksButton;
    v3->_bookmarksButton = (UIButton *)v54;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_bookmarksButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v56 = v3->_bookmarksButton;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-Bookmark.png")));
    -[UIButton setImage:forState:](v56, "setImage:forState:", v57, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_bookmarksButton, "addTarget:action:forControlEvents:", v3, "_bookmarksButtonPressed:", 64);
    LODWORD(v58) = 1132593152;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_bookmarksButton, "setContentCompressionResistancePriority:forAxis:", 0, v58);
    -[UIStackView addArrangedSubview:](v3->_firstLineStack, "addArrangedSubview:", v3->_bookmarksButton);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](v3->_firstLineStack, "arrangedSubviews"));
    v3->_numberOfControls = (unint64_t)objc_msgSend(v59, "count");

    v60 = objc_alloc_init((Class)NSMutableArray);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_firstLineStack, "centerXAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView centerXAnchor](v3, "centerXAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v62));
    objc_msgSend(v60, "addObject:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v3->_firstLineStack, "widthAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintLessThanOrEqualToConstant:", (double)v3->_numberOfControls * 88.0));
    objc_msgSend(v60, "addObject:", v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_firstLineStack, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView leadingAnchor](v3, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 12.0));

    LODWORD(v69) = 1148829696;
    objc_msgSend(v68, "setPriority:", v69);
    objc_msgSend(v60, "addObject:", v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView trailingAnchor](v3, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_firstLineStack, "trailingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, 12.0));

    LODWORD(v73) = 1148829696;
    objc_msgSend(v72, "setPriority:", v73);
    objc_msgSend(v60, "addObject:", v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_firstLineStack, "topAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView topAnchor](v3, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
    objc_msgSend(v60, "addObject:", v76);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_firstLineStack, "bottomAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView bottomAnchor](v3, "bottomAnchor"));
    v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v78));
    firstLineBottomToBottomConstraint = v3->_firstLineBottomToBottomConstraint;
    v3->_firstLineBottomToBottomConstraint = (NSLayoutConstraint *)v79;

    objc_msgSend(v60, "addObject:", v3->_firstLineBottomToBottomConstraint);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);

  }
  return v3;
}

- (void)layoutSubviews
{
  unsigned int v3;
  void *v4;
  UIStackView *v5;
  UIStackView *secondLineStack;
  id v7;
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
  NSLayoutConstraint *v19;
  NSLayoutConstraint *secondLineBottomToBottomConstraint;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v47.receiver = self;
  v47.super_class = (Class)TraceControlView;
  -[TraceControlView layoutSubviews](&v47, "layoutSubviews");
  v3 = -[TraceControlView _shouldSpanTwoLines](self, "_shouldSpanTwoLines");
  if (v3 != -[TraceControlView _isSpanningTwoLines](self, "_isSpanningTwoLines"))
  {
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView superview](self->_secondLineStack, "superview"));

      if (!v4)
      {
        v5 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        secondLineStack = self->_secondLineStack;
        self->_secondLineStack = v5;

        -[UIStackView setAxis:](self->_secondLineStack, "setAxis:", 0);
        -[UIStackView setDistribution:](self->_secondLineStack, "setDistribution:", 4);
        -[UIStackView setAlignment:](self->_secondLineStack, "setAlignment:", 3);
        -[UIStackView setSpacing:](self->_secondLineStack, "setSpacing:", 0.0);
        -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondLineStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIStackView setHidden:](self->_secondLineStack, "setHidden:", 1);
        -[TraceControlView addSubview:](self, "addSubview:", self->_secondLineStack);
        v7 = objc_alloc_init((Class)NSMutableArray);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_secondLineStack, "leadingAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_firstLineStack, "leadingAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        objc_msgSend(v7, "addObject:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_secondLineStack, "trailingAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_firstLineStack, "trailingAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
        objc_msgSend(v7, "addObject:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_secondLineStack, "topAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_firstLineStack, "bottomAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 8.0));
        objc_msgSend(v7, "addObject:", v16);

        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_secondLineStack, "bottomAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView bottomAnchor](self, "bottomAnchor"));
        v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
        secondLineBottomToBottomConstraint = self->_secondLineBottomToBottomConstraint;
        self->_secondLineBottomToBottomConstraint = v19;

      }
      v21 = objc_alloc_init((Class)NSMutableArray);
      v22 = v21;
      if (self->_viewCameraSnapshotsButton)
        objc_msgSend(v21, "addObject:");
      if (self->_saveCameraSnapshotButton)
        objc_msgSend(v22, "addObject:");
      if (self->_jumpBackButton)
        objc_msgSend(v22, "addObject:");
      if (self->_testLoggingButton)
        objc_msgSend(v22, "addObject:");
      if (self->_positionLabel)
        objc_msgSend(v22, "addObject:");
      if (self->_bookmarksButton)
        objc_msgSend(v22, "addObject:");
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v28, "removeFromSuperview");
            -[UIStackView addArrangedSubview:](self->_secondLineStack, "addArrangedSubview:", v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v25);
      }

      -[NSLayoutConstraint setActive:](self->_firstLineBottomToBottomConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_secondLineBottomToBottomConstraint, "setActive:", 1);

    }
    else
    {
      v29 = objc_alloc_init((Class)NSMutableArray);
      v30 = objc_alloc_init((Class)NSMutableArray);
      if (self->_viewCameraSnapshotsButton)
        objc_msgSend(v29, "addObject:");
      if (self->_saveCameraSnapshotButton)
        objc_msgSend(v29, "addObject:");
      if (self->_jumpBackButton)
        objc_msgSend(v29, "addObject:");
      if (self->_testLoggingButton)
        objc_msgSend(v30, "addObject:");
      if (self->_positionLabel)
        objc_msgSend(v30, "addObject:");
      if (self->_bookmarksButton)
        objc_msgSend(v30, "addObject:");
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10039A2C8;
      v42[3] = &unk_1011B3A18;
      v42[4] = self;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v42);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(_QWORD *)v39 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v36, "removeFromSuperview");
            -[UIStackView addArrangedSubview:](self->_firstLineStack, "addArrangedSubview:", v36);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        }
        while (v33);
      }

      -[NSLayoutConstraint setActive:](self->_secondLineBottomToBottomConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_firstLineBottomToBottomConstraint, "setActive:", 1);

    }
    -[UIStackView setHidden:](self->_secondLineStack, "setHidden:", v3 ^ 1);
    v37.receiver = self;
    v37.super_class = (Class)TraceControlView;
    -[TraceControlView layoutSubviews](&v37, "layoutSubviews");
  }
}

- (BOOL)_shouldSpanTwoLines
{
  double v3;

  -[TraceControlView bounds](self, "bounds");
  return v3 < (double)self->_numberOfControls * 44.0;
}

- (BOOL)_isSpanningTwoLines
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView superview](self->_secondLineStack, "superview"));
  if (v3)
    v4 = -[UIStackView isHidden](self->_secondLineStack, "isHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_jumpBackButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceControlViewJumpedBack:", self);

}

- (void)_playButtonPressed:(id)a3
{
  id WeakRetained;

  -[TraceControlView setIsPlaying:](self, "setIsPlaying:", !self->_isPlaying);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceControlView:setPlaying:", self, self->_isPlaying);

}

- (void)setIsPlaying:(BOOL)a3
{
  const __CFString *v4;
  id v5;

  self->_isPlaying = a3;
  if (a3)
    v4 = CFSTR("MN-pause.png");
  else
    v4 = CFSTR("MN-play.png");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v4));
  -[UIButton setImage:forState:](self->_playButton, "setImage:forState:", v5, 0);

}

- (void)setUseDistanceAsPosition:(BOOL)a3
{
  self->_useDistanceAsPosition = a3;
  -[TraceControlView setPosition:](self, "setPosition:", 0.0);
}

- (unint64_t)_currentPlaySpeedIndex
{
  unint64_t i;

  for (i = 0; i != 11; ++i)
  {
    if (self->_playSpeed <= dbl_100E354D8[i])
      break;
  }
  if (i >= 0xA)
    return 10;
  else
    return i;
}

- (void)_frButtonPressed:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  double v6;
  id WeakRetained;

  v4 = -[TraceControlView _currentPlaySpeedIndex](self, "_currentPlaySpeedIndex", a3);
  v5 = v4 - 1;
  if (!v4)
    v5 = 0;
  v6 = dbl_100E354D8[v5];
  if (v6 != self->_playSpeed)
  {
    -[TraceControlView setPlaySpeed:](self, "setPlaySpeed:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "traceControlView:setPlaySpeed:", self, v6);

  }
}

- (void)_ffButtonPressed:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  double v6;
  id WeakRetained;

  v4 = -[TraceControlView _currentPlaySpeedIndex](self, "_currentPlaySpeedIndex", a3);
  v5 = 10;
  if (v4 + 1 < 0xA)
    v5 = v4 + 1;
  v6 = dbl_100E354D8[v5];
  if (v6 != self->_playSpeed)
  {
    -[TraceControlView setPlaySpeed:](self, "setPlaySpeed:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "traceControlView:setPlaySpeed:", self, v6);

  }
}

- (void)_bookmarksButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceControlViewPressedBookmarksButton:", self);

}

- (void)_saveCameraSnapshotButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceControlViewPressedSaveCameraSnapshotButton:", self);

}

- (void)_viewCameraSnapshotsButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceControlViewPressedViewCameraSnapshotsButton:", self);

}

- (void)setPlaySpeed:(double)a3
{
  const __CFString *v4;
  NSString *v5;
  __CFString *v6;

  self->_playSpeed = a3;
  if (a3 == 1.0)
  {
    v4 = CFSTR("     ");
  }
  else
  {
    if (vabdd_f64(a3, (double)(int)(a3 + 0.05)) >= 0.1)
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fx"), *(_QWORD *)&a3);
    else
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%dx"), (int)(a3 + 0.05));
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = (__CFString *)v4;
  -[UIButton setTitle:forState:](self->_ffButton, "setTitle:forState:", v4, 0);

}

- (void)setPosition:(double)a3
{
  NSNumberFormatter *distancePositionFormatter;
  NSNumberFormatter *v6;
  NSNumberFormatter *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (self->_useDistanceAsPosition)
  {
    distancePositionFormatter = self->_distancePositionFormatter;
    if (!distancePositionFormatter)
    {
      v6 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
      v7 = self->_distancePositionFormatter;
      self->_distancePositionFormatter = v6;

      -[NSNumberFormatter setFormatterBehavior:](self->_distancePositionFormatter, "setFormatterBehavior:", 1);
      -[NSNumberFormatter setNumberStyle:](self->_distancePositionFormatter, "setNumberStyle:", 1);
      -[NSNumberFormatter setMaximumFractionDigits:](self->_distancePositionFormatter, "setMaximumFractionDigits:", 0);
      distancePositionFormatter = self->_distancePositionFormatter;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](distancePositionFormatter, "stringFromNumber:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@m"), v8));
    -[UILabel setText:](self->_positionLabel, "setText:", v9);

LABEL_5:
    return;
  }
  v10 = floor(a3);
  if (v10 != self->_lastPositionInLabel)
  {
    self->_lastPositionInLabel = v10;
    if (v10 >= 3600.0)
      v11 = 224;
    else
      v11 = 192;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TraceControlView timePositionFormatter](self, "timePositionFormatter"));
    objc_msgSend(v12, "setAllowedUnits:", v11);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[TraceControlView timePositionFormatter](self, "timePositionFormatter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromTimeInterval:", v10));
    -[UILabel setText:](self->_positionLabel, "setText:", v8);
    goto LABEL_5;
  }
}

- (NSDateComponentsFormatter)timePositionFormatter
{
  NSDateComponentsFormatter *timePositionFormatter;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *v5;

  timePositionFormatter = self->_timePositionFormatter;
  if (!timePositionFormatter)
  {
    v4 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    v5 = self->_timePositionFormatter;
    self->_timePositionFormatter = v4;

    -[NSDateComponentsFormatter setZeroFormattingBehavior:](self->_timePositionFormatter, "setZeroFormattingBehavior:", 0);
    -[NSDateComponentsFormatter setUnitsStyle:](self->_timePositionFormatter, "setUnitsStyle:", 0);
    timePositionFormatter = self->_timePositionFormatter;
  }
  return timePositionFormatter;
}

- (void)_testLoggingButtonPressed:(id)a3
{
  unsigned int v4;
  id WeakRetained;
  id v6;

  -[TraceControlView setIsLogging:](self, "setIsLogging:", !self->_isLogging);
  v4 = -[TraceControlView isLogging](self, "isLogging");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (v4)
    objc_msgSend(WeakRetained, "traceControlViewPressedStartLoggingButton:", self);
  else
    objc_msgSend(WeakRetained, "traceControlViewPressedEndLoggingButton:", self);

}

- (TraceControlViewDelegate)delegate
{
  return (TraceControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (double)playSpeed
{
  return self->_playSpeed;
}

- (UIButton)jumpBackButton
{
  return self->_jumpBackButton;
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (UIButton)ffButton
{
  return self->_ffButton;
}

- (UIButton)frButton
{
  return self->_frButton;
}

- (UIButton)bookmarksButton
{
  return self->_bookmarksButton;
}

- (BOOL)useDistanceAsPosition
{
  return self->_useDistanceAsPosition;
}

- (BOOL)isLogging
{
  return self->_isLogging;
}

- (void)setIsLogging:(BOOL)a3
{
  self->_isLogging = a3;
}

- (UIButton)viewCameraSnapshotsButton
{
  return self->_viewCameraSnapshotsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewCameraSnapshotsButton, 0);
  objc_storeStrong((id *)&self->_jumpBackButton, 0);
  objc_storeStrong((id *)&self->_distancePositionFormatter, 0);
  objc_storeStrong((id *)&self->_timePositionFormatter, 0);
  objc_storeStrong((id *)&self->_secondLineBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstLineBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondLineStack, 0);
  objc_storeStrong((id *)&self->_firstLineStack, 0);
  objc_storeStrong((id *)&self->_positionLabel, 0);
  objc_storeStrong((id *)&self->_testLoggingButton, 0);
  objc_storeStrong((id *)&self->_bookmarksButton, 0);
  objc_storeStrong((id *)&self->_frButton, 0);
  objc_storeStrong((id *)&self->_ffButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_saveCameraSnapshotButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
