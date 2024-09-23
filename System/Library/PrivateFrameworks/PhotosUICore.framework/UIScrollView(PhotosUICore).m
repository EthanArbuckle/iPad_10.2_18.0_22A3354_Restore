@implementation UIScrollView(PhotosUICore)

- (void)px_constrainedContentOffset:()PhotosUICore
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "_px_currentContentSize");
  objc_msgSend(a1, "adjustedContentInset");
  objc_msgSend(a1, "px_screenScale");
  PXSizeCeilingToPixel();
  v10.origin.x = v3;
  v10.origin.y = v5;
  v10.size.width = v7;
  v10.size.height = v9;
  CGRectGetWidth(v10);
  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  CGRectGetHeight(v11);
}

- (double)_px_currentContentSize
{
  double v2;
  double v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "contentSize");
  v3 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionViewContentSize");
    v3 = v5;

  }
  return v3;
}

- (uint64_t)px_scrollToContentOffset:()PhotosUICore animated:
{
  objc_msgSend(a1, "px_constrainedContentOffset:");
  return objc_msgSend(a1, "setContentOffset:animated:", a3);
}

- (uint64_t)px_isScrolledAtEdge:()PhotosUICore
{
  double v5;
  double v6;

  objc_msgSend(a1, "px_screenScale");
  if (v5 == 0.0)
    v6 = 0.5;
  else
    v6 = 0.5 / v5;
  return objc_msgSend(a1, "px_isScrolledAtEdge:tolerance:", a3, v6);
}

- (uint64_t)px_isScrolledAtEdge:()PhotosUICore tolerance:
{
  void *v9;

  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+PhotosUICore.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tolerance >= 0.0f"));

  }
  return objc_msgSend(a1, "_px_isScrolledAtEdge:tolerance:", a3, a4);
}

- (uint64_t)px_isScrolledBeyondEdge:()PhotosUICore
{
  return objc_msgSend(a1, "_px_isScrolledAtEdge:tolerance:", -0.6);
}

- (uint64_t)px_scrollToEdge:()PhotosUICore animated:
{
  objc_msgSend(a1, "px_contentOffsetForEdge:");
  return objc_msgSend(a1, "px_scrollToContentOffset:animated:", a4);
}

- (uint64_t)px_contentOffsetForEdge:()PhotosUICore
{
  return objc_msgSend(a1, "px_contentOffsetForEdge:padding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (double)px_contentOffsetForEdge:()PhotosUICore padding:
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat rect;
  CGRect v21;
  CGRect v22;

  objc_msgSend(a1, "bounds");
  v6 = v5;
  v18 = v7;
  v19 = v8;
  rect = v9;
  objc_msgSend(a1, "contentOffset");
  v11 = v10;
  objc_msgSend(a1, "_px_currentContentSize");
  v17 = v12;
  objc_msgSend(a1, "adjustedContentInset");
  PXEdgeInsetsAdd();
  switch(a3)
  {
    case 0:
      v11 = -v13;
      break;
    case 2:
      v15 = v14;
      v21.origin.x = v6;
      v21.origin.y = v18;
      v21.size.width = v19;
      v21.size.height = rect;
      v11 = v15 + v17 - CGRectGetWidth(v21);
      break;
    case 3:
      v22.origin.x = v6;
      v22.origin.y = v18;
      v22.size.width = v19;
      v22.size.height = rect;
      CGRectGetHeight(v22);
      break;
    default:
      return v11;
  }
  return v11;
}

- (uint64_t)px_isDecelerating
{
  if ((objc_msgSend(a1, "isDecelerating") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "px_isBouncing");
}

- (uint64_t)px_isBouncing
{
  unint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "px_scrollableAxis");
  if ((v2 & 1) != 0)
  {
    if ((objc_msgSend(a1, "px_isScrolledBeyondEdge:", 0) & 1) != 0)
      return 1;
    v3 = objc_msgSend(a1, "px_isScrolledBeyondEdge:", 2);
  }
  else
  {
    v3 = 0;
  }
  v4 = (v2 >> 1) & 1 | v3;
  if ((v2 & 2) == 0)
    return v4;
  if ((v3 & 1) != 0)
    return v4;
  v4 = 1;
  if ((objc_msgSend(a1, "px_isScrolledBeyondEdge:", 1) & 1) != 0)
    return v4;
  return objc_msgSend(a1, "px_isScrolledBeyondEdge:", 3);
}

- (void)px_adjustInsetsForKeyboardInfo:()PhotosUICore safeAreaInsets:
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[9];
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v8 = a6;
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "frame");
    objc_msgSend(v10, "convertRect:toView:", 0);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    objc_msgSend(a1, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:toView:", 0, v12, v14, v16, v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(v9, "CGRectValue");
    v63.origin.x = v28;
    v63.origin.y = v29;
    v63.size.width = v30;
    v63.size.height = v31;
    v60.origin.x = v21;
    v60.origin.y = v23;
    v60.size.width = v25;
    v60.size.height = v27;
    v61 = CGRectIntersection(v60, v63);
    x = v61.origin.x;
    y = v61.origin.y;
    width = v61.size.width;
    height = v61.size.height;
    if (CGRectIsNull(v61)
      || (v62.origin.x = x, v62.origin.y = y, v62.size.width = width, v62.size.height = height, CGRectIsEmpty(v62)))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    objc_msgSend(a1, "window");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "convertRect:fromWindow:", 0, x, y, width, height);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_msgSend(a1, "superview");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "convertRect:fromView:", 0, v38, v40, v42, v44);
    v47 = v46;

    objc_msgSend(a1, "contentInset");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    if (v47 < a4)
      v47 = a4;
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC4E48]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    v56 = v55;

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC4E40]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "integerValue");

    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __76__UIScrollView_PhotosUICore__px_adjustInsetsForKeyboardInfo_safeAreaInsets___block_invoke;
    v59[3] = &unk_1E51490B0;
    v59[4] = a1;
    v59[5] = v49;
    v59[6] = v51;
    *(double *)&v59[7] = v47;
    v59[8] = v53;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v58 << 16, v59, 0, v56, 0.0);
  }

}

