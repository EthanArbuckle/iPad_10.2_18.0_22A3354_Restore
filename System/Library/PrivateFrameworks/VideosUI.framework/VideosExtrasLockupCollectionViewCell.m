@implementation VideosExtrasLockupCollectionViewCell

- (VideosExtrasLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  VideosExtrasLockupCollectionViewCell *v3;
  uint64_t v4;
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIView *textContainerView;
  uint64_t v15;
  UILabel *titleLabel;
  double v17;
  void *v18;
  uint64_t v19;
  UILabel *subtitleLabel;
  double v21;
  void *v22;
  uint64_t v23;
  UILabel *descriptionLabel;
  double v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *artworkContainerWidthConstraint;
  double v29;
  uint64_t v30;
  NSLayoutConstraint *artworkContainerHeightConstraint;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  UILabel *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  v3 = -[VideosExtrasLockupCollectionViewCell initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[VideosExtrasConstrainedArtworkContainerView initForAutolayout]([VideosExtrasConstrainedArtworkContainerView alloc], "initForAutolayout");
    artworkContainerView = v3->_artworkContainerView;
    v3->_artworkContainerView = (VideosExtrasConstrainedArtworkContainerView *)v4;

    -[VideosExtrasConstrainedArtworkContainerView setUserInteractionEnabled:](v3->_artworkContainerView, "setUserInteractionEnabled:", 1);
    -[VideosExtrasConstrainedArtworkContainerView setMultipleTouchEnabled:](v3->_artworkContainerView, "setMultipleTouchEnabled:", 1);
    -[VideosExtrasConstrainedArtworkContainerView artworkView](v3->_artworkContainerView, "artworkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    -[VideosExtrasConstrainedArtworkContainerView artworkView](v3->_artworkContainerView, "artworkView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMultipleTouchEnabled:", 1);

    -[VideosExtrasConstrainedArtworkContainerView artworkView](v3->_artworkContainerView, "artworkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDimsWhenHighlighted:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[VideosExtrasConstrainedArtworkContainerView artworkView](v3->_artworkContainerView, "artworkView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderColor:", v10);

    -[VideosExtrasLockupCollectionViewCell addSubview:](v3, "addSubview:", v3->_artworkContainerView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = (UIView *)v13;

    -[VideosExtrasLockupCollectionViewCell addSubview:](v3, "addSubview:", v3->_textContainerView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    LODWORD(v17) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v3->_titleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v18);

    -[VideosExtrasLockupCollectionViewCell addSubview:](v3, "addSubview:", v3->_titleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v19;

    LODWORD(v21) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v3->_subtitleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_subtitleLabel, "setBackgroundColor:", v22);

    -[VideosExtrasLockupCollectionViewCell addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v23;

    LODWORD(v25) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v3->_descriptionLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_descriptionLabel, "setBackgroundColor:", v26);

    -[VideosExtrasLockupCollectionViewCell addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainerView, 5, 0, v3, 5, 1.0, 0.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainerView, 10, 0, v3, 10, 1.0, 0.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainerView, 8, -1, v3, 8, 1.0, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainerView, 7, 0, 0, 0, 1.0, v3->_artworkSize.width);
    v27 = objc_claimAutoreleasedReturnValue();
    artworkContainerWidthConstraint = v3->_artworkContainerWidthConstraint;
    v3->_artworkContainerWidthConstraint = (NSLayoutConstraint *)v27;

    LODWORD(v29) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_artworkContainerWidthConstraint, "setPriority:", v29);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainerView, 8, 0, 0, 0, 1.0, v3->_artworkSize.height);
    v30 = objc_claimAutoreleasedReturnValue();
    artworkContainerHeightConstraint = v3->_artworkContainerHeightConstraint;
    v3->_artworkContainerHeightConstraint = (NSLayoutConstraint *)v30;

    LODWORD(v32) = 1148829696;
    -[NSLayoutConstraint setPriority:](v3->_artworkContainerHeightConstraint, "setPriority:", v32);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 8, -1, v3->_artworkContainerView, 8, 1.0, 0.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 3, 1, v3, 3, 1.0, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 4, -1, v3, 4, 1.0, 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 5, 0, v3->_artworkContainerView, 6, 1.0, 20.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 6, 0, v3, 6, 1.0, -20.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_textContainerView, 10, 0, v3, 10, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_titleLabel, 3, 0, v3->_textContainerView, 3, 1.0, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0DC49E8];
    v34 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v35 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v36 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_titleLabel, v3->_textContainerView, 10, *MEMORY[0x1E0DC49E8], v34, v35, v36);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0D46958];
    v38 = v3->_subtitleLabel;
    v39 = v3->_titleLabel;
    -[VideosExtrasLockupCollectionViewCell subtitleTextStyle](v3, "subtitleTextStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", v38, v39, 11, v40, 20.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_subtitleLabel, v3->_textContainerView, 10, v33, v34, v35, v36);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_descriptionLabel, v3->_textContainerView, 10, v33, v34, v35, v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_descriptionLabel, 4, -1, v3->_textContainerView, 4, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v57);
    objc_msgSend(v43, "addObject:", v56);
    objc_msgSend(v43, "addObject:", v55);
    objc_msgSend(v43, "addObject:", v3->_artworkContainerWidthConstraint);
    objc_msgSend(v43, "addObject:", v3->_artworkContainerHeightConstraint);
    objc_msgSend(v43, "addObject:", v54);
    objc_msgSend(v43, "addObject:", v53);
    objc_msgSend(v43, "addObject:", v52);
    objc_msgSend(v43, "addObject:", v51);
    objc_msgSend(v43, "addObject:", v50);
    objc_msgSend(v43, "addObject:", v49);
    objc_msgSend(v43, "addObject:", v48);
    objc_msgSend(v43, "addObjectsFromArray:", v47);
    objc_msgSend(v43, "addObject:", v41);
    objc_msgSend(v43, "addObjectsFromArray:", v46);
    objc_msgSend(v43, "addObjectsFromArray:", v42);
    objc_msgSend(v43, "addObject:", v45);
    -[VideosExtrasLockupCollectionViewCell addConstraints:](v3, "addConstraints:", v43);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  -[VideosExtrasLockupCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholderImage:", 0);

  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[VideosExtrasConstrainedArtworkContainerView setOverlayImage:](self->_artworkContainerView, "setOverlayImage:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", 0);
  -[UILabel setFont:](self->_titleLabel, "setFont:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", 0);
  -[UILabel setText:](self->_descriptionLabel, "setText:", 0);
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", 0);
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", 0);
}

