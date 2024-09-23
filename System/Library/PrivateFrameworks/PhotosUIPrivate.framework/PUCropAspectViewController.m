@implementation PUCropAspectViewController

- (PUCropAspectViewController)initWithLayoutOrientation:(int64_t)a3 originalSize:(CGSize)a4 currentSize:(CGSize)a5 currentCropAspect:(id)a6 spec:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  id v15;
  id v16;
  PUCropAspectViewController *v17;
  PUCropAspectViewController *v18;
  void *v19;
  id v20;
  PUCropAspectViewController *v21;
  objc_super v23;
  _QWORD v24[4];

  height = a5.height;
  width = a5.width;
  v11 = a4.height;
  v12 = a4.width;
  v24[3] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PUCropAspectViewController;
  v17 = -[PUCropAspectViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    v17->_layoutOrientation = a3;
    v17->_currentCropSize.width = width;
    v17->_currentCropSize.height = height;
    v17->_originalSize.width = v12;
    v17->_originalSize.height = v11;
    objc_storeStrong((id *)&v17->_currentCropAspect, a6);
    objc_storeStrong((id *)&v18->_spec, a7);
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)-[PUCropAspectViewController registerForTraitChanges:withAction:](v18, "registerForTraitChanges:withAction:", v19, sel_traitEnvironment_didChangeTraitCollection_);

    v21 = v18;
  }

  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *scrollViewContainer;
  void *v6;
  void *v7;
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
  id v18;
  CEKEdgeGradientView *v19;
  CEKEdgeGradientView *gradientMask;
  UIScrollView *v21;
  UIScrollView *scrollView;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PUCropAspectViewController;
  -[PUCropAspectViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[PUCropAspectViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  scrollViewContainer = self->_scrollViewContainer;
  self->_scrollViewContainer = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_scrollViewContainer);
  -[UIView topAnchor](self->_scrollViewContainer, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIView bottomAnchor](self->_scrollViewContainer, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIView leftAnchor](self->_scrollViewContainer, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIView rightAnchor](self->_scrollViewContainer, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  v18 = objc_alloc(MEMORY[0x1E0D0D050]);
  v19 = (CEKEdgeGradientView *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  gradientMask = self->_gradientMask;
  self->_gradientMask = v19;

  -[CEKEdgeGradientView setEdgeGradientStyleMask](self->_gradientMask, "setEdgeGradientStyleMask");
  -[PUCropAspectViewController _updateScrollViewContainerMask](self, "_updateScrollViewContainerMask");
  v21 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v21;

  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", 1);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[PUCropAspectViewController spec](self, "spec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cropAspectRatioScrollContentInset");
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");

  -[UIView addSubview:](self->_scrollViewContainer, "addSubview:", self->_scrollView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  self->_aspectOrientation = -1;
  -[PUCropAspectViewController setAspectOrientation:](self, "setAspectOrientation:", self->_currentCropSize.width < self->_currentCropSize.height);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectViewController;
  -[PUCropAspectViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PUCropAspectViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CEKEdgeGradientView setFrame:](self->_gradientMask, "setFrame:");

  -[CEKEdgeGradientView setGradientDirection:](self->_gradientMask, "setGradientDirection:", 0);
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  -[CEKEdgeGradientView setGradientDimensions:](self->_gradientMask, "setGradientDimensions:", 0.0);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setAspectOrientation:(int64_t)a3
{
  double width;
  double height;

  if (self->_aspectOrientation != a3)
  {
    width = self->_originalSize.width;
    height = self->_originalSize.height;
    if ((!a3 && width < height || a3 == 1 && height < width)
      && self->_currentCropSize.width != self->_currentCropSize.height)
    {
      self->_originalSize.width = height;
      self->_originalSize.height = width;
    }
    self->_aspectOrientation = a3;
    -[PUCropAspectViewController updateAspectButtons](self, "updateAspectButtons");
  }
}

- (void)setCurrentCropAspect:(id)a3
{
  objc_storeStrong((id *)&self->_currentCropAspect, a3);
  -[PUCropAspectViewController updateAspectButtonSelection](self, "updateAspectButtonSelection");
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PUCropAspectViewController _updateScrollViewContainerMask](self, "_updateScrollViewContainerMask");
    -[PUCropAspectViewController updateAspectConstraints](self, "updateAspectConstraints");
  }
}

- (void)updateAspectButtonSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  -[PUCropAspectViewController currentCropAspect](self, "currentCropAspect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController matchingCropAspectTo:ignoreFreeform:](self, "matchingCropAspectTo:ignoreFreeform:", v3, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setSelected:", v8 == v13);
      ++v6;
      -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v6 < v12);
  }

}

