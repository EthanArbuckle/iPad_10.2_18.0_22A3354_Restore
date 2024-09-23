@implementation SBFDashBoardViewMetrics

+ (unint64_t)listLayoutForPage:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  char v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return a3 != 2;
  v8 = objc_msgSend(a1, "_isPortrait");
  v9 = 3;
  if (a3)
    v9 = 0;
  if (a3 == 1)
    v9 = 4;
  if ((v8 & 1) != 0)
    return 2;
  else
    return v9;
}

+ (BOOL)layoutCentersContent:(unint64_t)a3
{
  return a3 - 1 < 2;
}

+ (BOOL)layoutUsesMargin:(unint64_t)a3
{
  return a3 - 2 < 3;
}

+ (unint64_t)dateTimeLayoutForPage:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 2)
    return 1;
  if (a3 == 1)
    return objc_msgSend(a1, "_presentsListBelowDateTime", v3, v4) ^ 1;
  return 2;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:insets:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:insets:scrollsDateTime:", a3, objc_msgSend(a1, "listScrollsDateTime"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.top, a5.left, a5.bottom, a5.right);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5 scrollsDateTime:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
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
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double left;
  double top;
  double right;
  double bottom;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  v6 = a6;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a1, "_reducedPageBoundsFromBounds:forPage:");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v45 = width;
  v46 = height;
  objc_msgSend(a1, "suggestedContentInsetsForListForPage:pageBounds:scrollsDateTime:", a3, v6, x, y, width, height);
  v23 = v22;
  v24 = +[SBFDashBoardViewMetrics listLayoutForPage:](SBFDashBoardViewMetrics, "listLayoutForPage:", a3);
  v25 = 0.0;
  if (!v6)
  {
    objc_msgSend(a1, "listMinYForPage:", a3);
    v25 = v26 - v23;
  }
  v51.origin.x = v15;
  v51.origin.y = v17;
  v51.size.width = v19;
  v51.size.height = v21;
  v27 = CGRectGetHeight(v51) - v25;
  v28 = +[SBFDashBoardViewMetrics layoutUsesMargin:](SBFDashBoardViewMetrics, "layoutUsesMargin:", v24);
  v29 = +[SBFDashBoardViewMetrics layoutCentersContent:](SBFDashBoardViewMetrics, "layoutCentersContent:", v24);
  v30 = v29;
  if (v28)
  {
    objc_msgSend(a1, "listWidthForPage:", a3);
    v43 = v27;
    v44 = v31;
    if (v30)
    {
      objc_msgSend(a1, "listInsetXForPage:", a3);
    }
    else
    {
      if (v24 == 4)
      {
        v54.origin.x = v15;
        v54.origin.y = v17;
        v54.size.width = v19;
        v54.size.height = v21;
        v34 = CGRectGetWidth(v54) - v44;
        objc_msgSend(a1, "listInsetXForPage:leading:", a3, 0);
        v33 = v34 - v35;
        goto LABEL_14;
      }
      if (v24 != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBFDashBoardViewMetrics.m"), 265, CFSTR("The only way to get here should be left or right align, not %lu"), v24);

        v33 = 0.0;
        goto LABEL_14;
      }
      objc_msgSend(a1, "listInsetXForPage:leading:", a3, 1);
    }
    v33 = v32;
LABEL_14:
    v55.origin.x = v15;
    v55.origin.y = v17;
    v55.size.width = v19;
    v55.size.height = v21;
    v15 = v33 + CGRectGetMinX(v55);
    v17 = v25;
    v21 = v43;
    v19 = v44;
    goto LABEL_15;
  }
  if (v29)
  {
    v52.origin.x = v15;
    v52.origin.y = v17;
    v52.size.width = v19;
    v52.size.height = v21;
    v53 = CGRectInset(v52, 0.0, 0.0);
    v15 = v53.origin.x;
    v19 = v53.size.width;
    v17 = v25;
    v21 = v27;
  }
