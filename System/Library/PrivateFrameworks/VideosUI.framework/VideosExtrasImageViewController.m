@implementation VideosExtrasImageViewController

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VideosExtrasImageViewController gestureRecognizers](self, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:", self, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasImageViewController;
  -[VideosExtrasImageViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  char v3;

  -[VideosExtrasImageViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNavigationBarHidden");

  return v3;
}

- (void)viewDidLoad
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
  VideosExtrasZoomableImageView *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double MidX;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
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
  void *v44;
  void *v45;
  VideosExtrasZoomableImageView *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;

  v54.receiver = self;
  v54.super_class = (Class)VideosExtrasImageViewController;
  -[VideosExtrasImageViewController viewDidLoad](&v54, sel_viewDidLoad);
  -[VideosExtrasImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_alloc_init(VideosExtrasZoomableImageView);
  -[VideosExtrasZoomableImageView setFrame:](v12, "setFrame:", v5, v7, v9, v11);
  -[VideosExtrasZoomableImageView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
  v13 = v3;
  objc_msgSend(v3, "addSubview:", v12);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDoubleTap_);
  objc_msgSend(v15, "setNumberOfTapsRequired:", 2);
  -[VideosExtrasZoomableImageView addGestureRecognizer:](v12, "addGestureRecognizer:", v15);
  objc_msgSend(v14, "addObject:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleSingleTap_);
  v50 = v15;
  objc_msgSend(v16, "requireGestureRecognizerToFail:", v15);
  -[VideosExtrasZoomableImageView addGestureRecognizer:](v12, "addGestureRecognizer:", v16);
  v49 = v16;
  objc_msgSend(v14, "addObject:", v16);
  if (-[VideosExtrasImageViewController allowsPinchingImageForInteractiveZoomingImageTransition](self, "allowsPinchingImageForInteractiveZoomingImageTransition"))
  {
    -[VideosExtrasZoomableImageView pinchGestureRecognizer](v12, "pinchGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:", self, sel__handlePinch_);
    objc_msgSend(v14, "addObject:", v17);

  }
  -[VideosExtrasImageViewController setGestureRecognizers:](self, "setGestureRecognizers:", v14);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v48, "sizeToFit");
  v55.origin.x = v5;
  v55.origin.y = v7;
  v55.size.width = v9;
  v55.size.height = v11;
  MidX = CGRectGetMidX(v55);
  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  objc_msgSend(v48, "setCenter:", MidX, CGRectGetMidY(v56));
  objc_msgSend(v48, "setAutoresizingMask:", 45);
  objc_msgSend(v13, "addSubview:", v48);
  objc_msgSend(v48, "startAnimating");
  -[VideosExtrasImageViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v48);
  v46 = v12;
  -[VideosExtrasImageViewController setZoomableImageView:](self, "setZoomableImageView:", v12);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
  objc_msgSend(v13, "addSubview:", v19);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v20, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(v20, "setNumberOfLines:", 0);
  LODWORD(v21) = 1148846080;
  objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  objc_msgSend(v19, "addSubview:", v20);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v22, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(v22, "setNumberOfLines:", 0);
  LODWORD(v23) = 1148829696;
  objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  objc_msgSend(v19, "addSubview:", v22);
  v47 = v14;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v24, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(v24, "setNumberOfLines:", 0);
  LODWORD(v25) = 1148813312;
  objc_msgSend(v24, "setContentCompressionResistancePriority:forAxis:", 1, v25);
  objc_msgSend(v19, "addSubview:", v24);
  v26 = *MEMORY[0x1E0DC49E8];
  v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v20, v19, 10, *MEMORY[0x1E0DC49E8], v27, v28, v29);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v20;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 1, v19, 3, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 11, -1, v19, 4, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v22, v19, 10, v26, v27, v28, v29);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v22;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 3, 1, v19, 3, 1.0, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 11, -1, v19, 4, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v24, v19, 10, v26, v27, v28, v29);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 3, 1, v19, 3, 1.0, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 11, -1, v19, 4, 1.0, 0.0);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v53);
  objc_msgSend(v19, "addConstraint:", v52);
  objc_msgSend(v19, "addConstraint:", v51);
  objc_msgSend(v19, "addConstraints:", v43);
  objc_msgSend(v19, "addConstraint:", v42);
  objc_msgSend(v19, "addConstraint:", v41);
  objc_msgSend(v19, "addConstraints:", v40);
  objc_msgSend(v19, "addConstraint:", v39);
  v31 = (void *)v30;
  objc_msgSend(v19, "addConstraint:", v30);
  v32 = v13;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, v13, 9, 1.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 7, 0, v13, 7, 0.75, 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasImageViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 4, 0, v37, 4, 1.0, -20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "addConstraint:", v33);
  objc_msgSend(v32, "addConstraint:", v34);
  objc_msgSend(v32, "addConstraint:", v38);
  -[VideosExtrasImageViewController setTextContainmentView:](self, "setTextContainmentView:", v19);
  -[VideosExtrasImageViewController setTitleLabel:](self, "setTitleLabel:", v45);
  -[VideosExtrasImageViewController setSubtitleLabel:](self, "setSubtitleLabel:", v44);
  -[VideosExtrasImageViewController setDescriptionLabel:](self, "setDescriptionLabel:", v24);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  char v63;
  void *v64;
  objc_super v65;

  -[VideosExtrasImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasImageViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasImageViewController subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasImageViewController descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    goto LABEL_4;
  objc_msgSend(v5, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v6, "attributedText");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "length");

  if (v52)
  {
LABEL_5:
    objc_msgSend(v6, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    v11 = (id *)MEMORY[0x1E0DC4A98];
    v12 = v6;
    if (!v10)
    {
      objc_msgSend(v5, "attributedText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
        v12 = v5;
      else
        v12 = v4;
      if (v14)
        v11 = (id *)MEMORY[0x1E0DC4A90];
      else
        v11 = (id *)MEMORY[0x1E0DC4A88];
    }
    v15 = v12;
    v16 = *v11;
    -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = v16;
      -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstItem");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21 == v15)
      {
        -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
        v64 = v5;
        v22 = v4;
        v23 = v3;
        v24 = v15;
        v25 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "textStyle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v27, "isEqualToString:", v19);

        v6 = v25;
        v15 = v24;
        v3 = v23;
        v4 = v22;
        v5 = v64;

        v16 = v19;
        if ((v63 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

        v16 = v19;
      }
      -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeConstraint:", v28);

      -[VideosExtrasImageViewController setBottomLabelConstraint:](self, "setBottomLabelConstraint:", 0);
    }
LABEL_17:
    -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      v30 = (void *)MEMORY[0x1E0D46958];
      -[VideosExtrasImageViewController textContainmentView](self, "textContainmentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", v15, 11, 0, v31, 4, v16, 1.0, -10.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasImageViewController setBottomLabelConstraint:](self, "setBottomLabelConstraint:", v32);

      -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addConstraint:", v33);

    }
    objc_msgSend(v4, "attributedText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      objc_msgSend(v5, "attributedText");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "length");

      if (v36)
      {
LABEL_24:
        -[VideosExtrasImageViewController subtitleLeadingConstraint](self, "subtitleLeadingConstraint");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          objc_msgSend(v4, "attributedText");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "length"))
          {
            objc_msgSend(v5, "attributedText");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "length");

            if (!v49)
              goto LABEL_26;
            objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", v5, v4, 11, *MEMORY[0x1E0DC4A90], 25.0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[VideosExtrasImageViewController setSubtitleLeadingConstraint:](self, "setSubtitleLeadingConstraint:", v50);

            -[VideosExtrasImageViewController subtitleLeadingConstraint](self, "subtitleLeadingConstraint");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addConstraint:", v38);
          }
        }

LABEL_26:
        objc_msgSend(v5, "attributedText");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "length");

        v41 = v5;
        if (v40
          || (objc_msgSend(v4, "attributedText"),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v43 = objc_msgSend(v42, "length"),
              v42,
              v41 = v4,
              v43))
        {
          v44 = v41;
          if (v44)
          {
            -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "secondItem");
            v46 = (id)objc_claimAutoreleasedReturnValue();

            if (v46 == v44)
              goto LABEL_44;
            v47 = 0;
LABEL_43:
            -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "removeConstraint:", v59);

            -[VideosExtrasImageViewController setDescriptionLeadingConstraint:](self, "setDescriptionLeadingConstraint:", 0);
            if ((v47 & 1) != 0)
            {
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:
            -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v60)
            {
              objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", v6, v44, 11, *MEMORY[0x1E0DC4A98], 30.0);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[VideosExtrasImageViewController setDescriptionLeadingConstraint:](self, "setDescriptionLeadingConstraint:", v61);

              -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addConstraint:", v62);

            }
            goto LABEL_46;
          }
        }
        else
        {
          v44 = 0;
        }
        v47 = 1;
        goto LABEL_43;
      }
    }
    else
    {

    }
    -[VideosExtrasImageViewController subtitleLeadingConstraint](self, "subtitleLeadingConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", v37);

    -[VideosExtrasImageViewController setSubtitleLeadingConstraint:](self, "setSubtitleLeadingConstraint:", 0);
    goto LABEL_24;
  }
  -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[VideosExtrasImageViewController bottomLabelConstraint](self, "bottomLabelConstraint");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", v54);

    -[VideosExtrasImageViewController setBottomLabelConstraint:](self, "setBottomLabelConstraint:", 0);
  }
  -[VideosExtrasImageViewController subtitleLeadingConstraint](self, "subtitleLeadingConstraint");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[VideosExtrasImageViewController subtitleLeadingConstraint](self, "subtitleLeadingConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", v56);

    -[VideosExtrasImageViewController setSubtitleLeadingConstraint:](self, "setSubtitleLeadingConstraint:", 0);
  }
  -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[VideosExtrasImageViewController descriptionLeadingConstraint](self, "descriptionLeadingConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", v58);

    -[VideosExtrasImageViewController setDescriptionLeadingConstraint:](self, "setDescriptionLeadingConstraint:", 0);
  }