- (id)matchingCropAspectTo:(id)a3 ignoreFreeform:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  double v17;
  BOOL v18;
  double v19;
  char v20;
  id v21;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v23 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v25;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
      -[PUCropAspectViewController currentCropAspect](self, "currentCropAspect");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToCropAspect:", v13))
        break;

      if (!v9)
        goto LABEL_12;
LABEL_19:
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
    if (!v23)
    {

LABEL_25:
      v21 = v12;

      goto LABEL_26;
    }
    v14 = objc_msgSend(v12, "isFreeformCrop");

    if ((v14 & 1) == 0)
      goto LABEL_25;
    if (v9)
      goto LABEL_19;
LABEL_12:
    v15 = v12;
    v16 = v15;
    if (objc_msgSend(v15, "allowOrientationChange"))
    {
      objc_msgSend(v15, "ratio");
      v18 = v17 >= 1.0;
      objc_msgSend(v5, "ratio");
      v20 = v18 ^ (v19 < 1.0);
      v16 = v15;
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v15, "inverseAspect");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (objc_msgSend(v16, "isEquivalentToCropAspect:", v5))
      v9 = v15;
    else
      v9 = 0;

    goto LABEL_19;
  }
  v9 = 0;
LABEL_23:

  v9 = v9;
  v21 = v9;
LABEL_26:

  return v21;
}

- (void)updateAspectButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *buttonContainer;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
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
  unint64_t v43;
  id v44;

  +[PUCropAspect allAspectsWithOriginalSize:currentSize:](PUCropAspect, "allAspectsWithOriginalSize:currentSize:", self->_originalSize.width, self->_originalSize.height, self->_currentCropSize.width, self->_currentCropSize.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController setAllAspectRatios:](self, "setAllAspectRatios:", v3);

  -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[PUCropAspectViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    buttonContainer = self->_buttonContainer;
    if (buttonContainer)
    {
      -[UIView removeFromSuperview](buttonContainer, "removeFromSuperview");
      v8 = self->_buttonContainer;
      self->_buttonContainer = 0;

    }
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v10 = self->_buttonContainer;
    self->_buttonContainer = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", self->_buttonContainer);
    -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v14, "setTag:", v13);
        objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_aspectButtonPressed_, 0x2000);
        -[UIView addSubview:](self->_buttonContainer, "addSubview:", v14);
        objc_msgSend(v5, "addObject:", v14);

        ++v13;
        -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v13 < v16);
    }
    -[PUCropAspectViewController setAspectButtons:](self, "setAspectButtons:", v5);

  }
  -[PUCropAspectViewController updateAspectConstraints](self, "updateAspectConstraints");
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resolvedColorWithTraitCollection:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.2);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  PXMonospacedNumberFontWithSize();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController spec](self, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cropAspectButtonColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resolvedColorWithTraitCollection:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropAspectViewController spec](self, "spec");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cropAspectButtonSelectedColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewController traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resolvedColorWithTraitCollection:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    v31 = 0;
    do
    {
      -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "localizedName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedUppercaseString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", 0, 0, v37, v20, v24, 0, 15.0, 7.0, 2.0, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", 0, 0, v37, v20, v28, v44, 15.0, 7.0, 2.0, 0);
      v39 = v28;
      v40 = v24;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setImage:forState:", v38, 0);
      objc_msgSend(v35, "setImage:forState:", v41, 4);

      v24 = v40;
      v28 = v39;

      ++v31;
      -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

    }
    while (v31 < v43);
  }
  -[PUCropAspectViewController updateAspectButtonSelection](self, "updateAspectButtonSelection");

}

