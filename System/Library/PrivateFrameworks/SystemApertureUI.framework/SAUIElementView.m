@implementation SAUIElementView

- (SAUIElementView)initWithElementViewProvider:(id)a3
{
  id v5;
  SAUIElementView *v6;
  SAUIElementView *v7;
  _SAUIElementViewContentView *v8;
  uint64_t v9;
  UIView *contentView;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SAUIElementView;
  v6 = -[SAUIElementView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementViewProvider, a3);
    v8 = [_SAUIElementViewContentView alloc];
    -[SAUIElementView bounds](v7, "bounds");
    v9 = -[_SAUIElementViewContentView initWithFrame:](v8, "initWithFrame:");
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v9;

    -[SAUIElementView addSubview:](v7, "addSubview:", v7->_contentView);
    -[UIView setAutoresizingMask:](v7->_contentView, "setAutoresizingMask:", 18);
  }

  return v7;
}

- (_SAUIProvidedViewContainerView)minimalTransformView
{
  if (-[SAUIElementView _configureMinimalTransformViewIfNecessary](self, "_configureMinimalTransformViewIfNecessary"))
    -[SAUIElementView setNeedsLayout](self, "setNeedsLayout");
  return self->_minimalTransformView;
}

- (NSDirectionalEdgeInsets)suggestedOutsetsForLayoutMode:(int64_t)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t layoutAxis;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  id WeakRetained;
  char v19;
  double v20;
  double v21;
  double v22;
  void *v23;
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
  uint64_t v35;
  void *v36;
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
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  NSDirectionalEdgeInsets result;

  v5 = *MEMORY[0x24BDF65E8];
  v4 = *(double *)(MEMORY[0x24BDF65E8] + 8);
  v7 = *(double *)(MEMORY[0x24BDF65E8] + 16);
  v6 = *(double *)(MEMORY[0x24BDF65E8] + 24);
  if (a3 >= 1)
  {
    if (a3 == 1)
    {
      layoutAxis = self->_layoutAxis;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "maximumSizeOfMinimalViewForElementView:", self);
        v12 = *MEMORY[0x24BDBF148];
        v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
        v14 = v10 == *MEMORY[0x24BDBF148];
        if (v11 != v13)
          v14 = 0;
        if (layoutAxis != 2)
          v14 = 1;
        if (v14)
          v15 = v11;
        else
          v15 = v10;
        if (v14)
          v16 = v10;
        else
          v16 = v11;
      }
      else
      {
        v12 = *MEMORY[0x24BDBF148];
        v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
        v15 = 1.79769313e308;
        v16 = 1.79769313e308;
      }
      -[SAUIElementView _effectiveMinimalView](self, "_effectiveMinimalView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v23, 1, v16, v15);
        v12 = v24;
        v13 = v25;
      }
      if (v12 == 0.0 && v13 == 0.0)
      {
        objc_msgSend(v23, "sizeThatFits:", v16, v15);
        v12 = v26;
        v13 = v27;
      }
      if (layoutAxis == 2)
        v28 = v13;
      else
        v28 = v12;
      v29 = -v28;
      -[SAUIElementView _paddingForView:fromProvider:inLayoutMode:](self, "_paddingForView:fromProvider:inLayoutMode:", v23, self->_elementViewProvider, 1);
      v31 = v30;
      v4 = v29 - v30;
      v6 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(WeakRetained, "elementViewShouldCenterProvidedContent:", self))
          v32 = v31;
        else
          v32 = 0.0;
        v4 = v4 - v32;
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v19 = objc_opt_respondsToSelector();
      if ((v19 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "maximumSizeOfLeadingViewForElementView:", self);
        v21 = v20;
        v58 = v22;
      }
      else
      {
        v21 = 1.79769313e308;
        v58 = 1.79769313e308;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "maximumSizeOfTrailingViewForElementView:", self);
        v34 = v33;
        -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView", v35);
      }
      else
      {
        v34 = 1.79769313e308;
        -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView", 0x7FEFFFFFFFFFFFFFLL);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAUIElementViewProviding trailingView](self->_elementViewProvider, "trailingView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0.0;
      v38 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v23, a3, v21, v58);
        v38 = v39;
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v36, a3, v34, v57);
        v37 = v40;
      }
      if (fabs(v38) < 2.22044605e-16)
      {
        objc_msgSend(v23, "sizeThatFits:", v21, v58);
        v38 = v41;
      }
      if (fabs(v37) < 2.22044605e-16)
      {
        objc_msgSend(v36, "sizeThatFits:", v34, v57);
        v37 = v42;
      }
      v43 = -v38;
      if (v38 >= v37)
        v44 = v38;
      else
        v44 = v37;
      v45 = -v44;
      if (a3 == 3)
        v46 = v45;
      else
        v46 = -v38;
      if (a3 == 3)
        v47 = v45;
      else
        v47 = -v37;
      if (v46 != v4 || v5 != 0.0 || v47 != v6 || v7 != 0.0)
      {
        -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView", v43, -v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAUIElementView _paddingForView:fromProvider:inLayoutMode:](self, "_paddingForView:fromProvider:inLayoutMode:", v48, self->_elementViewProvider, a3);
        v50 = v49;

        v46 = v46 - v50;
        -[SAUIElementViewProviding trailingView](self->_elementViewProvider, "trailingView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAUIElementView _paddingForView:fromProvider:inLayoutMode:](self, "_paddingForView:fromProvider:inLayoutMode:", v51, self->_elementViewProvider, a3);
        v47 = v47 - v52;

      }
      v6 = v47;
      v4 = v46;
    }

    v7 = 0.0;
    v5 = 0.0;
  }
  v53 = v5;
  v54 = v4;
  v55 = v7;
  v56 = v6;
  result.trailing = v56;
  result.bottom = v55;
  result.leading = v54;
  result.top = v53;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SAUIElementView *v5;
  SAUIElementView *v6;
  SAUIElementView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SAUIElementView;
  -[SAUIElementView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SAUIElementView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  void (**v40)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  __n128 v51;
  __n128 v52;
  __n128 v53;
  __n128 v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  _BOOL4 v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  CGRect rect;
  void *v68;
  SAUIElementView *v69;
  id v70;
  void (**v71)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _QWORD v76[5];
  id v77;
  void (**v78)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  double v79;
  double v80;
  double v81;
  double v82;
  _QWORD v83[5];
  id v84;
  void (**v85)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  double v86;
  double v87;
  double v88;
  double v89;
  _QWORD v90[5];
  objc_super v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v91.receiver = self;
  v91.super_class = (Class)SAUIElementView;
  -[SAUIElementView layoutSubviews](&v91, sel_layoutSubviews);
  v3 = -[SAUIElementView _configureMinimalTransformViewIfNecessary](self, "_configureMinimalTransformViewIfNecessary");
  v61 = -[SAUIElementView _configureLeadingTransformViewIfNecessary](self, "_configureLeadingTransformViewIfNecessary");
  v62 = -[SAUIElementView _configureTrailingTransformViewIfNecessary](self, "_configureTrailingTransformViewIfNecessary");
  -[SAUIElementView bounds](self, "bounds");
  rect.origin.x = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SAUIElementView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v66 = v12;
  -[SAUIElementView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v13, "layoutDirection");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = objc_msgSend(WeakRetained, "layoutModeForElementView:", self);

  -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView");
  v16 = objc_claimAutoreleasedReturnValue();
  -[SAUIElementView _effectiveMinimalView](self, "_effectiveMinimalView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIElementViewProviding trailingView](self->_elementViewProvider, "trailingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)v16;
  if (v15 == 1)
    v19 = v17;
  else
    v19 = (void *)v16;
  v20 = v19;
  objc_msgSend(v20, "sizeThatFits:", v8, v10);
  BSRectWithSize();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  v64 = v11;
  if (v15 == 1
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v29, "elementViewShouldCenterProvidedContent:", self))
  {
    v60 = v66;
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    -[SAUIElementView _paddingForView:fromProvider:inLayoutMode:](self, "_paddingForView:fromProvider:inLayoutMode:", v20, self->_elementViewProvider, v15);
    if (self->_layoutAxis == 2)
    {
      v60 = v66;
      UIRectCenteredXInRectScale();
    }
    else
    {
      if (v65 == 1)
      {
        v92.origin.x = rect.origin.x;
        v92.origin.y = v6;
        v92.size.width = v8;
        v92.size.height = v10;
        CGRectGetWidth(v92);
        v93.origin.x = v22;
        v93.origin.y = v24;
        v93.size.width = v26;
        v93.size.height = v28;
        CGRectGetWidth(v93);
      }
      v60 = v66;
      UIRectCenteredYInRectScale();
    }
  }
  v34 = v30;
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v38 = MEMORY[0x24BDAC760];
  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = __33__SAUIElementView_layoutSubviews__block_invoke;
  v90[3] = &__block_descriptor_40_e85_v56__0___SAUIProvidedViewContainerView_8__UIView_16_CGRect__CGPoint_dd__CGSize_dd__24l;
  v90[4] = v15;
  v39 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))MEMORY[0x24958F7F4](v90);
  v40 = v39;
  if (v3)
  {
    v41 = (void *)MEMORY[0x24BDF6F90];
    *(CGFloat *)v83 = v38;
    v83[1] = 3221225472;
    v83[2] = __33__SAUIElementView_layoutSubviews__block_invoke_2;
    v83[3] = &unk_25193CF70;
    v85 = v39;
    v83[4] = self;
    v84 = v20;
    v86 = v34;
    v87 = v35;
    v88 = v36;
    v89 = v37;
    objc_msgSend(v41, "performWithoutAnimation:", v83, v60);

  }
  else
  {
    ((void (**)(_QWORD, _SAUIProvidedViewContainerView *, id, double, double, double, double))v39)[2](v39, self->_minimalTransformView, v20, v34, v35, v36, v37);
  }
  if (v61)
  {
    v42 = (void *)MEMORY[0x24BDF6F90];
    *(CGFloat *)v76 = v38;
    v76[1] = 3221225472;
    v76[2] = __33__SAUIElementView_layoutSubviews__block_invoke_3;
    v76[3] = &unk_25193CF70;
    v78 = v40;
    v76[4] = self;
    v77 = v20;
    v79 = v34;
    v80 = v35;
    v81 = v36;
    v82 = v37;
    objc_msgSend(v42, "performWithoutAnimation:", v76);

  }
  else
  {
    ((void (**)(_QWORD, _SAUIProvidedViewContainerView *, id, double, double, double, double))v40)[2](v40, self->_leadingTransformView, v20, v34, v35, v36, v37);
  }
  objc_msgSend(v18, "sizeThatFits:", v8, v10, v60);
  BSRectWithSize();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[SAUIElementView _paddingForView:fromProvider:inLayoutMode:](self, "_paddingForView:fromProvider:inLayoutMode:", v18, self->_elementViewProvider, v15);
  if (v65 != 1)
  {
    v94.origin.x = rect.origin.x;
    v94.origin.y = v6;
    v94.size.width = v8;
    v94.size.height = v10;
    CGRectGetWidth(v94);
    v95.origin.x = v44;
    v95.origin.y = v46;
    v95.size.width = v48;
    v95.size.height = v50;
    CGRectGetWidth(v95);
  }
  UIRectCenteredYInRectScale();
  v55 = v51.n128_u64[0];
  v56 = v52.n128_u64[0];
  v57 = v53.n128_u64[0];
  v58 = v54.n128_u64[0];
  if (v62)
  {
    v59 = (void *)MEMORY[0x24BDF6F90];
    rect.origin.y = v38;
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __33__SAUIElementView_layoutSubviews__block_invoke_4;
    v68 = &unk_25193CF70;
    v71 = v40;
    v69 = self;
    v70 = v18;
    v72 = v55;
    v73 = v56;
    v74 = v57;
    v75 = v58;
    objc_msgSend(v59, "performWithoutAnimation:", &rect.origin.y, v66);

  }
  else
  {
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double), _SAUIProvidedViewContainerView *, void *, __n128, __n128, __n128, __n128))v40[2])(v40, self->_trailingTransformView, v18, v51, v52, v53, v54);
  }

}

