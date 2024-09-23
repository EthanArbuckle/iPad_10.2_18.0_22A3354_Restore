@implementation PUReviewScreenControlBar

- (PUReviewScreenControlBar)initWithFrame:(CGRect)a3
{
  PUReviewScreenControlBar *v3;
  PUReviewScreenControlBar *v4;
  uint64_t v5;
  UIButton *editButton;
  UIButton *v7;
  void *v8;
  uint64_t v9;
  UIButton *markupButton;
  UIButton *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  UIButton *funEffectsButton;
  UIButton *v20;
  void *v21;
  uint64_t v22;
  UIButton *sendButton;
  UIButton *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PUReviewScreenControlBar *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSSet *availableButtons;
  uint64_t v44;
  NSSet *enabledButtons;
  void *v47;
  void *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _QWORD v55[3];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)PUReviewScreenControlBar;
  v3 = -[PUReviewScreenControlBar initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUReviewScreenControlBar _updateBackgroundTransparency](v3, "_updateBackgroundTransparency");
    +[PUReviewScreenControlBarButton buttonWithType:](PUReviewScreenControlBarButton, "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    editButton = v4->_editButton;
    v4->_editButton = (UIButton *)v5;

    v7 = v4->_editButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenEditButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v7, "setImage:forState:", v8, 0);

    +[PUReviewScreenControlBarButton buttonWithType:](PUReviewScreenControlBarButton, "buttonWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    markupButton = v4->_markupButton;
    v4->_markupButton = (UIButton *)v9;

    v11 = v4->_markupButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenMarkupButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v11, "setImage:forState:", v12, 0);

    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenFunEffectsInactiveButton"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenFunEffectsActiveButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pu_tintedImageWithColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithRenderingMode:", 1);
    v17 = objc_claimAutoreleasedReturnValue();

    +[PUReviewScreenControlBarButton buttonWithType:](PUReviewScreenControlBarButton, "buttonWithType:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    funEffectsButton = v4->_funEffectsButton;
    v4->_funEffectsButton = (UIButton *)v18;

    v20 = v4->_funEffectsButton;
    PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_FUN_EFFECTS"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v20, "setTitle:forState:", v21, 0);

    v48 = (void *)v13;
    -[UIButton setImage:forState:](v4->_funEffectsButton, "setImage:forState:", v13, 0);
    -[UIButton setImage:forState:](v4->_funEffectsButton, "setImage:forState:", v17, 4);
    v47 = (void *)v17;
    -[UIButton setImage:forState:](v4->_funEffectsButton, "setImage:forState:", v17, 5);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v22 = objc_claimAutoreleasedReturnValue();
    sendButton = v4->_sendButton;
    v4->_sendButton = (UIButton *)v22;

    v24 = v4->_sendButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUReviewScreenSendButton"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageWithRenderingMode:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v24, "setImage:forState:", v26, 0);

    -[UIButton setContentHorizontalAlignment:](v4->_sendButton, "setContentHorizontalAlignment:", 3);
    -[UIButton setContentVerticalAlignment:](v4->_sendButton, "setContentVerticalAlignment:", 3);
    -[PUReviewScreenControlBar _updateButtonText](v4, "_updateButtonText");
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v55[0] = v4->_editButton;
    v55[1] = v4->_markupButton;
    v55[2] = v4->_funEffectsButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      v30 = *MEMORY[0x1E0DC4918];
      v31 = *MEMORY[0x1E0DC4AA0];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          -[PUReviewScreenControlBar addSubview:](v4, "addSubview:", v33);
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.560784314);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTitleColor:forState:", v34, 0);

          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTitleColor:forState:", v35, 4);

          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTitleColor:forState:", v36, 5);

          objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v31, v37);
          v38 = v4;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "titleLabel");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setFont:", v39);

          v4 = v38;
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v28);
    }

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewScreenControlBar setTintColor:](v4, "setTintColor:", v41);

    -[PUReviewScreenControlBar addSubview:](v4, "addSubview:", v4->_sendButton);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v42 = objc_claimAutoreleasedReturnValue();
    availableButtons = v4->_availableButtons;
    v4->_availableButtons = (NSSet *)v42;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v44 = objc_claimAutoreleasedReturnValue();
    enabledButtons = v4->_enabledButtons;
    v4->_enabledButtons = (NSSet *)v44;

    -[PUReviewScreenControlBar _updateButtonVisibility](v4, "_updateButtonVisibility");
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t k;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _QWORD v103[3];
  _BYTE v104[128];
  uint64_t v105;
  CGRect v106;
  CGRect v107;

  v105 = *MEMORY[0x1E0C80C00];
  v100.receiver = self;
  v100.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar layoutSubviews](&v100, sel_layoutSubviews);
  -[PUReviewScreenControlBar bounds](self, "bounds");
  v86 = v3;
  v87 = v4;
  v6 = v5;
  v8 = v7;
  -[PUReviewScreenControlBar sendButton](self, "sendButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBar layoutCenterAlignmentPoint](self, "layoutCenterAlignmentPoint");
  v11 = v10;
  v13 = v12;
  -[PUReviewScreenControlBar window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBar convertPoint:fromView:](self, "convertPoint:fromView:", v14, v11, v13);
  v16 = v15;
  v18 = v17;

  -[PUReviewScreenControlBar window](self, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = +[PUReviewScreenUtilities useCompactControlBarButtonsForReferenceBounds:](PUReviewScreenUtilities, "useCompactControlBarButtonsForReferenceBounds:", v21, v23, v25, v27);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  -[PUReviewScreenControlBar editButton](self, "editButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v29;
  -[PUReviewScreenControlBar markupButton](self, "markupButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v30;
  -[PUReviewScreenControlBar funEffectsButton](self, "funEffectsButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v97 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "setUseCompactSize:", v28);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v34);
  }

  if (-[PUReviewScreenControlBar shouldLayoutVertically](self, "shouldLayoutVertically"))
  {
    -[PUReviewScreenControlBar _buttonsForLayout](self, "_buttonsForLayout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "reverseObjectEnumerator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUReviewScreenControlBar _buttonsForLayout](self, "_buttonsForLayout");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "count"))
    {
      -[PUReviewScreenControlBar _buttonsForLayout](self, "_buttonsForLayout");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count") - 1;

    }
    else
    {
      v41 = 0;
    }

    v60 = v6;
    objc_msgSend((id)objc_opt_class(), "sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:", v41, v86, v87, v6, v8, v16, v18);
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v38, "nextObject");

    objc_msgSend(v9, "frame");
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v69 = v38;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v93 != v72)
            objc_enumerationMutation(v69);
          v74 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
          v107.origin.x = v62;
          v107.origin.y = v64;
          v107.size.width = v66;
          v107.size.height = v68;
          v64 = CGRectGetMaxY(v107) + 30.0;
          v68 = 42.0;
          UIRectCenteredAboutPointScale();
          v62 = v75;
          objc_msgSend(v74, "frameForAlignmentRect:");
          objc_msgSend(v74, "setFrame:", PURoundRectToPixel(v76, v77, v78, v79));
          v66 = 42.0;
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
        v68 = 42.0;
        v66 = 42.0;
      }
      while (v71);
    }

    v42 = v60;
  }
  else
  {
    v85 = v8;
    v42 = v6;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    -[PUReviewScreenControlBar _buttonsForLayout](self, "_buttonsForLayout");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v89;
      v47 = 20.0;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v89 != v46)
            objc_enumerationMutation(v43);
          v49 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
          objc_msgSend(v49, "intrinsicContentSize");
          v51 = v50;
          v53 = v52;
          UIRectCenteredAboutPointScale();
          v55 = v54;
          objc_msgSend(v49, "frameForAlignmentRect:", v47);
          objc_msgSend(v49, "setFrame:", PURoundRectToPixel(v56, v57, v58, v59));
          v106.origin.x = v47;
          v106.origin.y = v55;
          v106.size.width = v51;
          v106.size.height = v53;
          v47 = CGRectGetMaxX(v106) + 30.0;
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      }
      while (v45);
    }

    objc_msgSend((id)objc_opt_class(), "sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:", v86, v87, v6, v85, v16, v18);
    objc_msgSend(v9, "setFrame:");
  }
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topOutset");
  v82 = -v81;
  v83 = v81 + 44.0;
  -[PUReviewScreenControlBar accessoryView](self, "accessoryView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setFrame:", 0.0, v82, v42, v83);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PUReviewScreenControlBar window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUReviewScreenControlBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PUReviewScreenControlBar *)objc_claimAutoreleasedReturnValue();
  if (-[PUReviewScreenControlBar useTransparentTouches](self, "useTransparentTouches") && v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)setShouldLayoutVertically:(BOOL)a3
{
  if (self->_shouldLayoutVertically != a3)
  {
    self->_shouldLayoutVertically = a3;
    -[PUReviewScreenControlBar _updateButtonText](self, "_updateButtonText");
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayoutCenterAlignmentPoint:(CGPoint)a3
{
  if (a3.x != self->_layoutCenterAlignmentPoint.x || a3.y != self->_layoutCenterAlignmentPoint.y)
  {
    self->_layoutCenterAlignmentPoint = a3;
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseTransparentBackground:(BOOL)a3
{
  if (self->_useTransparentBackground != a3)
  {
    self->_useTransparentBackground = a3;
    -[PUReviewScreenControlBar _updateBackgroundTransparency](self, "_updateBackgroundTransparency");
  }
}

- (void)setAvailableButtons:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  char v6;
  NSSet *v7;
  NSSet *availableButtons;
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_availableButtons != v4)
  {
    v9 = v4;
    v6 = -[NSSet isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSSet *)-[NSSet copy](v9, "copy");
      availableButtons = self->_availableButtons;
      self->_availableButtons = v7;

      -[PUReviewScreenControlBar _updateButtonVisibility](self, "_updateButtonVisibility");
      -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)setEnabledButtons:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  char v6;
  NSSet *v7;
  NSSet *enabledButtons;
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_enabledButtons != v4)
  {
    v9 = v4;
    v6 = -[NSSet isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSSet *)-[NSSet copy](v9, "copy");
      enabledButtons = self->_enabledButtons;
      self->_enabledButtons = v7;

      -[PUReviewScreenControlBar _updateButtonVisibility](self, "_updateButtonVisibility");
      v5 = v9;
    }
  }

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_accessoryView;
  UIView *accessoryView;
  PUReviewScreenControlBar *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v9 = v5;
    -[UIView superview](accessoryView, "superview");
    v8 = (PUReviewScreenControlBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[PUReviewScreenControlBar addSubview:](self, "addSubview:", *p_accessoryView);
    v5 = v9;
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUReviewScreenControlBar frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  -[PUReviewScreenControlBar center](self, "center");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setCenter:](&v11, sel_setCenter_, x, y);
  if (x != v7 || y != v9)
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUReviewScreenControlBar bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PUReviewScreenControlBar;
  -[PUReviewScreenControlBar setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[PUReviewScreenControlBar setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isButtonAvailable:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUReviewScreenControlBar availableButtons](self, "availableButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)_isButtonEnabled:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUReviewScreenControlBar enabledButtons](self, "enabledButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)_buttonForButtonType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 2:
      -[PUReviewScreenControlBar editButton](self, "editButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[PUReviewScreenControlBar markupButton](self, "markupButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[PUReviewScreenControlBar funEffectsButton](self, "funEffectsButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[PUReviewScreenControlBar sendButton](self, "sendButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)_updateButtonVisibility
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  _BOOL8 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "supportedButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "integerValue", (_QWORD)v15);
        -[PUReviewScreenControlBar _buttonForButtonType:](self, "_buttonForButtonType:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PUReviewScreenControlBar _isButtonAvailable:](self, "_isButtonAvailable:", v10);
        v13 = -[PUReviewScreenControlBar _isButtonEnabled:](self, "_isButtonEnabled:", v10);
        objc_msgSend(v11, "setHidden:", !v12);
        objc_msgSend(v11, "setEnabled:", v13);
        if (v12
          || (-[PUReviewScreenControlBar sendButton](self, "sendButton"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v11 == v14))
        {
          objc_msgSend(v4, "addObject:", v11);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[PUReviewScreenControlBar _setButtonsForLayout:](self, "_setButtonsForLayout:", v4);
}

- (void)_updateButtonText
{
  _BOOL4 v3;
  UIButton *editButton;
  void *v5;
  UIButton *funEffectsButton;
  void *v7;
  UIButton *markupButton;
  __CFString *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  id v13;

  v3 = -[PUReviewScreenControlBar shouldLayoutVertically](self, "shouldLayoutVertically");
  editButton = self->_editButton;
  if (v3)
  {
    PULocalizedString(&stru_1E58AD278);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](editButton, "setTitle:forState:", v5, 0);

    funEffectsButton = self->_funEffectsButton;
    PULocalizedString(&stru_1E58AD278);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](funEffectsButton, "setTitle:forState:", v7, 0);

    markupButton = self->_markupButton;
    v9 = &stru_1E58AD278;
  }
  else
  {
    PULocalizedString(CFSTR("EDIT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](editButton, "setTitle:forState:", v10, 0);

    v11 = self->_funEffectsButton;
    PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_FUN_EFFECTS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v11, "setTitle:forState:", v12, 0);

    markupButton = self->_markupButton;
    v9 = CFSTR("PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP");
  }
  PULocalizedString(v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](markupButton, "setTitle:forState:");

}

- (void)_updateBackgroundTransparency
{
  _BOOL4 v3;
  double v4;
  id v5;

  v3 = -[PUReviewScreenControlBar useTransparentBackground](self, "useTransparentBackground");
  v4 = 0.0;
  if (!v3)
    v4 = 0.3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBar setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (NSSet)availableButtons
{
  return self->_availableButtons;
}

- (NSSet)enabledButtons
{
  return self->_enabledButtons;
}

- (BOOL)shouldLayoutVertically
{
  return self->_shouldLayoutVertically;
}

- (CGPoint)layoutCenterAlignmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutCenterAlignmentPoint.x;
  y = self->_layoutCenterAlignmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)useTransparentBackground
{
  return self->_useTransparentBackground;
}

- (BOOL)useTransparentTouches
{
  return self->_useTransparentTouches;
}

- (void)setUseTransparentTouches:(BOOL)a3
{
  self->_useTransparentTouches = a3;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (UIButton)markupButton
{
  return self->_markupButton;
}

- (UIButton)funEffectsButton
{
  return self->_funEffectsButton;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSArray)_buttonsForLayout
{
  return self->__buttonsForLayout;
}

- (void)_setButtonsForLayout:(id)a3
{
  objc_storeStrong((id *)&self->__buttonsForLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__buttonsForLayout, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_funEffectsButton, 0);
  objc_storeStrong((id *)&self->_markupButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_enabledButtons, 0);
  objc_storeStrong((id *)&self->_availableButtons, 0);
}

+ (id)supportedButtons
{
  if (supportedButtons_onceToken != -1)
    dispatch_once(&supportedButtons_onceToken, &__block_literal_global_79544);
  return (id)supportedButtons_supportedButtons;
}

+ (CGRect)sendButtonAlignmentRectInHorizontalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  UIRectCenteredAboutPointScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v14 = CGRectGetMaxX(v18) + -20.0 + -56.0;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGRect)sendButtonAlignmentRectInVerticalBounds:(CGRect)a3 relativeCenterAlignmentPoint:(CGPoint)a4 controlsCount:(unint64_t)a5
{
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  height = a3.size.height;
  UIRectCenteredAboutPointScale();
  v10 = (height - ((double)a5 * 72.0 + 66.0)) * 0.5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v7;
  return result;
}

void __44__PUReviewScreenControlBar_supportedButtons__block_invoke()
{
  void *v0;

  v0 = (void *)supportedButtons_supportedButtons;
  supportedButtons_supportedButtons = (uint64_t)&unk_1E59BA720;

}

@end