- (void)updateAspectConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
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
  double v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIScrollView *scrollView;
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
  uint64_t v40;
  unint64_t v41;
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
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
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
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;

  -[PUCropAspectViewController aspectConstraints](self, "aspectConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUCropAspectViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropAspectViewController aspectConstraints](self, "aspectConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[PUCropAspectViewController setAspectConstraints:](self, "setAspectConstraints:", 0);
  }
  v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUCropAspectViewController layoutOrientation](self, "layoutOrientation"))
  {
    -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView leftAnchor](self->_buttonContainer, "leftAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "leftAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -5.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "addObject:", v15);

        -[UIView rightAnchor](self->_buttonContainer, "rightAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rightAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 5.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "addObject:", v18);

        objc_msgSend(v12, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v9, "bottomAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 10.0;
        }
        else
        {
          -[UIView topAnchor](self->_buttonContainer, "topAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0.0;
        }
        objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "addObject:", v22);

        ++v10;
        -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        v9 = v12;
      }
      while (v10 < v24);
      if (v12)
      {
        objc_msgSend(v12, "bottomAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_buttonContainer, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 0.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "addObject:", v27);

      }
    }
    else
    {
      v12 = 0;
    }
    -[UIScrollView heightAnchor](self->_scrollView, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_buttonContainer, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v61) = 1132068864;
    objc_msgSend(v60, "setPriority:", v61);
    objc_msgSend(v121, "addObject:", v60);
    -[UIView leftAnchor](self->_buttonContainer, "leftAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_scrollViewContainer, "leftAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v64);

    -[UIView rightAnchor](self->_buttonContainer, "rightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_scrollViewContainer, "rightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v67);

    -[UIView topAnchor](self->_buttonContainer, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v70);

    -[UIView bottomAnchor](self->_buttonContainer, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v73);

    -[UIScrollView heightAnchor](self->_scrollView, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](self->_scrollViewContainer, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v76);

    -[UIScrollView centerYAnchor](self->_scrollView, "centerYAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_scrollViewContainer, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v79);

    -[UIScrollView leftAnchor](self->_scrollView, "leftAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_scrollViewContainer, "leftAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v82);

    -[UIScrollView rightAnchor](self->_scrollView, "rightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_scrollViewContainer, "rightAnchor");
    v84 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    scrollView = self->_scrollView;
    -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](scrollView, "addSubview:", v30);

    -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_buttonContainer, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v34);

    -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_buttonContainer, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v38);

  }
  -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  if (!v40)
  {
    v12 = 0;
    goto LABEL_30;
  }
  v120 = v6;
  v12 = 0;
  v41 = 0;
  do
  {
    v42 = v12;
    -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView topAnchor](self->_buttonContainer, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -5.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v46);

    -[UIView bottomAnchor](self->_buttonContainer, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 5.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v49);

    if (v42)
    {
      objc_msgSend(v12, "leftAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "rightAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 10.0;
LABEL_18:
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "addObject:", v53);
      goto LABEL_21;
    }
    -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "leftAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v54)
    {
      -[UIView leftAnchor](self->_buttonContainer, "leftAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0.0;
      goto LABEL_18;
    }
    -[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "rightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v53, 10.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v55);

LABEL_21:
    ++v41;
    -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "count");

  }
  while (v41 < v57);
  if (v12)
  {
    objc_msgSend(v12, "rightAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_buttonContainer, "rightAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 0.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "addObject:", v87);

  }
  v6 = v120;