LABEL_47:
  v65.receiver = self;
  v65.super_class = (Class)VideosExtrasImageViewController;
  -[VideosExtrasImageViewController updateViewConstraints](&v65, sel_updateViewConstraints);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasImageViewController;
  -[VideosExtrasImageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[VideosExtrasImageViewController setOverlayHidden:](self, "setOverlayHidden:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasImageViewController;
  -[VideosExtrasImageViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[VideosExtrasImageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasImageViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareZoomingImageTransitionWithContext:", v4);

  v6 = objc_msgSend(v4, "appearState");
  if (v6 == 1)
    -[VideosExtrasImageViewController setOverlayHidden:](self, "setOverlayHidden:", 0);
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performZoomingImageTransitionWithContext:", v4);

}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalizeZoomingImageTransitionWithContext:transitionFinished:", v6, v4);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[VideosExtrasImageViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    v4 = (id)-[VideosExtrasImageViewController view](self, "view");
  -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v8)
  {
    objc_msgSend(v5, "setImage:", v8);
    -[VideosExtrasImageViewController activityIndicatorView](self, "activityIndicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((((v8 != 0) ^ objc_msgSend(v7, "isAnimating")) & 1) == 0)
    {
      if (v8)
        objc_msgSend(v7, "stopAnimating");
      else
        objc_msgSend(v7, "startAnimating");
    }

  }
}

- (void)setTitleString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[VideosExtrasImageViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    v4 = (id)-[VideosExtrasImageViewController view](self, "view");
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v6);
  -[VideosExtrasImageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (NSAttributedString)titleString
{
  return -[UILabel attributedText](self->_titleLabel, "attributedText");
}

- (void)setSubtitleString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[VideosExtrasImageViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    v4 = (id)-[VideosExtrasImageViewController view](self, "view");
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v6);
  -[VideosExtrasImageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (NSAttributedString)subtitleString
{
  return -[UILabel attributedText](self->_subtitleLabel, "attributedText");
}

- (void)setDescriptionString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[VideosExtrasImageViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    v4 = (id)-[VideosExtrasImageViewController view](self, "view");
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v6);
  -[VideosExtrasImageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (NSAttributedString)descriptionString
{
  return -[UILabel attributedText](self->_descriptionLabel, "attributedText");
}

- (void)setImageIndex:(unint64_t)a3
{
  id v4;

  self->_imageIndex = a3;
  -[VideosExtrasImageViewController interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemIndex:", a3);

}

- (void)setAllowsPinchingImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_allowsPinchingImageForInteractiveZoomingImageTransition != a3)
  {
    v3 = a3;
    self->_allowsPinchingImageForInteractiveZoomingImageTransition = a3;
    -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pinchGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v3)
      {
        objc_msgSend(v9, "addTarget:action:", self, sel__handlePinch_);
        -[VideosExtrasImageViewController gestureRecognizers](self, "gestureRecognizers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arrayByAddingObject:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VideosExtrasImageViewController setGestureRecognizers:](self, "setGestureRecognizers:", v7);

      }
      else
      {
        objc_msgSend(v9, "removeTarget:action:", self, 0);
        -[VideosExtrasImageViewController gestureRecognizers](self, "gestureRecognizers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v6, "removeObject:", v9);
        -[VideosExtrasImageViewController setGestureRecognizers:](self, "setGestureRecognizers:", v6);
      }

    }
  }
}

- (void)setZoomingImageTransitionIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *zoomingImageTransitionIdentifier;
  id v7;

  if (self->_zoomingImageTransitionIdentifier != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    zoomingImageTransitionIdentifier = self->_zoomingImageTransitionIdentifier;
    self->_zoomingImageTransitionIdentifier = v5;

    -[VideosExtrasImageViewController interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v4);

  }
}

- (void)_handleDoubleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "state") == 3)
  {
    -[VideosExtrasImageViewController zoomableImageView](self, "zoomableImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoomScale");
    v6 = v5;
    objc_msgSend(v4, "minimumZoomScale");
    if (v6 >= v7 + 0.00000011920929)
    {
      objc_msgSend(v4, "setZoomScale:animated:", 1);
    }
    else
    {
      objc_msgSend(v8, "locationInView:", v4);
      objc_msgSend(v4, "zoomToPoint:animated:", 1);
    }

  }
}

