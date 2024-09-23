@implementation _TVCollectionWrappingView

+ (void)gradientConfigForCollection:(id)a3 gradientMask:(int64_t)a4 gradientLengths:(UIEdgeInsets *)a5 gradientInset:(UIEdgeInsets *)a6 gradientBoundsInset:(UIEdgeInsets *)a7
{
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
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
  double v32;
  double v33;
  double v34;

  v10 = a4;
  objc_msgSend(a3, "contentInset");
  v15 = *MEMORY[0x24BDF7718];
  if ((v10 & 1) != 0)
  {
    v18 = 90.0;
    if (v11 < 100.0)
    {
      v19 = 100.0 - v11;
      v20 = -(100.0 - v11);
      v15 = v15 + v19;
      goto LABEL_8;
    }
  }
  else
  {
    v16 = v11 < 100.0;
    v17 = -(100.0 - v11);
    if (v16)
      v18 = v17;
    else
      v18 = *MEMORY[0x24BDF7718];
  }
  v20 = *MEMORY[0x24BDF7718];
LABEL_8:
  v21 = *(double *)(MEMORY[0x24BDF7718] + 16);
  if ((v10 & 4) != 0)
  {
    v22 = 90.0;
    if (v13 < 150.0)
    {
      v23 = 150.0 - v13;
      v24 = -(150.0 - v13);
      v21 = v23 + v21;
      goto LABEL_15;
    }
  }
  else if (v13 >= 150.0)
  {
    v22 = *(double *)(MEMORY[0x24BDF7718] + 16);
  }
  else
  {
    v22 = -(150.0 - v13);
  }
  v24 = *(double *)(MEMORY[0x24BDF7718] + 16);
LABEL_15:
  v25 = *(double *)(MEMORY[0x24BDF7718] + 8);
  if ((v10 & 8) != 0)
  {
    v27 = 90.0;
    if (v12 < 100.0)
    {
      v28 = 100.0 - v12;
      v29 = -(100.0 - v12);
      v25 = v25 + v28;
      goto LABEL_22;
    }
  }
  else
  {
    v16 = v12 < 100.0;
    v26 = -(100.0 - v12);
    if (v16)
      v27 = v26;
    else
      v27 = *(double *)(MEMORY[0x24BDF7718] + 8);
  }
  v29 = *(double *)(MEMORY[0x24BDF7718] + 8);
LABEL_22:
  v30 = *(double *)(MEMORY[0x24BDF7718] + 24);
  if ((v10 & 0x10) == 0)
  {
    v16 = v14 < 100.0;
    v31 = -(100.0 - v14);
    if (v16)
      v32 = v31;
    else
      v32 = *(double *)(MEMORY[0x24BDF7718] + 24);
LABEL_29:
    v34 = *(double *)(MEMORY[0x24BDF7718] + 24);
    if (!a5)
      goto LABEL_31;
    goto LABEL_30;
  }
  v32 = 90.0;
  if (v14 >= 100.0)
    goto LABEL_29;
  v33 = 100.0 - v14;
  v34 = -(100.0 - v14);
  v30 = v33 + v30;
  if (a5)
  {
LABEL_30:
    a5->top = v18;
    a5->left = v27;
    a5->bottom = v22;
    a5->right = v32;
  }
LABEL_31:
  if (a6)
  {
    a6->top = v15;
    a6->left = v25;
    a6->bottom = v21;
    a6->right = v30;
  }
  if (a7)
  {
    a7->top = v20;
    a7->left = v29;
    a7->bottom = v24;
    a7->right = v34;
  }
}

- (_TVCollectionWrappingView)initWithFrame:(CGRect)a3
{
  _TVCollectionWrappingView *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionWrappingView;
  v3 = -[_TVCollectionWrappingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_TVShelfViewLayout defaultHeaderSelectionMargin](_TVShelfViewLayout, "defaultHeaderSelectionMargin");
    v3->_headerSelectionMargin = v4;
    v3->_headerFloating = 1;
    v3->_headerAuxiliarySelecting = 1;
  }
  return v3;
}