LABEL_15:
  v37 = v19 - (left + right);
  v38 = v21 - (top + bottom);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = v45;
    v56.size.height = v46;
    CGRectGetWidth(v56);
    v57.origin.x = left + v15;
    v57.origin.y = top + v17;
    v57.size.width = v37;
    v57.size.height = v38;
    CGRectGetMaxX(v57);
  }
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  objc_msgSend(a1, "suggestedContentInsetsForListForPage:pageBounds:scrollsDateTime:", a3, objc_msgSend(a1, "listScrollsDateTime"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 scrollsDateTime:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v5 = a5;
  objc_msgSend(a1, "listMinYForPage:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = v8;
  if (v5)
  {
    *(double *)&v10 = 66.0;
    if (!a3)
    {
      objc_msgSend(a1, "searchClippingLineMaxY");
      v9 = v9 - v11;
    }
  }
  else if (a3 == 1)
  {
    if (objc_msgSend(a1, "_presentsListBelowDateTime"))
      v9 = 10.0;
    *(double *)&v10 = 66.0;
  }
  else
  {
    *(double *)&v10 = 0.0;
    if (a3)
    {
      v9 = 0.0;
    }
    else
    {
      objc_msgSend(a1, "searchClippingLineMaxY");
      v9 = -v12;
    }
  }
  v13 = 0.0;
  v14 = 0.0;
  v15 = v9;
  v16 = *(double *)&v10;
  result.right = v14;
  result.bottom = v16;
  result.left = v13;
  result.top = v15;
  return result;
}

+ (CGRect)suggestedFrameForMediaControlsForPageBounds:(CGRect)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  char *v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  char v17;
  int v18;
  char v19;
  int v20;
  double v21;
  int v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  char v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (char *)objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 1, v11);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v15, "userInterfaceIdiom");

    if (v3 != (void *)1)
    {
LABEL_3:
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v13 = 0;
          v14 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "userInterfaceIdiom"))
        {
          v14 = 0;
          v13 = 1;
          goto LABEL_29;
        }
      }
      v13 = v12 ^ 1;
      v20 = __sb__runningInSpringBoard();
      if (v20)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "_referenceBounds");
      }
      v14 = v20 ^ 1;
      BSSizeRoundForScale();
      if (v21 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      {
        if ((v14 & 1) != 0)
          goto LABEL_46;
LABEL_37:
        if (v13)
        {
LABEL_38:

          goto LABEL_39;
        }
        goto LABEL_39;
      }
LABEL_29:
      v22 = __sb__runningInSpringBoard();
      v23 = v22;
      if (v22)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          if ((v14 & 1) != 0)
            goto LABEL_46;
          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom"))
          goto LABEL_45;
      }
      v28 = __sb__runningInSpringBoard();
      v29 = v28;
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_referenceBounds");
      }
      BSSizeRoundForScale();
      if ((v29 & 1) != 0)
      {
        if ((v23 & 1) == 0)
          goto LABEL_45;
LABEL_49:
        if (v14)
        {
LABEL_46:

          if ((v13 & 1) == 0)
            goto LABEL_39;
          goto LABEL_38;
        }
        goto LABEL_37;
      }

      if ((v23 & 1) != 0)
        goto LABEL_49;
LABEL_45:

      if ((v14 & 1) != 0)
        goto LABEL_46;
      goto LABEL_37;
    }
  }
  if ((unint64_t)(v11 - 3) <= 1)
  {
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    x = CGRectGetWidth(v30) * 0.5;
    width = width - x;
  }
  v16 = __sb__runningInSpringBoard();
  v17 = v16;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_39;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
    {

      goto LABEL_39;
    }
  }
  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if ((v19 & 1) == 0)

  if ((v17 & 1) == 0)
LABEL_39:
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  CGRectGetMinX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  CGRectGetWidth(v32);
  UIRectInset();
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (CGRect)suggestedFrameForMediaArtworkForControlsFrame:(CGRect)a3 bottomInset:(double)a4 inPageBounds:(CGRect)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  CGRectGetMaxY(a3);
  v6 = (void *)0x1E0CEA000;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 3) <= 1)
      CGRectGetWidth(a5);
    v9 = __sb__runningInSpringBoard();
    v10 = v9;
    if (v9)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "userInterfaceIdiom") != 1)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    v11 = __sb__runningInSpringBoard();
    v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if ((v12 & 1) == 0)

    if ((v10 & 1) == 0)
      goto LABEL_16;
  }
  else
  {
    CGRectGetWidth(a5);
    CGRectGetHeight(a5);
  }
LABEL_17:
  UIRectCenteredXInRectScale();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (CGRect)suggestedFrameForCallToActionLabel:(id)a3 yOffset:(double)a4 inBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a3, "sizeThatFits:", a5.size.width + -48.0, 1.79769313e308);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetMaxY(v13);
  UIRectCenteredXInRectScale();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (double)searchBarWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SBFDashBoardViewMetrics_searchBarWidth__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (searchBarWidth_onceToken != -1)
    dispatch_once(&searchBarWidth_onceToken, block);
  return *(double *)&searchBarWidth_sSearchBarWidth;
}