- (void)setTitleText:(id)a3
{
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", a3);
}

- (id)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setSubtitleText:(id)a3
{
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", a3);
}

- (id)subtitleText
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setDescriptionText:(id)a3
{
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", a3);
}

- (id)descriptionText
{
  return -[UILabel text](self->_descriptionLabel, "text");
}

- (void)setThumbnailImage:(id)a3
{
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  artworkContainerView = self->_artworkContainerView;
  v4 = a3;
  -[VideosExtrasConstrainedArtworkContainerView artworkView](artworkContainerView, "artworkView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v4);

  objc_msgSend(v10, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = 1.0 / v7;

  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(v10, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", v8);

}

- (void)setThumbnailBorderColor:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void)setThumbnailImagePlaceholder:(id)a3
{
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  id v4;
  id v5;

  artworkContainerView = self->_artworkContainerView;
  v4 = a3;
  -[VideosExtrasConstrainedArtworkContainerView artworkView](artworkContainerView, "artworkView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderImage:", v4);

}

- (void)setThumbnailImageAccessibilityText:(id)a3
{
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  id v4;
  id v5;

  artworkContainerView = self->_artworkContainerView;
  v4 = a3;
  -[VideosExtrasConstrainedArtworkContainerView artworkView](artworkContainerView, "artworkView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  UIPinchGestureRecognizer *v4;
  void *v5;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *v7;
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *interactiveTransitionSourceContext;
  void *v9;
  UIPinchGestureRecognizer *v10;
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *v11;
  UIPinchGestureRecognizer *v12;

  if (self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition != a3)
  {
    self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition = a3;
    if (a3)
    {
      v4 = (UIPinchGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinchGesture_);
      -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addGestureRecognizer:", v4);

      pinchGestureRecognizer = self->_pinchGestureRecognizer;
      self->_pinchGestureRecognizer = v4;
      v12 = v4;

      v7 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setPinchGestureRecognizer:](v7, "setPinchGestureRecognizer:", v12);
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setItemIndex:](v7, "setItemIndex:", -[VideosExtrasLockupCollectionViewCell itemIndex](self, "itemIndex"));
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setSupportedZoomingImageTransitionDirections:](v7, "setSupportedZoomingImageTransitionDirections:", 3);
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setIdentifier:](v7, "setIdentifier:", self->_zoomingImageTransitionIdentifier);
      interactiveTransitionSourceContext = self->_interactiveTransitionSourceContext;
      self->_interactiveTransitionSourceContext = v7;

    }
    else
    {
      -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeGestureRecognizer:", self->_pinchGestureRecognizer);

      -[UIPinchGestureRecognizer removeTarget:action:](self->_pinchGestureRecognizer, "removeTarget:action:", self, 0);
      v10 = self->_pinchGestureRecognizer;
      self->_pinchGestureRecognizer = 0;

      v11 = self->_interactiveTransitionSourceContext;
      self->_interactiveTransitionSourceContext = 0;

    }
  }
}