- (void)setHeaderFloating:(BOOL)a3
{
  void *v4;

  if (self->_headerFloating != a3)
  {
    self->_headerFloating = a3;
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_TVCollectionWrappingView _updateSubviews](self, "_updateSubviews");
    -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHeaderHidden:(BOOL)a3
{
  _BOOL4 headerHidden;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  headerHidden = self->_headerHidden;
  if (headerHidden != a3)
  {
    self->_headerHidden = a3;
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", self->_headerHidden);

    -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");
    if (headerHidden)
    {
      -[_TVCollectionWrappingView window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "focusedView");
      obj = (id)objc_claimAutoreleasedReturnValue();

      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(obj, "isDescendantOfView:", v8);

      if ((_DWORD)v7)
      {
        objc_storeStrong((id *)&self->_selectingView, obj);
        -[_TVCollectionWrappingView reevaluateHeaderFrame](self, "reevaluateHeaderFrame");
      }

    }
  }
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  CGSize v7;
  UIView *v8;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v8 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    v7 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->_headerFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->_headerFrame.size = v7;
    -[_TVCollectionWrappingView _updateSubviews](self, "_updateSubviews");
  }
  -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCollectionView:(id)a3
{
  _TVCollectionView *v5;
  _TVCollectionView *collectionView;
  _TVCollectionView *v7;

  v5 = (_TVCollectionView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    -[_TVCollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    self->_collectionViewFlags.respondsToAugmentedSelectionFrameForFrame = objc_opt_respondsToSelector() & 1;
    -[_TVCollectionWrappingView _updateSubviews](self, "_updateSubviews");
  }
  -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCentered:(BOOL)a3
{
  if (self->_centered != a3)
  {
    self->_centered = a3;
    -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *footerView;
  CGSize v7;
  UIView *v8;

  v5 = (UIView *)a3;
  footerView = self->_footerView;
  v8 = v5;
  if (footerView != v5)
  {
    -[UIView removeFromSuperview](footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    v7 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->_footerFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->_footerFrame.size = v7;
    -[_TVCollectionWrappingView _updateSubviews](self, "_updateSubviews");
  }
  -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");

}

- (void)reevaluateFooterFrame
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  _QWORD v9[4];
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[_TVCollectionWrappingView _currentFooterView](self, "_currentFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CGRectIntegral(self->_footerFrame);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  objc_msgSend(v3, "frame");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50___TVCollectionWrappingView_reevaluateFooterFrame__block_invoke;
    v9[3] = &unk_24EB857E0;
    v10 = v3;
    v11 = x;
    v12 = y;
    v13 = width;
    v14 = height;
    objc_msgSend(v8, "tv_performByPreventingAdditiveAnimations:", v9);

  }
}

- (void)reevaluateHeaderFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect v20;

  -[_TVCollectionWrappingView _currentHeaderView](self, "_currentHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCollectionWrappingView _adjustedHeaderFrame](self, "_adjustedHeaderFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    v12 = (void *)MEMORY[0x24BDF6F90];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50___TVCollectionWrappingView_reevaluateHeaderFrame__block_invoke;
    v13[3] = &unk_24EB857E0;
    v14 = v3;
    v15 = v5;
    v16 = v7;
    v17 = v9;
    v18 = v11;
    objc_msgSend(v12, "tv_performByPreventingAdditiveAnimations:", v13);

  }
}

- (void)tv_setShowcaseFactor:(double)a3
{
  void *v5;

  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tv_setShowcaseFactor:", a3);

    -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setValue:(id)a3 forTVViewStyle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVCollectionWrappingView;
  -[UIView setValue:forTVViewStyle:](&v5, sel_setValue_forTVViewStyle_, a3, a4);
  -[_TVCollectionWrappingView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGSize result;

  width = a3.width;
  -[_TVCollectionWrappingView _adjustedPadding](self, "_adjustedPadding", a3.width, a3.height);
  v69 = v5;
  v70 = v6;
  v8 = v7;
  v10 = v9;
  v68 = v9;
  -[_TVCollectionWrappingView headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_margin");
  v65 = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[_TVCollectionWrappingView _adjustedShowcaseFactor](self, "_adjustedShowcaseFactor");
  v20 = v19;
  v67 = width;
  if (width - (v8 + v14 + v10 + v18) >= 2.22044605e-16)
    width = width - (v8 + v14 + v10 + v18);
  v64 = width;
  -[_TVCollectionWrappingView headerView](self, "headerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tv_sizeThatFits:", width, 0.0);
  v23 = v22;

  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "_displaysHorizontalIndexTitleBar");

  v26 = *MEMORY[0x24BDF8128];
  if (!v25)
    v26 = 0.0;
  v27 = 1.0 - v20;
  v28 = (1.0 - v20) * v23;
  v29 = *MEMORY[0x24BDF7718];
  v30 = *(double *)(MEMORY[0x24BDF7718] + 16);
  if (v28 == 0.0)
    v31 = *(double *)(MEMORY[0x24BDF7718] + 16);
  else
    v31 = v16;
  v32 = v65;
  if (v28 == 0.0)
    v32 = *MEMORY[0x24BDF7718];
  v66 = v32;
  v33 = v27 * v26;
  v34 = v27 * v26 == 0.0;
  v35 = 18.0;
  if (v34)
    v35 = 0.0;
  v62 = v35;
  v63 = v31;
  -[_TVCollectionWrappingView footerView](self, "footerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tv_margin");
  v58 = v38;
  v60 = v37;
  v40 = v39;
  v42 = v41;

  v43 = v8 + v40 + v68 + v42;
  if (v64 < 2.22044605e-16)
    v43 = 0.0;
  v44 = v67 - v43;
  -[_TVCollectionWrappingView footerView](self, "footerView", v58, v60);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "tv_sizeThatFits:", v44, 0.0);
  v47 = v46;

  v49 = v59;
  v48 = v61;
  if (v27 * v47 == 0.0)
  {
    v48 = v29;
    v49 = v30;
  }
  v50 = v70 + v49 + v27 * v47 + v48;
  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "tv_sizeThatFits:withContentInset:", v67, 0.0, v69 + v62 + v33 + v28 + v66 + v63, v8, v50, v68);
  v53 = v52;
  v55 = v54;

  v56 = v53;
  v57 = v55;
  result.height = v57;
  result.width = v56;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  float v52;
  int v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double x;
  double y;
  double width;
  double height;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  BOOL v92;
  BOOL v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  __int128 v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double sx;
  double v138;
  double v139;
  CATransform3D v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  objc_super v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v147.receiver = self;
  v147.super_class = (Class)_TVCollectionWrappingView;
  -[_TVCollectionWrappingView layoutSubviews](&v147, sel_layoutSubviews);
  -[_TVCollectionWrappingView bounds](self, "bounds");
  v138 = v3;
  v139 = v4;
  v124 = v5;
  v7 = v6;
  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCollectionWrappingView _currentHeaderView](self, "_currentHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCollectionWrappingView _adjustedPadding](self, "_adjustedPadding");
  v132 = v10;
  v127 = v11;
  v126 = v12;
  v14 = v13;
  -[UIView tv_padding](self, "tv_padding");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v9, "tv_margin");
  v130 = v19;
  v131 = v20;
  v22 = v21;
  v24 = v23;
  -[_TVCollectionWrappingView _adjustedShowcaseFactor](self, "_adjustedShowcaseFactor");
  v26 = v25;
  -[_TVCollectionWrappingView _showcaseContentScaleForExpectedWidth:](self, "_showcaseContentScaleForExpectedWidth:", v7);
  v136 = v26;
  sx = 1.0 - (1.0 - v27) * v26;
  v123 = v16 + v18;
  if (v7 - (v22 + v24) - (v16 + v18) >= 2.22044605e-16)
    v28 = v7 - (v22 + v24) - (v16 + v18);
  else
    v28 = v7;
  v29 = -[_TVCollectionWrappingView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v9, "tv_sizeThatFits:", v28, 0.0);
  v31 = v30;
  v33 = v32;
  v134 = v14;
  v34 = v7 - (v14 + v24 + v30);
  v125 = v16;
  if (v29 == 1)
    v35 = v34;
  else
    v35 = v16 + v22;
  if (v30 < v28)
  {
    v36 = objc_msgSend(v9, "tv_alignment");
    v37 = floor((v7 - v31) * 0.5);
    if (v36 != 2)
      v37 = v35;
    if (v36 == 3)
      v35 = v34;
    else
      v35 = v37;
  }
  v148.origin.y = v132 + v130;
  v148.origin.x = v35;
  v148.size.width = v31;
  v148.size.height = v33;
  self->_headerFrame = CGRectIntegral(v148);
  -[_TVCollectionWrappingView _adjustedHeaderFrame](self, "_adjustedHeaderFrame");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend(v9, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "anchorPoint");
  v48 = v47;
  v50 = v49;

  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v43, v45);
  v117 = v41;
  v118 = v39;
  v115 = v45;
  v116 = v43;
  v51 = v39 + v43 * v48;
  v52 = v41 + v45 * v50;
  objc_msgSend(v9, "setCenter:", roundf(v51), roundf(v52));
  v53 = objc_msgSend(v8, "_displaysHorizontalIndexTitleBar");
  v54 = 18.0;
  if (v53)
  {
    v55 = *MEMORY[0x24BDF8128];
  }
  else
  {
    v54 = 0.0;
    v55 = 0.0;
  }
  v121 = v55;
  v120 = v54 + v55 + v131 + v130 + self->_headerFrame.size.height;
  v122 = floor((1.0 - v136) * v120);
  v129 = ceil(v136 * v120);
  v119 = ceil(v139 / sx);
  objc_msgSend(v8, "setFrame:", 0.0);
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v138, v124, v7, v139);
  -[_TVCollectionWrappingView _currentFooterView](self, "_currentFooterView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "tv_margin");
  v59 = v57;
  v61 = v60;
  v62 = v58;
  if (v7 - (v57 + v58) - v123 >= 2.22044605e-16)
    v63 = v7 - (v57 + v58) - v123;
  else
    v63 = v7;
  objc_msgSend(v56, "tv_sizeThatFits:", v63, 0.0);
  v65 = v64;
  v67 = v66;
  v68 = v7 - (v134 + v62 + v64);
  if (v29 == 1)
    v69 = v68;
  else
    v69 = v125 + v59;
  if (v64 < v63)
  {
    v70 = objc_msgSend(v56, "tv_alignment");
    v71 = floor((v7 - v65) * 0.5);
    if (v70 != 2)
      v71 = v69;
    if (v70 == 3)
      v69 = v68;
    else
      v69 = v71;
  }
  v72 = v126 + v61 + v67;
  v149.origin.y = v139 - v72;
  v149.origin.x = v69;
  v149.size.width = v65;
  v149.size.height = v67;
  v150 = CGRectIntegral(v149);
  self->_footerFrame = v150;
  v151 = CGRectIntegral(v150);
  x = v151.origin.x;
  y = v151.origin.y;
  width = v151.size.width;
  height = v151.size.height;
  objc_msgSend(v56, "layer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "anchorPoint");
  v79 = v78;
  v81 = v80;

  objc_msgSend(v56, "setBounds:", 0.0, 0.0, width, height);
  v82 = x + width * v79;
  v83 = v132 + v122;
  *(float *)&v82 = v82;
  v84 = y + height * v81;
  objc_msgSend(v56, "setCenter:", roundf(*(float *)&v82), roundf(v84));
  -[_TVCollectionWrappingView _updateGradientLayer](self, "_updateGradientLayer");
  v85 = -[_TVCollectionWrappingView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v85 == 1)
    v86 = v134;
  else
    v86 = v127;
  if (v85 == 1)
    v87 = v127;
  else
    v87 = v134;
  objc_msgSend(v8, "contentInset");
  if (v91 != v86 || (v88 == v83 ? (v92 = v90 == v87) : (v92 = 0), v92 ? (v93 = v89 == v72) : (v93 = 0), !v93))
  {
    objc_msgSend(v8, "contentOffset");
    v95 = v94;
    v97 = v96;
    objc_msgSend(v8, "contentInset");
    v99 = v98;
    v133 = v100;
    v135 = v101;
    v128 = v102;
    objc_msgSend(v8, "setContentInset:", v83, v86, v72, v87);
    v103 = v121;
    if (v121 > 0.0)
      objc_msgSend(v8, "_setHorizontalIndexTitleBarOffset:", 0.0, -(v120 - (v131 + v130 + self->_headerFrame.size.height)));
    if (-[_TVCollectionWrappingView collectionGradientMask](self, "collectionGradientMask", v103) < 1)
    {
      objc_msgSend(v8, "_setGradientMaskLengths:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    }
    else
    {
      v104 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
      v145 = *MEMORY[0x24BDF7718];
      v146 = v104;
      v143 = v145;
      v144 = v104;
      v141 = v145;
      v142 = v104;
      objc_msgSend((id)objc_opt_class(), "gradientConfigForCollection:gradientMask:gradientLengths:gradientInset:gradientBoundsInset:", v8, -[_TVCollectionWrappingView collectionGradientMask](self, "collectionGradientMask"), &v145, &v143, &v141);
      if ((-[_TVCollectionWrappingView collectionGradientMask](self, "collectionGradientMask") & 1) != 0
        && v9
        && -[_TVCollectionWrappingView isHeaderFloating](self, "isHeaderFloating"))
      {
        v152.origin.y = v117;
        v152.origin.x = v118;
        v152.size.height = v115;
        v152.size.width = v116;
        *(double *)&v143 = *(double *)&v143 + v131 + CGRectGetMaxY(v152);
      }
      objc_msgSend(v8, "_setGradientMaskLengths:", v145, v146);
      objc_msgSend(v8, "_setGradientMaskEdgeInsets:", v143, v144);
      objc_msgSend(v8, "_setGradientBoundsInsets:", v141, v142);
    }
    if ((objc_msgSend(v8, "isDragging") & 1) == 0 && (objc_msgSend(v8, "isDecelerating") & 1) == 0)
    {
      objc_msgSend(v8, "contentSize");
      v107 = v128 + v106 - v7;
      v108 = v87 + v106 - v7;
      if (v95 < v107)
        v108 = v95;
      if (v95 <= -v133)
        v108 = -v86;
      v109 = v135 + v105 - v119;
      v110 = v72 + v105 - v119;
      if (v97 < v109)
        v110 = v97;
      if (v97 <= -v99)
        v110 = -v83;
      objc_msgSend(v8, "setContentOffset:animated:", 0, v108, v110);
    }
  }
  -[_TVCollectionWrappingView setBounds:](self, "setBounds:", v138, v129, v7, v139);
  +[TVMLUtilities _headerFadeForShowcaseFactor:](TVMLUtilities, "_headerFadeForShowcaseFactor:", v136);
  v112 = v111;
  objc_msgSend(v9, "setAlpha:");
  objc_msgSend(v8, "_horizontalIndexTitleBar");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setAlpha:", v112);

  -[_TVCollectionWrappingView layer](self, "layer");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v140, sx, sx, 1.0);
  objc_msgSend(v114, "setSublayerTransform:", &v140);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  CGFloat v11;
  _BOOL8 v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  UIView *selectingView;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  _TVCollectionWrappingView *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  _TVCollectionWrappingView *v26;

  v6 = a4;
  objc_msgSend(a3, "nextFocusedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCollectionWrappingView _currentHeaderView](self, "_currentHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_TVCollectionWrappingView headerCanBecomeFocused](self, "headerCanBecomeFocused"))
    -[_TVCollectionWrappingView setHeaderFocused:](self, "setHeaderFocused:", objc_msgSend(v7, "isDescendantOfView:", v8));
  if (v8)
  {
    if (!-[_TVCollectionWrappingView isHeaderFocused](self, "isHeaderFocused"))
    {
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isDescendantOfView:", v9);

      if (v10)
      {
        objc_msgSend(v8, "frame");
        v12 = v11 < self->_headerFrame.origin.y;
        objc_storeStrong((id *)&self->_selectingView, v7);
        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
        v25 = &unk_24EB85440;
        v26 = self;
        v13 = &v22;
        v14 = v6;
        v15 = v12;
LABEL_9:
        objc_msgSend(v14, "addCoordinatedAnimationsForAnimation:animations:completion:", v15, v13, 0, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
        goto LABEL_10;
      }
    }
  }
  selectingView = self->_selectingView;
  if (selectingView)
  {
    self->_selectingView = 0;

    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __78___TVCollectionWrappingView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
    v20 = &unk_24EB85440;
    v21 = self;
    v13 = &v17;
    v14 = v6;
    v15 = 1;
    goto LABEL_9;
  }
LABEL_10:

}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (-[_TVCollectionWrappingView headerCanBecomeFocused](self, "headerCanBecomeFocused")
    && -[_TVCollectionWrappingView isHeaderFocused](self, "isHeaderFocused"))
  {
    -[_TVCollectionWrappingView _currentHeaderView](self, "_currentHeaderView");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)rowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  float v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  double v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _OWORD v77[2];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  int64_t v81;
  void *v82;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x24BDAC8D0];
  -[_TVCollectionWrappingView _adjustedPadding](self, "_adjustedPadding");
  v8 = v7;
  v70 = v10;
  v71 = v9;
  v12 = v11;
  v81 = 0x7FFFFFFFFFFFFFFFLL;
  -[_TVCollectionWrappingView _collectionRowMetricsForExpectedWidth:firstItemRowIndex:forShowcase:](self, "_collectionRowMetricsForExpectedWidth:firstItemRowIndex:forShowcase:", &v81, 0, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  memset(v77, 0, sizeof(v77));
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "tv_rowMetricsValue");
    }
    else
    {
      v79 = 0u;
      v80 = 0u;
      v78 = 0u;
      memset(v77, 0, sizeof(v77));
    }

  }
  else
  {
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    memset(v77, 0, sizeof(v77));
  }
  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_displaysHorizontalIndexTitleBar");

  if (v17)
  {
    *(float64x2_t *)((char *)v77 + 8) = vaddq_f64(*(float64x2_t *)((char *)v77 + 8), (float64x2_t)vdupq_lane_s64(COERCE__INT64(*MEMORY[0x24BDF8128] + 18.0), 0));
    *(_QWORD *)&v80 = 0;
    *(_QWORD *)&v79 = 0;
    *(_QWORD *)&v78 = 0;
  }
  -[_TVCollectionWrappingView headerView](self, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tv_margin");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v29 = a3 - (v71 + v24 + v70 + v28) >= 2.22044605e-16 ? a3 - (v71 + v24 + v70 + v28) : a3;
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tv_sizeThatFits:", v29, 0.0);
    v32 = v31;

    -[_TVCollectionWrappingView headerView](self, "headerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "tv_alignmentInsetsForExpectedWidth:", v29);
    v35 = v34;

    v36 = v8 + v22;
    *(float64x2_t *)((char *)v77 + 8) = vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(v26 + v36 + v32), 0), *(float64x2_t *)((char *)v77 + 8));
    *(double *)&v78 = v36 + v35;
    *(double *)&v79 = v36 + v35;
    v19 = *(double *)&v80;
    if (*(double *)&v80 > 0.0)
    {
      -[_TVCollectionWrappingView headerSelectionMargin](self, "headerSelectionMargin", *(double *)&v80);
      *(float *)&v37 = fmax(v37 + *(double *)&v80 - v26, 0.0) - v36;
      v19 = fmaxf(*(float *)&v37, 0.0);
      *(double *)&v80 = v19;
    }
  }
  if (objc_msgSend(v13, "count", v19))
  {
    v38 = (void *)objc_msgSend(v13, "mutableCopy");
    v74 = v78;
    v75 = v79;
    v76 = v80;
    v72 = v77[0];
    v73 = v77[1];
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v72);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "replaceObjectAtIndex:withObject:", 0, v39);

    v40 = objc_msgSend(v38, "copy");
  }
  else
  {
    v41 = *((double *)v77 + 1);
    if (*((double *)v77 + 1) <= 0.0)
      goto LABEL_20;
    v74 = v78;
    v75 = v79;
    v76 = v80;
    v72 = v77[0];
    v73 = v77[1];
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v72);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 1);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v40;

  v13 = v42;