- (void)_handlePinch:(id)a3
{
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VideosExtrasImageViewController interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext");
  v4 = (VideosExtrasZoomingImageInteractiveTransitionSourceContext *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
    -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setItemIndex:](v4, "setItemIndex:", -[VideosExtrasImageViewController imageIndex](self, "imageIndex"));
    -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setPinchGestureRecognizer:](v4, "setPinchGestureRecognizer:", v7);
    -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setSupportedZoomingImageTransitionDirections:](v4, "setSupportedZoomingImageTransitionDirections:", 2);
    -[VideosExtrasImageViewController zoomingImageTransitionIdentifier](self, "zoomingImageTransitionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setIdentifier:](v4, "setIdentifier:", v5);

    -[VideosExtrasImageViewController setInteractiveTransitionSourceContext:](self, "setInteractiveTransitionSourceContext:", v4);
  }
  -[VideosExtrasImageViewController targetForAction:withSender:](self, "targetForAction:withSender:", sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handlePinchGestureForZoomingImageInteractiveTransitionWithContext:", v4);

}

- (void)_handleSingleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[VideosExtrasImageViewController setOverlayHidden:](self, "setOverlayHidden:", -[VideosExtrasImageViewController overlayHidden](self, "overlayHidden") ^ 1);
}

- (void)setOverlayHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_overlayHidden = a3;
  -[VideosExtrasImageViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setNavigationBarHidden:edge:duration:", v3, 15, 0.3);

  -[UIView setHidden:](self->_textContainmentView, "setHidden:", v3);
}

