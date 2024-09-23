@implementation _UICollectionViewOrthogonalScrollView

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  v3 = -[UIScrollView _edgesPropagatingSafeAreaInsetsToSubviews](&v5, sel__edgesPropagatingSafeAreaInsetsToSubviews);
  if (-[UIScrollView _contentScrollsAlongXAxis](self, "_contentScrollsAlongXAxis"))
    v3 &= 0xFFFFFFFFFFFFFFF5;
  if (-[UIScrollView _contentScrollsAlongYAxis](self, "_contentScrollsAlongYAxis"))
    return v3 & 0xFFFFFFFFFFFFFFFALL;
  else
    return v3;
}

- (void)configureForDescriptor:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v5;
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
  BOOL v19;
  double v20;
  BOOL v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  _BOOL8 v30;
  uint64_t v31;
  double v32;
  double v33;
  int v34;
  uint64_t v35;
  UIView *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double Width;
  double MaxX;
  double v53;
  double v54;
  double v55;
  double v56;
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
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v88;
  double v90;
  double v91;
  CGFloat MinY;
  double MaxY;
  double Height;
  CGFloat MinX;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 2080));
    if (!a2 || !WeakRetained)
    {
LABEL_67:

      return;
    }
    v103 = WeakRetained;
    *(_BYTE *)(a1 + 2072) = 1;
    if (-[_UICollectionLayoutSectionDescriptor isEqualToSectionDescriptor:comparingContentOffset:](*(_QWORD *)(a1 + 2104), a2, 0))
    {
LABEL_52:
      v71 = *(double *)(a2 + 96);
      v72 = *(double *)(a2 + 104);
      objc_msgSend((id)a1, "_currentScreenScale");
      v74 = _UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection(a2, v71, v72, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v73);
      v76 = v75;
      if ((objc_msgSend((id)a1, "isTracking") & 1) != 0
        || (objc_msgSend((id)a1, "isDecelerating") & 1) != 0
        || objc_msgSend((id)a1, "isScrollAnimating"))
      {
        v77 = *(_QWORD *)(a2 + 16);
        v78 = _UIPointValueForAxis(v77, v71, v72);
        v74 = _UISetPointValueForAxis(v77, v74, v76, v78);
        v76 = v79;
      }
      objc_msgSend((id)a1, "contentOffset");
      v81 = v80;
      v83 = v82;
      objc_msgSend((id)a1, "_pointByApplyingBaseContentInsetsToPoint:", v74, v76);
      v86 = vabdd_f64(v83, v85);
      if (vabdd_f64(v81, v84) >= 0.00000011920929 || v86 >= 0.00000011920929)
        objc_msgSend((id)a1, "setContentOffset:", v84, v85, 0.00000011920929, v86);
      v88 = vabdd_f64(v72, v76);
      if (vabdd_f64(v71, v74) >= 0.00000011920929 || v88 >= 0.00000011920929)
        objc_msgSend(v103, "_orthogonalScrollView:didScrollToOffset:inSection:", a1, *(_QWORD *)(a1 + 2088), v74, v76);
      *(_BYTE *)(a1 + 2072) = 0;
      WeakRetained = v103;
      goto LABEL_67;
    }
    objc_storeStrong((id *)(a1 + 2104), (id)a2);
    v5 = *(_QWORD *)(a2 + 16);
    v6 = *(double *)(a2 + 208);
    v7 = *(double *)(a2 + 216);
    v101 = *(double *)(a2 + 232);
    v102 = *(double *)(a2 + 224);
    v9 = *(double *)(a1 + 2112);
    v8 = *(double *)(a1 + 2120);
    v10 = *(double *)(a1 + 2128);
    v11 = *(double *)(a1 + 2136);
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = _UIPointValueForAxis(v5, v6, v7);
    v99 = v13;
    v100 = v12;
    v15 = _UISetPointValueForAxis(v5, v12, v13, v14);
    v17 = -v7;
    v19 = v8 == -v6 && v9 == v17 && v11 == v15;
    v20 = v15;
    v21 = v19 && v10 == v16;
    v22 = v16;
    if (!v21)
    {
      *(double *)(a1 + 2112) = v17;
      *(double *)(a1 + 2120) = -v6;
      *(double *)(a1 + 2128) = v16;
      *(double *)(a1 + 2136) = v15;
      +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scrollManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "adjustTargetContentOffsetForScrollableContainer:byDelta:", a1, v6 + v8, v7 + v9);
    }
    v25 = *(double *)(a2 + 160);
    v26 = *(double *)(a2 + 168);
    v27 = objc_msgSend((id)a1, "_isAutomaticContentOffsetAdjustmentEnabled");
    objc_msgSend((id)a1, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    objc_msgSend((id)a1, "setFrame:", v6, v7, v102, v101);
    objc_msgSend((id)a1, "setContentSize:", v25, v26);
    objc_msgSend((id)a1, "_setAutomaticContentOffsetAdjustmentEnabled:", v27);
    v28 = *(_QWORD *)(a2 + 40);
    v29 = v28 == 1 && v5 == 1;
    v30 = v28 == 1 && v5 == 2;
    objc_msgSend((id)a1, "setBounces:", v28 != 2);
    objc_msgSend((id)a1, "setAlwaysBounceHorizontal:", v29);
    objc_msgSend((id)a1, "setAlwaysBounceVertical:", v30);
    v31 = *(_QWORD *)(a2 + 24);
    objc_msgSend((id)a1, "setPagingEnabled:", (unint64_t)(v31 - 3) < 3);
    v32 = *(double *)(a2 + 32);
    if (v32 == *(double *)off_1E167DBC0)
      v32 = *(double *)off_1E167DBC8;
    objc_msgSend((id)a1, "setDecelerationRate:", v32);
    objc_msgSend((id)a1, "_setShouldPreventFocusScrollPastContentSize:", objc_msgSend((id)a1, "_shouldPreventFocusScrollPastContentSize"));
    v33 = *(double *)(a2 + 48);
    if (v33 <= 0.0)
    {
      objc_msgSend((id)a1, "maskView");
      v36 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = *(unsigned __int8 *)(a2 + 8);
      objc_msgSend((id)a1, "maskView");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (UIView *)v35;
      if (!v34)
      {
        if (!v35)
        {
          v36 = objc_alloc_init(UIView);
          +[UIColor whiteColor](UIColor, "whiteColor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v37);

          v38 = *MEMORY[0x1E0CD2A68];
          -[UIView layer](v36, "layer");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setCornerCurve:", v38);

          objc_msgSend((id)a1, "setMaskView:", v36);
        }
        -[UIView layer](v36, "layer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setCornerRadius:", v33);

        -[UIView setFrame:](v36, "setFrame:", *(double *)(a2 + 144), *(double *)(a2 + 152), *(double *)(a2 + 160), *(double *)(a2 + 168));
        goto LABEL_32;
      }
    }
    if (!v36)
      goto LABEL_33;
    objc_msgSend((id)a1, "setMaskView:", 0);
LABEL_32:

LABEL_33:
    v97 = v22;
    v98 = -v6;
    v96 = v20;
    if ((v5 & 1) != 0)
      v41 = 7;
    else
      v41 = 1;
    objc_msgSend((id)a1, "_setContentScrollsAlongXAxis:", v5 & 1);
    if ((v5 & 2) != 0)
      v41 |= 0x18uLL;
    objc_msgSend((id)a1, "_setContentScrollsAlongYAxis:", (unint64_t)(v5 & 2) >> 1);
    objc_msgSend((id)a1, "_autoScrollAssistant");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAllowedDirections:", v41);

    objc_msgSend(v103, "frame");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v104.origin.x = v6;
    v104.origin.y = v7;
    v104.size.width = v102;
    v104.size.height = v101;
    MinY = CGRectGetMinY(v104);
    v105.origin.x = v6;
    v105.origin.y = v7;
    v105.size.width = v102;
    v105.size.height = v101;
    MinX = CGRectGetMinX(v105);
    v106.origin.x = v44;
    v106.origin.y = v46;
    v106.size.width = v48;
    v106.size.height = v50;
    Height = CGRectGetHeight(v106);
    v107.origin.x = v6;
    v107.origin.y = v7;
    v107.size.width = v102;
    v107.size.height = v101;
    MaxY = CGRectGetMaxY(v107);
    v108.origin.x = v44;
    v108.origin.y = v46;
    v108.size.width = v48;
    v108.size.height = v50;
    Width = CGRectGetWidth(v108);
    v90 = v7;
    v91 = v6;
    v109.origin.x = v6;
    v109.origin.y = v7;
    v109.size.width = v102;
    v109.size.height = v101;
    MaxX = CGRectGetMaxX(v109);
    if (v5)
    {
      v53 = Width - MaxX;
      v55 = -v7;
      v54 = v97;
      if (v5 == 1)
      {
        v56 = 0.0;
        v58 = 0.0;
        v57 = MinX;
      }
      else
      {
        v56 = Height - MaxY;
        v57 = MinX;
        if (v5 == 2)
        {
          v53 = 0.0;
          v57 = 0.0;
        }
        v58 = MinY;
      }
    }
    else
    {
      v53 = 0.0;
      v56 = 0.0;
      v57 = 0.0;
      v58 = 0.0;
      v55 = -v7;
      v54 = v97;
    }
    objc_msgSend((id)a1, "_setTouchInsets:", -v58, -v57, -v56, -v53);
    v59 = *(double *)(a2 + 56);
    objc_msgSend((id)a1, "_pointByApplyingBaseContentInsetsToPoint:", v100, v99);
    v61 = v60;
    v63 = v62;
    v64 = *MEMORY[0x1E0C9D820];
    v65 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v59 > 0.0)
    {
      v66 = _UISizeValueForAxis(v5, v102, v101);
      v64 = _UISetSizeValueForAxis(v5, v64, v65, -(v66 - v59));
      v65 = v67;
      if (v31 == 5)
      {
        dyld_program_sdk_at_least();
        UIRoundToViewScale((void *)a1);
        v69 = v68;
        v61 = v61 + _UISetPointValueForAxis(v5, v100, v99, -v68);
        v63 = v63 + v70;
        if (v5 == 1)
        {
          objc_msgSend((id)a1, "setContentInset:", v55, v69 - v91, v54, v96 + v69);
LABEL_51:
          objc_msgSend((id)a1, "_setPagingOrigin:", v61, v63);
          objc_msgSend((id)a1, "_setInterpageSpacing:", v64, v65);
          goto LABEL_52;
        }
        v55 = v69 - v90;
        v54 = v54 + v69;
      }
    }
    objc_msgSend((id)a1, "setContentInset:", v55, v98, v54, v96);
    goto LABEL_51;
  }
}