void __41__SBFDashBoardViewMetrics_searchBarWidth__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  double Width;
  double v9;
  double v10;
  uint64_t v11;
  CGRect v12;

  v2 = _os_feature_enabled_impl();
  v3 = 556.0;
  if (v2)
    v3 = 425.0;
  searchBarWidth_sSearchBarWidth = *(_QWORD *)&v3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v6 = *(double *)&searchBarWidth_sSearchBarWidth;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    Width = CGRectGetWidth(v12);
    objc_msgSend(*(id *)(a1 + 32), "listInsetXForPage:", 0);
    v10 = Width + v9 * -2.0;

    if (v6 <= v10)
      *(double *)&v11 = v6;
    else
      *(double *)&v11 = v10;
    searchBarWidth_sSearchBarWidth = v11;
  }
}

+ (double)timeLabelScrollPercentForPage:(unint64_t)a3
{
  uint64_t v3;
  double result;
  BOOL v5;
  double v6;

  v3 = objc_msgSend(a1, "dateTimeLayoutForPage:", a3);
  if (v3 == 2)
  {
    v5 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    result = 1.0;
    v6 = -1.0;
  }
  else
  {
    result = 0.0;
    if (v3 != 1)
      return result;
    v5 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection", 0.0) == 1;
    result = -1.0;
    v6 = 1.0;
  }
  if (v5)
    return v6;
  return result;
}

+ (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 centeredX:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  id *v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat rect;
  double rect_8;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "_reducedPageBoundsFromBounds:forPage:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  rect = v10;
  rect_8 = width;
  if (objc_msgSend(a1, "_presentsListBelowDateTime"))
  {
    objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:", 0, x, y, width, height);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(a1, "timeToListInsetXforPage:", 0);
    v27 = v26;
    v28 = (id *)MEMORY[0x1E0CEB258];
    v29 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v30 = v19;
    v31 = v21;
    v32 = v23;
    v33 = v25;
    if (v29 == 1)
      v34 = v27 + CGRectGetMinX(*(CGRect *)&v30);
    else
      v34 = CGRectGetMaxX(*(CGRect *)&v30) - v27;
    v54 = height;
    v36 = x;
    objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:", 1, x, y, rect_8, height, *(_QWORD *)&v34);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    objc_msgSend(a1, "timeToListInsetXforPage:", 1);
    v45 = objc_msgSend(*v28, "userInterfaceLayoutDirection");
    v46 = v38;
    v47 = v40;
    v48 = v42;
    v49 = v44;
    if (v45 == 1)
      CGRectGetMaxX(*(CGRect *)&v46);
    else
      CGRectGetMinX(*(CGRect *)&v46);
    height = v54;
    if (!objc_msgSend(a1, "dateTimeLayoutForPage:", 1))
    {
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = rect_8;
      v59.size.height = v54;
      CGRectGetMaxX(v59);
    }
    if (v4)
    {
LABEL_17:
      v60.origin.x = v36;
      v60.origin.y = y;
      v60.size.width = rect_8;
      v60.size.height = height;
      CGRectGetWidth(v60);
      UIRectCenteredXInRect();
      CGRectGetMinX(v61);
    }
  }
  else
  {
    objc_msgSend(a1, "_dateTimeMinXForReducedBounds:forPage:", 0, v11, v13, v15, v17);
    v35 = (id *)MEMORY[0x1E0CEB258];
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v57.origin.x = v11;
      v57.origin.y = v13;
      v57.size.width = v15;
      v57.size.height = v17;
      CGRectGetWidth(v57);
    }
    objc_msgSend(a1, "_dateTimeMinXForReducedBounds:forPage:", 1, v11, v13, v15, v17);
    v36 = x;
    if (objc_msgSend(*v35, "userInterfaceLayoutDirection") == 1)
    {
      v58.origin.x = rect;
      v58.origin.y = v13;
      v58.size.width = v15;
      v58.size.height = v17;
      CGRectGetWidth(v58);
    }
    if (v4)
      goto LABEL_17;
  }
  objc_msgSend(a1, "timeLabelBaselineY");
  +[SBFLockScreenDateView timeFontMetrics](SBFLockScreenDateView, "timeFontMetrics");
  objc_msgSend(a1, "timeSubtitleBaselineY");
  +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

+ (double)_dateTimeMinXForReducedBounds:(CGRect)a3 forPage:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  double result;
  double MaxX;
  double v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_msgSend(a1, "dateTimeLayoutForPage:");
  if (v10)
  {
    if (v10 == 2)
    {
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MaxX = CGRectGetMaxX(v15);
      objc_msgSend(a1, "listInsetXForPage:", a4);
      return MaxX - v13;
    }
    else if (v10 == 1)
    {
      objc_msgSend(a1, "listInsetXForPage:", a4);
    }
  }
  else
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    return CGRectGetWidth(v14) * 0.5;
  }
  return result;
}