LABEL_20:
  -[_TVCollectionWrappingView footerView](self, "footerView", v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    goto LABEL_37;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      objc_msgSend(v44, "tv_rowMetricsValue");
    }
    else
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v72 = 0u;
    }
    v78 = v74;
    v79 = v75;
    v80 = v76;
    v77[0] = v72;
    v77[1] = v73;

  }
  else
  {
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    memset(v77, 0, sizeof(v77));
  }
  -[_TVCollectionWrappingView footerView](self, "footerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "tv_margin");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  if (a3 - (v71 + v50 + v70 + v54) >= 2.22044605e-16)
    v55 = a3 - (v71 + v50 + v70 + v54);
  else
    v55 = a3;
  -[_TVCollectionWrappingView footerView](self, "footerView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "tv_sizeThatFits:", v55, 0.0);
  v58 = v57;

  -[_TVCollectionWrappingView footerView](self, "footerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "tv_alignmentInsetsForExpectedWidth:", v55);
  v61 = v60;

  v62 = v52 + v48 + v58;
  *((double *)v77 + 1) = v62 + *((double *)v77 + 1);
  *((double *)&v77[1] + 1) = v62 + *((double *)&v77[1] + 1);
  *((double *)&v78 + 1) = v12 + v52 + v61;
  *((double *)&v79 + 1) = *((double *)&v78 + 1);
  if (*((double *)&v80 + 1) > 0.0)
  {
    v63 = fmax(v48 + 7.0 - *((double *)&v80 + 1), 0.0) - (v12 + v52);
    *((double *)&v80 + 1) = fmaxf(v63, 0.0);
  }
  if (objc_msgSend(v13, "count"))
  {
    v64 = (void *)objc_msgSend(v13, "mutableCopy");
    v65 = objc_msgSend(v13, "count") - 1;
    v74 = v78;
    v75 = v79;
    v76 = v80;
    v72 = v77[0];
    v73 = v77[1];
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v72);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "replaceObjectAtIndex:withObject:", v65, v66);

    v67 = objc_msgSend(v64, "copy");
  }
  else
  {
    if (*((double *)v77 + 1) <= 0.0)
      goto LABEL_37;
    v74 = v78;
    v75 = v79;
    v76 = v80;
    v72 = v77[0];
    v73 = v77[1];
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v72);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v64;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
    v67 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v67;

  v13 = v68;
LABEL_37:
  if (a4)
    *a4 = v81;
  return v13;
}