- (CGPoint)_pointByApplyingBaseContentInsetsToPoint:(CGPoint)a3
{
  double left;
  double top;
  double v5;
  double v6;
  CGPoint result;

  if (self)
  {
    top = self->_baseContentInsets.top;
    left = self->_baseContentInsets.left;
  }
  else
  {
    left = 0.0;
    top = 0.0;
  }
  v5 = a3.x - left;
  v6 = a3.y - top;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  _UICollectionViewOrthogonalScrollView *v7;
  objc_super v8;
  int64_t v9;

  v7 = self;
  v9 = a4;
  if (self)
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  if (-[_UICollectionViewOrthogonalScrollView shouldAddSubview:atPosition:relativeTo:](self, "shouldAddSubview:atPosition:relativeTo:", a3, &v9, a5))
  {
    v8.receiver = v7;
    v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView _addSubview:positioned:relativeTo:](&v8, sel__addSubview_positioned_relativeTo_, a3, v9, a5);
  }
}

- (_QWORD)initWithCollectionView:(uint64_t)a3 section:
{
  id v5;
  _QWORD *v6;
  id v7;
  void *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  v5 = objc_msgSendSuper2(&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)v5 + 260, a2);
    v6[261] = a3;
    v7 = -[_UICollectionViewSubviewRouter initWithContainer:]([_UICollectionViewSubviewRouter alloc], v6);
    v8 = (void *)v6[262];
    v6[262] = v7;

    objc_msgSend(v6, "setDelaysContentTouches:", 0);
    objc_msgSend(v6, "setClipsToBounds:", 0);
    objc_msgSend(v6, "setContentInsetAdjustmentBehavior:", 2);
    objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UICollectionViewSubviewRouter setContainer:]((uint64_t)self->_subviewRouter, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView dealloc](&v3, sel_dealloc);
}