+ (double)timeLabelBaselineY
{
  double result;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBFDashBoardViewMetrics_timeLabelBaselineY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (timeLabelBaselineY_onceToken != -1)
    dispatch_once(&timeLabelBaselineY_onceToken, block);
  objc_msgSend(a1, "searchClippingLineMaxY");
  +[SBFLockScreenDateView timeFontMetrics](SBFLockScreenDateView, "timeFontMetrics");
  SBFMainScreenScale();
  BSFloatRoundForScale();
  return result;
}

uint64_t __45__SBFDashBoardViewMetrics_timeLabelBaselineY__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = *(void **)(a1 + 32);
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    result = objc_msgSend(v4, "_padSpecificValueJ99:otherPad:", 192.0, 166.0);
  else
    result = objc_msgSend(v4, "_phoneSpecificValueN56:n61:n69:d22:", 154.0, 140.0, 140.0, 175.0);
  timeLabelBaselineY_timeLabelMinimumOffsetFromTopBaselineY = v6;
  return result;
}

+ (double)timeLabelToSubtitleLabelDifferenceY
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  if (timeLabelToSubtitleLabelDifferenceY_onceToken != -1)
    dispatch_once(&timeLabelToSubtitleLabelDifferenceY_onceToken, &__block_literal_global_26);
  if ((BSFloatIsZero() & 1) == 0)
    return *(double *)&timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY;
  +[SBFLockScreenDateView timeFontMetrics](SBFLockScreenDateView, "timeFontMetrics");
  v4 = v3;
  objc_msgSend(a1, "timeToSubtitleLabelBaselineDifferenceY");
  v6 = v4 + v5;
  +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
  result = v6 - v7;
  timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY = *(_QWORD *)&result;
  return result;
}

void __62__SBFDashBoardViewMetrics_timeLabelToSubtitleLabelDifferenceY__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_15_0);

}

void __62__SBFDashBoardViewMetrics_timeLabelToSubtitleLabelDifferenceY__block_invoke_2()
{
  timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY = 0;
}

+ (double)timeToSubtitleLabelBaselineDifferenceY
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  double v5;
  double result;
  void *v7;
  uint64_t v8;

  if (timeToSubtitleLabelBaselineDifferenceY_onceToken != -1)
    dispatch_once(&timeToSubtitleLabelBaselineDifferenceY_onceToken, &__block_literal_global_16_1);
  if ((BSFloatIsZero() & 1) == 0)
    return *(double *)&timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
    result = v5;
    timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = *(_QWORD *)&v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(a1, "_padSpecificValueJ99:otherPad:", 46.0, 40.0);
      timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = *(_QWORD *)&result;
    }
    else
    {
      timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = 0x4042000000000000;
      return 36.0;
    }
  }
  return result;
}

void __65__SBFDashBoardViewMetrics_timeToSubtitleLabelBaselineDifferenceY__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_17_1);

}

void __65__SBFDashBoardViewMetrics_timeToSubtitleLabelBaselineDifferenceY__block_invoke_2()
{
  timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = 0;
}

+ (UIEdgeInsets)_cachedGlyphInsetsForString:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
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
  double v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  _QWORD v33[2];
  UIEdgeInsets result;

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (_cachedGlyphInsetsForString_withFont__onceToken != -1)
    dispatch_once(&_cachedGlyphInsetsForString_withFont__onceToken, &__block_literal_global_18);
  objc_msgSend((id)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_cachedGlyphInsetsForString_withFont__trailingInsetForNumber, "objectForKeyedSubscript:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v32 = *MEMORY[0x1E0CEA098];
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 8, v11, 0, *MEMORY[0x1E0C9D820], v13);
    UIRectIntegralWithScale();
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, v12, v13);
    UIRectIntegralWithScale();
    v19 = v18;
    v21 = v15 - v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 - v20);
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 - v17 - v21);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber, "setObject:forKeyedSubscript:", v22, v5);
    objc_msgSend((id)_cachedGlyphInsetsForString_withFont__trailingInsetForNumber, "setObject:forKeyedSubscript:", v23, v5);

    v9 = (void *)v23;
    v7 = (void *)v22;
  }
  objc_msgSend(v7, "floatValue");
  v25 = v24;
  objc_msgSend(v9, "floatValue");
  v27 = v26;

  v28 = v25;
  v29 = v27;
  v30 = 0.0;
  v31 = 0.0;
  result.right = v29;
  result.bottom = v31;
  result.left = v28;
  result.top = v30;
  return result;
}