LABEL_30:
  -[PUCropAspectViewController spec](self, "spec");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "cropAspectRatioScrollContentInset");
  v90 = v89;
  v92 = v91;

  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_buttonContainer, "widthAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, v90 + v92);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v95) = 1132068864;
  objc_msgSend(v60, "setPriority:", v95);
  objc_msgSend(v121, "addObject:", v60);
  -[UIView leftAnchor](self->_buttonContainer, "leftAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v98);

  -[UIView rightAnchor](self->_buttonContainer, "rightAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v101);

  -[UIView topAnchor](self->_buttonContainer, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v104);

  -[UIView bottomAnchor](self->_buttonContainer, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v107);

  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_scrollViewContainer, "widthAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintLessThanOrEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v110);

  -[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollViewContainer, "centerXAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v113);

  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_scrollViewContainer, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v116);

  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollViewContainer, "bottomAnchor");
  v84 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v117 = (void *)v84;
  objc_msgSend(v83, "constraintEqualToAnchor:", v84);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "addObject:", v118);

  -[PUCropAspectViewController view](self, "view");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "addConstraints:", v121);

  -[PUCropAspectViewController setAspectConstraints:](self, "setAspectConstraints:", v121);
}

- (void)setScrollExtraLeftView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollExtraLeftView, a3);
  -[PUCropAspectViewController _updateScrollViewContainerMask](self, "_updateScrollViewContainerMask");
  -[PUCropAspectViewController updateAspectConstraints](self, "updateAspectConstraints");
}

- (void)aspectButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = objc_msgSend(a3, "tag");
  -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "tag") == v4);
      ++v7;
      -[PUCropAspectViewController aspectButtons](self, "aspectButtons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v7 < v11);
  }
  -[PUCropAspectViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PUCropAspectViewController allAspectRatios](self, "allAspectRatios");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isFreeformCrop"))
    {

      v15 = 0;
    }
    -[PUCropAspectViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cropAspectController:cropAspectSelected:", self, v15);

  }
}

- (void)_updateScrollViewContainerMask
{
  void *v3;
  CEKEdgeGradientView *gradientMask;

  if (-[PUCropAspectViewController layoutOrientation](self, "layoutOrientation")
    || (-[PUCropAspectViewController scrollExtraLeftView](self, "scrollExtraLeftView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    gradientMask = 0;
  }
  else
  {
    gradientMask = self->_gradientMask;
  }
  -[UIView setMaskView:](self->_scrollViewContainer, "setMaskView:", gradientMask);
}

- (CGSize)currentCropSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentCropSize.width;
  height = self->_currentCropSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentCropSize:(CGSize)a3
{
  self->_currentCropSize = a3;
}

- (PUCropAspect)currentCropAspect
{
  return self->_currentCropAspect;
}

- (PUCropAspectViewControllerDelegate)delegate
{
  return (PUCropAspectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)aspectOrientation
{
  return self->_aspectOrientation;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (UIView)scrollExtraLeftView
{
  return self->_scrollExtraLeftView;
}

- (CEKEdgeGradientView)gradientMask
{
  return self->_gradientMask;
}

- (void)setGradientMask:(id)a3
{
  objc_storeStrong((id *)&self->_gradientMask, a3);
}

- (UIView)scrollViewContainer
{
  return self->_scrollViewContainer;
}

- (void)setScrollViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewContainer, a3);
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (NSArray)aspectButtons
{
  return self->_aspectButtons;
}

- (void)setAspectButtons:(id)a3
{
  objc_storeStrong((id *)&self->_aspectButtons, a3);
}

- (NSArray)allAspectRatios
{
  return self->_allAspectRatios;
}

- (void)setAllAspectRatios:(id)a3
{
  objc_storeStrong((id *)&self->_allAspectRatios, a3);
}

- (CGSize)originalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalSize.width;
  height = self->_originalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (PUCropToolControllerSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSArray)aspectConstraints
{
  return self->_aspectConstraints;
}

- (void)setAspectConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_aspectConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectConstraints, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_allAspectRatios, 0);
  objc_storeStrong((id *)&self->_aspectButtons, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_scrollViewContainer, 0);
  objc_storeStrong((id *)&self->_gradientMask, 0);
  objc_storeStrong((id *)&self->_scrollExtraLeftView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentCropAspect, 0);
}

@end