- (void)_notifyDidScroll
{
  CGFloat v3;
  CGFloat v4;
  _UICollectionLayoutSectionDescriptor *descriptor;
  objc_super v6;

  if (!self->_isConfiguring)
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    -[_UICollectionViewOrthogonalScrollView _pointByRemovingBaseContentInsetsFromPoint:](self, "_pointByRemovingBaseContentInsetsFromPoint:");
    descriptor = self->_descriptor;
    if (descriptor)
    {
      descriptor->_contentOffset.x = v3;
      descriptor->_contentOffset.y = v4;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView _notifyDidScroll](&v6, sel__notifyDidScroll);
}

- (void)_willRemoveSubview:(id)a3
{
  _UICollectionViewSubviewRouter *subviewRouter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIView _willRemoveSubview:](&v6, sel__willRemoveSubview_);
  if (self)
    subviewRouter = self->_subviewRouter;
  else
    subviewRouter = 0;
  -[_UICollectionViewSubviewRouter willRemoveSubview:](subviewRouter, "willRemoveSubview:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_subviewRouter, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (id)collectionView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 260);
  return WeakRetained;
}

- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6
{
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id WeakRetained;
  CGPoint v40;
  CGRect v41;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 260);
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "frame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(a1, "_contentOffsetForScrollingToItemAtIndexPath:atScrollPosition:additionalInsets:itemFrame:", a2, a3, a5, a6, a7, a8, v18, v20, v22, v24);
      v37 = v27;
      v38 = v26;
      if (dyld_program_sdk_at_least())
      {
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          v19 = *MEMORY[0x1E0C9D628];
          v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
          v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        }
        v28 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:](a1, v38, v37, v19, v21, v23, v25);
      }
      else
      {
        objc_msgSend(WeakRetained, "_contentOffsetForScrollingToItemAtIndexPath:atScrollPosition:additionalInsets:itemFrame:containingScrollView:clampToScrollableArea:", a2, a3, a1, 1, a5, a6, a7, a8, v19, v21, v23, v25);
      }
      objc_msgSend(a1, "setContentOffset:animated:", a4, v28);
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        objc_msgSend(a1, "frame");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(WeakRetained, "bounds");
        v40.x = v30;
        v40.y = v32;
        if (!CGRectContainsPoint(v41, v40))
          objc_msgSend(WeakRetained, "scrollRectToVisible:animated:", a4, v30, v32, v34, v36);
      }
    }

  }
}

