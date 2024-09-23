@implementation UIRefreshControlModernContentView

uint64_t __45___UIRefreshControlModernContentView__reveal__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setInstanceAlphaOffset:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
}

void __52___UIRefreshControlModernContentView_initWithFrame___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(*(void **)(a1 + 32));
  objc_msgSend(v3, "setCornerRadius:", v2 * 0.5);

}

void __60___UIRefreshControlModernContentView__resetToRevealingState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int has_internal_diagnostics;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CATransform3D v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
  v26 = v22;
  v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v27 = v21;
  objc_msgSend(v2, "setTransform:", buf);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeRotation(&v24, 0.785398163, 0.0, 0.0, 1.0);
  objc_msgSend(v4, "setInstanceTransform:", &v24);

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = *(_QWORD *)(a1 + 32);
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v19 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_3;
    if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_3)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_3);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v8);

  v9 = (void *)_UISetCurrentFallbackEnvironment(*(void **)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_effectiveTintColorWithAlpha:", 1.0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setInstanceColor:", objc_msgSend(v11, "CGColor"));

  _UIRestorePreviousFallbackEnvironment(v9);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = -1.0;
  objc_msgSend(v12, "setInstanceAlphaOffset:", v13);

  objc_msgSend(*(id *)(a1 + 32), "_setUnbloomedAppearance");
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  *(_OWORD *)buf = v23;
  v26 = v22;
  v27 = v21;
  objc_msgSend(v14, "setTransform:", buf);
  v15 = *(_QWORD **)(a1 + 32);
  v16 = (void *)v15[58];
  objc_msgSend(v15, "_effectiveTintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

}

uint64_t __52___UIRefreshControlModernContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
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
  double v13;
  double v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  double v18;
  void *v19;
  double MidX;
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
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  __int128 v53;
  double x;
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
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t result;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CGFloat height;
  double v105;
  CGFloat width;
  double v107;
  CGFloat y;
  double v109;
  CGFloat v110;
  double v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  v11 = v10 + 0.0;
  v13 = v3 + v11;
  v14 = v5 + 0.0;
  v15 = v7 - (v11 + v12 + 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "frame");
  v124 = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  y = v124.origin.y;
  v110 = *MEMORY[0x1E0C9D648];
  height = v124.size.height;
  width = v124.size.width;
  v16 = CGRectEqualToRect(v118, *MEMORY[0x1E0C9D648]);
  v17 = *(_QWORD *)(a1 + 32);
  if (v16 || *(_BYTE *)(v17 + 489))
  {
    objc_msgSend((id)v17, "_currentScreenScale");
    UIRectCenteredXInRectScale(0.0, -20.0, 100.0, 100.0, v13, v5 + 0.0, v15, v9, v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:");
    v17 = *(_QWORD *)(a1 + 32);
  }
  v19 = *(void **)(v17 + 448);
  v119.origin.x = v13;
  v119.origin.y = v5 + 0.0;
  v119.size.width = v15;
  v119.size.height = v9;
  MidX = CGRectGetMidX(v119);
  v120.origin.x = v13;
  v120.origin.y = v5 + 0.0;
  v120.size.width = v15;
  v120.size.height = v9;
  objc_msgSend(v19, "setCenter:", MidX, CGRectGetMidY(v120));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "frame");
  v103 = v21;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "frame");
  v125.origin.y = y;
  v125.origin.x = v110;
  v125.size.height = height;
  v125.size.width = width;
  if (CGRectEqualToRect(v121, v125))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
    UIRectCenteredXInRectScale(0.0, 0.0, 100.0, 100.0, v23, v25, v27, v29, v30);
    v101 = v32;
    v102 = v31;
    v99 = v34;
    v100 = v33;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "bounds");
    v35 = v9;
    v37 = v36;
    v38 = v15;
    v40 = v39;
    v41 = v13;
    v43 = v42;
    v44 = v14;
    v46 = v45;
    objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
    v47 = v37;
    v9 = v35;
    v48 = v40;
    v15 = v38;
    v49 = v43;
    v13 = v41;
    v50 = v46;
    v14 = v44;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", UIRectCenteredYInRectScale(v102, v101, v100, v99, v47, v48, v49, v50, v51));
  }
  v116 = 0u;
  v117 = 0u;
  v115 = 0u;
  v52 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  if (v52)
  {
    objc_msgSend(v52, "transform");
    v52 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  }
  v53 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v112 = *MEMORY[0x1E0C9BAA8];
  v113 = v53;
  v114 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v52, "setTransform:", &v112);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frame");
  x = v122.origin.x;
  v55 = v122.origin.y;
  v56 = v122.size.width;
  v57 = v122.size.height;
  v126.origin.y = y;
  v126.origin.x = v110;
  v126.size.height = height;
  v126.size.width = width;
  if (CGRectEqualToRect(v122, v126))
  {
    UIRoundToViewScale(*(void **)(a1 + 32));
    v59 = v58;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "bounds");
    v61 = v60;
    v109 = v15;
    v111 = v9;
    v63 = v62;
    v65 = v64;
    v107 = v13;
    v67 = v66;
    objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
    UIRectCenteredXInRectScale(x, v55, v59, 10.0, v61, v63, v65, v67, v68);
    v105 = v69;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "bounds");
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v82 = v14;
    v84 = v83;
    objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
    v85 = v77;
    v86 = v79;
    v15 = v109;
    v9 = v111;
    v87 = v81;
    v13 = v107;
    v88 = v84;
    v14 = v82;
    x = UIRectCenteredYInRectScale(v105, v71, v73, v75, v85, v86, v87, v88, v89);
    v56 = v90;
    v57 = v91;
    v55 = v92 + -10.0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", x, v55, v56, v57);
  v93 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v112 = v115;
  v113 = v116;
  v114 = v117;
  objc_msgSend(v93, "setTransform:", &v112);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "frame");
  v95 = v94;
  UICeilToViewScale(*(void **)(a1 + 32));
  v97 = v103 + v96 + 27.0 + 5.0;
  v123.origin.x = v13;
  v123.origin.y = v14;
  v123.size.width = v15;
  v123.size.height = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setFrame:", CGRectGetMinX(v123) + 10.0, v97, v15 + -20.0, v95);
  result = objc_msgSend(*(id *)(a1 + 32), "_updateTimeOffsetOfRelevantLayers");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 489) = 0;
  return result;
}