- (unint64_t)imageIndex
{
  return self->_imageIndex;
}

- (BOOL)allowsPinchingImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingImageForInteractiveZoomingImageTransition;
}

- (NSString)zoomingImageTransitionIdentifier
{
  return self->_zoomingImageTransitionIdentifier;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (VideosExtrasZoomableImageView)zoomableImageView
{
  return self->_zoomableImageView;
}

- (void)setZoomableImageView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomableImageView, a3);
}

- (NSArray)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext
{
  return self->_interactiveTransitionSourceContext;
}

- (void)setInteractiveTransitionSourceContext:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, a3);
}

- (UIView)textContainmentView
{
  return self->_textContainmentView;
}

- (void)setTextContainmentView:(id)a3
{
  objc_storeStrong((id *)&self->_textContainmentView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (MPUContentSizeLayoutConstraint)topLabelConstraint
{
  return self->_topLabelConstraint;
}

- (void)setTopLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLabelConstraint, a3);
}

- (MPUContentSizeLayoutConstraint)subtitleLeadingConstraint
{
  return self->_subtitleLeadingConstraint;
}

- (void)setSubtitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLeadingConstraint, a3);
}

- (MPUContentSizeLayoutConstraint)descriptionLeadingConstraint
{
  return self->_descriptionLeadingConstraint;
}

- (void)setDescriptionLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLeadingConstraint, a3);
}

- (MPUContentSizeLayoutConstraint)bottomLabelConstraint
{
  return self->_bottomLabelConstraint;
}

- (void)setBottomLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, a3);
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainmentView, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_zoomableImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
}

@end