void __64__SBFDashBoardViewMetrics__cachedGlyphInsetsForString_withFont___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber;
  _cachedGlyphInsetsForString_withFont__leadingInsetForNumber = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_cachedGlyphInsetsForString_withFont__trailingInsetForNumber;
  _cachedGlyphInsetsForString_withFont__trailingInsetForNumber = v2;

}

+ (double)timeToListInsetXforPage:(unint64_t)a3
{
  void *v3;
  int v4;
  double result;
  void *v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  int v11;
  char v12;
  double v13;
  BOOL v14;

  v4 = objc_msgSend(a1, "_presentsListBelowDateTime", a3);
  result = 0.0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    result = 16.0;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v8 = __sb__runningInSpringBoard();
      v9 = v8;
      if (v8)
      {
        if (SBFEffectiveDeviceClass())
        {
          v10 = SBFEffectiveDeviceClass();
          result = 18.0;
          if (v10 != 1)
            return result;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v7 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)v7, "userInterfaceIdiom"))
        {

          return 18.0;
        }
      }
      v11 = __sb__runningInSpringBoard();
      v12 = v11;
      if (v11)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v14 = v13 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
      if ((v12 & 1) == 0)

      if ((v9 & 1) == 0)
      result = 18.0;
      if (v14)
        return 24.0;
    }
  }
  return result;
}

+ (double)timeSubtitleBaselineY
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "timeLabelBaselineY");
  v4 = v3;
  objc_msgSend(a1, "timeToSubtitleLabelBaselineDifferenceY");
  return v4 + v5;
}

+ (id)dateOnlyLunarDateFont
{
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  _QWORD *v12;
  int v13;
  double v14;
  uint64_t v15;
  void *v16;

  if (dateOnlyLunarDateFont_onceToken != -1)
    dispatch_once(&dateOnlyLunarDateFont_onceToken, &__block_literal_global_22_1);
  if (dateOnlyLunarDateFont_dateOnlyLunarFont)
    return (id)dateOnlyLunarDateFont_dateOnlyLunarFont;
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 23.0;
  else
    v7 = 15.0;
  v8 = __sb__runningInSpringBoard();
  if ((_DWORD)v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      goto LABEL_24;
    }
  }
  v11 = v8 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      v12 = (_QWORD *)MEMORY[0x1E0CEB3D0];
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v8, "userInterfaceIdiom"))
    {
      v10 = 0;
      v12 = (_QWORD *)MEMORY[0x1E0CEB3D0];
      v9 = 1;
      goto LABEL_25;
    }
  }
  v9 = v2 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v10 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v14 < *(double *)(MEMORY[0x1E0DAB260] + 40))
  {
    v12 = (_QWORD *)MEMORY[0x1E0CEB3D0];
    goto LABEL_25;
  }
LABEL_24:
  v12 = (_QWORD *)MEMORY[0x1E0CEB3C8];
LABEL_25:
  objc_msgSend(a1, "scaledFontSize:withMaximumFontSizeCategory:", *v12, v7);
  objc_msgSend(v4, "systemFontOfSize:");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)dateOnlyLunarDateFont_dateOnlyLunarFont;
  dateOnlyLunarDateFont_dateOnlyLunarFont = v15;

  if (v10)
  {

    if (!v9)
      goto LABEL_27;
LABEL_31:

    if (!v11)
      return (id)dateOnlyLunarDateFont_dateOnlyLunarFont;
    goto LABEL_28;
  }
  if (v9)
    goto LABEL_31;
LABEL_27:
  if (v11)
LABEL_28:

  return (id)dateOnlyLunarDateFont_dateOnlyLunarFont;
}

void __48__SBFDashBoardViewMetrics_dateOnlyLunarDateFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_23_0);

}

void __48__SBFDashBoardViewMetrics_dateOnlyLunarDateFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)dateOnlyLunarDateFont_dateOnlyLunarFont;
  dateOnlyLunarDateFont_dateOnlyLunarFont = 0;

}

+ (id)dateFont
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (dateFont_onceToken != -1)
    dispatch_once(&dateFont_onceToken, &__block_literal_global_25_0);
  v3 = (void *)dateFont_dateFont;
  if (!dateFont_dateFont)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      objc_msgSend(a1, "_padSpecificValueJ99:otherPad:", 66.0, 56.0);
    else
      objc_msgSend(a1, "_phoneSpecificValueN56:n61:n69:", 42.0, 36.0, 36.0);
    v6 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(a1, "scaledFontSize:withMaximumFontSizeCategory:", *MEMORY[0x1E0CEB3E0]);
    objc_msgSend(v6, "_lightSystemFontOfSize:");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)dateFont_dateFont;
    dateFont_dateFont = v7;

    v3 = (void *)dateFont_dateFont;
  }
  return v3;
}