- (double)contentOffsetAdjustedForCurrentScrollingBehavior:(double)a3 itemFrame:(CGFloat)a4
{
  double v9;
  double v10;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double result;
  CGRect v26;

  if (!a1)
    return 0.0;
  v9 = a5;
  v10 = a4;
  v26.origin.x = a4;
  v26.origin.y = a5;
  v26.size.width = a6;
  v26.size.height = a7;
  if (!CGRectIsNull(v26))
  {
    objc_msgSend(a1, "_pointByRemovingBaseContentInsetsFromPoint:", v10, v9);
    v10 = v14;
    v9 = v15;
  }
  objc_msgSend(a1, "_pointByRemovingBaseContentInsetsFromPoint:", a2, a3);
  v17 = v16;
  v19 = v18;
  v20 = a1[263];
  objc_msgSend(a1, "_currentScreenScale");
  v22 = _UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection((uint64_t)v20, v17, v19, v10, v9, a6, a7, v21);
  v24 = v23;

  objc_msgSend(a1, "_pointByApplyingBaseContentInsetsToPoint:", v22, v24);
  return result;
}

- (CGPoint)_contentOffsetForScrollingToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 additionalInsets:(NSDirectionalEdgeInsets)a5 itemFrame:(CGRect)a6
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  double x;
  double y;
  CGPoint result;

  x = a6.origin.x;
  y = a6.origin.y;
  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v52 = v18;
  v53 = v17;
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "collectionViewLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_supplementaryViewInsetsForScrollingToItemAtIndexPath:", a3);
  v22 = top + v21;
  v24 = leading + v23;
  v26 = bottom + v25;
  v28 = trailing + v27;
  v29 = -[UIScrollView _contentScrollableAxes](self, "_contentScrollableAxes");
  if (v29 == 2)
    v30 = 0.0;
  else
    v30 = v28;
  if (v29 == 2)
    v31 = 0.0;
  else
    v31 = v24;
  if (v29 == 1)
  {
    v30 = v28;
    v32 = 0.0;
  }
  else
  {
    v32 = v26;
  }
  if (v29 == 1)
  {
    v31 = v24;
    v33 = 0.0;
  }
  else
  {
    v33 = v22;
  }
  if (v29)
    v34 = v30;
  else
    v34 = 0.0;
  if (v29)
    v35 = v32;
  else
    v35 = 0.0;
  if (v29)
    v36 = v31;
  else
    v36 = 0.0;
  if (v29)
    v37 = v33;
  else
    v37 = 0.0;
  v38 = dyld_program_sdk_at_least();
  if (v38)
    v39 = v16;
  else
    v39 = y;
  if (v38)
    v40 = v14;
  else
    v40 = x;
  objc_msgSend(v19, "_contentOffsetFromProposedOffset:forScrollingToItemWithFrame:atScrollPosition:additionalInsets:containingScrollViewBounds:", a4, v40, v39, x, *(_QWORD *)&v37, *(_QWORD *)&v36, *(_QWORD *)&v35, *(_QWORD *)&v34, *(_QWORD *)&v14, *(_QWORD *)&v16, v53, v52);
  v42 = v41;
  v44 = v43;
  v45 = objc_msgSend(v20, "_orthogonalScrollingAxis");
  v46 = _UIPointValueForAxis(v45, v42, v44);
  v47 = _UISetPointValueForAxis(v45, v40, v39, v46);
  v49 = v48;

  v50 = v47;
  v51 = v49;
  result.y = v51;
  result.x = v50;
  return result;
}

