@implementation VideosExtrasCarouselCollectionViewCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VideosExtrasCarouselCollectionViewCell pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:", self, 0);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  -[VideosExtrasCarouselCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
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
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerViewHeightConstraint](self, "thumbnailImageContainerViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerHeight](self, "thumbnailImageContainerHeight");
  objc_msgSend(v3, "setConstant:");

  -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v7;
  if (objc_msgSend(v8, "length"))
  {

    v9 = 11;
    v10 = v4;
  }
  else
  {
    objc_msgSend(v4, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
      v10 = v4;
    else
      v10 = (void *)v7;
    if (v12)
      v9 = 11;
    else
      v9 = 4;
  }
  v13 = v10;
  -[VideosExtrasCarouselCollectionViewCell subtitleBaselineConstraint](self, "subtitleBaselineConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, "secondItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v13)
    {
      v17 = objc_msgSend(v15, "secondAttribute");

      if (v17 == v9)
        goto LABEL_15;
    }
    else
    {

    }
    objc_msgSend(v46, "removeConstraint:", v15);

    -[VideosExtrasCarouselCollectionViewCell setSubtitleBaselineConstraint:](self, "setSubtitleBaselineConstraint:", 0);
  }
  v18 = (void *)MEMORY[0x1E0D46958];
  -[VideosExtrasCarouselCollectionViewCell subtitleTextStyle](self, "subtitleTextStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", v5, v13, v9, v19, 25.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "addConstraint:", v15);
  -[VideosExtrasCarouselCollectionViewCell setSubtitleBaselineConstraint:](self, "setSubtitleBaselineConstraint:", v15);
LABEL_15:
  objc_msgSend(v5, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v13;
  if (objc_msgSend(v20, "length"))
  {
    v21 = v5;
LABEL_17:

    v22 = 11;
    goto LABEL_20;
  }
  objc_msgSend(v5, "attributedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v22 = 11;
    v21 = v5;
  }
  else
  {
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      v21 = v4;
      goto LABEL_17;
    }
    objc_msgSend(v4, "attributedText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (v36)
      v21 = v4;
    else
      v21 = v45;
    if (v36)
      v22 = 11;
    else
      v22 = 4;
  }
LABEL_20:
  v25 = v21;
  -[VideosExtrasCarouselCollectionViewCell descriptionLabelBaselineConstraint](self, "descriptionLabelBaselineConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = v26;
    objc_msgSend(v26, "secondItem");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28 == v25)
    {
      v29 = objc_msgSend(v27, "secondAttribute");

      if (v29 == v22)
        goto LABEL_26;
    }
    else
    {

    }
    objc_msgSend(v46, "removeConstraint:", v27);

    -[VideosExtrasCarouselCollectionViewCell setDescriptionLabelBaselineConstraint:](self, "setDescriptionLabelBaselineConstraint:", 0);
  }
  v30 = (void *)MEMORY[0x1E0D46958];
  -[VideosExtrasCarouselCollectionViewCell descriptionTextStyle](self, "descriptionTextStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", v6, v25, v22, v31, 40.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "addConstraint:", v27);
  -[VideosExtrasCarouselCollectionViewCell setDescriptionLabelBaselineConstraint:](self, "setDescriptionLabelBaselineConstraint:", v27);
LABEL_26:
  objc_msgSend(v4, "text");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v32, "length"))
  {
    objc_msgSend(v4, "attributedText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "length"))
    {
      objc_msgSend(v5, "text");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "length"))
      {
        objc_msgSend(v5, "attributedText");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v43, "length"))
        {
          objc_msgSend(v6, "text");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v42, "length"))
          {
            objc_msgSend(v6, "attributedText");
            v40 = v34;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v37, "length");

            if (v41)
              goto LABEL_36;
            -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerViewConstraints](self, "thumbnailImageContainerViewConstraints");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "removeConstraints:", v38);

            v39 = (void *)MEMORY[0x1E0CB3718];
            -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "constraintsByAttachingView:toView:alongEdges:insets:", v32, v46, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addConstraints:", v33);
            goto LABEL_34;
          }

        }
      }

    }