void __35__SBFDashBoardViewMetrics_dateFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_26);

}

void __35__SBFDashBoardViewMetrics_dateFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)dateFont_dateFont;
  dateFont_dateFont = 0;

}

+ (double)singleLineDateViewBaselineDifferenceY
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBFDashBoardViewMetrics_singleLineDateViewBaselineDifferenceY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleLineDateViewBaselineDifferenceY_onceToken != -1)
    dispatch_once(&singleLineDateViewBaselineDifferenceY_onceToken, block);
  return *(double *)&singleLineDateViewBaselineDifferenceY_singleLineDateViewBaselineDifferenceY;
}

void __64__SBFDashBoardViewMetrics_singleLineDateViewBaselineDifferenceY__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_padSpecificValueJ99:otherPad:", -3.0, -1.0);
    singleLineDateViewBaselineDifferenceY_singleLineDateViewBaselineDifferenceY = v4;
  }
}

+ (double)dateBaselineToListY
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SBFDashBoardViewMetrics_dateBaselineToListY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dateBaselineToListY_onceToken != -1)
    dispatch_once(&dateBaselineToListY_onceToken, block);
  return *(double *)&dateBaselineToListY_dateBaselineToListY;
}

void __46__SBFDashBoardViewMetrics_dateBaselineToListY__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 29.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(*(id *)(a1 + 32), "_padSpecificValueJ99:otherPad:", 52.0, 34.0);
  dateBaselineToListY_dateBaselineToListY = *(_QWORD *)&v4;
}

+ (double)listMinYForPage:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  if ((objc_msgSend(a1, "_presentsListBelowDateTime", a3) & 1) != 0)
  {
    objc_msgSend(a1, "timeLabelBaselineY");
    v5 = v4;
    objc_msgSend(a1, "timeToSubtitleLabelBaselineDifferenceY");
    v7 = v5 + v6;
    objc_msgSend(a1, "dateBaselineToListY");
    v9 = v7 + v8;
    if (listMinYForPage__onceToken != -1)
      dispatch_once(&listMinYForPage__onceToken, &__block_literal_global_27);
    return v9 + *(double *)&listMinYForPage__alternateCalendarHeight;
  }
  else
  {
    objc_msgSend(a1, "_phoneSpecificValueN56:n61:n69:", 78.0, 58.0, 32.0);
  }
  return result;
}

void __43__SBFDashBoardViewMetrics_listMinYForPage___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CAA1E8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_28);

}

uint64_t __43__SBFDashBoardViewMetrics_listMinYForPage___block_invoke_2()
{
  uint64_t result;
  uint64_t v1;

  result = +[SBFLockScreenAlternateDateLabel showAlternateDate](SBFLockScreenAlternateDateLabel, "showAlternateDate");
  v1 = 0;
  if ((_DWORD)result)
    result = +[SBFLockScreenDateSubtitleDateView subtitleLabelToLunarDateLabelBaselineDifferenceY](SBFLockScreenDateSubtitleDateView, "subtitleLabelToLunarDateLabelBaselineDifferenceY", 0.0);
  listMinYForPage__alternateCalendarHeight = v1;
  return result;
}

+ (BOOL)_presentsListBelowDateTime
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 1;
  else
    return objc_msgSend(a1, "_isPortrait");
}

+ (double)searchClippingLineMaxY
{
  if (searchClippingLineMaxY_onceToken != -1)
    dispatch_once(&searchClippingLineMaxY_onceToken, &__block_literal_global_31);
  return *(double *)&searchClippingLineMaxY_searchClippingLineMaxY;
}

void __49__SBFDashBoardViewMetrics_searchClippingLineMaxY__block_invoke()
{
  double v0;
  void *v1;
  void *v2;
  uint64_t v3;
  double v4;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v0 = 68.0;
    }
    else if (SBFEffectiveHomeButtonType() == 2)
    {
      v0 = 92.0;
    }
    else
    {
      v0 = 68.0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "userInterfaceIdiom"))
    {
      v0 = 68.0;
    }
    else if (SBFEffectiveHomeButtonType() == 2)
    {
      v0 = 92.0;
    }
    else
    {
      v0 = 68.0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 72.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v4 = v0;
  searchClippingLineMaxY_searchClippingLineMaxY = *(_QWORD *)&v4;
}