void __33__SAUIElementView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;

  v14 = a2;
  v13 = a3;
  SAUISetViewFrameMaintainingTransform(v14, a4, a5, a6, a7);
  if (*(_QWORD *)(a1 + 32) != 3 && objc_msgSend(v14, "portalsProvidedView"))
  {
    objc_msgSend(v13, "setFrame:", a4, a5, a6, a7);
    objc_msgSend(v13, "layoutIfNeeded");
  }

}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SAUIElementViewProviding setLayoutAxis:](self->_elementViewProvider, "setLayoutAxis:", self->_layoutAxis);
    -[SAUIElementView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_paddingForView:(id)a3 fromProvider:(id)a4 inLayoutMode:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  id WeakRetained;
  double v12;

  v8 = a3;
  v9 = a4;
  v10 = 12.0;
  if (v8
    && ((objc_opt_respondsToSelector() & 1) == 0
     || objc_msgSend(v9, "isProvidedViewConcentric:inLayoutMode:", v8, a5)))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "concentricPaddingForProvidedView:fromViewProvider:", v8, v9);
      v10 = v12;
    }

  }
  return v10;
}

- (BOOL)_configureTransformView:(id *)a3 ifNecessaryWithProvidedView:(id)a4 assertIfConfigurationRequired:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  _SAUIProvidedViewContainerView *v11;
  _SAUIProvidedViewContainerView *v12;
  void *v13;
  char v14;
  int v15;
  _SAUIProvidedViewContainerView *v16;
  SAUIElementView *v17;
  BOOL v18;
  void *v20;

  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIElementView.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformViewPtr != nil"));

  }
  v11 = (_SAUIProvidedViewContainerView *)*a3;
  v12 = v11;
  if (v9
    && (-[_SAUIProvidedViewContainerView providedView](v11, "providedView"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = BSEqualObjects(),
        v13,
        (v14 & 1) == 0))
  {
    -[_SAUIProvidedViewContainerView setProvidedView:](v12, "setProvidedView:", 0);
    -[_SAUIProvidedViewContainerView removeFromSuperview](v12, "removeFromSuperview");
    v16 = objc_alloc_init(_SAUIProvidedViewContainerView);

    -[_SAUIProvidedViewContainerView setProvidedView:](v16, "setProvidedView:", v9);
    -[_SAUIProvidedViewContainerView setElementView:](v16, "setElementView:", self);
    v15 = 1;
    v12 = v16;
  }
  else
  {
    v15 = 0;
  }
  objc_storeStrong(a3, v12);
  if (v10 && v15)
    v10[2](v10);
  if (!*a3
    || (objc_msgSend(*a3, "superview"),
        v17 = (SAUIElementView *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17 == self))
  {
    v18 = 0;
  }
  else
  {
    if (objc_msgSend(*a3, "portalsProvidedView"))
      -[UIView addSubview:](self->_contentView, "addSubview:", v9);
    -[SAUIElementView addSubview:](self, "addSubview:", *a3);
    v18 = 1;
  }

  return v18;
}

- (id)_effectiveMinimalView
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "isMinimalViewIsolatedForElementView:", self)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUIElementViewProviding detachedMinimalView](self->_elementViewProvider, "detachedMinimalView");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SAUIElementViewProviding minimalView](self->_elementViewProvider, "minimalView");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (!v4)
  {
    -[SAUIElementViewProviding minimalView](self->_elementViewProvider, "minimalView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (BOOL)_configureMinimalTransformViewIfNecessary
{
  void *v4;
  id v5;
  _BOOL4 v6;
  id WeakRetained;
  _QWORD v9[5];
  id v10;
  SEL v11;

  -[SAUIElementView _effectiveMinimalView](self, "_effectiveMinimalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SAUIElementView__configureMinimalTransformViewIfNecessary__block_invoke;
  v9[3] = &unk_25193CF98;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  v11 = a2;
  v6 = -[SAUIElementView _configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:](self, "_configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:", &self->_minimalTransformView, v5, v9);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "elementView:didConfigureMinimalTransformView:", self, self->_minimalTransformView);

  }
  return v6;
}

void __60__SAUIElementView__configureMinimalTransformViewIfNecessary__block_invoke(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 424), "leadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 != (void *)a1[5])
    goto LABEL_2;
  v4 = v2;
  v3 = objc_msgSend(*(id *)(a1[4] + 440), "portalsProvidedView");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("SAUIElementView.m"), 293, CFSTR("If the provided minimal and leading views are the same, only portalling is supported."));
    v2 = v5;