LABEL_34:

  }
LABEL_36:
  v47.receiver = self;
  v47.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  -[VideosExtrasCarouselCollectionViewCell updateConstraints](&v47, sel_updateConstraints);

}

- (void)prepareForReuse
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__VideosExtrasCarouselCollectionViewCell_prepareForReuse__block_invoke;
  v4[3] = &unk_1E9F98DF0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  -[VideosExtrasCarouselCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[VideosExtrasCarouselCollectionViewCell setTitleText:](self, "setTitleText:", 0);
  -[VideosExtrasCarouselCollectionViewCell setSubtitleText:](self, "setSubtitleText:", 0);
  -[VideosExtrasCarouselCollectionViewCell setDescriptionText:](self, "setDescriptionText:", 0);
  -[VideosExtrasCarouselCollectionViewCell setThumbnailImage:](self, "setThumbnailImage:", 0);
  -[VideosExtrasCarouselCollectionViewCell setThumbnailImagePlaceholder:](self, "setThumbnailImagePlaceholder:", 0);
  -[VideosExtrasCarouselCollectionViewCell setItemIndex:](self, "setItemIndex:", 0);
  -[VideosExtrasCarouselCollectionViewCell setThumbnailOverlayImage:](self, "setThumbnailOverlayImage:", 0);
  -[VideosExtrasCarouselCollectionViewCell clearArtworkCatalogs](self, "clearArtworkCatalogs");
}

void __57__VideosExtrasCarouselCollectionViewCell_prepareForReuse__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailImageContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlighted:", 0);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasCarouselCollectionViewCell;
  -[VideosExtrasCarouselCollectionViewCell setHighlighted:](&v7, sel_setHighlighted_);
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:animated:", v3, v3 ^ 1);

}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "appearState") == 1)
  {
    objc_msgSend(v7, "zoomingImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replicateStateFromImageView:", v5);

  }
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "appearState"))
  {
    objc_msgSend(v7, "zoomingImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicateStateFromImageView:", v6);

  }
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  void *v4;
  id v5;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (id)thumbnailImage
{
  void *v2;
  void *v3;
  void *v4;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v4);

  -[VideosExtrasCarouselCollectionViewCell _updateThumbnailArtworkViewBorder](self, "_updateThumbnailArtworkViewBorder");
}

- (void)setThumbnailBorderColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGColor");

  objc_msgSend(v6, "setBorderColor:", v8);
}

- (id)thumbnailImagePlaceholder
{
  void *v2;
  void *v3;
  void *v4;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setThumbnailImagePlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholderImage:", v4);

  -[VideosExtrasCarouselCollectionViewCell _updateThumbnailArtworkViewBorder](self, "_updateThumbnailArtworkViewBorder");
}

- (void)setThumbnailOverlayImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayImage:", v4);

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlayScale:", 0.2);

}