+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5
{
  void *v5;
  void *v6;
  int v10;
  char v11;
  int v12;
  char v13;
  double v14;
  double v15;
  double v16;
  int v17;
  char v18;
  int v19;
  char v20;
  double v21;
  BOOL v22;

  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {

      goto LABEL_15;
    }
  }
  v12 = __sb__runningInSpringBoard();
  v13 = v12;
  if (v12)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v15 = v14;
  v16 = *(double *)(MEMORY[0x1E0DAB260] + 48);
  if ((v13 & 1) == 0)

  if ((v11 & 1) == 0)
  if (v15 < v16)
  {
LABEL_15:
    v17 = __sb__runningInSpringBoard();
    v18 = v17;
    if (v17)
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      {
LABEL_22:
        v19 = __sb__runningInSpringBoard();
        v20 = v19;
        if (v19)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v22 = v21 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
        if ((v20 & 1) == 0)

        if ((v18 & 1) == 0)
        a3 = a5;
        if (v22)
          return a4;
        return a3;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "userInterfaceIdiom"))
        goto LABEL_22;

    }
    return a5;
  }
  return a3;
}

+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5 d22:(double)a6
{
  void *v6;
  void *v7;
  void *v12;
  int v13;
  char v14;
  int v15;
  char v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  int v21;
  char v22;
  int v23;
  char v24;
  double v25;
  BOOL v26;

  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      return a6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom"))
    {

    }
    else
    {
      v6 = (void *)SBFEffectiveHomeButtonType();

      if (v6 == (void *)2)
        return a6;
    }
  }
  v13 = __sb__runningInSpringBoard();
  v14 = v13;
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom"))
    {

      goto LABEL_24;
    }
  }
  v15 = __sb__runningInSpringBoard();
  v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v18 = v17;
  v19 = *(double *)(MEMORY[0x1E0DAB260] + 48);
  if ((v16 & 1) == 0)

  if ((v14 & 1) == 0)
  v20 = v18 < v19;
  a6 = a3;
  if (v20)
  {
LABEL_24:
    v21 = __sb__runningInSpringBoard();
    v22 = v21;
    if (v21)
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      {
LABEL_31:
        v23 = __sb__runningInSpringBoard();
        v24 = v23;
        if (v23)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_referenceBounds");
        }
        BSSizeRoundForScale();
        v26 = v25 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
        if ((v24 & 1) == 0)

        if ((v22 & 1) == 0)
        a6 = a5;
        if (v26)
          return a4;
        return a6;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "userInterfaceIdiom"))
        goto LABEL_31;

    }
    return a5;
  }
  return a6;
}

+ (double)_padSpecificValueJ99:(double)a3 otherPad:(double)a4
{
  void *v4;
  void *v5;
  int v8;
  char v9;
  int v10;
  char v11;
  double v12;

  v8 = __sb__runningInSpringBoard();
  v9 = v8;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
      return a4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
    {
LABEL_13:

      return a4;
    }
  }
  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if (v12 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    a4 = a3;
  if ((v11 & 1) == 0)

  if ((v9 & 1) == 0)
    goto LABEL_13;
  return a4;
}

+ (double)_padSpecificInsets:(SBFDashBoardPadPageInsets *)a3 leading:(BOOL)a4
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  int v9;
  char v10;
  int v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double *p_var1;
  double *p_var2;
  double *p_var3;
  int v19;
  char v20;
  int v21;
  char v22;
  double v23;
  double v24;
  double v25;
  double result;

  v6 = a4;
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
    {

      goto LABEL_15;
    }
  }
  v11 = __sb__runningInSpringBoard();
  v12 = v11;
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v14 = v13;
  v15 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v12 & 1) == 0)

  if ((v10 & 1) == 0)
  if (v14 >= v15)
  {
    p_var1 = &a3->var2.var1;
    p_var2 = &a3->var2.var2;
    p_var3 = &a3->var2.var3;
    a3 = (SBFDashBoardPadPageInsets *)((char *)a3 + 64);
    goto LABEL_30;
  }
LABEL_15:
  v19 = __sb__runningInSpringBoard();
  v20 = v19;
  if (v19)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") != 1)
    {

LABEL_29:
      p_var1 = &a3->var0.var1;
      p_var2 = &a3->var0.var2;
      p_var3 = &a3->var0.var3;
      goto LABEL_30;
    }
  }
  v21 = __sb__runningInSpringBoard();
  v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v24 = v23;
  v25 = *(double *)(MEMORY[0x1E0DAB260] + 248);
  if ((v22 & 1) == 0)

  if ((v20 & 1) == 0)
  if (v24 < v25)
    goto LABEL_29;
  p_var1 = &a3->var1.var1;
  p_var2 = &a3->var1.var2;
  p_var3 = &a3->var1.var3;
  a3 = (SBFDashBoardPadPageInsets *)((char *)a3 + 32);
LABEL_30:
  objc_msgSend(a1, "_padSpecificValueForDevice:leading:", v6, a3->var0.var0, *p_var1, *p_var2, *p_var3);
  return result;
}