uint64_t __46___UIRefreshControlModernContentView__unbloom__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUnbloomedAppearance");
}

uint64_t __44___UIRefreshControlModernContentView__bloom__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBloomedAppearance");
}

uint64_t __44___UIRefreshControlModernContentView__bloom__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unbloom");
}

uint64_t __43___UIRefreshControlModernContentView__spin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSpunAppearance");
}

uint64_t __43___UIRefreshControlModernContentView__tick__block_invoke(uint64_t a1)
{
  double v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[5];

  v2 = 0.0;
  v3 = 8;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __43___UIRefreshControlModernContentView__tick__block_invoke_2;
    v6[3] = &unk_1E16B1B28;
    v6[4] = *(_QWORD *)(a1 + 32);
    result = +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, v2, 0.125);
    v2 = v2 + 0.125;
    --v3;
  }
  while (v3);
  return result;
}

uint64_t __43___UIRefreshControlModernContentView__tick__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;
  CGAffineTransform v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  if (v1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "transform");
  else
    memset(&v3, 0, sizeof(v3));
  CGAffineTransformRotate(&v4, &v3, 0.785398163);
  return objc_msgSend(v1, "setTransform:", &v4);
}

uint64_t __45___UIRefreshControlModernContentView__goAway__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 0.001, 0.001);
  memset(&v10, 0, sizeof(v10));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 456);
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    memset(&v9, 0, sizeof(v9));
  }
  CGAffineTransformRotate(&v10, &v9, 3.13159265);
  t1 = v11;
  memset(&v8, 0, sizeof(v8));
  v6 = v10;
  CGAffineTransformConcat(&v8, &t1, &v6);
  v4 = *(void **)(v2 + 456);
  t1 = v8;
  objc_msgSend(v4, "setTransform:", &t1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 0.0);
}

@end