- (BOOL)shouldBindRowsTogether
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2557B2468))
  {
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return 0;
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "shouldBindRowsTogether");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)showcaseRowMetricsForExpectedWidth:(double)a3
{
  return -[_TVCollectionWrappingView _collectionRowMetricsForExpectedWidth:firstItemRowIndex:forShowcase:](self, "_collectionRowMetricsForExpectedWidth:firstItemRowIndex:forShowcase:", 0, 1, a3);
}

- (id)_collectionRowMetricsForExpectedWidth:(double)a3 firstItemRowIndex:(int64_t *)a4 forShowcase:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  double v41;
  void *v42;
  __int128 v44;
  _OWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[5];
  int64_t v51;
  _BYTE v52[128];
  _QWORD v53[2];

  v5 = a5;
  v53[1] = *MEMORY[0x24BDAC8D0];
  v51 = 0x7FFFFFFFFFFFFFFFLL;
  -[_TVCollectionWrappingView _adjustedPadding](self, "_adjustedPadding");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[_TVCollectionWrappingView headerView](self, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v10 = 0.0;
  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_2557B2540);

  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    v22 = objc_opt_respondsToSelector();

    if (!v5
      || (v22 & 1) == 0
      || (-[_TVCollectionWrappingView collectionView](self, "collectionView"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "showcaseRowMetricsForExpectedWidth:withContentInset:", a3, v10, v12, v14, v16),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          !v21))
    {
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rowMetricsForExpectedWidth:withContentInset:firstItemRowIndex:", &v51, a3, v10, v12, v14, v16);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v21 = (void *)v25;

    }
  }
  else
  {

    if (v21)
    {
      memset(&v50[1], 0, 64);
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "tv_sizeThatFits:withContentInset:", a3, 0.0, v10, v12, v14, v16);
      v28 = v27;

      *(_QWORD *)&v50[0] = 0;
      *((_QWORD *)&v50[0] + 1) = v28;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", v50);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 1);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  if (v5)
  {
    -[_TVCollectionWrappingView _showcaseContentScaleForExpectedWidth:](self, "_showcaseContentScaleForExpectedWidth:", a3);
    v44 = v29;
    if (*(double *)&v29 < 1.0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v31 = v21;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v47 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            memset(v50, 0, sizeof(v50));
            if (v36)
            {
              objc_msgSend(v36, "tv_rowMetricsValue");
              v37 = *(float64x2_t *)((char *)v50 + 8);
              v38 = *(float64x2_t *)((char *)&v50[1] + 8);
              v39 = *(float64x2_t *)((char *)&v50[2] + 8);
              v40 = *(float64x2_t *)((char *)&v50[3] + 8);
              v41 = *((double *)&v50[4] + 1);
            }
            else
            {
              *(_QWORD *)&v50[0] = 0;
              v37 = 0uLL;
              v41 = 0.0;
              v38 = 0uLL;
              v39 = 0uLL;
              v40 = 0uLL;
            }
            *(float64x2_t *)((char *)v50 + 8) = vmulq_n_f64(v37, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[1] + 8) = vmulq_n_f64(v38, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[2] + 8) = vmulq_n_f64(v39, *(double *)&v44);
            *(float64x2_t *)((char *)&v50[3] + 8) = vmulq_n_f64(v40, *(double *)&v44);
            *((double *)&v50[4] + 1) = *(double *)&v44 * v41;
            v45[2] = v50[2];
            v45[3] = v50[3];
            v45[4] = v50[4];
            v45[0] = v50[0];
            v45[1] = v50[1];
            objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", v45, v44);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v42);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v33);
      }

      v21 = (void *)objc_msgSend(v30, "copy");
    }
  }
  if (a4)
    *a4 = v51;
  return v21;
}