+ (double)_padSpecificValueForDevice:(SBFDashBoardOrientationLeadingInsets)a3 leading:(BOOL)a4
{
  _BOOL4 v4;
  double var2;
  double var1;
  double var0;
  int v8;
  double result;

  v4 = a4;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8 = objc_msgSend(a1, "_isPortrait", a3.var0, a3.var1, a3.var2, a3.var3);
  if (v4)
    result = var0;
  else
    result = var2;
  if (!v8)
    return var1;
  return result;
}

+ (double)listInsetXForPage:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  double result;

  v4 = objc_msgSend(a1, "listLayoutForPage:", a3) - 3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  if (v4 > 1)
  {
    result = 8.0;
    if (v7 == 1)
      return 0.0;
  }
  else
  {
    v8 = objc_msgSend(a1, "_isPortrait");
    if (v7 == 1)
    {
      result = 69.0;
      if (v8)
        return 56.0;
    }
    else
    {
      result = 8.0;
      if ((v8 & 1) == 0)
        objc_msgSend(a1, "_phoneSpecificValueN56:n61:n69:", 79.0, 69.0, 54.0);
    }
  }
  return result;
}

+ (double)listInsetXForPage:(unint64_t)a3 leading:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  double result;
  char v11;
  _OWORD v12[6];

  v4 = a4;
  v6 = objc_msgSend(a1, "listLayoutForPage:", a3) - 3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = v8 & 0xFFFFFFFFFFFFFFFBLL;
  if (v6 > 1)
  {
    result = 8.0;
    if (v9 == 1)
      return 0.0;
  }
  else if (v9 == 1)
  {
    v12[0] = xmmword_18AC15EB0;
    v12[1] = xmmword_18AC15EC0;
    v12[2] = vdupq_n_s64(0x4051400000000000uLL);
    v12[3] = vdupq_n_s64(0x4050000000000000uLL);
    v12[4] = xmmword_18AC15ED0;
    v12[5] = vdupq_n_s64(0x4054000000000000uLL);
    objc_msgSend(a1, "_padSpecificInsets:leading:", v12, v4);
  }
  else
  {
    v11 = objc_msgSend(a1, "_isPortrait");
    result = 8.0;
    if ((v11 & 1) == 0)
      objc_msgSend(a1, "_phoneSpecificValueN56:n61:n69:", 79.0, 69.0, 54.0);
  }
  return result;
}

+ (double)listWidthForPage:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  double result;
  int v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    result = 0.0;
    if (a3 <= 1)
    {
      v8 = _os_feature_enabled_impl();
      result = 556.0;
      if (v8)
        return 425.0;
    }
  }
  else if (objc_msgSend(a1, "_isPortrait")
         || objc_msgSend(a1, "_presentsListBelowDateTime"))
  {
    objc_msgSend(a1, "searchBarWidth");
  }
  else
  {
    return 320.0;
  }
  return result;
}

+ (CGRect)suggestedFrameForStatusView:(id)a3 inView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right;
  double left;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (a3 && a4)
  {
    right = a5.right;
    left = a5.left;
    v8 = a3;
    objc_msgSend(a4, "bounds");
    if (left >= right)
      v10 = left;
    else
      v10 = right;
    objc_msgSend(v8, "sizeThatFits:", v9 + fmax(v10, 25.0) * -2.0);

    UIRectInset();
    SBFMainScreenScale();
    BSRectRoundForScale();
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (BOOL)_isPortrait
{
  return (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) < 2;
}

+ (CGRect)_reducedPageBoundsFromBounds:(CGRect)a3 forPage:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_10;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v12 = CGRectGetWidth(v23);
  objc_msgSend(a1, "listInsetXForPage:", a4);
  v14 = v12 + v13 * -2.0;
  objc_msgSend(a1, "listWidthForPage:", a4);
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  v17 = objc_msgSend(a1, "listLayoutForPage:", a4);
  if (!objc_msgSend(a1, "layoutUsesMargin:", v17))
    v14 = v16;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v18 = CGRectGetWidth(v24) - v14;
  if (v18 > 0.0)
  {
    if (objc_msgSend(a1, "layoutCentersContent:", v17))
      x = x + v18 * 0.5;
  }
  else
  {
LABEL_10:
    v14 = width;
  }
  v19 = x;
  v20 = y;
  v21 = v14;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  NSString *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = (NSString *)a4;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  v8 = (void *)MEMORY[0x1E0CEA5E8];
  v9 = *MEMORY[0x1E0CEB538];
  if (v7 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "_scaledValueForValue:", a3);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v14 = v13;

  return v14;
}

@end