- (id)thumbnailImageAccessibilityText
{
  void *v2;
  void *v3;
  void *v4;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setThumbnailImageAccessibilityText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (id)titleText
{
  void *v2;
  void *v3;

  -[VideosExtrasCarouselCollectionViewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)subtitleText
{
  void *v2;
  void *v3;

  -[VideosExtrasCarouselCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSubtitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)descriptionText
{
  void *v2;
  void *v3;

  -[VideosExtrasCarouselCollectionViewCell descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell descriptionLabel](self, "descriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)lockupElement
{
  return 0;
}

- (void)setAllowsPinchingThumbnailImageForInteractiveZoomingImageTransition:(BOOL)a3
{
  void *v4;
  void *v5;
  VideosExtrasZoomingImageInteractiveTransitionSourceContext *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition != a3)
  {
    self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition = a3;
    if (a3)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinchGesture_);
      -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "artworkView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addGestureRecognizer:", v10);

      -[VideosExtrasCarouselCollectionViewCell setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", v10);
      v6 = objc_alloc_init(VideosExtrasZoomingImageInteractiveTransitionSourceContext);
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setPinchGestureRecognizer:](v6, "setPinchGestureRecognizer:", v10);
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setItemIndex:](v6, "setItemIndex:", -[VideosExtrasCarouselCollectionViewCell itemIndex](self, "itemIndex"));
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setSupportedZoomingImageTransitionDirections:](v6, "setSupportedZoomingImageTransitionDirections:", 3);
      -[VideosExtrasCarouselCollectionViewCell zoomingImageTransitionIdentifier](self, "zoomingImageTransitionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasZoomingImageInteractiveTransitionSourceContext setIdentifier:](v6, "setIdentifier:", v7);

      -[VideosExtrasCarouselCollectionViewCell setInteractiveTransitionSourceContext:](self, "setInteractiveTransitionSourceContext:", v6);
    }
    else
    {
      -[VideosExtrasCarouselCollectionViewCell pinchGestureRecognizer](self, "pinchGestureRecognizer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "artworkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeGestureRecognizer:", v11);

      objc_msgSend(v11, "removeTarget:action:", self, 0);
      -[VideosExtrasCarouselCollectionViewCell setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", 0);
      -[VideosExtrasCarouselCollectionViewCell setInteractiveTransitionSourceContext:](self, "setInteractiveTransitionSourceContext:", 0);

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

    -[VideosExtrasCarouselCollectionViewCell interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v4);

  }
}

- (CGSize)thumbnailMaxSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
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

- (void)setWindowSize:(CGSize)a3
{
  double width;
  double height;
  id v8;
  void *v9;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  if (width != a3.width || height != a3.height)
  {
    self->_windowSize = a3;
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[VideosExtrasCarouselCollectionViewCell _setupThumbnailImageContainerViewWithConstraintsAccumulator:](self, "_setupThumbnailImageContainerViewWithConstraintsAccumulator:", v8);
      -[VideosExtrasCarouselCollectionViewCell _setupTitleLabelWithConstraintsAccumulator:](self, "_setupTitleLabelWithConstraintsAccumulator:", v8);
      -[VideosExtrasCarouselCollectionViewCell _setupSubtitleLabelWithConstraintsAccumulator:](self, "_setupSubtitleLabelWithConstraintsAccumulator:", v8);
      -[VideosExtrasCarouselCollectionViewCell _setupDescriptionLabelWithConstraintsAccumulator:](self, "_setupDescriptionLabelWithConstraintsAccumulator:", v8);
      -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addConstraints:", v8);

    }
    -[VideosExtrasCarouselCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (double)thumbnailImageContainerHeight
{
  double result;

  -[VideosExtrasCarouselCollectionViewCell windowSize](self, "windowSize");
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (void)setItemIndex:(unint64_t)a3
{
  id v4;

  self->_itemIndex = a3;
  -[VideosExtrasCarouselCollectionViewCell interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemIndex:", a3);

}

- (void)_handlePinchGesture:(id)a3
{
  void *v4;
  id v5;

  -[VideosExtrasCarouselCollectionViewCell interactiveTransitionSourceContext](self, "interactiveTransitionSourceContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell targetForAction:withSender:](self, "targetForAction:withSender:", sel_handlePinchGestureForZoomingImageInteractiveTransitionWithContext_, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlePinchGestureForZoomingImageInteractiveTransitionWithContext:", v5);

}

- (double)_descriptionLabelTopInset
{
  double result;

  -[VideosExtrasCarouselCollectionViewCell windowSize](self, "windowSize");
  MPULayoutLinearRelationMake();
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (void)_setupThumbnailImageContainerViewWithConstraintsAccumulator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[VideosExtrasConstrainedArtworkContainerView initForAutolayout]([VideosExtrasConstrainedArtworkContainerView alloc], "initForAutolayout");
  objc_msgSend(v5, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDimsWhenHighlighted:", 1);
  objc_msgSend(v6, "setForcesAnimatedUnhighlighting:", 1);
  objc_msgSend(v6, "setMultipleTouchEnabled:", 1);
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v9, "addSubview:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v9, 11, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell setThumbnailImageContainerViewConstraints:](self, "setThumbnailImageContainerViewConstraints:", v7);
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 8, 0, 0, 0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v8);
  -[VideosExtrasCarouselCollectionViewCell setThumbnailImageContainerViewHeightConstraint:](self, "setThumbnailImageContainerViewHeightConstraint:", v8);
  -[VideosExtrasCarouselCollectionViewCell setThumbnailImageContainerView:](self, "setThumbnailImageContainerView:", v5);

}

- (void)_setupTitleLabelWithConstraintsAccumulator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v6, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v15, "insertSubview:belowSubview:", v6, v5);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v9);
  v10 = (void *)MEMORY[0x1E0D46958];
  -[VideosExtrasCarouselCollectionViewCell titleTextStyle](self, "titleTextStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v6, 0, v5, 4, v11, 1.0, 34.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v15, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, -1, v15, 4, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  -[VideosExtrasCarouselCollectionViewCell setTitleLabel:](self, "setTitleLabel:", v6);
}

- (void)_setupSubtitleLabelWithConstraintsAccumulator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v6, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v12, "insertSubview:belowSubview:", v6, v5);
  LODWORD(v9) = 1144733696;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v6, v12, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, -1, v12, 4, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  -[VideosExtrasCarouselCollectionViewCell setSubtitleLabel:](self, "setSubtitleLabel:", v6);
}

- (void)_setupDescriptionLabelWithConstraintsAccumulator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSubview:belowSubview:", v5, v8);

  LODWORD(v9) = 1144717312;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v12, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, -1, v12, 4, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  -[VideosExtrasCarouselCollectionViewCell setDescriptionLabel:](self, "setDescriptionLabel:", v5);
}

- (void)_updateThumbnailArtworkViewBorder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[VideosExtrasCarouselCollectionViewCell thumbnailImageContainerView](self, "thumbnailImageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "setBorderWidth:", 1.0 / v7);

  }
  else
  {
    objc_msgSend(v4, "setBorderWidth:", 0.0);
  }

}

- (VideosExtrasConstrainedArtworkContainerView)thumbnailImageContainerView
{
  return self->_thumbnailImageContainerView;
}

- (void)setThumbnailImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageContainerView, a3);
}