- (void)_autoScrollAssistantUpdateContentOffset:(CGPoint)a3
{
  double v4;
  objc_super v5;

  v4 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)&self->super.super.super.super.isa, a3.x, a3.y, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView _autoScrollAssistantUpdateContentOffset:](&v5, sel__autoScrollAssistantUpdateContentOffset_, v4);
}

- (CGPoint)_contentOffsetForScrollingToTop
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)&self->super.super.super.super.isa, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_pointByRemovingBaseContentInsetsFromPoint:(CGPoint)a3
{
  double left;
  double top;
  double v5;
  double v6;
  CGPoint result;

  if (self)
  {
    top = self->_baseContentInsets.top;
    left = self->_baseContentInsets.left;
  }
  else
  {
    left = 0.0;
    top = 0.0;
  }
  v5 = a3.x + left;
  v6 = a3.y + top;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_);
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchesBegan:withEvent:", a3, a4);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_);
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchesMoved:withEvent:", a3, a4);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_);
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchesCancelled:withEvent:", a3, a4);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_);
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchesEnded:withEvent:", a3, a4);

}

- (CGPoint)_panGestureLocationInView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)_panGestureVelocityInView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  int64_t section;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (_UIViewShouldReturnSubviewsInFocusItemsInRect())
  {
    v16.receiver = self;
    v16.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView focusItemsInRect:](&v16, sel_focusItemsInRect_, x, y, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView coordinateSpace](self, "coordinateSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      section = self->_section;
    else
      section = 0;
    objc_msgSend(v9, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", v10, section, x, y, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView focusItemsInRect:](&v15, sel_focusItemsInRect_, x, y, width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)_extantFocusItemsInRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIView focusItemsInRect:](&v4, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t section;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  if (_UIViewShouldReturnSubviewsInFocusItemsInRect())
  {
    v27.receiver = self;
    v27.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView _childFocusRegionsInRect:inCoordinateSpace:](&v27, sel__childFocusRegionsInRect_inCoordinateSpace_, a4, x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView _childFocusRegionsInRect:inCoordinateSpace:](&v26, sel__childFocusRegionsInRect_inCoordinateSpace_, a4, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (self)
      section = self->_section;
    else
      section = 0;
    objc_msgSend(v12, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", a4, section, x, y, width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setParentScrollView:", self, (_QWORD)v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v18);
    }

    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  _UIFocusScrollBoundaryMetrics *v5;
  void *v6;
  void *v7;
  int64_t section;
  void *v9;
  objc_super v11;

  -[UIScrollView _canScrollX](self, "_canScrollX");
  -[UIScrollView _canScrollY](self, "_canScrollY");
  v5 = -[_UIFocusScrollBoundaryMetrics initWithFocusItem:scrollView:]([_UIFocusScrollBoundaryMetrics alloc], "initWithFocusItem:scrollView:", a3, self);
  -[_UICollectionViewOrthogonalScrollView collectionView]((id *)&self->super.super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self)
    section = self->_section;
  else
    section = 0;
  objc_msgSend(v6, "_updateFocusScrollBoundaryMetrics:forItem:inSection:", v5, a3, section);

  if (!-[_UIFocusScrollBoundaryMetrics hasDisprovedAllRelevantAssumptions](v5, "hasDisprovedAllRelevantAssumptions"))
  {
    v11.receiver = self;
    v11.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIScrollView _focusScrollBoundaryMetricsForItem:](&v11, sel__focusScrollBoundaryMetricsForItem_, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusScrollBoundaryMetrics consumeOtherMetrics:](v5, "consumeOtherMetrics:", v9);

  }
  return v5;
}

