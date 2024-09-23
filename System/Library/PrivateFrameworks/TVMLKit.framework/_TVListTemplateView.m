@implementation _TVListTemplateView

- (_TVListTemplateView)initWithFrame:(CGRect)a3
{
  _TVListTemplateView *v3;
  UIFocusContainerGuide *v4;
  UIFocusContainerGuide *previewFocusGuide;
  UIFocusContainerGuide *v6;
  UIFocusContainerGuide *overallFocusGuide;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVListTemplateView;
  v3 = -[_TVListTemplateView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x24BDF6A50]);
    previewFocusGuide = v3->_previewFocusGuide;
    v3->_previewFocusGuide = v4;

    -[_TVListTemplateView addLayoutGuide:](v3, "addLayoutGuide:", v3->_previewFocusGuide);
    v6 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x24BDF6A50]);
    overallFocusGuide = v3->_overallFocusGuide;
    v3->_overallFocusGuide = v6;

    -[_TVListTemplateView addLayoutGuide:](v3, "addLayoutGuide:", v3->_overallFocusGuide);
    v3->_floatingBanner = 1;
  }
  return v3;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  UIView *bannerView;
  UIView *bgImageView;
  UIView *listView;
  UIView *previewView;
  objc_super v9;

  bannerView = self->_bannerView;
  if (bannerView)
    -[UIView setSemanticContentAttribute:](bannerView, "setSemanticContentAttribute:", a3);
  bgImageView = self->_bgImageView;
  if (bgImageView)
    -[UIView setSemanticContentAttribute:](bgImageView, "setSemanticContentAttribute:", a3);
  listView = self->_listView;
  if (listView)
    -[UIView setSemanticContentAttribute:](listView, "setSemanticContentAttribute:", a3);
  previewView = self->_previewView;
  if (previewView)
    -[UIView setSemanticContentAttribute:](previewView, "setSemanticContentAttribute:", a3);
  v9.receiver = self;
  v9.super_class = (Class)_TVListTemplateView;
  -[_TVListTemplateView setSemanticContentAttribute:](&v9, sel_setSemanticContentAttribute_, a3);
}

- (void)setBgImageView:(id)a3
{
  UIView *v5;
  UIView **p_bgImageView;
  UIView *bgImageView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_bgImageView = &self->_bgImageView;
  bgImageView = self->_bgImageView;
  v8 = v5;
  if (bgImageView != v5)
  {
    -[UIView removeFromSuperview](bgImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bgImageView, a3);
    if (*p_bgImageView)
    {
      -[UIView setSemanticContentAttribute:](*p_bgImageView, "setSemanticContentAttribute:", -[_TVListTemplateView semanticContentAttribute](self, "semanticContentAttribute"));
      -[_TVListTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_bgImageView, 0);
    }
  }
  -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setBannerView:(id)a3
{
  UIView *v5;
  UIView **p_bannerView;
  UIView *bannerView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_bannerView = &self->_bannerView;
  bannerView = self->_bannerView;
  v9 = v5;
  if (bannerView != v5)
  {
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bannerView, a3);
    if (*p_bannerView)
    {
      -[UIView setSemanticContentAttribute:](*p_bannerView, "setSemanticContentAttribute:", -[_TVListTemplateView semanticContentAttribute](self, "semanticContentAttribute"));
      v8 = *p_bannerView;
      if (self->_bgImageView)
        -[_TVListTemplateView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8);
      else
        -[_TVListTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8);
    }
  }
  -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setFloatingBanner:(BOOL)a3
{
  self->_floatingBanner = a3;
  -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setListView:(id)a3
{
  UIView *v5;
  UIView **p_listView;
  UIView *listView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_listView = &self->_listView;
  listView = self->_listView;
  v8 = v5;
  if (listView != v5)
  {
    -[UIView removeFromSuperview](listView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_listView, a3);
    if (*p_listView)
    {
      -[UIView setSemanticContentAttribute:](*p_listView, "setSemanticContentAttribute:", -[_TVListTemplateView semanticContentAttribute](self, "semanticContentAttribute"));
      -[_TVListTemplateView addSubview:](self, "addSubview:", *p_listView);
    }
  }
  -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setPreviewView:(id)a3
{
  UIView *v5;
  UIView *previewView;
  UIView *v7;
  void *v8;
  uint64_t v9;
  UIView *v10;
  UIView *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UIView *v16;
  _QWORD v17[4];
  UIView *v18;

  v5 = (UIView *)a3;
  previewView = self->_previewView;
  if (previewView != v5)
  {
    v7 = previewView;
    objc_storeStrong((id *)&self->_previewView, a3);
    -[UIView setAlpha:](v5, "setAlpha:", 0.0);
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __38___TVListTemplateView_setPreviewView___block_invoke;
    v17[3] = &unk_24EB85440;
    v18 = v7;
    v12 = v9;
    v13 = 3221225472;
    v14 = __38___TVListTemplateView_setPreviewView___block_invoke_2;
    v15 = &unk_24EB85A38;
    v10 = v18;
    v16 = v10;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v17, &v12, 0.2);
    v11 = self->_previewView;
    if (v11)
      -[UIView setSemanticContentAttribute:](v11, "setSemanticContentAttribute:", -[_TVListTemplateView semanticContentAttribute](self, "semanticContentAttribute", v12, v13, v14, v15));

  }
  -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout", v12, v13, v14, v15);

}

- (void)setBackdropEnabled:(BOOL)a3
{
  UIVisualEffectView *backdropView;
  id v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;

  if (self->_backdropEnabled != a3)
  {
    self->_backdropEnabled = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      if (!backdropView)
      {
        v5 = objc_alloc(MEMORY[0x24BDF6FC8]);
        objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 5003);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (UIVisualEffectView *)objc_msgSend(v5, "initWithEffect:", v6);
        v8 = self->_backdropView;
        self->_backdropView = v7;

      }
      -[_TVListTemplateView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIVisualEffectView removeFromSuperview](backdropView, "removeFromSuperview");
      v9 = self->_backdropView;
      self->_backdropView = 0;

    }
  }
}