- (NSLayoutConstraint)thumbnailImageContainerViewHeightConstraint
{
  return self->_thumbnailImageContainerViewHeightConstraint;
}

- (void)setThumbnailImageContainerViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewHeightConstraint, a3);
}

- (NSArray)thumbnailImageContainerViewConstraints
{
  return self->_thumbnailImageContainerViewConstraints;
}

- (void)setThumbnailImageContainerViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewConstraints, a3);
}

- (MPUContentSizeLayoutConstraint)subtitleBaselineConstraint
{
  return self->_subtitleBaselineConstraint;
}

- (void)setSubtitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, a3);
}

- (MPUContentSizeLayoutConstraint)descriptionLabelBaselineConstraint
{
  return self->_descriptionLabelBaselineConstraint;
}

- (void)setDescriptionLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabelBaselineConstraint, a3);
}

- (UIView)textContainer
{
  return self->_textContainer;
}

- (void)setTextContainer:(id)a3
{
  objc_storeStrong((id *)&self->_textContainer, a3);
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

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (VideosExtrasZoomingImageInteractiveTransitionSourceContext)interactiveTransitionSourceContext
{
  return self->_interactiveTransitionSourceContext;
}

- (void)setInteractiveTransitionSourceContext:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, a3);
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (BOOL)allowsPinchingThumbnailImageForInteractiveZoomingImageTransition
{
  return self->_allowsPinchingThumbnailImageForInteractiveZoomingImageTransition;
}

- (NSString)zoomingImageTransitionIdentifier
{
  return self->_zoomingImageTransitionIdentifier;
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingImageTransitionIdentifier, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionSourceContext, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_descriptionLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewConstraints, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailImageContainerView, 0);
}

@end
