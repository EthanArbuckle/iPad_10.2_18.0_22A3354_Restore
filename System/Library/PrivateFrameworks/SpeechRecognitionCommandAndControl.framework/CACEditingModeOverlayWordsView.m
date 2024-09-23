@implementation CACEditingModeOverlayWordsView

- (CACEditingModeOverlayWordsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CACEditingModeOverlayWordsView *v7;
  uint64_t v8;
  UIView *badgeContainer;
  uint64_t v10;
  UIView *contrastedBadgeContainer;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CACEditingModeOverlayWordsView;
  v7 = -[CACEditingModeOverlayWordsView initWithFrame:](&v13, sel_initWithFrame_);
  +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, x, y, width, height);
  v8 = objc_claimAutoreleasedReturnValue();
  badgeContainer = v7->_badgeContainer;
  v7->_badgeContainer = (UIView *)v8;

  +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, x, y, width, height);
  v10 = objc_claimAutoreleasedReturnValue();
  contrastedBadgeContainer = v7->_contrastedBadgeContainer;
  v7->_contrastedBadgeContainer = (UIView *)v10;

  -[CACEditingModeOverlayWordsView addSubview:](v7, "addSubview:", v7->_contrastedBadgeContainer);
  -[CACEditingModeOverlayWordsView addSubview:](v7, "addSubview:", v7->_badgeContainer);
  return v7;
}

- (void)setLabels:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  int *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  void *v34;
  void *v35;
  UIView *contrastedBadgeContainer;
  id v37;
  CACEditingModeOverlayWordsView *v38;
  unint64_t v39;
  uint64_t v40;
  int *v41;
  void *v42;
  UIView *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = 416;
  -[UIView subviews](self->_badgeContainer, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "removeFromSuperview");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v8);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[UIView subviews](self->_contrastedBadgeContainer, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "removeFromSuperview");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v13);
  }

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setNumberStyle:", 1);
  v44 = v16;
  objc_msgSend(v16, "setMaximumFractionDigits:", 0);
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0;
    v18 = 0x24F2A9000uLL;
    v19 = &OBJC_IVAR___CACContextCluesWelcomeController__delegate;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "label");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = v21;
      objc_msgSend(*(id *)(v18 + 2024), "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:", objc_msgSend(v21, "length"), 0, 0, 0, UIAccessibilityDarkerSystemColorsEnabled());
      v23 = v22;
      v25 = v24;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(unint64_t *)((char *)&self->super.super.super.isa + v19[101]);
      objc_msgSend(v26, "frame");
      v29 = v28;
      objc_msgSend(v26, "frame");
      v31 = v30;
      if (v27 <= 3 && ((0xEu >> (v27 & 0xF)) & 1) != 0)
      {
        objc_msgSend(v26, "frame");
        v29 = fmax(v33 - v23, 0.0);
      }
      v34 = v45;
      if (v27 == 1)
      {
        objc_msgSend(v26, "frame");
        v31 = CGRectGetMidY(v57) + v25 * -0.5;
      }
      v35 = (void *)objc_msgSend(objc_alloc(*(Class *)(v18 + 2024)), "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v45, 0, 0, 0, v29, v31, v23, v25);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v5), "addSubview:", v35);
      if (UIAccessibilityDarkerSystemColorsEnabled())
      {
        contrastedBadgeContainer = self->_contrastedBadgeContainer;
        objc_msgSend(v35, "contrastedCopy");
        v37 = v4;
        v38 = self;
        v39 = v18;
        v40 = v5;
        v41 = v19;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = contrastedBadgeContainer;
        v34 = v45;
        -[UIView addSubview:](v43, "addSubview:", v42);

        v19 = v41;
        v5 = v40;
        v18 = v39;
        self = v38;
        v4 = v37;
      }

      ++v17;
    }
    while (v17 < objc_msgSend(v4, "count"));
  }

}

- (NSArray)labels
{
  return self->_labels;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_contrastedBadgeContainer, 0);
  objc_storeStrong((id *)&self->_badgeContainer, 0);
}

@end