- (CGRect)_adjustedHeaderFrame
{
  CGRect *p_headerFrame;
  CGFloat x;
  double y;
  double height;
  CGFloat width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  UIView *selectingView;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  CGRect v66;
  CGRect v68;
  CGRect v69;

  p_headerFrame = &self->_headerFrame;
  x = self->_headerFrame.origin.x;
  y = self->_headerFrame.origin.y;
  width = self->_headerFrame.size.width;
  height = self->_headerFrame.size.height;
  if (self->_selectingView
    && -[_TVCollectionWrappingView isHeaderAuxiliarySelecting](self, "isHeaderAuxiliarySelecting")
    && -[_TVCollectionWrappingView isHeaderFloating](self, "isHeaderFloating"))
  {
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tv_padding](self, "tv_padding");
    v65 = v9;
    v62 = v10;
    -[UIView frame](self->_selectingView, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = -[UIView conformsToProtocol:](self->_selectingView, "conformsToProtocol:", &unk_25578CA30);
    selectingView = self->_selectingView;
    if (v19)
      -[UIView selectionMarginsForSize:](selectingView, "selectionMarginsForSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    else
      -[UIView tv_focusMargin](selectingView, "tv_focusMargin");
    v26 = v12 - v22;
    v27 = v14 - v21;
    v28 = v16 + v22 + v24;
    v29 = v18 + v21 + v23;
    -[UIView superview](self->_selectingView, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertRect:fromView:", v30, v26, v27, v28, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v61 = x;
    if (self->_collectionViewFlags.respondsToAugmentedSelectionFrameForFrame)
    {
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "tv_augmentedSelectionFrameForFrame:", v32, v34, v36, v38);
      v32 = v40;
      v34 = v41;
      v36 = v42;
      v38 = v43;

    }
    -[_TVCollectionWrappingView collectionView](self, "collectionView", *(_QWORD *)&width);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCollectionWrappingView convertRect:fromView:](self, "convertRect:fromView:", v44, v32, v34, v36, v38);
    v46 = v45;
    v63 = v48;
    v64 = v47;
    v50 = v49;

    v51 = v65;
    if (v46 >= v65)
    {
      -[_TVCollectionWrappingView bounds](self, "bounds");
      v51 = v46;
      if (v46 + v50 > v52 - v62)
      {
        -[_TVCollectionWrappingView bounds](self, "bounds");
        v51 = v53 - v62 - v50;
      }
    }
    v55 = p_headerFrame->origin.x;
    v54 = p_headerFrame->origin.y;
    v57 = p_headerFrame->size.width;
    v56 = p_headerFrame->size.height;
    -[_TVCollectionWrappingView headerSelectionMargin](self, "headerSelectionMargin");
    v68.size.height = v56 + v58;
    v68.origin.x = v55;
    v68.origin.y = v54;
    v68.size.width = v57;
    v69.origin.x = v51;
    v69.size.height = v63;
    v69.origin.y = v64;
    v69.size.width = v50;
    if (CGRectIntersectsRect(v68, v69))
    {
      x = p_headerFrame->origin.x;
      -[_TVCollectionWrappingView headerSelectionMargin](self, "headerSelectionMargin");
      width = p_headerFrame->size.width;
      height = p_headerFrame->size.height;
      y = v64 - v59 - height;
    }
    else
    {
      width = v60;
      x = v61;
    }
    goto LABEL_8;
  }
  if (!-[_TVCollectionWrappingView isHeaderFloating](self, "isHeaderFloating"))
  {
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInset");
    y = y - v25;
LABEL_8:

  }
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  return CGRectIntegral(v66);
}

