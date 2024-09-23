@implementation PUPickerBannerView

- (PUPickerBannerView)initWithFrame:(CGRect)a3
{
  PUPickerBannerView *v3;
  void *v4;
  PUStackView *v5;
  PUStackView *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPickerBannerView;
  v3 = -[PUPickerBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [PUStackView alloc];
    -[PUPickerBannerView bounds](v3, "bounds");
    v6 = -[PUStackView initWithFrame:](v5, "initWithFrame:");
    objc_msgSend(v4, "configureBannerStackView:", v6);
    -[PUPickerBannerView addSubview:](v3, "addSubview:", v6);
    -[PUPickerBannerView _setStackView:](v3, "_setStackView:", v6);
    v7 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUPickerBannerView bounds](v3, "bounds");
    v8 = (void *)objc_msgSend(v7, "initWithFrame:");
    objc_msgSend(v4, "configureBannerLabel:", v8);
    -[PUPickerBannerView addSubview:](v3, "addSubview:", v8);
    -[PUPickerBannerView _setLabel:](v3, "_setLabel:", v8);
    objc_msgSend(v4, "bannerBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerBannerView setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v4;
  uint64_t v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
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
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double x;
  double y;
  double width;
  double height;
  int64_t v52;
  int64_t v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  _BOOL4 v71;
  uint64_t v72;
  _BOOL8 v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat MidX;
  CGFloat v92;
  CGFloat v93;
  CGFloat rect;
  double v95;
  double v96;
  double v97;
  CGRect remainder;
  CGRect slice;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  -[PUPickerBannerView _stackView](self, "_stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfVisibleItems");
  -[PUPickerBannerView _label](self, "_label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v8 = v7;
  slice.origin.x = v7;
  slice.origin.y = v9;
  rect = v9;
  slice.size.width = v10;
  slice.size.height = v11;
  objc_msgSend(v6, "frame");
  v92 = v12;
  v93 = v13;
  remainder.origin.x = v12;
  remainder.origin.y = v13;
  remainder.size.width = v14;
  remainder.size.height = v15;
  -[PUPickerBannerView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[PUPickerBannerView safeAreaInsets](self, "safeAreaInsets");
  v25 = v17 + v24;
  v27 = v19 + v26;
  v29 = v21 - (v24 + v28);
  v31 = v23 - (v26 + v30);
  -[PUPickerBannerView leftView](self, "leftView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerBannerView rightView](self, "rightView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "center");
  v35 = v34;
  v37 = v36;
  objc_msgSend(v33, "center");
  v97 = v38;
  v40 = v39;
  if (v32)
  {
    objc_msgSend(v32, "frame");
    v41 = CGRectGetWidth(v100) + 14.0;
    v101.origin.x = v25;
    v101.origin.y = v27;
    v101.size.width = v29;
    v101.size.height = v31;
    CGRectGetMinX(v101);
    UIRoundToViewScale();
    v95 = v42;
    v102.origin.x = v25;
    v102.origin.y = v27;
    v102.size.width = v29;
    v102.size.height = v31;
    CGRectGetMidY(v102);
    UIRoundToViewScale();
    v37 = v43;
    v44 = fmax(v41, 0.0);
  }
  else
  {
    v95 = v35;
    v44 = 0.0;
  }
  v96 = v37;
  if (v33)
  {
    objc_msgSend(v33, "frame");
    v45 = CGRectGetWidth(v103) + 14.0;
    v104.origin.x = v25;
    v104.origin.y = v27;
    v104.size.width = v29;
    v104.size.height = v31;
    CGRectGetMaxX(v104);
    UIRoundToViewScale();
    v97 = v46;
    v105.origin.x = v25;
    v105.origin.y = v27;
    v105.size.width = v29;
    v105.size.height = v31;
    CGRectGetMidY(v105);
    UIRoundToViewScale();
    v40 = v47;
    if (v44 < v45)
      v44 = v45;
  }
  v106.origin.x = v25;
  v106.origin.y = v27;
  v106.size.width = v29;
  v106.size.height = v31;
  v107 = CGRectInset(v106, v44, 0.0);
  x = v107.origin.x;
  y = v107.origin.y;
  width = v107.size.width;
  height = v107.size.height;
  v52 = -[PUPickerBannerView _alignment](self, "_alignment");
  v53 = v52;
  if (v52 == 1)
  {
    v57 = x;
    v58 = y;
    v59 = width;
    v60 = height;
    if (v5)
    {
      v61 = CGRectGetHeight(*(CGRect *)&v57);
      slice.size.width = v61;
      slice.size.height = v61;
      v110.origin.x = x;
      v110.origin.y = y;
      v110.size.width = width;
      v110.size.height = height;
      v62 = CGRectGetWidth(v110) + -10.0;
      v111.origin.x = v8;
      v111.origin.y = rect;
      v111.size.width = v61;
      v111.size.height = v61;
      v63 = v62 - CGRectGetWidth(v111);
      objc_msgSend(v6, "sizeThatFits:", v63, 0.0);
      if (v64 < v63)
        v63 = v64;
      remainder.size.width = v63;
      v112.origin.x = x;
      v112.origin.y = y;
      v112.size.width = width;
      v112.size.height = height;
      remainder.size.height = CGRectGetHeight(v112);
      v113.origin.x = x;
      v113.origin.y = y;
      v113.size.width = width;
      v113.size.height = height;
      MidX = CGRectGetMidX(v113);
      v114.origin.x = v8;
      v114.origin.y = rect;
      v114.size.width = v61;
      v114.size.height = v61;
      CGRectGetWidth(v114);
      v115.origin.x = v92;
      v115.origin.y = v93;
      v115.size.width = v63;
      v115.size.height = remainder.size.height;
      CGRectGetWidth(v115);
      UIRoundToViewScale();
      v66 = v65;
      slice.origin.x = v65;
      v116.origin.x = x;
      v116.origin.y = y;
      v116.size.width = width;
      v116.size.height = height;
      v117.origin.y = CGRectGetMinY(v116);
      slice.origin.y = v117.origin.y;
      v117.origin.x = v66;
      v117.size.width = v61;
      v117.size.height = v61;
      v67 = CGRectGetMaxX(v117) + 10.0;
    }
    else
    {
      v69 = CGRectGetWidth(*(CGRect *)&v57);
      objc_msgSend(v6, "sizeThatFits:", v69, 0.0);
      if (v70 < v69)
        v69 = v70;
      remainder.size.width = v69;
      v118.origin.x = x;
      v118.origin.y = y;
      v118.size.width = width;
      v118.size.height = height;
      remainder.size.height = CGRectGetHeight(v118);
      v119.origin.x = x;
      v119.origin.y = y;
      v119.size.width = width;
      v119.size.height = height;
      CGRectGetMidX(v119);
      v120.origin.x = v92;
      v120.origin.y = v93;
      v120.size.width = v69;
      v120.size.height = remainder.size.height;
      CGRectGetWidth(v120);
      UIRoundToViewScale();
    }
    remainder.origin.x = v67;
    v121.origin.x = x;
    v121.origin.y = y;
    v121.size.width = width;
    v121.size.height = height;
    remainder.origin.y = CGRectGetMinY(v121);
  }
  else
  {
    if (!v52)
    {
      v54 = v95;
      v55 = v96;
      if (v5)
      {
        v108.origin.x = x;
        v108.origin.y = y;
        v108.size.width = width;
        v108.size.height = height;
        v56 = CGRectGetHeight(v108);
        v109.origin.x = x;
        v109.origin.y = y;
        v109.size.width = width;
        v109.size.height = height;
        CGRectDivide(v109, &slice, &remainder, v56, CGRectMinXEdge);
        remainder = CGRectInset(remainder, 10.0, 0.0);
      }
      else
      {
        remainder.origin.x = x;
        remainder.origin.y = y;
        remainder.size.width = width;
        remainder.size.height = height;
      }
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerBannerView.m"), 125, CFSTR("Alignment not implemented."));

  }
  v54 = v95;
  v55 = v96;
LABEL_22:
  v71 = -[PUPickerBannerView _animatingStackView](self, "_animatingStackView", *(_QWORD *)&MidX);
  if (v5)
    v72 = v71;
  else
    v72 = 1;
  v73 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPickerBannerView semanticContentAttribute](self, "semanticContentAttribute")) == 1;
  objc_msgSend(v32, "setCenter:", v54, v55);
  objc_msgSend(v32, "frame");
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73);
  objc_msgSend(v32, "setFrame:", PURoundRectToPixel(v74, v75, v76, v77));
  objc_msgSend(v33, "setCenter:", v97, v40);
  objc_msgSend(v33, "frame");
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73);
  objc_msgSend(v33, "setFrame:", PURoundRectToPixel(v78, v79, v80, v81));
  objc_msgSend(v4, "setHidden:", v72);
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, x, y, width, height);
  slice.origin.x = v82;
  slice.origin.y = v83;
  slice.size.width = v84;
  slice.size.height = v85;
  objc_msgSend(v4, "setFrame:");
  if (v53)
    v86 = v53;
  else
    v86 = 4;
  objc_msgSend(v6, "setTextAlignment:", v86);
  -[PUPickerBannerView _frameReversedIfRightToLeft:frame:bounds:](self, "_frameReversedIfRightToLeft:frame:bounds:", v73, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, x, y, width, height);
  remainder.origin.x = v87;
  remainder.origin.y = v88;
  remainder.size.width = v89;
  remainder.size.height = v90;
  objc_msgSend(v6, "setFrame:");

}