- (void)_handlePinchGesture:(id)a3
{
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *v4;
  id v5;

  v4 = self->_interactiveTransitionSourceContext;
  -[VideosExtrasLockupCollectionViewCell targetForAction:withSender:](self, "targetForAction:withSender:", sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePinchGestureForZoomingImageInteractiveTransitionWithContext:", v4);

}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
  -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setItemIndex:](self->_interactiveTransitionSourceContext, "setItemIndex:");
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (id)thumbnailImage
{
  void *v2;
  void *v3;

  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E0DC4A88];
}

- (id)subtitleTextStyle
{
  return (id)*MEMORY[0x1E0DC4B10];
}

- (id)descriptionTextStyle
{
  return (id)*MEMORY[0x1E0DC4AB8];
}

- (void)setThumbnailMaxSize:(CGSize)a3
{
  if (self->_artworkSize.width != a3.width || self->_artworkSize.height != a3.height)
  {
    self->_artworkSize = a3;
    -[VideosExtrasLockupCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (CGSize)thumbnailMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailOverlayImage:(id)a3
{
  -[VideosExtrasConstrainedArtworkContainerView setOverlayImage:](self->_artworkContainerView, "setOverlayImage:", a3);
  -[VideosExtrasConstrainedArtworkContainerView setOverlayScale:](self->_artworkContainerView, "setOverlayScale:", 0.2);
}

- (void)updateConstraints
{
  CGSize *p_artworkSize;
  void *v4;
  uint64_t v5;
  void *titleLabel;
  uint64_t v7;
  id v8;
  NSLayoutConstraint *subtitleBaselineConstraint;
  id v10;
  NSLayoutAttribute v11;
  NSLayoutConstraint *v12;
  void *v13;
  UILabel *subtitleLabel;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  void *v18;
  UILabel **p_subtitleLabel;
  UILabel *v20;
  void *v21;
  uint64_t v22;
  VideosExtrasLockupCollectionViewCell *v23;
  uint64_t v24;
  VideosExtrasLockupCollectionViewCell *v25;
  NSLayoutConstraint *descriptionBaselineConstraint;
  VideosExtrasLockupCollectionViewCell *v27;
  NSLayoutAttribute v28;
  NSLayoutConstraint *v29;
  void *v30;
  UILabel *descriptionLabel;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *v34;
  objc_super v35;

  p_artworkSize = &self->_artworkSize;
  -[NSLayoutConstraint setConstant:](self->_artworkContainerWidthConstraint, "setConstant:", self->_artworkSize.width);
  -[NSLayoutConstraint setConstant:](self->_artworkContainerHeightConstraint, "setConstant:", p_artworkSize->height);
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    titleLabel = self->_titleLabel;
    v7 = 11;
  }
  else
  {
    v7 = 3;
    titleLabel = self;
  }
  v8 = titleLabel;
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    -[NSLayoutConstraint secondItem](subtitleBaselineConstraint, "secondItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v8)
    {
      v11 = -[NSLayoutConstraint secondAttribute](self->_subtitleBaselineConstraint, "secondAttribute");

      if (v11 == v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[VideosExtrasLockupCollectionViewCell removeConstraint:](self, "removeConstraint:", self->_subtitleBaselineConstraint);
    v12 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_9:
    if (self->_subtitleBaselineConstraint)
      goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x1E0D46958];
  subtitleLabel = self->_subtitleLabel;
  -[VideosExtrasLockupCollectionViewCell subtitleTextStyle](self, "subtitleTextStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", subtitleLabel, 0, v8, v7, v15, 1.0, 20.0);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v17 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v16;

LABEL_11:
  -[UILabel text](self->_subtitleLabel, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
    p_subtitleLabel = &self->_subtitleLabel;
  else
    p_subtitleLabel = &self->_titleLabel;
  v20 = *p_subtitleLabel;

  -[UILabel text](v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
    v23 = (VideosExtrasLockupCollectionViewCell *)v20;
  else
    v23 = self;
  if (v22)
    v24 = 11;
  else
    v24 = 3;
  v25 = v23;
  descriptionBaselineConstraint = self->_descriptionBaselineConstraint;
  if (!descriptionBaselineConstraint)
    goto LABEL_26;
  -[NSLayoutConstraint secondItem](descriptionBaselineConstraint, "secondItem");
  v27 = (VideosExtrasLockupCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  if (v27 == v25)
  {
    v28 = -[NSLayoutConstraint secondAttribute](self->_descriptionBaselineConstraint, "secondAttribute");

    if (v28 == v24)
      goto LABEL_25;
  }
  else
  {

  }
  -[VideosExtrasLockupCollectionViewCell removeConstraint:](self, "removeConstraint:", self->_descriptionBaselineConstraint);
  v29 = self->_descriptionBaselineConstraint;
  self->_descriptionBaselineConstraint = 0;

LABEL_25:
  if (!self->_descriptionBaselineConstraint)
  {
LABEL_26:
    v30 = (void *)MEMORY[0x1E0D46958];
    descriptionLabel = self->_descriptionLabel;
    -[VideosExtrasLockupCollectionViewCell descriptionTextStyle](self, "descriptionTextStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", descriptionLabel, v25, v24, v32, 30.0);
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v34 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = v33;

    -[VideosExtrasLockupCollectionViewCell addConstraint:](self, "addConstraint:", self->_descriptionBaselineConstraint);
  }
  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  -[VideosExtrasLockupCollectionViewCell updateConstraints](&v35, sel_updateConstraints);

}

- (void)setZoomingImageTransitionIdentifier:(id)a3
{
  NSString *v4;
  NSString *zoomingImageTransitionIdentifier;

  if (self->_zoomingImageTransitionIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    zoomingImageTransitionIdentifier = self->_zoomingImageTransitionIdentifier;
    self->_zoomingImageTransitionIdentifier = v4;

    -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setIdentifier:](self->_interactiveTransitionSourceContext, "setIdentifier:", self->_zoomingImageTransitionIdentifier);
  }
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "appearState") == 1)
  {
    objc_msgSend(v7, "zoomingImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicateStateFromImageView:", v5);

  }
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "appearState"))
  {
    objc_msgSend(v6, "zoomingImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicateStateFromImageView:", v5);

  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  id v4;

  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasLockupCollectionViewCell;
  -[VideosExtrasLockupCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (IKLockupElement)lockup
{
  return (IKLockupElement *)objc_loadWeakRetained((id *)&self->_lockup);
}

- (void)setLockup:(id)a3
{
  objc_storeWeak((id *)&self->_lockup, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockup);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptionBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_artworkContainerView, 0);
}

@end