- (uint64_t)px_scrollableAxis
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
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
  _BOOL8 v20;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "_px_currentContentSize");
  v11 = v10;
  v23 = v12;
  objc_msgSend(a1, "adjustedContentInset");
  v22 = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v24.origin.x = v3;
  v24.origin.y = v5;
  v24.size.width = v7;
  v24.size.height = v9;
  v20 = CGRectGetWidth(v24) < v19 + v11 + v15;
  v25.origin.x = v3;
  v25.origin.y = v5;
  v25.size.width = v7;
  v25.size.height = v9;
  if (CGRectGetHeight(v25) >= v17 + v23 + v22)
    return v20;
  else
    return v20 | 2;
}

- (BOOL)_px_isScrolledAtEdge:()PhotosUICore tolerance:
{
  double v3;

  objc_msgSend(a1, "px_scrollDistanceFromEdge:");
  return v3 <= a2;
}

- (void)px_scrollDistanceFromEdge:()PhotosUICore
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;

  objc_msgSend(a1, "bounds");
  v6 = v5;
  v8 = v7;
  v11 = v9;
  v12 = v10;
  objc_msgSend(a1, "contentOffset");
  objc_msgSend(a1, "_px_currentContentSize");
  objc_msgSend(a1, "adjustedContentInset");
  switch(a3)
  {
    case 2:
      v13.origin.x = v6;
      v13.origin.y = v8;
      v13.size.width = v11;
      v13.size.height = v12;
      CGRectGetWidth(v13);
      break;
    case 3:
      v14.origin.x = v6;
      v14.origin.y = v8;
      v14.size.width = v11;
      v14.size.height = v12;
      CGRectGetHeight(v14);
      break;
    default:
      return;
  }
}

- (uint64_t)px_cancelScrollGesture
{
  uint64_t result;

  result = objc_msgSend(a1, "isScrollEnabled");
  if ((_DWORD)result)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      return objc_msgSend(a1, "_forcePanGestureToEndImmediately");
    }
    else
    {
      objc_msgSend(a1, "setScrollEnabled:", 0);
      return objc_msgSend(a1, "setScrollEnabled:", 1);
    }
  }
  return result;
}

- (uint64_t)px_cancelScrollAnimation
{
  objc_msgSend(a1, "contentOffset");
  return objc_msgSend(a1, "setContentOffset:animated:", 0);
}

- (BOOL)px_isPerformingScrollTest
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "scrollTestParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (double)px_minimumContentOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "adjustedContentInset");
  objc_msgSend(a1, "px_screenScale");
  PXFloatRoundToPixel();
  v3 = v2;
  objc_msgSend(a1, "px_screenScale");
  PXFloatRoundToPixel();
  return v3;
}

- (double)px_maximumContentOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  objc_msgSend(a1, "px_minimumContentOffset");
  v5 = v4;
  objc_msgSend(a1, "adjustedContentInset");
  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "px_screenScale");
  PXFloatRoundToPixel();
  v7 = v6 - v3;
  if (v5 >= v7)
    v8 = v5;
  else
    v8 = v7;
  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "px_screenScale");
  PXFloatRoundToPixel();
  return v8;
}

- (double)px_contentOffsetYFraction
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a1, "px_minimumContentOffset");
  v3 = v2;
  objc_msgSend(a1, "px_maximumContentOffset");
  v5 = v4 - v3;
  objc_msgSend(a1, "contentOffset");
  if (fabs((v6 - v3) / v5) == INFINITY)
    return 0.0;
  PXFloatSaturate();
  return result;
}

@end