- (UIEdgeInsets)_adjustedPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  -[UIView tv_padding](self, "tv_padding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[_TVCollectionWrappingView isCentered](self, "isCentered"))
  {
    -[_TVCollectionWrappingView bounds](self, "bounds");
    v12 = v11 - (v6 + v10);
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionViewLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "prepareLayout");
    objc_msgSend(v14, "collectionViewContentSize");
    if (v15 < v12)
    {
      v16 = v15;
      -[_TVCollectionWrappingView bounds](self, "bounds");
      v10 = (v17 - v16) * 0.5;
      v6 = v10;
    }

  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)_adjustedShowcaseFactor
{
  uint64_t v4;

  -[_TVCollectionWrappingView showcaseConfig](self, "showcaseConfig");
  if (v4)
    return self->_showcaseFactor;
  else
    return 0.0;
}

- (double)_showcaseContentScaleForExpectedWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[_TVCollectionWrappingView _adjustedPadding](self, "_adjustedPadding");
  v6 = v5;
  v8 = v7;
  -[_TVCollectionWrappingView showcaseConfig](self, "showcaseConfig");
  return fmin((a3 + 0.0 * -2.0) / (a3 - (v6 + v8)), 1.0);
}

- (id)_currentHeaderView
{
  void *v3;

  if (-[_TVCollectionWrappingView isHeaderHidden](self, "isHeaderHidden"))
  {
    v3 = 0;
  }
  else
  {
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setIkBackgroundColor:(id)a3
{
  void *v5;
  void *v6;
  CAGradientLayer *v7;
  CAGradientLayer *gradientLayer;
  void *v9;
  id v10;

  v10 = a3;
  if ((-[IKColor isEqual:](self->_ikBackgroundColor, "isEqual:") & 1) == 0)
  {
    -[CAGradientLayer removeFromSuperlayer](self->_gradientLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_ikBackgroundColor, a3);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "color");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "colorType") == 3)
      {
        objc_msgSend(MEMORY[0x24BDE56B8], "layer");
        v7 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
        gradientLayer = self->_gradientLayer;
        self->_gradientLayer = v7;

        -[_TVCollectionWrappingView _updateGradientLayer](self, "_updateGradientLayer");
        -[_TVCollectionWrappingView layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertSublayer:atIndex:", self->_gradientLayer, 0);

      }
    }
    else
    {
      v6 = v5;
    }
    -[_TVCollectionWrappingView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[_TVCollectionWrappingView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle"))
  {
    v5 = objc_msgSend(v8, "userInterfaceStyle");
    -[_TVCollectionWrappingView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    if (v5 != v7)
      -[_TVCollectionWrappingView _updateGradientLayer](self, "_updateGradientLayer");
  }
  else
  {

  }
}

- (void)_updateGradientLayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CAGradientLayer *gradientLayer;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  if (self->_gradientLayer)
  {
    -[IKColor gradientColors](self->_ikBackgroundColor, "gradientColors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDBCEB8];
      -[IKColor gradientColors](self->_ikBackgroundColor, "gradientColors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[IKColor gradientColors](self->_ikBackgroundColor, "gradientColors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __49___TVCollectionWrappingView__updateGradientLayer__block_invoke;
      v12[3] = &unk_24EB86858;
      v13 = v7;
      v11 = v7;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

      -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v11);
      gradientLayer = self->_gradientLayer;
      -[IKColor gradientPoints](self->_ikBackgroundColor, "gradientPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setLocations:](gradientLayer, "setLocations:", v10);

    }
  }
}

- (void)_updateSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _TVCollectionWrappingView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _TVCollectionWrappingView *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _TVCollectionWrappingView *v26;
  void *v27;
  id v28;

  -[_TVCollectionWrappingView collectionView](self, "collectionView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_TVCollectionWrappingView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_TVCollectionWrappingView headerView](self, "headerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (_TVCollectionWrappingView *)objc_claimAutoreleasedReturnValue();

      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == self)
      {
        -[_TVCollectionWrappingView headerView](self, "headerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVCollectionWrappingView insertSubview:below:](self, "insertSubview:below:", v9, v10);

      }
      else
      {
        -[_TVCollectionWrappingView addSubview:](self, "addSubview:", v9);
      }

    }
  }
  -[_TVCollectionWrappingView headerView](self, "headerView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_TVCollectionWrappingView headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = -[_TVCollectionWrappingView isHeaderFloating](self, "isHeaderFloating");
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        objc_msgSend(v16, "superview");
        v18 = (_TVCollectionWrappingView *)objc_claimAutoreleasedReturnValue();

        -[_TVCollectionWrappingView headerView](self, "headerView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 != self)
        {
          -[_TVCollectionWrappingView addSubview:](self, "addSubview:", v19);
LABEL_16:

          goto LABEL_17;
        }
        -[_TVCollectionWrappingView collectionView](self, "collectionView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVCollectionWrappingView insertSubview:above:](self, "insertSubview:above:", v19, v20);
LABEL_15:

        goto LABEL_16;
      }

      if (v17)
      {
        -[_TVCollectionWrappingView collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVCollectionWrappingView headerView](self, "headerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v20);
        goto LABEL_15;
      }
    }
  }
LABEL_17:
  -[_TVCollectionWrappingView footerView](self, "footerView");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_TVCollectionWrappingView footerView](self, "footerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[_TVCollectionWrappingView collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "superview");
      v26 = (_TVCollectionWrappingView *)objc_claimAutoreleasedReturnValue();

      -[_TVCollectionWrappingView footerView](self, "footerView");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (v26 == self)
      {
        -[_TVCollectionWrappingView collectionView](self, "collectionView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVCollectionWrappingView insertSubview:above:](self, "insertSubview:above:", v28, v27);

      }
      else
      {
        -[_TVCollectionWrappingView addSubview:](self, "addSubview:", v28);
      }

    }
  }
}

- (UIView)headerView
{
  return self->_headerView;
}

- (_TVCollectionView)collectionView
{
  return self->_collectionView;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (BOOL)headerCanBecomeFocused
{
  return self->_headerCanBecomeFocused;
}

- (void)setHeaderCanBecomeFocused:(BOOL)a3
{
  self->_headerCanBecomeFocused = a3;
}

- (double)headerSelectionMargin
{
  return self->_headerSelectionMargin;
}

- (void)setHeaderSelectionMargin:(double)a3
{
  self->_headerSelectionMargin = a3;
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = *(TVShowcaseConfig *)((char *)self + 560);
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset;

  inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.inset = inset;
}

- (BOOL)isHeaderAuxiliarySelecting
{
  return self->_headerAuxiliarySelecting;
}

- (void)setHeaderAuxiliarySelecting:(BOOL)a3
{
  self->_headerAuxiliarySelecting = a3;
}

- (BOOL)isHeaderFloating
{
  return self->_headerFloating;
}

- (BOOL)isHeaderHidden
{
  return self->_headerHidden;
}

- (int64_t)collectionGradientMask
{
  return self->_collectionGradientMask;
}

- (void)setCollectionGradientMask:(int64_t)a3
{
  self->_collectionGradientMask = a3;
}

- (IKColor)ikBackgroundColor
{
  return self->_ikBackgroundColor;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isHeaderFocused
{
  return self->_headerFocused;
}

- (void)setHeaderFocused:(BOOL)a3
{
  self->_headerFocused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ikBackgroundColor, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_selectingView, 0);
}

@end