- (CGRect)_frameReversedIfRightToLeft:(BOOL)a3 frame:(CGRect)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double MaxX;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3)
  {
    MaxX = CGRectGetMaxX(a5);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    x = MaxX - CGRectGetWidth(v14) - x;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PUPickerBannerView _updateAlignment](self, "_updateAlignment");
  }
}

- (void)setImages:(id)a3
{
  NSArray *v4;
  NSArray *images;

  if (self->_images != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    images = self->_images;
    self->_images = v4;

    -[PUPickerBannerView _updateStackView](self, "_updateStackView");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

    -[PUPickerBannerView _updateLabel](self, "_updateLabel");
  }
}

- (void)setLeftView:(id)a3
{
  -[PUPickerBannerView setLeftView:animated:](self, "setLeftView:animated:", a3, 0);
}

- (void)setLeftView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView *leftView;
  UIView *v9;
  UIView *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  UIView *v14;
  PUPickerBannerView *v15;
  UIView *v16;

  v4 = a4;
  v7 = (UIView *)a3;
  leftView = self->_leftView;
  if (leftView != v7)
  {
    v9 = leftView;
    objc_storeStrong((id *)&self->_leftView, a3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__PUPickerBannerView_setLeftView_animated___block_invoke;
    aBlock[3] = &unk_1E58AB790;
    v10 = v9;
    v14 = v10;
    v15 = self;
    v16 = v7;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v4)
    {
      -[PUPickerBannerView layoutSubviews](self, "layoutSubviews");
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v12, 0, 0.3);
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }

  }
}