- (unint64_t)_focusPrimaryScrollableAxis
{
  objc_super v4;

  if (-[UIScrollView _contentScrollsAlongXAxis](self, "_contentScrollsAlongXAxis"))
    return 1;
  if (-[UIScrollView _contentScrollsAlongYAxis](self, "_contentScrollsAlongYAxis"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  return -[UIScrollView _focusPrimaryScrollableAxis](&v4, sel__focusPrimaryScrollableAxis);
}

- (UIEdgeInsets)_focusScrollableAreaInsets
{
  double leading;
  _UICollectionLayoutSectionDescriptor *descriptor;
  double bottom;
  double trailing;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  UIEdgeInsets result;

  leading = 0.0;
  if (!self)
  {
    bottom = 0.0;
    trailing = 0.0;
    top = 0.0;
    goto LABEL_6;
  }
  descriptor = self->_descriptor;
  bottom = 0.0;
  trailing = 0.0;
  top = 0.0;
  if (!descriptor)
  {
LABEL_6:
    v7 = -top;
    v8 = -leading;
    v9 = -bottom;
    v10 = -trailing;
    goto LABEL_9;
  }
  if (!descriptor->_clipsContentToBounds)
  {
    top = descriptor->_contentInsets.top;
    leading = descriptor->_contentInsets.leading;
    bottom = descriptor->_contentInsets.bottom;
    trailing = descriptor->_contentInsets.trailing;
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewOrthogonalScrollView;
  -[UIScrollView _focusScrollableAreaInsets](&v11, sel__focusScrollableAreaInsets, 0.0, 0.0, 0.0, 0.0);
LABEL_9:
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)bringSubviewToFront:(id)a3
{
  _UICollectionViewOrthogonalScrollView *v4;
  objc_super v5;

  v4 = self;
  if (self)
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  if (-[_UICollectionViewOrthogonalScrollView shouldBringSubviewToFront:](self, "shouldBringSubviewToFront:", a3))
  {
    v5.receiver = v4;
    v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView bringSubviewToFront:](&v5, sel_bringSubviewToFront_, a3);
  }
}

- (void)sendSubviewToBack:(id)a3
{
  _UICollectionViewOrthogonalScrollView *v4;
  objc_super v5;

  v4 = self;
  if (self)
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  if (-[_UICollectionViewOrthogonalScrollView shouldSendSubviewToBack:](self, "shouldSendSubviewToBack:", a3))
  {
    v5.receiver = v4;
    v5.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView sendSubviewToBack:](&v5, sel_sendSubviewToBack_, a3);
  }
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  _UICollectionViewOrthogonalScrollView *v6;
  objc_super v7;

  v6 = self;
  if (self)
    self = (_UICollectionViewOrthogonalScrollView *)self->_subviewRouter;
  if (-[_UICollectionViewOrthogonalScrollView shouldExchangeSubviewAtIndex:withSubviewAtIndex:](self, "shouldExchangeSubviewAtIndex:withSubviewAtIndex:", a3, a4))
  {
    v7.receiver = v6;
    v7.super_class = (Class)_UICollectionViewOrthogonalScrollView;
    -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](&v7, sel_exchangeSubviewAtIndex_withSubviewAtIndex_, a3, a4);
  }
}

@end