LABEL_2:

  }
}

- (BOOL)_configureLeadingTransformViewIfNecessary
{
  _SAUIProvidedViewContainerView **p_leadingTransformView;
  void *v4;
  _BOOL4 v5;
  id WeakRetained;

  p_leadingTransformView = &self->_leadingTransformView;
  -[SAUIElementViewProviding leadingView](self->_elementViewProvider, "leadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SAUIElementView _configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:](self, "_configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:", p_leadingTransformView, v4, 0);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "elementView:didConfigureLeadingTransformView:", self, *p_leadingTransformView);

  }
  return v5;
}

- (BOOL)_configureTrailingTransformViewIfNecessary
{
  _SAUIProvidedViewContainerView **p_trailingTransformView;
  void *v4;
  _BOOL4 v5;
  id WeakRetained;

  p_trailingTransformView = &self->_trailingTransformView;
  -[SAUIElementViewProviding trailingView](self->_elementViewProvider, "trailingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SAUIElementView _configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:](self, "_configureTransformView:ifNecessaryWithProvidedView:assertIfConfigurationRequired:", p_trailingTransformView, v4, 0);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "elementView:didConfigureTrailingTransformView:", self, *p_trailingTransformView);

  }
  return v5;
}

- (void)_didLayoutResizedTransformView:(id)a3
{
  id WeakRetained;
  void *v5;
  _SAUIProvidedViewContainerView *v6;

  v6 = (_SAUIProvidedViewContainerView *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_minimalTransformView == v6)
  {
    objc_msgSend(WeakRetained, "elementView:didLayoutResizedMinimalTransformView:", self);
  }
  else if (self->_leadingTransformView == v6)
  {
    objc_msgSend(WeakRetained, "elementView:didLayoutResizedLeadingTransformView:", self);
  }
  else if (self->_trailingTransformView == v6)
  {
    objc_msgSend(WeakRetained, "elementView:didLayoutResizedTrailingTransformView:", self, v6);
  }

}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (SAUIElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (SAUIElementViewDelegate)delegate
{
  return (SAUIElementViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMinimalTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalTransformView, a3);
}

- (_SAUIProvidedViewContainerView)leadingTransformView
{
  return self->_leadingTransformView;
}

- (void)setLeadingTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTransformView, a3);
}

- (_SAUIProvidedViewContainerView)trailingTransformView
{
  return self->_trailingTransformView;
}

- (void)setTrailingTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTransformView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_trailingTransformView, 0);
  objc_storeStrong((id *)&self->_leadingTransformView, 0);
  objc_storeStrong((id *)&self->_minimalTransformView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
}

@end