- (void)setRightView:(id)a3
{
  -[PUPickerBannerView setRightView:animated:](self, "setRightView:animated:", a3, 0);
}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView *rightView;
  UIView *v9;
  UIView *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  UIView *v14;
  PUPickerBannerView *v15;
  UIView *v16;

  v4 = a4;
  v7 = (UIView *)a3;
  rightView = self->_rightView;
  if (rightView != v7)
  {
    v9 = rightView;
    objc_storeStrong((id *)&self->_rightView, a3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PUPickerBannerView_setRightView_animated___block_invoke;
    aBlock[3] = &unk_1E58AB790;
    v10 = v9;
    v14 = v10;
    v15 = self;
    v16 = v7;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v4)
    {
      -[PUPickerBannerView layoutSubviews](self, "layoutSubviews");
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v12, 0, 0.3);
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }

  }
}

- (void)_setAnimatingStackView:(BOOL)a3
{
  if (self->__animatingStackView != a3)
  {
    self->__animatingStackView = a3;
    -[PUPickerBannerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setAlignment:(int64_t)a3
{
  if (self->__alignment != a3)
  {
    self->__alignment = a3;
    -[PUPickerBannerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateAlignment
{
  -[PUPickerBannerView _setAlignment:](self, "_setAlignment:", self->_style == 2);
}

- (void)_updateStackView
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  -[PUPickerBannerView images](self, "images");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPickerBannerView _stackView](self, "_stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", objc_msgSend(v3, "style"));
  v5 = objc_msgSend(v8, "count");
  if (v4 >= v5)
    v4 = v5;
  objc_msgSend(v3, "setNumberOfVisibleItems:", v4);
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      objc_msgSend(v3, "setImageSize:forItemAtIndex:", i);
      objc_msgSend(v3, "setImage:forItemAtIndex:", v7, i);

    }
  }
  -[PUPickerBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateLabel
{
  void *v3;
  id v4;

  -[PUPickerBannerView title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPickerBannerView _label](self, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PUPickerBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)animateImagesOntoView:(id)a3 inContainerView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  float v15;
  double v16;
  float v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MidX;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
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
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  PUPickerBannerView *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  void *v86;
  _QWORD v87[2];
  _QWORD v88[4];
  void *v89;
  void *v90;
  _QWORD v91[2];
  _QWORD v92[3];
  CGRect v93;

  v92[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    -[PUPickerBannerView _stackView](self, "_stackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v74 = self;
    objc_msgSend(v12, "convertRect:toView:", v9);
    v77 = v13;
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v9, "addSubview:", v13);
    -[PUPickerBannerView _setAnimatingStackView:](self, "_setAnimatingStackView:", 1);
    v14 = v8;
    UIAnimationDragCoefficient();
    v16 = v15 * 0.5;
    UIAnimationDragCoefficient();
    v18 = v17 * 0.2;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v19 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v21 = objc_claimAutoreleasedReturnValue();
    v78 = v12;
    objc_msgSend(v12, "center");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v12, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", v26, v23, v25);
    v28 = v27;
    v30 = v29;

    v76 = v14;
    objc_msgSend(v14, "center");
    v32 = v31;
    v34 = v33;
    objc_msgSend(v14, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", v35, v32, v34);
    v37 = v36;
    v39 = v38;

    if (v30 >= v39)
      v40 = v39;
    else
      v40 = v30;
    v41 = v40 + -50.0;
    v42 = v28 + (v37 - v28) * 0.5;
    objc_msgSend(v9, "bounds");
    MidX = CGRectGetMidX(v93);
    if (vabdd_f64(v37, v28) < vabdd_f64(v37, MidX))
      v42 = MidX;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "moveToPoint:", v28, v30);
    objc_msgSend(v44, "addQuadCurveToPoint:controlPoint:", v37, v39, v42, v41);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_retainAutorelease(v44);
    objc_msgSend(v45, "setPath:", objc_msgSend(v75, "CGPath"));
    objc_msgSend(v45, "setKeyTimes:", &unk_1E59BA648);
    v92[0] = v19;
    v79 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTimingFunctions:", v46);

    v47 = v45;
    v72 = v45;
    objc_msgSend(v45, "setDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setValues:", &unk_1E59BA660);
    objc_msgSend(v48, "setKeyTimes:", &unk_1E59BA678);
    v49 = (void *)v20;
    v91[0] = v20;
    v91[1] = v21;
    v50 = v21;
    v69 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v80 = v8;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTimingFunctions:", v51);

    v71 = v48;
    objc_msgSend(v48, "setDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setValues:", &unk_1E59BA690);
    objc_msgSend(v52, "setKeyTimes:", &unk_1E59BA6A8);
    v90 = v49;
    v73 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTimingFunctions:", v53);

    v70 = v52;
    objc_msgSend(v52, "setDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setValues:", &unk_1E59BA6C0);
    objc_msgSend(v54, "setKeyTimes:", &unk_1E59BA6D8);
    v89 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTimingFunctions:", v55);

    v56 = v54;
    objc_msgSend(v54, "setDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDuration:", v16);
    objc_msgSend(v57, "setRemovedOnCompletion:", 0);
    objc_msgSend(v57, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v88[0] = v47;
    v88[1] = v48;
    v88[2] = v52;
    v88[3] = v56;
    v58 = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAnimations:", v59);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setBeginTime:", v16);
    objc_msgSend(v60, "setDuration:", v18);
    objc_msgSend(v60, "setValues:", &unk_1E59BA6F0);
    objc_msgSend(v60, "setKeyTimes:", &unk_1E59BA708);
    v87[0] = v81;
    v87[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTimingFunctions:", v61);

    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setDuration:", v16 + v18);
    objc_msgSend(v62, "setRemovedOnCompletion:", 1);
    objc_msgSend(v62, "setFillMode:", *MEMORY[0x1E0CD2B68]);
    v86 = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setAnimations:", v63);

    objc_msgSend(v62, "setDelegate:", v74);
    +[PUInterfaceManager beginDisablingUserInteractionForReason:](PUInterfaceManager, "beginDisablingUserInteractionForReason:", 3);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __78__PUPickerBannerView_animateImagesOntoView_inContainerView_completionHandler___block_invoke;
    v82[3] = &unk_1E58A6BF8;
    v83 = v77;
    v84 = v64;
    v85 = v11;
    v65 = v64;
    v66 = v77;
    -[PUPickerBannerView _setAnimationCompletionHandler:](v74, "_setAnimationCompletionHandler:", v82);
    objc_msgSend(v66, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addAnimation:forKey:", v57, CFSTR("jumpAndLandAnimation"));

    objc_msgSend(v76, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "addAnimation:forKey:", v62, CFSTR("jumpAndLandAnimation"));
    v9 = v79;

    v8 = v80;
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a4;
  -[PUPickerBannerView _animationCompletionHandler](self, "_animationCompletionHandler", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUPickerBannerView _animationCompletionHandler](self, "_animationCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

    -[PUPickerBannerView _setAnimationCompletionHandler:](self, "_setAnimationCompletionHandler:", 0);
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (NSArray)images
{
  return self->_images;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)leftView
{
  return self->_leftView;
}

- (UIView)rightView
{
  return self->_rightView;
}

- (int64_t)_alignment
{
  return self->__alignment;
}

- (UILabel)_label
{
  return self->__label;
}

- (void)_setLabel:(id)a3
{
  objc_storeStrong((id *)&self->__label, a3);
}

- (PUStackView)_stackView
{
  return self->__stackView;
}

- (void)_setStackView:(id)a3
{
  objc_storeStrong((id *)&self->__stackView, a3);
}

- (BOOL)_animatingStackView
{
  return self->__animatingStackView;
}

- (id)_animationCompletionHandler
{
  return self->__animationCompletionHandler;
}

- (void)_setAnimationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__animationCompletionHandler, 0);
  objc_storeStrong((id *)&self->__stackView, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

uint64_t __78__PUPickerBannerView_animateImagesOntoView_inContainerView_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __44__PUPickerBannerView_setRightView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 48));
}

uint64_t __43__PUPickerBannerView_setLeftView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 48));
}

@end