- (void)setOverlayBlurOffset:(double)a3
{
  UIVisualEffectView *bgVisualEffectView;
  id v5;
  void *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;

  self->_bgVisualEffectOffset = a3;
  bgVisualEffectView = self->_bgVisualEffectView;
  if (a3 == 0.0)
  {
    -[UIVisualEffectView removeFromSuperview](bgVisualEffectView, "removeFromSuperview");
    v10 = self->_bgVisualEffectView;
    self->_bgVisualEffectView = 0;

  }
  else
  {
    if (!bgVisualEffectView)
    {
      v5 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 5000);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIVisualEffectView *)objc_msgSend(v5, "initWithEffect:", v6);
      v8 = self->_bgVisualEffectView;
      self->_bgVisualEffectView = v7;

      v9 = self->_bgVisualEffectView;
      if (self->_bgImageView)
        -[_TVListTemplateView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v9);
      else
        -[_TVListTemplateView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9);
    }
    -[_TVListTemplateView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](self->_bgVisualEffectView, "setFrame:");
  }
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_listView)
  {
    v4[0] = self->_listView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (void)adjustScrollForListView:(id)a3
{
  UIView *bannerView;
  id v5;
  double v6;
  double v7;
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

  if (!self->_floatingBanner)
  {
    bannerView = self->_bannerView;
    v5 = a3;
    -[UIView tv_margin](bannerView, "tv_margin");
    v7 = v6;
    -[UIView frame](self->_bannerView, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "contentOffset");
    v15 = v14;
    objc_msgSend(v5, "contentInset");
    v17 = v16;

    -[UIView setFrame:](self->_bannerView, "setFrame:", v9, v7 - (v15 + v17), v11, v13);
  }
}

- (int64_t)listAlignment
{
  void *v2;
  int64_t v3;

  -[_TVListTemplateView listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_alignment");

  if ((v3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    return v3;
  else
    return 3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *bgImageView;
  UIFocusContainerGuide *overallFocusGuide;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int64_t v37;
  double bgVisualEffectOffset;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double Width;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double MinX;
  UIVisualEffectView *backdropView;
  double v54;
  uint64_t v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  uint64_t v93;
  float v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  UIVisualEffectView *v100;
  _TVListTemplateView *v101;
  UIVisualEffectView *v102;
  void *v103;
  UIView *previewView;
  _TVListTemplateView *v105;
  UIView *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  _QWORD v116[5];
  objc_super v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v117.receiver = self;
  v117.super_class = (Class)_TVListTemplateView;
  -[_TVListTemplateView layoutSubviews](&v117, sel_layoutSubviews);
  -[_TVListTemplateView bounds](self, "bounds");
  v4 = v3;
  v111 = v5;
  -[_TVListTemplateView bannerView](self, "bannerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_margin");
  v8 = v7;
  v10 = v9;
  v113 = v11;
  v13 = v12;
  v14 = v7;

  bgImageView = self->_bgImageView;
  -[_TVListTemplateView bounds](self, "bounds");
  -[UIView setFrame:](bgImageView, "setFrame:");
  overallFocusGuide = self->_overallFocusGuide;
  -[_TVListTemplateView bounds](self, "bounds");
  -[UIFocusContainerGuide _setManualLayoutFrame:](overallFocusGuide, "_setManualLayoutFrame:");
  v17 = v4;
  if (v4 - (v10 + v13) >= 0.0)
    v18 = v4 - (v10 + v13);
  else
    v18 = 0.0;
  -[_TVListTemplateView bannerView](self, "bannerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v18, 0.0);
  v21 = v20;

  if (!self->_floatingBanner)
  {
    -[_TVListTemplateView listView](self, "listView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[_TVListTemplateView listView](self, "listView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "contentOffset");
      v27 = v26;
      objc_msgSend(v25, "contentInset");
      v14 = v8 - (v27 + v28);

    }
  }
  -[_TVListTemplateView bannerView](self, "bannerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v10, v14, v18, v21);

  -[_TVListTemplateView listView](self, "listView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tv_margin");
  v32 = v31;
  v34 = v33;
  v110 = v35;
  v115 = v36;

  v37 = -[_TVListTemplateView listAlignment](self, "listAlignment");
  bgVisualEffectOffset = self->_bgVisualEffectOffset;
  if (bgVisualEffectOffset == 0.0)
    v39 = v113;
  else
    v39 = -0.0;
  v40 = v8 + v21;
  if (bgVisualEffectOffset == 0.0)
    v41 = v8 + v21;
  else
    v41 = self->_bgVisualEffectOffset;
  if (-[_TVListTemplateView shouldAdjustListForTabBar](self, "shouldAdjustListForTabBar"))
  {
    -[_TVListTemplateView safeAreaInsets](self, "safeAreaInsets");
    v43 = v42 + 17.0;
  }
  else
  {
    v43 = v41 + v32 + v39;
  }
  v44 = v17;
  -[_TVListTemplateView listView](self, "listView", *(_QWORD *)&v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "tv_itemWidth");
  Width = v46;

  if (Width == 0.0)
  {
    -[_TVListTemplateView bounds](self, "bounds");
    Width = CGRectGetWidth(v118);
  }
  if (v37 == 1)
    v48 = v34;
  else
    v48 = v44 - Width - v115;
  -[_TVListTemplateView listView](self, "listView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v48;
  objc_msgSend(v49, "setFrame:", v48, v43, Width, v111 - (v110 + v43));

  -[UIVisualEffectView layer](self->_backdropView, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setCornerRadius:", 40.0);

  -[UIVisualEffectView layer](self->_backdropView, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setMasksToBounds:", 1);

  v109 = Width;
  if (v37 == 3)
  {
    -[UIView frame](self->_listView, "frame");
    MinX = CGRectGetMinX(v119) - v34;
    backdropView = self->_backdropView;
    v54 = v44 - MinX - v115;
LABEL_25:
    -[UIVisualEffectView setFrame:](backdropView, "setFrame:", MinX, v43, v54, v111 - v43 - v110);
    v55 = 0;
    goto LABEL_27;
  }
  if (v37 == 1)
  {
    -[UIView frame](self->_listView, "frame");
    MinX = CGRectGetMinX(v120);
    backdropView = self->_backdropView;
    -[UIView frame](self->_listView, "frame");
    v54 = v115 + CGRectGetMaxX(v121) - v34;
    goto LABEL_25;
  }
  v55 = 1;
LABEL_27:
  -[UIVisualEffectView setHidden:](self->_backdropView, "setHidden:", v55);
  -[_TVListTemplateView previewView](self, "previewView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "tv_margin");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;

  -[_TVListTemplateView previewView](self, "previewView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "tv_itemWidth");
  v67 = v66;

  v68 = self->_bgVisualEffectOffset;
  v69 = -0.0;
  if (v68 == 0.0)
    v69 = v113;
  v70 = v58 + v69;
  v71 = v44 - (v64 + v34 + v109 + fmax(v115, v60));
  v114 = fmax(v64, v34);
  if (v37 == 3)
    v72 = v112 - (v60 + v114);
  else
    v72 = v71;
  if (v68 == 0.0)
    v68 = v108;
  v73 = v68 + v70;
  v74 = v111 - (v62 + v68 + v70);
  if (v74 > 0.0)
    v75 = v74;
  else
    v75 = 0.0;
  -[_TVListTemplateView previewView](self, "previewView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v67 >= v72 || v67 <= 0.0)
    v79 = v72;
  else
    v79 = v67;
  objc_msgSend(v76, "sizeThatFits:", v79, 0.0);
  v81 = v80;
  v83 = v82;

  v84 = fmin(v81, v72);
  if (v81 > 0.0)
    v85 = v84;
  else
    v85 = v72;
  v86 = fmin(v83, v75);
  if (v83 > 0.0)
    v87 = v86;
  else
    v87 = v75;
  if (v87 < v75)
  {
    -[_TVListTemplateView previewView](self, "previewView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_TVListTemplateView previewView](self, "previewView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "collectionView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v91 = objc_opt_isKindOfClass();

      if ((v91 & 1) != 0)
        v87 = v75;
    }
    else
    {

    }
  }
  -[_TVListTemplateView previewView](self, "previewView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "tv_alignment");

  if (v93 == 2)
  {
    v94 = (v72 - v85) * 0.5;
    v95 = floorf(v94);
    if (v37 == 3)
      v60 = v112 - v85 - v114 - v95;
    else
      v60 = v109 + v112 + fmax(v60, v115) + v95;
  }
  else
  {
    v96 = fmax(v60, v115);
    if (v37 != 3)
      v60 = v109 + v112 + v96;
  }
  if (-[_TVListTemplateView shouldAdjustPreviewForTabBar](self, "shouldAdjustPreviewForTabBar"))
  {
    -[_TVListTemplateView safeAreaInsets](self, "safeAreaInsets");
    if (v73 < v97)
      v73 = v97;
    v87 = v87 - v73;
  }
  -[_TVListTemplateView previewView](self, "previewView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setFrame:", v60, v73, v85, v87);

  -[UIFocusContainerGuide _setManualLayoutFrame:](self->_previewFocusGuide, "_setManualLayoutFrame:", v60, 0.0, v85, v111);
  -[_TVListTemplateView listView](self, "listView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    v100 = self->_backdropView;
    if (v100)
    {
      -[UIVisualEffectView superview](v100, "superview");
      v101 = (_TVListTemplateView *)objc_claimAutoreleasedReturnValue();

      if (v101 != self)
      {
        v102 = self->_backdropView;
        -[_TVListTemplateView listView](self, "listView");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVListTemplateView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v102, v103);

      }
    }
    previewView = self->_previewView;
    if (previewView)
    {
      -[UIView superview](previewView, "superview");
      v105 = (_TVListTemplateView *)objc_claimAutoreleasedReturnValue();

      if (v105 != self)
      {
        v106 = self->_previewView;
        if (self->_backdropView)
          -[_TVListTemplateView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v106);
        else
          -[_TVListTemplateView insertSubview:above:](self, "insertSubview:above:", v106, self->_listView);
        -[UIView alpha](self->_previewView, "alpha");
        if (v107 < 1.0)
        {
          v116[0] = MEMORY[0x24BDAC760];
          v116[1] = 3221225472;
          v116[2] = __37___TVListTemplateView_layoutSubviews__block_invoke;
          v116[3] = &unk_24EB85440;
          v116[4] = self;
          objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v116, 0, 0.2, 0.0);
        }
      }
    }
  }
}

- (UIView)bgImageView
{
  return self->_bgImageView;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (UIView)listView
{
  return self->_listView;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (BOOL)isBackdropEnabled
{
  return self->_backdropEnabled;
}

- (BOOL)floatingBanner
{
  return self->_floatingBanner;
}

- (BOOL)shouldAdjustListForTabBar
{
  return self->_shouldAdjustListForTabBar;
}

- (void)setShouldAdjustListForTabBar:(BOOL)a3
{
  self->_shouldAdjustListForTabBar = a3;
}

- (BOOL)shouldAdjustPreviewForTabBar
{
  return self->_shouldAdjustPreviewForTabBar;
}

- (void)setShouldAdjustPreviewForTabBar:(BOOL)a3
{
  self->_shouldAdjustPreviewForTabBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_overallFocusGuide, 0);
  objc_storeStrong((id *)&self->_previewFocusGuide, 0);
  objc_storeStrong((id *)&self->_bgVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
