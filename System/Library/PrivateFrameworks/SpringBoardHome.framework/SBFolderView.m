@implementation SBFolderView

- (void)enumerateIconListViewsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBFolderView allIconListViews](self, "allIconListViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  __int128 v7;
  uint64_t VisibleColumnsForIconListIndex;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _BYTE buf[32];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(v5, "iconRowsForCurrentOrientation");
  else
    objc_msgSend(v5, "iconColumnsForCurrentOrientation");
  v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&buf[16] = v7;
  VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)buf, a3);
  v10 = v9;
  objc_msgSend(v6, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayoutOnGeometryChange:", 0);

  v12 = objc_msgSend(v6, "visibleColumnRange");
  v14 = v13;
  v16 = objc_msgSend(v6, "visibleRowRange");
  v17 = v15;
  if (VisibleColumnsForIconListIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_1(a3, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(v6, "hideAllIcons");
  }
  else if (v10 == -1)
  {
    SBLogIcon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_2(a3, v28, v29, v30, v31, v32, v33, v34);

    objc_msgSend(v6, "showAllIcons");
  }
  else
  {
    v40 = v15;
    v25 = *(unsigned __int8 *)(a1 + 88);
    SBLogIcon();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = VisibleColumnsForIconListIndex;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v10;
        _os_log_debug_impl(&dword_1CFEF3000, v26, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to show icons in range {%lu,%lu} (vertical)", buf, 0x20u);
      }

      objc_msgSend(v6, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0, VisibleColumnsForIconListIndex, v10, 0x7FFFFFFFFFFFFFFFLL, 0);
      v17 = v40;
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = VisibleColumnsForIconListIndex;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v10;
        _os_log_debug_impl(&dword_1CFEF3000, v26, OS_LOG_TYPE_DEBUG, "Telling page at index %lu to show icons in range {%lu,%lu}", buf, 0x20u);
      }

      v17 = v40;
      if (*(_BYTE *)(a1 + 89) && *(_QWORD *)(a1 + 64) == a3)
      {
        v35 = *(_QWORD *)(a1 + 72);
        v36 = *(_QWORD *)(a1 + 80);
      }
      else
      {
        v36 = 0;
        v35 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend(v6, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", VisibleColumnsForIconListIndex, v10, v35, v36, 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0);
    }
  }
  if (v12 != objc_msgSend(v6, "visibleColumnRange")
    || v14 != v37
    || v16 != objc_msgSend(v6, "visibleRowRange")
    || v17 != v38)
  {
    objc_msgSend(v6, "layoutIconsIfNeeded");
  }
  objc_msgSend(v6, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNeedsLayoutOnGeometryChange:", 1);

}

- (SBVisibleColumnRange)visibleColumnRangeWithTotalLists:(SEL)a3 iconVisibilityHandling:(unint64_t)a4 predictedVisibleColumn:(int64_t)a5 includingAdditionalColumnsKeptVisible:(SBFolderPredictedVisibleColumn *)a6
{
  _BOOL4 v7;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  int v24;
  BOOL v25;
  double v26;
  double v27;
  unint64_t v28;
  SBVisibleColumnRange *result;
  void *v30;
  double v31;
  int64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  double v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _BOOL4 v76;
  __int128 v79;
  double v80;
  void *v81;
  BOOL v82;
  void *v83;
  SBFolderPredictedVisibleColumn *v84;
  unint64_t v85;
  _OWORD v86[2];
  double v87;
  double v88;

  v7 = a7;
  -[SBFolderView _pageWidthOrHeight](self, "_pageWidthOrHeight");
  v14 = v13;
  v15 = -[SBFolderView countOfAdditionalPagesToKeepVisibleInOneDirection](self, "countOfAdditionalPagesToKeepVisibleInOneDirection");
  -[SBFolderView additionalScrollWidthToKeepVisibleInOneDirection](self, "additionalScrollWidthToKeepVisibleInOneDirection");
  v17 = v16 + v14 * (double)v15;
  if (v7)
    v18 = v17;
  else
    v18 = 0.0;
  -[SBFolderView scrollableWidthForVisibleColumnRange](self, "scrollableWidthForVisibleColumnRange");
  v20 = v19;
  -[SBFolderView minimumVisibleScrollOffset](self, "minimumVisibleScrollOffset");
  v22 = v21 - v18;
  v23 = nexttoward(v18 + v20 + v21, v21);
  v24 = -[SBFolderView isRTL](self, "isRTL");
  v25 = -[SBFolderView isVertical](self, "isVertical");
  if (v24)
    v26 = v23;
  else
    v26 = v22;
  if (v24)
    v27 = v22;
  else
    v27 = v23;
  v28 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
  result = (SBVisibleColumnRange *)BSFloatIsZero();
  if (!a4 || (result & 1) != 0)
    goto LABEL_15;
  -[SBFolderView window](self, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {

    goto LABEL_16;
  }
  result = (SBVisibleColumnRange *)-[SBFolderView hasEverBeenInAWindow](self, "hasEverBeenInAWindow");
  if ((_DWORD)result)
  {
LABEL_15:
    retstr->endIconListIndex = 0;
    retstr->endColumnIndex = 0;
    retstr->startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
    retstr->startColumnIndex = 0;
    return result;
  }
LABEL_16:
  v82 = v25;
  v85 = v28;
  v31 = v18 + v14 + v18;
  if (((a5 == 1) & -[SBFolderView isScrollingUsingDecelerationAnimation](self, "isScrollingUsingDecelerationAnimation")) != 0)
    v32 = 0;
  else
    v32 = a5;
  v33 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 0, 0, v26);
  v34 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v33);
  v35 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 0, 0, v27);
  v36 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v35);
  v84 = a6;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    v33 = -[SBFolderView closestIconPageIndexForPageIndex:](self, "closestIconPageIndexForPageIndex:", v33);
  v37 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v33);
  -[SBFolderView _scrollRangeForContentAtPageIndex:pageWidthOrHeight:](self, "_scrollRangeForContentAtPageIndex:pageWidthOrHeight:", v33, v14);
  v39 = v38;
  v41 = SBHIntersectionFloatRange(v38, v40, v22, v18 + v14 + v18);
  v43 = v42;
  if (BSFloatIsZero())
    v44 = v37 + 1 >= v85;
  else
    v44 = 1;
  if (!v44)
  {
    -[SBFolderView _scrollRangeForContentAtPageIndex:pageWidthOrHeight:](self, "_scrollRangeForContentAtPageIndex:pageWidthOrHeight:", v33 + 1, v14);
    v39 = v45;
    v41 = SBHIntersectionFloatRange(v45, v46, v22, v31);
    v43 = v47;
    ++v37;
  }
  if (v37 == 0x7FFFFFFFFFFFFFFFLL || v37 >= a4)
  {
    v49 = 0;
    v88 = 0.0;
    v50 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_42;
  }
  -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v37);
  v51 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v51;
  v88 = 0.0;
  v50 = 0x7FFFFFFFFFFFFFFFLL;
  if (v51 && v43 > 0.0)
  {
    if (v32 == 2)
    {
      v37 = 0;
    }
    else if (v32 == 1)
    {
      v52 = SBHRTLAwarePositionInFloatRange(0, v24, v41, v43);
      if (v82)
        v53 = objc_msgSend(v49, "rowAtPoint:fractionOfDistanceThroughRow:", &v88, 0.0, v52 - v39);
      else
        v53 = objc_msgSend(v49, "columnAtPoint:fractionOfDistanceThroughColumn:", &v88, v52 - v39, 0.0);
      v50 = v53;
      goto LABEL_42;
    }
    v50 = 0;
  }
LABEL_42:
  if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    v35 = -[SBFolderView closestIconPageIndexForPageIndex:](self, "closestIconPageIndexForPageIndex:", v35);
  -[SBFolderView _scrollRangeForContentAtPageIndex:pageWidthOrHeight:](self, "_scrollRangeForContentAtPageIndex:pageWidthOrHeight:", v35, v14);
  v55 = v54;
  v57 = SBHIntersectionFloatRange(v54, v56, v22, v31);
  v59 = v58;
  v60 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v35);
  v87 = 0.0;
  v83 = v49;
  if (v60 >= a4 || v59 <= 0.0)
  {
    -[SBFolderView folder](self, "folder");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v64;
    if (v60 == 0x7FFFFFFFFFFFFFFFLL
      || (v65 = objc_msgSend(v64, "precedingVisibleListIndexBeforeIndex:", v60), v65 == 0x7FFFFFFFFFFFFFFFLL)
      || (v66 = v65,
          -[SBFolderView iconListViewForIconListModelIndex:](self, "iconListViewForIconListModelIndex:", v65),
          (v67 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v70 = 0;
      v71 = 0;
    }
    else
    {
      v68 = v67;
      if (v82)
        v69 = objc_msgSend(v67, "iconRowsForCurrentOrientation");
      else
        v69 = objc_msgSend(v67, "iconColumnsForCurrentOrientation");
      v71 = v69;
      v70 = v69 - 1;

      v60 = v66;
    }
  }
  else
  {
    -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v82)
      v63 = objc_msgSend(v61, "iconRowsForCurrentOrientation");
    else
      v63 = objc_msgSend(v61, "iconColumnsForCurrentOrientation");
    v71 = v63;
    if (!v32 || v32 == 2)
    {
      v70 = v63 - 1;
    }
    else if (v32 == 1)
    {
      v72 = SBHRTLAwarePositionInFloatRange(2, v24, v57, v59);
      if (v82)
        v73 = objc_msgSend(v62, "rowAtPoint:fractionOfDistanceThroughRow:", &v87, 0.0, v72 - v55);
      else
        v73 = objc_msgSend(v62, "columnAtPoint:fractionOfDistanceThroughColumn:", &v87, v72 - v55, 0.0);
      v70 = v73;
    }
    else
    {
      v70 = 0;
    }
  }

  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
    v74 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v74 = v37;
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
    v75 = 0;
  else
    v75 = v50;
  retstr->startIconListIndex = v74;
  retstr->startColumnIndex = v75;
  retstr->endIconListIndex = v60;
  retstr->endColumnIndex = v70;
  if (!v84)
    goto LABEL_95;
  v76 = -[SBFolderView isScrolling](self, "isScrolling");
  if (v74 == 0x7FFFFFFFFFFFFFFFLL || !v76 || v85 == 0)
    goto LABEL_81;
  v79 = *(_OWORD *)&retstr->endIconListIndex;
  v86[0] = *(_OWORD *)&retstr->startIconListIndex;
  v86[1] = v79;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)v86))
    goto LABEL_81;
  if (-[SBFolderView userInterfaceLayoutDirectionAwareScrollingDirection](self, "userInterfaceLayoutDirectionAwareScrollingDirection"))
  {
    if (v70 + 1 >= v71)
    {
      if (v60 + 1 >= v85)
      {
        v84->var0 = v60 + 1;
        v84->var1.column = 0;
      }
      else
      {
        v84->var0 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v84->var0 = v60;
      v84->var1.column = v70 + 1;
    }
    v80 = v87;
LABEL_94:
    v84->var1.confidence = v80;
    goto LABEL_95;
  }
  if (v74 | v75)
  {
    if (v75)
    {
      v84->var0 = v74;
      v84->var1.column = v75 - 1;
    }
    else
    {
      v84->var0 = v74 - 1;
      -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v84->var1.column = objc_msgSend(v81, "iconColumnsForCurrentOrientation") - 1;

    }
    v80 = 1.0 - v88;
    goto LABEL_94;
  }
LABEL_81:
  v84->var0 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_95:

  return result;
}

+ (int64_t)_pageIndexForOffset:(double)a3 minimumPage:(int64_t)a4 maximumPage:(int64_t)a5 pageCount:(unint64_t)a6 pageWidth:(double)a7 pageSpacing:(double)a8 userInterfaceLayoutDirection:(int64_t)a9 behavior:(int64_t)a10 fractionOfDistanceThroughPage:(double *)a11
{
  uint64_t v13;
  int64_t v14;

  v13 = objc_msgSend((id)objc_opt_class(), "_pageOffsetForOffset:behavior:pageWidth:pageSpacing:pageCount:userInterfaceLayoutDirection:fractionOfDistanceThroughPage:", a10, a6, a9, a11, a3, a7, a8);
  v14 = v13 + a4;
  if (a4 > v13 + a4)
    v14 = a4;
  if (a5 >= v14)
    return v14;
  else
    return a5;
}

+ (unint64_t)_pageOffsetForOffset:(double)a3 behavior:(int64_t)a4 pageWidth:(double)a5 pageSpacing:(double)a6 pageCount:(unint64_t)a7 userInterfaceLayoutDirection:(int64_t)a8 fractionOfDistanceThroughPage:(double *)a9
{
  unint64_t result;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double __y;

  if (fabs(a5) < 2.22044605e-16)
  {
    result = 0;
    if (a9)
      *a9 = 0.0;
    return result;
  }
  __y = 0.0;
  v17 = (double)a7 * a5;
  if (a6 <= 0.0)
  {
    v18 = a3 / a5;
    v22 = modf(a3 / a5, &__y);
  }
  else
  {
    v18 = a3 / (a5 + a6);
    modf(v18, &__y);
    v19 = fmod(a3, a5 + a6);
    v20 = v19 / a5;
    v21 = v19 < a5;
    v22 = 1.0;
    if (v21)
      v22 = v20;
    if (a7 > 1)
      v17 = v17 + (double)(a7 - 1) * a6;
  }
  v23 = 0.0;
  if (v18 >= 0.0)
  {
    v23 = v22;
    if (v18 > v17)
      v23 = 0.0;
  }
  v24 = v23 >= 1.0 || v23 <= 0.0;
  v25 = 1.0 - v23;
  if (v24)
    v25 = v23;
  if (a8 == 1)
  {
    result = ~(uint64_t)__y + a7;
  }
  else
  {
    v25 = v23;
    result = (uint64_t)__y;
  }
  if (a4 != 1)
    goto LABEL_26;
  if (v25 < 0.01)
  {
    v25 = 0.0;
LABEL_26:
    if (!a9)
      return result;
    goto LABEL_27;
  }
  if (v25 > 0.99)
  {
    v25 = 0.0;
    ++result;
  }
  if (a9)
LABEL_27:
    *a9 = v25;
  return result;
}

- (id)iconListViewAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_iconListViews, "objectAtIndex:", a3);
}

- (double)minimumVisibleScrollOffset
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBIconScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  if (-[SBFolderView isVertical](self, "isVertical"))
    return v6;
  else
    return v4;
}

+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  return 0;
}

- (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  return objc_msgSend((id)objc_opt_class(), "countOfAdditionalPagesToKeepVisibleInOneDirection");
}

- (BOOL)isScrollingUsingDecelerationAnimation
{
  return self->_scrollingUsingDecelerationAnimation;
}

- (double)additionalScrollWidthToKeepVisibleInOneDirection
{
  return 0.0;
}

uint64_t __37__SBFolderView_setContentVisibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentVisibility:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisiblySettled:", 0);
}

- (id)allIconListViews
{
  NSMutableArray *iconListViews;
  void *v3;
  void *v4;

  iconListViews = self->_iconListViews;
  -[SBFolderView additionalIconListViews](self, "additionalIconListViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray arrayByAddingObjectsFromArray:](iconListViews, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)scrollableWidthForVisibleColumnRange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[SBIconScrollView frame](self->_scrollView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SBFolderView isVertical](self, "isVertical");
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  if (v11)
    return CGRectGetHeight(*(CGRect *)&v12);
  else
    return CGRectGetWidth(*(CGRect *)&v12);
}

- (void)updateIconListIndexAndVisibility:(BOOL)a3
{
  int64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  double v12;
  CGRect v13;

  v5 = -[SBFolderView iconVisibilityHandling](self, "iconVisibilityHandling");
  v6 = -[SBIconScrollView isTracking](self->_scrollView, "isTracking");
  v7 = -[SBIconScrollView isDragging](self->_scrollView, "isDragging");
  v8 = -[SBIconScrollView isDecelerating](self->_scrollView, "isDecelerating");
  if (a3
    || !v8
    || (v6 & 1) != 0
    || (v7 & 1) != 0
    || v5 == 1
    || (-[SBIconScrollView _pageDecelerationTarget](self->_scrollView, "_pageDecelerationTarget"),
        -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:"),
        v9 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 1, 0), -[SBFolderView currentPageIndex](self, "currentPageIndex") != v9))
  {
    v10 = -[NSMutableArray count](self->_iconListViews, "count");
    v11 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
    -[SBFolderView bounds](self, "bounds");
    if (CGRectGetWidth(v13) > 0.0)
    {
      -[SBFolderView scrollOffsetForPageIndexCalculation](self, "scrollOffsetForPageIndexCalculation");
      v11 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", -[SBFolderView isScrolling](self, "isScrolling") ^ 1, 0, v12);
    }
    -[SBFolderView updateVisibleColumnRangeWithTotalLists:iconVisibilityHandling:](self, "updateVisibleColumnRangeWithTotalLists:iconVisibilityHandling:", v10, v5);
    -[SBFolderView _setCurrentPageIndex:deferringPageControlUpdate:](self, "_setCurrentPageIndex:deferringPageControlUpdate:", v11, v6 | v7);
  }
}

- (int64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)updateVisibleColumnRangeWithTotalLists:(unint64_t)a3 iconVisibilityHandling:(int64_t)a4
{
  __int128 *v7;
  BOOL v8;
  BOOL v9;
  __int128 v10;
  SBVisibleColumnRange *p_visibleColumnRange;
  __int128 v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSMutableArray *iconListViews;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE buf[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35 = xmmword_1D0195BC0;
  v36 = 0;
  if (-[SBFolderView updatesPredictedVisibleColumnWhileScrolling](self, "updatesPredictedVisibleColumnWhileScrolling"))
    v7 = &v35;
  else
    v7 = 0;
  v33 = 0u;
  v34 = 0u;
  -[SBFolderView visibleColumnRangeWithTotalLists:iconVisibilityHandling:predictedVisibleColumn:includingAdditionalColumnsKeptVisible:](self, "visibleColumnRangeWithTotalLists:iconVisibilityHandling:predictedVisibleColumn:includingAdditionalColumnsKeptVisible:", a3, a4, v7, 1);
  v8 = -[SBFolderView isScrolling](self, "isScrolling");
  v9 = -[SBFolderView isVertical](self, "isVertical");
  v31 = 0u;
  v32 = 0u;
  if (self->_prefetchedColumnRange.startIconListIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = v33;
    v32 = v34;
  }
  else
  {
    *(_OWORD *)buf = v33;
    *(_OWORD *)&buf[16] = v34;
    v10 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
    v29 = *(_OWORD *)&self->_prefetchedColumnRange.startIconListIndex;
    v30 = v10;
    SBVisibleColumnRangeUnion((uint64_t *)buf, &v29, (uint64_t)&v31);
  }
  p_visibleColumnRange = &self->_visibleColumnRange;
  *(_OWORD *)buf = v31;
  *(_OWORD *)&buf[16] = v32;
  v12 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  v29 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v30 = v12;
  if (!SBVisibleColumnRangeEqualToRange(buf, &v29))
  {
    SBLogIcon();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    if (v14)
    {
      SBLogIcon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
        *(_OWORD *)buf = *(_OWORD *)&p_visibleColumnRange->startIconListIndex;
        *(_OWORD *)&buf[16] = v19;
        SBStringFromVisibleColumnRange(buf);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)buf = v31;
        *(_OWORD *)&buf[16] = v32;
        SBStringFromVisibleColumnRange(buf);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        _os_log_debug_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEBUG, "Visible column range changed. Was %{public}@, now %{public}@", buf, 0x16u);

      }
    }
    _UIScrollViewNotifyForScrollView();
    iconListViews = self->_iconListViews;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke;
    v22[3] = &__block_descriptor_90_e31_v32__0__SBIconListView_8Q16_B24l;
    v27 = v9;
    v23 = v31;
    v24 = v32;
    v28 = v8;
    v25 = v35;
    v26 = v36;
    -[NSMutableArray enumerateObjectsUsingBlock:](iconListViews, "enumerateObjectsUsingBlock:", v22);
    v17 = v32;
    *(_OWORD *)&p_visibleColumnRange->startIconListIndex = v31;
    *(_OWORD *)&self->_visibleColumnRange.endIconListIndex = v17;
    v18 = v34;
    *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex = v33;
    *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex = v18;
  }
}

- (BOOL)updatesPredictedVisibleColumnWhileScrolling
{
  return 0;
}

- (double)scrollOffsetForPageIndexCalculation
{
  void *v3;
  double v4;
  long double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  CGFloat Width;
  CGRect v11;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  v8 = -[SBFolderView isRTL](self, "isRTL");
  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    v5 = v7;
  }
  else if (v8)
  {
    objc_msgSend(v3, "frame");
    Width = CGRectGetWidth(v11);
    v5 = nexttoward(v5 + Width, v5);
  }

  return v5;
}

- (BOOL)isScrolling
{
  void *v3;
  char v4;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrolling");

  return (v4 & 1) != 0 || -[NSMutableSet count](self->_scrollViewIsScrollingOverrides, "count") != 0;
}

- (UIScrollView)scrollView
{
  return &self->_scrollView->super.super;
}

- (unint64_t)typeForPage:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  v5 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  v6 = -[SBFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount");
  v7 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
  v8 = -[SBFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount");
  if (v6 && (uint64_t)(v6 + v5) > a3)
    return 0;
  if ((uint64_t)(v7 - v8) >= a3 || v8 == 0)
    return 1;
  else
    return 2;
}

- (id)additionalIconListViews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)_pageIndexForOffset:(double)a3
{
  return -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 0, 0, a3);
}

- (BOOL)hasEverBeenInAWindow
{
  return self->_hasEverBeenInAWindow;
}

- (double)_pageWidth
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double result;
  CGRect v12;

  -[SBIconScrollView _interpageSpacing](self->_scrollView, "_interpageSpacing");
  -[SBIconScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    return CGRectGetWidth(v12);
  }
  else
  {
    UISizeRoundToViewScale();
  }
  return result;
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidth:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  SBHFloatRange result;

  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:");
  v8 = v7;
  -[SBFolderView _scrollOffsetForContentAtPageIndex:](self, "_scrollOffsetForContentAtPageIndex:", a3);
  v10 = a4 - (v9 - v8);
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (int64_t)_pageIndexForOffset:(double)a3 behavior:(int64_t)a4 fractionOfDistanceThroughPage:(double *)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;

  v9 = (void *)objc_opt_class();
  v10 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  v11 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
  v12 = -[SBFolderView pageCount](self, "pageCount");
  -[SBFolderView _pageWidthOrHeight](self, "_pageWidthOrHeight");
  v14 = v13;
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  return objc_msgSend(v9, "_pageIndexForOffset:minimumPage:maximumPage:pageCount:pageWidth:pageSpacing:userInterfaceLayoutDirection:behavior:fractionOfDistanceThroughPage:", v10, v11, v12, -[SBFolderView userInterfaceLayoutDirection](self, "userInterfaceLayoutDirection"), a4, a5, a3, v14, v15);
}

- (BOOL)isRTL
{
  return -[SBFolderView userInterfaceLayoutDirection](self, "userInterfaceLayoutDirection") == 1;
}

- (int64_t)userInterfaceLayoutDirection
{
  unint64_t v3;

  if (-[SBFolderView isVertical](self, "isVertical"))
    return 0;
  v3 = -[SBFolderView userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling");
  if (v3 != 2)
  {
    if (!v3)
      return objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    return 0;
  }
  return 1;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageWidth:(double)a4
{
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v6 = a3 - -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  v8 = v7;
  if (-[SBFolderView isRTL](self, "isRTL"))
  {
    -[SBIconScrollView contentSize](self->_scrollView, "contentSize");
    v10 = v9 - (double)(v6 + 1) * a4 - (double)v6 * v8;
  }
  else
  {
    v10 = (double)v6 * a4;
    if (v6 >= 1 && v8 > 0.0)
      v10 = v10 + (double)(v6 - 1) * v8;
  }
  v11 = 0.0;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)_pageSpacing
{
  return 0.0;
}

- (int64_t)maximumPageIndex
{
  unint64_t v3;
  int64_t v4;
  unint64_t v5;

  v3 = -[SBFolderView pageCount](self, "pageCount");
  v4 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  v5 = v3 - 1;
  if (!v3)
    v5 = 0;
  return v4 + v5;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  CGPoint result;

  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    -[SBFolderView _pageHeight](self, "_pageHeight");
    -[SBFolderView _scrollOffsetForPageAtIndex:pageHeight:](self, "_scrollOffsetForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    -[SBFolderView _pageWidth](self, "_pageWidth");
    -[SBFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", a3);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3
{
  int64_t v5;

  v5 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex");
  if ((int64_t)(-[SBFolderView iconListViewCount](self, "iconListViewCount") + v5) <= a3 || a3 < v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3 - v5;
}

- (int64_t)firstIconPageIndex
{
  int64_t v3;

  v3 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  return -[SBFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount") + v3;
}

- (int64_t)minimumPageIndex
{
  return 100;
}

- (unint64_t)pageCount
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SBFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount");
  v4 = -[SBFolderView iconPageCount](self, "iconPageCount") + v3;
  return v4 + -[SBFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount");
}

- (unint64_t)iconPageCount
{
  _BOOL4 v3;
  SBFolder *folder;

  v3 = -[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages");
  folder = self->_folder;
  if (v3)
    return -[SBFolder listCount](folder, "listCount");
  else
    return -[SBFolder visibleListCount](folder, "visibleListCount");
}

- (BOOL)includesHiddenIconListPages
{
  return self->_includesHiddenIconListPages;
}

- (unint64_t)iconListViewCount
{
  return -[NSMutableArray count](self->_iconListViews, "count");
}

- (CGPoint)_scrollOffsetForContentAtPageIndex:(int64_t)a3
{
  double v5;
  double v6;
  CGPoint result;

  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    -[SBFolderView _pageHeight](self, "_pageHeight");
    -[SBFolderView _scrollOffsetForPageAtIndex:pageHeight:](self, "_scrollOffsetForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    -[SBFolderView _pageWidth](self, "_pageWidth");
    -[SBFolderView _scrollOffsetForPageAtIndex:pageWidth:](self, "_scrollOffsetForPageAtIndex:pageWidth:", a3);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)iconListViewForPageIndex:(int64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSArray)iconListViews
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_iconListViews, "copy");
}

- (SBVisibleColumnRange)visibleColumnRangeExcludingAdditionalWidthKeptVisible
{
  return -[SBFolderView visibleColumnRangeWithTotalLists:iconVisibilityHandling:predictedVisibleColumn:includingAdditionalColumnsKeptVisible:](self, "visibleColumnRangeWithTotalLists:iconVisibilityHandling:predictedVisibleColumn:includingAdditionalColumnsKeptVisible:", -[NSMutableArray count](self->_iconListViews, "count"), -[SBFolderView iconVisibilityHandling](self, "iconVisibilityHandling"), 0, 0);
}

- (int64_t)iconVisibilityHandling
{
  return 1;
}

- (void)_setCurrentPageIndex:(int64_t)a3 deferringPageControlUpdate:(BOOL)a4
{
  int64_t currentPageIndex;
  id v8;

  if (-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:") && self->_currentPageIndex != a3)
  {
    -[SBFolderView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "folderView:currentPageIndexWillChange:", self, a3);
    currentPageIndex = self->_currentPageIndex;
    self->_currentPageIndex = a3;
    if (!a4)
      -[SBFolderView _updatePageControlToIndex:](self, "_updatePageControlToIndex:", a3);
    -[SBFolderView setCurrentPageType:](self, "setCurrentPageType:", -[SBFolderView typeForPage:](self, "typeForPage:", a3));
    -[SBFolderView _currentPageIndexDidChange](self, "_currentPageIndexDidChange");
    -[SBFolderView _currentPageIndexDidChangeFromPageIndex:](self, "_currentPageIndexDidChangeFromPageIndex:", currentPageIndex);
    objc_msgSend(v8, "folderView:currentPageIndexDidChange:", self, self->_currentPageIndex);

  }
}

- (BOOL)_isValidPageIndex:(int64_t)a3
{
  return -[SBFolderView minimumPageIndex](self, "minimumPageIndex") <= a3
      && -[SBFolderView maximumPageIndex](self, "maximumPageIndex") >= a3;
}

- (void)_updatePageControlToIndex:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  SBIconScrollView *v9;

  v5 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  v6 = -[SBFolderView _adjustPageIndexForPageControl:](self, "_adjustPageIndexForPageControl:", a3 - v5);
  v7 = -[SBIconListPageControl currentPage](self->_pageControl, "currentPage");
  if (v6 != v7)
  {
    v8 = v7;
    v9 = self->_scrollView;
    if (!-[SBIconScrollView isScrollAnimating](v9, "isScrollAnimating")
      || (-[SBIconScrollView isTracking](v9, "isTracking") & 1) != 0
      || v8 != -[SBFolderView _adjustPageIndexForPageControl:](self, "_adjustPageIndexForPageControl:", -[SBFolderView scrollAnimationTargetPageIndex](self, "scrollAnimationTargetPageIndex") - v5))
    {
      -[SBIconListPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v6);
    }

  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolderView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  void *v18;
  _OWORD v20[2];

  -[SBFolderView succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView frame](self, "frame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("frame"));
  -[SBFolderView folder](self, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("folder"));

  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderView isEditing](self, "isEditing"), CFSTR("editing"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFolderView isScrolling](self, "isScrolling"), CFSTR("scrolling"));
  if (-[SBFolderView orientation](self, "orientation") == 1)
  {
    v10 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (-[SBFolderView orientation](self, "orientation") == 4)
  {
    v10 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (-[SBFolderView orientation](self, "orientation") == 3)
  {
    v10 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (-[SBFolderView orientation](self, "orientation") == 2)
  {
    v10 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("orientation"));
  v11 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView currentPageIndex](self, "currentPageIndex"), CFSTR("currentPageIndex"));
  v12 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView iconListViewCount](self, "iconListViewCount"), CFSTR("iconListViewCount"));
  v13 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isScalingViewBorrowed, CFSTR("isScalingViewBorrowed"));
  v14 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount"), CFSTR("leadingCustomPageCount"));
  v15 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount"), CFSTR("trailingCustomPageCount"));
  -[NSMutableSet allObjects](self->_scrollViewIsScrollingOverrides, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v16, CFSTR("scrollViewIsScrollingOverrides"), 0);

  v17 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  v20[0] = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v20[1] = v17;
  SBStringFromVisibleColumnRange(v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v18, CFSTR("visibleColumnRange"));

  return v4;
}

- (unint64_t)_leadingCustomPageCount
{
  return 0;
}

- (unint64_t)_trailingCustomPageCount
{
  return 0;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBIconListModel)currentIconListModel
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = -[SBFolderView iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    -[SBFolderView folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listAtIndex:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SBIconListModel *)v4;
}

- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3
{
  int64_t v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!-[SBFolderView isPageTypeIcon:](self, "isPageTypeIcon:", a3))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex");
  v6 = a3 < v5;
  v7 = a3 - v5;
  if (v6 || !-[SBFolderView hasIconPages](self, "hasIconPages"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!-[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages"))
  {
    -[SBFolderView folder](self, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "indexForVisibleIndex:", v7);

  }
  return v7;
}

- (BOOL)isPageTypeIcon:(int64_t)a3
{
  return -[SBFolderView typeForPage:](self, "typeForPage:", a3) == 1;
}

- (BOOL)hasIconPages
{
  _BOOL4 v3;
  SBFolder *folder;

  v3 = -[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages");
  folder = self->_folder;
  if (v3)
    return -[SBFolder listCount](folder, "listCount") != 0;
  else
    return -[SBFolder hasVisibleLists](folder, "hasVisibleLists");
}

- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3
{
  void *v5;
  int64_t v6;

  -[SBFolderView folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages"))
    a3 = objc_msgSend(v5, "visibleIndexForIndex:", a3);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex") + a3;

  return v6;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolderView iconListViewIndexForIconListModelIndex:](self, "iconListViewIndexForIconListModelIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3
{
  int64_t v4;

  v4 = -[SBFolderView pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  SBIconScrollView *v4;
  NSObject *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  NSMutableArray *scrollFrames;
  void *v10;
  unint64_t scrollFrameCount;
  void *v12;
  void *v13;
  CGPoint *p_scrollTrackingContentOffset;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  SBIconScrollView *v18;
  CGPoint v19;

  v4 = (SBIconScrollView *)a3;
  if (self->_scrollView == v4)
  {
    v18 = v4;
    SBLogIcon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    v7 = 0.0;
    if (v6)
    {
      ++self->_scrollFrameCount;
      v7 = CACurrentMediaTime();
    }
    if (self->_rotating)
    {
      if (!v6)
      {
LABEL_7:
        p_scrollTrackingContentOffset = &self->_scrollTrackingContentOffset;
        -[SBIconScrollView contentOffset](v18, "contentOffset");
        v4 = v18;
        p_scrollTrackingContentOffset->x = v15;
        p_scrollTrackingContentOffset->y = v16;
        goto LABEL_8;
      }
    }
    else
    {
      -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
      -[SBFolderView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "folderViewWillUpdatePageDuringScrolling:", self);
      -[SBFolderView updateIconListIndexAndVisibility](self, "updateIconListIndexAndVisibility");
      objc_msgSend(v17, "folderViewDidScroll:", self);

      if (!v6)
        goto LABEL_7;
    }
    v8 = CACurrentMediaTime();
    scrollFrames = self->_scrollFrames;
    v10 = (void *)MEMORY[0x1E0CB3940];
    scrollFrameCount = self->_scrollFrameCount;
    -[SBIconScrollView contentOffset](self->_scrollView, "contentOffset");
    NSStringFromCGPoint(v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("scroll view did scroll time: frame=%u, offset: %@, time: %f ms"), scrollFrameCount, v12, (v8 - v7) * 100.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](scrollFrames, "addObject:", v13);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_checkIfScrollStateChanged
{
  _BOOL8 v3;
  BOOL v4;

  v3 = -[SBFolderView isScrolling](self, "isScrolling");
  if (self->_wasScrolling != v3)
  {
    v4 = v3;
    -[SBFolderView _updateScrollingState:](self, "_updateScrollingState:", v3);
    self->_wasScrolling = v4;
  }
}

- (void)_updateScrollingState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSMutableArray *scrollFrames;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (self->_wasScrolling == a3)
    NSLog(CFSTR("Somehow this got called when scrolling didn't update.  This is so bad that I am *HOPPING* mad. Please file a radar on SpringBoard|HomeScreen"), a2);
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v20 = 138412546;
    *(_QWORD *)&v20[4] = objc_opt_class();
    *(_WORD *)&v20[12] = 1024;
    *(_DWORD *)&v20[14] = v3;
    v6 = *(id *)&v20[4];
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "%@ updating scrolling: %{BOOL}u", v20, 0x12u);

  }
  -[SBFolderView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBFolderView noteUserIsInteractingWithIcons](self, "noteUserIsInteractingWithIcons");
    -[SBFolderView scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentOffset");
    self->_scrollStartContentOffset.x = v9;
    self->_scrollStartContentOffset.y = v10;

    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", &__block_literal_global_56);
    objc_msgSend(v7, "folderViewWillBeginScrolling:", self);
  }
  else
  {
    SBLogIcon();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (v12)
    {
      self->_scrollFrameCount = 0;
      SBLogIcon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        scrollFrames = self->_scrollFrames;
        *(_DWORD *)v20 = 138543362;
        *(_QWORD *)&v20[4] = scrollFrames;
        _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "Scroll frames: %{public}@", v20, 0xCu);
      }

      -[NSMutableArray removeAllObjects](self->_scrollFrames, "removeAllObjects");
    }
    if (-[SBFolderView extraPageCountDuringScrolling](self, "extraPageCountDuringScrolling", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21))
    {
      -[SBFolderView setExtraPageCountDuringScrolling:](self, "setExtraPageCountDuringScrolling:", 0);
      -[SBFolderView _updateIconListFrames](self, "_updateIconListFrames");
    }
    -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", 1);
    if (-[SBFolderView snapsToPageBoundariesAfterScrolling](self, "snapsToPageBoundariesAfterScrolling"))
      -[SBFolderView resetContentOffsetToCurrentPageAnimated:](self, "resetContentOffsetToCurrentPageAnimated:", 0);
    -[SBFolderView _updatePageControlToIndex:](self, "_updatePageControlToIndex:", self->_currentPageIndex);
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", &__block_literal_global_58_1);
    self->_prefetchedColumnRange.startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
    if (-[SBFolderView addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping"))
    {
      -[SBFolderView currentIconListView](self, "currentIconListView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "focusedItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (v15)
        {
          objc_msgSend(v17, "parentFocusEnvironment");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 != v15)
            -[SBFolderView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        }
      }

    }
    objc_msgSend(v7, "folderViewDidEndScrolling:", self);
    v19 = (void *)-[NSMutableArray copy](self->_scrollCompletionBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_scrollCompletionBlocks, "removeAllObjects");
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", &__block_literal_global_60_0);

  }
}

- (void)resetContentOffsetToCurrentPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", v5);
    v8 = v7;
    v10 = v9;
    -[SBIconScrollView contentOffset](self->_scrollView, "contentOffset");
    if (!BSFloatApproximatelyEqualToFloat() || (BSFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      SBLogIcon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543874;
        v14 = (id)objc_opt_class();
        v15 = 2048;
        v16 = v6;
        v17 = 1024;
        v18 = v3;
        v12 = v14;
        _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll to page: %li animated: %{BOOL}u", (uint8_t *)&v13, 0x1Cu);

      }
      -[SBIconScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, v8, v10);
    }
  }
}

- (void)updateIconListIndexAndVisibility
{
  -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", 0);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (SBIconListPageControl)pageControl
{
  return self->_pageControl;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (NSString)iconLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "iconLocationForFolderView:", self), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBFolderView currentIconListView](self, "currentIconListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend((id)objc_opt_class(), "defaultIconLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v5;
}

- (SBFolderViewDelegate)delegate
{
  return (SBFolderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)headerHeight
{
  double headerHeight;
  void *v4;
  double v5;
  double v6;
  double v7;

  headerHeight = self->_headerHeight;
  if (headerHeight == *MEMORY[0x1E0DC55F0])
  {
    -[SBFolderView headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[SBFolderView bounds](self, "bounds");
      objc_msgSend(v4, "sizeThatFits:", v5, v6);
    }
    else
    {
      v7 = 0.0;
    }
    self->_headerHeight = v7;

  }
  return headerHeight;
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v16;
  void *v17;
  NSMutableArray *rotationCompletionBlocks;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  SBFolderView *v29;
  void (**v30)(_QWORD);
  int64_t v31;
  BOOL v32;
  uint8_t buf[4];
  int64_t v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v5 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a5;
  if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", a3)
    || !-[SBFolderView canChangeCurrentPageIndexToIndex:](self, "canChangeCurrentPageIndexToIndex:", a3))
  {
    if (!v8)
    {
LABEL_15:
      v23 = 0;
      goto LABEL_16;
    }
LABEL_14:
    v8[2](v8);
    goto LABEL_15;
  }
  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", a3);
  v10 = v9;
  v12 = v11;
  -[SBIconScrollView contentOffset](self->_scrollView, "contentOffset");
  if (v10 == v14 && v12 == v13)
  {
    -[SBFolderView _setCurrentPageIndex:](self, "_setCurrentPageIndex:", a3);
    if (!v8)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (-[SBFolderView isRotating](self, "isRotating"))
  {
    SBLogIcon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v34 = a3;
      v35 = 1024;
      v36 = v5;
      _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "Delaying request to change to page %li because we are rotating (animated: %{BOOL}u)", buf, 0x12u);
    }

    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __56__SBFolderView_setCurrentPageIndex_animated_completion___block_invoke;
    v28 = &unk_1E8D8E550;
    v29 = self;
    v31 = a3;
    v32 = v5;
    v30 = v8;
    v17 = _Block_copy(&v25);
    rotationCompletionBlocks = self->_rotationCompletionBlocks;
    if (!rotationCompletionBlocks)
    {
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = self->_rotationCompletionBlocks;
      self->_rotationCompletionBlocks = v19;

      rotationCompletionBlocks = self->_rotationCompletionBlocks;
    }
    v21 = (void *)objc_msgSend(v17, "copy", v25, v26, v27, v28, v29);
    v22 = _Block_copy(v21);
    -[NSMutableArray addObject:](rotationCompletionBlocks, "addObject:", v22);

  }
  else
  {
    -[SBFolderView _willScrollToPageIndex:animated:](self, "_willScrollToPageIndex:animated:", a3, v5);
    if (v8)
      -[SBFolderView _addScrollingCompletionBlock:](self, "_addScrollingCompletionBlock:", v8);
    -[SBFolderView _setScrollViewContentOffset:animated:](self, "_setScrollViewContentOffset:animated:", v5, v10, v12);
    if (!v5)
      -[SBFolderView layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", -1, 0);
  }
  v23 = 1;
LABEL_16:

  return v23;
}

- (BOOL)canChangeCurrentPageIndexToIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[SBFolderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "folderView:canChangeCurrentPageIndexToIndex:", self, a3);
  else
    v7 = 1;

  return v7;
}

- (void)_setCurrentPageIndex:(int64_t)a3
{
  -[SBFolderView _setCurrentPageIndex:deferringPageControlUpdate:](self, "_setCurrentPageIndex:deferringPageControlUpdate:", a3, 0);
}

- (BOOL)snapsToPageBoundariesAfterScrolling
{
  return self->_snapsToPageBoundariesAfterScrolling;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)_willScrollToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  id v6;

  if (a4)
  {
    -[SBFolderView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "folderView:willAnimateScrollToPageIndex:", self, a3);

  }
}

- (void)_addScrollingCompletionBlock:(id)a3
{
  id v4;
  NSMutableArray *scrollCompletionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  scrollCompletionBlocks = self->_scrollCompletionBlocks;
  v10 = v4;
  if (!scrollCompletionBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_scrollCompletionBlocks;
    self->_scrollCompletionBlocks = v6;

    v4 = v10;
    scrollCompletionBlocks = self->_scrollCompletionBlocks;
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  v9 = _Block_copy(v8);
  -[NSMutableArray addObject:](scrollCompletionBlocks, "addObject:", v9);

}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  double width;
  CGFloat v6;
  double height;
  CGSize result;

  if (self->_scrollView == a3)
  {
    -[SBFolderView _scrollViewContentSize](self, "_scrollViewContentSize", a4, a5.width, a5.height);
    a5.height = v6;
  }
  else
  {
    width = a5.width;
  }
  height = a5.height;
  result.height = height;
  result.width = width;
  return result;
}

uint64_t __44__SBFolderView__updateEditingStateAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePageControlNumberOfPages");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layoutIfNeeded");
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t i;
  void *v13;
  SBFolderTitleTextField **p_titleTextField;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[SBFolderView isEditing](self, "isEditing");
  v6 = -[SBFolderView suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SBFolderView iconListViews](self, "iconListViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = v5 && !v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "setEditing:", v11);
        objc_msgSend(v13, "updateEditingStateAnimated:", v3);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  -[SBFolderView updateIconListIndexAndVisibility](self, "updateIconListIndexAndVisibility");
  if (v5
    && (p_titleTextField = &self->_titleTextField,
        -[SBFolderTitleTextField allowsEditing](self->_titleTextField, "allowsEditing")))
  {
    v15 = 1;
  }
  else
  {
    p_titleTextField = &self->_titleTextField;
    -[SBFolderTitleTextField endEditing:](self->_titleTextField, "endEditing:", 1);
    v15 = 0;
  }
  -[SBFolderTitleTextField setShowsEditUI:animated:](*p_titleTextField, "setShowsEditUI:animated:", v15, v3);
  v16 = -[SBFolderView _isEligibleForFocusInteraction](self, "_isEligibleForFocusInteraction");
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "focusedItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != (v18 != 0))
    -[SBFolderView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  if (v3)
  {
    v19 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __44__SBFolderView__updateEditingStateAnimated___block_invoke;
    v21[3] = &unk_1E8D84C50;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v21);
    v20[0] = v19;
    v20[1] = 3221225472;
    v20[2] = __44__SBFolderView__updateEditingStateAnimated___block_invoke_2;
    v20[3] = &unk_1E8D84C50;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v20, 0.3);
  }

}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (void)_updatePageControlNumberOfPages
{
  int64_t v3;

  v3 = -[SBFolderView _pageCountForPageControl](self, "_pageCountForPageControl");
  if (v3 != -[SBIconListPageControl numberOfPages](self->_pageControl, "numberOfPages"))
    -[SBIconListPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v3);
  -[SBFolderView _updatePageControlCurrentPage](self, "_updatePageControlCurrentPage");
}

- (void)layoutSubviews
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  char v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_FOLDER_VIEW", "iconListView=%{public}@", buf, 0xCu);

  }
  v8 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  v9 = -[SBFolderView isScrolling](self, "isScrolling");
  -[SBFolderView _updateScalingViewFrame](self, "_updateScalingViewFrame");
  if (!-[SBFolderView iconListViewCount](self, "iconListViewCount")
    && -[SBFolder hasVisibleLists](self->_folder, "hasVisibleLists")
    && -[SBFolderView automaticallyCreatesIconListViews](self, "automaticallyCreatesIconListViews"))
  {
    -[SBFolderView resetIconListViews](self, "resetIconListViews");
  }
  -[SBFolderView _layoutSubviews](self, "_layoutSubviews");
  v10 = self->_isScalingViewBorrowed || v9;
  if ((v10 & 1) == 0 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[SBFolderView currentPageIndex](self, "currentPageIndex") == v8)
      -[SBFolderView resetContentOffsetToCurrentPageAnimated:](self, "resetContentOffsetToCurrentPageAnimated:", 0);
    else
      -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v8, 0);
  }
  -[SBFolderView _updateIconListFrames](self, "_updateIconListFrames");
  -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_iconListViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "layoutIconsIfNeeded");
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v13);
  }

  v16 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  *(_OWORD *)buf = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v23 = v16;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)buf))
    -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
  -[SBFolderView _updatePageControlNumberOfPages](self, "_updatePageControlNumberOfPages");
  -[SBIconListPageControl layoutIfNeeded](self->_pageControl, "layoutIfNeeded");
  SBLogWidgets();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_FOLDER_VIEW", " isAnimation=YES ", buf, 2u);
  }

}

- (void)_updatePageControlCurrentPage
{
  -[SBFolderView _updatePageControlToIndex:](self, "_updatePageControlToIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
}

- (void)updateVisibleColumnRange
{
  if (!-[SBFolderView isRotating](self, "isRotating"))
    -[SBFolderView updateVisibleColumnRangeWithTotalLists:iconVisibilityHandling:](self, "updateVisibleColumnRangeWithTotalLists:iconVisibilityHandling:", -[NSMutableArray count](self->_iconListViews, "count"), -[SBFolderView iconVisibilityHandling](self, "iconVisibilityHandling"));
}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
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
  _BOOL4 v15;
  _BOOL4 v16;
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
  CGRect result;

  -[SBFolderView _iconListViewSize](self, "_iconListViewSize");
  v6 = v5;
  v8 = v7;
  -[SBFolderView _pageWidth](self, "_pageWidth");
  v10 = v9;
  -[SBFolderView _pageHeight](self, "_pageHeight");
  v12 = v11;
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  v14 = v13;
  v15 = -[SBFolderView isRTL](self, "isRTL");
  v16 = -[SBFolderView isVertical](self, "isVertical");
  -[SBFolderView _scrollOffsetForFirstListView](self, "_scrollOffsetForFirstListView");
  v19 = v10 + v14;
  if (v15)
    v19 = -(v10 + v14);
  v20 = v19 * (double)a3;
  v21 = v12 * 0.5 + v18;
  v22 = v10 * 0.5 + v17;
  if (v16)
    v23 = 0.0;
  else
    v23 = v19 * (double)a3;
  if (!v16)
    v20 = 0.0;
  v24 = v22 - v6 * 0.5 + v23;
  v25 = v21 - v8 * 0.5 + v20;
  v26 = v6;
  v27 = v8;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_updateIconListFrames
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *iconListViews;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[9];
  BOOL v24;
  BOOL v25;
  _QWORD v26[4];
  __int128 v27;
  __int128 v28;

  -[SBFolderView _scrollViewContentSize](self, "_scrollViewContentSize");
  v4 = v3;
  v6 = v5;
  -[SBIconScrollView contentSize](self->_scrollView, "contentSize");
  if (v4 != v8 || v6 != v7)
    -[SBIconScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v6);
  -[SBFolderView _pageWidth](self, "_pageWidth");
  v11 = v10;
  -[SBFolderView _pageHeight](self, "_pageHeight");
  v13 = v12;
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  v15 = v14;
  v16 = -[SBFolderView isRTL](self, "isRTL");
  v17 = -[SBFolderView isVertical](self, "isVertical");
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x4010000000;
  v26[3] = &unk_1D01C8D52;
  v27 = 0u;
  v28 = 0u;
  -[SBFolderView _frameForIconListAtIndex:](self, "_frameForIconListAtIndex:", 0);
  *(_QWORD *)&v27 = v18;
  *((_QWORD *)&v27 + 1) = v19;
  iconListViews = self->_iconListViews;
  *(_QWORD *)&v28 = v21;
  *((_QWORD *)&v28 + 1) = v22;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __37__SBFolderView__updateIconListFrames__block_invoke;
  v23[3] = &unk_1E8D8E610;
  v23[4] = self;
  v23[5] = v26;
  v24 = v17;
  v25 = v16;
  v23[6] = v11;
  v23[7] = v15;
  v23[8] = v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](iconListViews, "enumerateObjectsUsingBlock:", v23);
  _Block_object_dispose(v26, 8);
}

- (CGSize)_scrollViewContentSize
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  BOOL v15;
  double v16;
  unint64_t v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double Height;
  double Width;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;
  CGRect v29;
  CGRect v30;

  v3 = -[SBFolderView pageCount](self, "pageCount");
  v4 = -[SBFolderView extraPageCountDuringScrolling](self, "extraPageCountDuringScrolling") + v3;
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  v6 = v5;
  -[SBIconScrollView bounds](self->_scrollView, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[SBFolderView isVertical](self, "isVertical");
  v16 = (double)v4;
  v17 = v4 - 1;
  v18 = v6 > 0.0 && v4 != 0;
  v19 = (double)v17;
  if (v15)
  {
    -[SBFolderView _pageHeight](self, "_pageHeight");
    v21 = v20 * v16;
    if (v18)
      Height = v21 + v19 * v6;
    else
      Height = v21;
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    Width = CGRectGetWidth(v29);
  }
  else
  {
    -[SBFolderView _pageWidth](self, "_pageWidth");
    v25 = v24 * v16;
    if (v18)
      Width = v25 + v19 * v6;
    else
      Width = v25;
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    Height = CGRectGetHeight(v30);
  }
  v26 = Width;
  v27 = Height;
  result.height = v27;
  result.width = v26;
  return result;
}

- (CGPoint)_scrollOffsetForFirstListView
{
  double v2;
  double v3;
  CGPoint result;

  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex"));
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)_iconListViewSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[SBIconScrollView bounds](self->_scrollView, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBFolderView iconListViews](self, "iconListViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (v4)
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "setIconsNeedLayout");
        objc_msgSend(v12, "layoutIconsIfNeededWithAnimationType:options:", a3, 0);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (SBFolderTitleTextField)_titleTextField
{
  return self->_titleTextField;
}

- (UIView)scalingView
{
  return self->_scalingView;
}

- (void)_updateScalingViewFrame
{
  UIView *scalingView;

  if (!self->_isScalingViewBorrowed)
  {
    scalingView = self->_scalingView;
    -[SBFolderView _frameForScalingView](self, "_frameForScalingView");
    -[UIView sbf_setBoundsAndPositionFromFrame:](scalingView, "sbf_setBoundsAndPositionFromFrame:");
  }
}

- (BOOL)isScalingViewBorrowed
{
  return self->_isScalingViewBorrowed;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  char v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBFolderView updateAccessibilityTintColors](self, "updateAccessibilityTintColors");
    -[SBFolderView firstIconListView](self, "firstIconListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();

    v8 = -[SBFolderView listViewClass](self, "listViewClass");
    v5 = obj;
    if (v7)
    {
      v9 = objc_msgSend(v7, "isEqual:", v8);
      v5 = obj;
      if ((v9 & 1) == 0)
      {
        -[SBFolderView resetIconListViews](self, "resetIconListViews");
        v5 = obj;
      }
    }
  }

}

- (id)firstIconListView
{
  return (id)-[NSMutableArray firstObject](self->_iconListViews, "firstObject");
}

- (id)_createIconListViewForList:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SBFolderView listViewClass](self, "listViewClass");
  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView iconLocationForList:](self, "iconLocationForList:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView iconViewProvider](self, "iconViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend([v5 alloc], "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v4, v6, v7, self->_orientation, v8);
  objc_msgSend(v9, "setUserInterfaceLayoutDirectionHandling:", -[SBFolderView userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling"));
  objc_msgSend(v9, "setEditing:", -[SBFolderView isEditing](self, "isEditing"));
  objc_msgSend(v9, "setLayoutDelegate:", self);
  objc_msgSend(v9, "setDragDelegate:", self);
  -[SBFolderView legibilitySettingsForIconListViews](self, "legibilitySettingsForIconListViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegibilitySettings:", v10);

  -[SBFolderView folderIconImageCache](self, "folderIconImageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFolderIconImageCache:", v11);

  objc_msgSend(v9, "setAddsFocusGuidesForWrapping:", self->_addsFocusGuidesForWrapping);
  -[SBFolderView iconImageCache](self, "iconImageCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIconImageCache:", v12);

  -[SBFolderView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOverrideIconImageAppearance:", v13);

  objc_msgSend(v9, "setIconSpacingAxisMatchingBehavior:", -[SBFolderView iconSpacingAxisMatchingBehavior](self, "iconSpacingAxisMatchingBehavior"));
  if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupRoot"), v7))
  {
    objc_msgSend(v9, "setFocusGroupIdentifier:", CFSTR("FolderViewFocusGroup"));
  }
  else
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFocusGroupIdentifier:", v14);

  }
  objc_msgSend(v9, "hideAllIcons");

  return v9;
}

- (Class)listViewClass
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;

  -[SBFolderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (void *)objc_msgSend(v3, "iconListViewClassForFolderView:", self);
  else
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "defaultIconListViewClass");
  v6 = v5;

  return v6;
}

+ (Class)defaultIconListViewClass
{
  return (Class)objc_opt_self();
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (id)_interactionTintColor
{
  return 0;
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  if (self->_scrollView == a3)
  {
    -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
    self->_scrollTrackingContentOffset = (CGPoint)*MEMORY[0x1E0C9D538];
  }
}

- (void)_setScrollViewContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v14 = *MEMORY[0x1E0C80C00];
  -[SBFolderView _ignoreScrollingDidEndNotifications](self, "_ignoreScrollingDidEndNotifications");
  SBLogIcon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 1024;
    v13 = v4;
    v9 = v11;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll - animated: %{BOOL}u", (uint8_t *)&v10, 0x12u);

  }
  -[SBIconScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v4, x, y);
  -[SBFolderView _unignoreScrollingDidEndNotifications](self, "_unignoreScrollingDidEndNotifications");
}

- (BOOL)iconScrollView:(id)a3 shouldSetContentOffset:(CGPoint *)a4 animated:(BOOL)a5
{
  return 1;
}

- (void)_unignoreScrollingDidEndNotifications
{
  --self->_ignoreScrollingDidEndNotificationsCount;
}

- (void)_ignoreScrollingDidEndNotifications
{
  ++self->_ignoreScrollingDidEndNotificationsCount;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderView;
  -[SBFolderView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SBFolderView _updateScrollingIfNeeded](self, "_updateScrollingIfNeeded");
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBFolderView;
  -[SBFolderView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[SBFolderView _updateScrollingIfNeeded](self, "_updateScrollingIfNeeded");
  -[SBFolderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");
  v5 = -[SBFolderView orientation](self, "orientation");
  SBLogIcon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    _os_log_debug_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEBUG, "adding folder view to window %@ with orientation %li, current: %li", buf, 0x20u);
  }

  if (v3 && v4 && v4 != v5)
  {
    -[SBFolderView setOrientation:](self, "setOrientation:", v4);
    -[SBFolderView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folderViewDidChangeOrientation:", self);

  }
  else if (!v3)
  {
    if (!-[SBFolderView isRegisteredForIdleUpdates](self, "isRegisteredForIdleUpdates"))
      goto LABEL_11;
    _UIUpdateCycleUnregisterIdleObserver();
    v8 = 0;
    goto LABEL_10;
  }
  if (!-[SBFolderView isRegisteredForIdleUpdates](self, "isRegisteredForIdleUpdates"))
  {
    _UIUpdateCycleRegisterIdleObserver();
    v8 = 1;
LABEL_10:
    -[SBFolderView setRegisteredForIdleUpdates:](self, "setRegisteredForIdleUpdates:", v8);
  }
LABEL_11:
  -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");

}

- (SBIconListView)currentIconListView
{
  unint64_t v3;
  void *v4;

  v3 = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBIconListView *)v4;
}

double __37__SBFolderView__updateIconListFrames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  double *v10;
  double result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_updateIconListContainment:atIndex:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "_iconListFrameForPageRect:atIndex:", a3, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  objc_msgSend(v6, "setBounds:", 0.0, 0.0);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");

  v7 = *(double *)(a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(a1 + 72))
  {
    v9 = *(double *)(a1 + 64) + v7;
    if (*(_BYTE *)(a1 + 73))
      v9 = -v9;
    v10 = (double *)(v8 + 40);
  }
  else
  {
    v9 = *(double *)(a1 + 48) + v7;
    if (*(_BYTE *)(a1 + 73))
      v9 = -v9;
    v10 = (double *)(v8 + 32);
  }
  result = v9 + *v10;
  *v10 = result;
  return result;
}

- (void)_updateIconListContainment:(id)a3 atIndex:(unint64_t)a4
{
  SBIconScrollView *v5;
  SBIconScrollView *scrollView;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v5 = (SBIconScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_scrollView;

  if (v5 != scrollView)
    -[SBIconScrollView addSubview:](self->_scrollView, "addSubview:", v7);

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)prepareToOpen
{
  if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex")))-[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderView defaultPageIndex](self, "defaultPageIndex"), 0);
  -[SBFolderView _precacheIconImages](self, "_precacheIconImages");
  -[SBFolderView setHidden:](self, "setHidden:", 0);
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  -[SBFolderView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_precacheIconImages
{
  NSObject *v3;
  SBFolder *folder;
  void *v5;
  void *v6;
  SBFolder *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  SBFolder *v25;
  id v26;
  _QWORD v27[4];
  SBFolder *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  SBFolder *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    folder = self->_folder;
    *(_DWORD *)buf = 138412290;
    v40 = folder;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "beginning precache of icons for folder %@", buf, 0xCu);
  }

  -[SBFolderView currentIconListModel](self, "currentIconListModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView folder](self, "folder");
  v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SBFolder lists](v7, "lists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        if (v14 != v5)
        {
          objc_msgSend(v14, "icons");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  -[SBFolderView iconImageCache](self, "iconImageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = (id)objc_msgSend(v16, "imageForIcon:imageAppearance:options:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22++), v17, 0);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

  SBLogIcon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v7;
    _os_log_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_INFO, "finished synchronous precache of first page of icons for folder %@", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __35__SBFolderView__precacheIconImages__block_invoke;
  v27[3] = &unk_1E8D8E598;
  v28 = v7;
  v25 = v7;
  v26 = (id)objc_msgSend(v16, "cacheImagesForIcons:imageAppearance:reason:options:completionHandler:", v8, v17, CFSTR("SBFolderView _precacheIconImages"), 0, v27);

}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setNeedsLayout
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_iconListViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setIconsNeedLayout");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBFolderView;
  -[SBFolderView setNeedsLayout](&v8, sel_setNeedsLayout);
}

- (void)noteUserIsInteractingWithIcons
{
  -[SBFolderTitleTextField endEditing:](self->_titleTextField, "endEditing:", 1);
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  -[SBFolderView setSuppressesEditingStateForListViews:animated:](self, "setSuppressesEditingStateForListViews:animated:", a3, 1);
}

- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3
{
  return -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex") + a3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isEditing != a3)
  {
    self->_isEditing = a3;
    -[SBFolderView _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", a4);
  }
}

- (SBFolderView)initWithConfiguration:(id)a3
{
  id v4;
  SBFolderView *v5;
  void *v6;
  uint64_t v7;
  SBIconListLayoutProvider *listLayoutProvider;
  NSMutableArray *v9;
  NSMutableArray *iconListViews;
  NSMutableSet *v11;
  NSMutableSet *scrollingDisabledReasons;
  NSMutableSet *v13;
  NSMutableSet *pageControlDisabledReasons;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *scrollFrames;
  uint64_t v18;
  _UILegibilitySettings *legibilitySettings;
  uint64_t v20;
  SBFolderIconImageCache *folderIconImageCache;
  uint64_t v22;
  SBHIconImageCache *iconImageCache;
  uint64_t v24;
  UIView *headerView;
  double v26;
  void *v27;
  uint64_t v28;
  SBHIconImageAppearance *overrideIconImageAppearance;
  UIView *v30;
  UIView *scalingView;
  SBFolderTitleTextField *v32;
  uint64_t v33;
  SBFolderTitleTextField *titleTextField;
  SBFolderTitleTextField *v35;
  SBFolderTitleTextField *v36;
  void *v37;
  SBIconScrollView *v38;
  SBIconScrollView *scrollView;
  uint64_t v40;
  SBIconListPageControl *pageControl;
  SBHScrollableZoomingIconViewInteraction *v42;
  SBHScrollableZoomingIconViewInteraction *scrollingInteraction;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "initialViewFrame");
  v49.receiver = self;
  v49.super_class = (Class)SBFolderView;
  v5 = -[SBFolderView initWithFrame:](&v49, sel_initWithFrame_);
  if (v5)
  {
    objc_msgSend(v4, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_folder, v6);
    objc_msgSend(v4, "listLayoutProvider");
    v7 = objc_claimAutoreleasedReturnValue();
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v7;

    v5->_orientation = objc_msgSend(v4, "orientation");
    v5->_allowedOrientations = objc_msgSend(v4, "allowedOrientations");
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    iconListViews = v5->_iconListViews;
    v5->_iconListViews = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    scrollingDisabledReasons = v5->_scrollingDisabledReasons;
    v5->_scrollingDisabledReasons = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pageControlDisabledReasons = v5->_pageControlDisabledReasons;
    v5->_pageControlDisabledReasons = v13;

    v5->_currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_currentPageType = 1;
    objc_msgSend(v4, "iconViewProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_iconViewProvider, v15);

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scrollFrames = v5->_scrollFrames;
    v5->_scrollFrames = v16;

    objc_msgSend(v4, "legibilitySettings");
    v18 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v18;

    objc_msgSend(v4, "folderIconImageCache");
    v20 = objc_claimAutoreleasedReturnValue();
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v20;

    objc_msgSend(v4, "iconImageCache");
    v22 = objc_claimAutoreleasedReturnValue();
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v22;

    objc_msgSend(v4, "headerView");
    v24 = objc_claimAutoreleasedReturnValue();
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v24;

    objc_msgSend(v4, "headerHeight");
    v5->_headerHeight = v26;
    v5->_userInterfaceLayoutDirectionHandling = objc_msgSend(v4, "userInterfaceLayoutDirectionHandling");
    v5->_vertical = objc_msgSend(v4, "isVertical");
    v5->_snapsToPageBoundariesAfterScrolling = objc_msgSend(v4, "snapsToPageBoundariesAfterScrolling");
    v5->_addsFocusGuidesForWrapping = objc_msgSend(v4, "addsFocusGuidesForWrapping");
    objc_msgSend(v4, "overrideIconImageAppearance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    overrideIconImageAppearance = v5->_overrideIconImageAppearance;
    v5->_overrideIconImageAppearance = (SBHIconImageAppearance *)v28;

    v5->_iconSpacingAxisMatchingBehavior = objc_msgSend(v4, "iconSpacingAxisMatchingBehavior");
    v5->_prefetchedColumnRange.startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_automaticallyCreatesIconListViews = 1;
    v5->_contentVisibility = 0;
    objc_msgSend(v6, "addFolderObserver:", v5);
    v30 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    scalingView = v5->_scalingView;
    v5->_scalingView = v30;

    -[SBFolderView addSubview:](v5, "addSubview:", v5->_scalingView);
    if (-[SBFolderView _showsTitle](v5, "_showsTitle"))
    {
      v32 = [SBFolderTitleTextField alloc];
      v33 = -[SBFolderTitleTextField initWithFrame:](v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      titleTextField = v5->_titleTextField;
      v5->_titleTextField = (SBFolderTitleTextField *)v33;

      v35 = v5->_titleTextField;
      -[SBFolderView _titleFontSize](v5, "_titleFontSize");
      -[SBFolderTitleTextField setFontSize:](v35, "setFontSize:");
      v36 = v5->_titleTextField;
      objc_msgSend(v6, "displayName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderTitleTextField setText:](v36, "setText:", v37);

      -[SBFolderTitleTextField setDelegate:](v5->_titleTextField, "setDelegate:", v5);
      -[SBFolderTitleTextField setAllowsEditing:](v5->_titleTextField, "setAllowsEditing:", objc_msgSend(v6, "canEditDisplayName"));
      -[SBFolderTitleTextField setLegibilitySettings:](v5->_titleTextField, "setLegibilitySettings:", v5->_legibilitySettings);
    }
    v38 = (SBIconScrollView *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_scrollViewClass"));
    scrollView = v5->_scrollView;
    v5->_scrollView = v38;

    -[BSUIScrollView setDelegate:](v5->_scrollView, "setDelegate:", v5);
    -[SBIconScrollView setPagingEnabled:](v5->_scrollView, "setPagingEnabled:", 1);
    -[SBIconScrollView setBounces:](v5->_scrollView, "setBounces:", 1);
    -[SBIconScrollView setScrollsToTop:](v5->_scrollView, "setScrollsToTop:", 0);
    -[SBIconScrollView setShowsHorizontalScrollIndicator:](v5->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[SBIconScrollView setShowsVerticalScrollIndicator:](v5->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[SBIconScrollView setDelaysContentTouches:](v5->_scrollView, "setDelaysContentTouches:", 0);
    -[SBIconScrollView setClipsToBounds:](v5->_scrollView, "setClipsToBounds:", 0);
    -[SBIconScrollView setAlwaysBounceHorizontal:](v5->_scrollView, "setAlwaysBounceHorizontal:", !v5->_vertical);
    -[SBIconScrollView setAlwaysBounceVertical:](v5->_scrollView, "setAlwaysBounceVertical:", v5->_vertical);
    -[SBIconScrollView _setSupportsPointerDragScrolling:](v5->_scrollView, "_setSupportsPointerDragScrolling:", 1);
    v40 = -[SBFolderView _newPageControl](v5, "_newPageControl");
    pageControl = v5->_pageControl;
    v5->_pageControl = (SBIconListPageControl *)v40;

    -[SBFolderView _updatePageControlToIndex:](v5, "_updatePageControlToIndex:", -[SBFolderView minimumPageIndex](v5, "minimumPageIndex"));
    -[SBIconListPageControl setHidesForSinglePage:](v5->_pageControl, "setHidesForSinglePage:", 1);
    -[SBIconListPageControl _setPreferredNumberOfVisibleIndicators:](v5->_pageControl, "_setPreferredNumberOfVisibleIndicators:", objc_msgSend(v6, "maxListCount"));
    -[SBIconListPageControl setLegibilitySettings:](v5->_pageControl, "setLegibilitySettings:", v5->_legibilitySettings);
    -[SBIconListPageControl setDelegate:](v5->_pageControl, "setDelegate:", v5);
    if (-[SBFolderView _useParallaxOnPageControl](v5, "_useParallaxOnPageControl"))
      -[SBIconListPageControl _setVisualAltitude:](v5->_pageControl, "_setVisualAltitude:", *MEMORY[0x1E0DC5AD8]);
    -[SBIconListPageControl setAccessibilityIdentifier:](v5->_pageControl, "setAccessibilityIdentifier:", CFSTR("Page control"));
    if (-[SBFolderView _shouldUseScrollableIconViewInteraction](v5, "_shouldUseScrollableIconViewInteraction"))
    {
      v42 = -[SBHScrollableIconViewInteraction initWithContainer:]([SBHScrollableZoomingIconViewInteraction alloc], "initWithContainer:", v5);
      scrollingInteraction = v5->_scrollingInteraction;
      v5->_scrollingInteraction = v42;

      -[SBFolderView _configureScrollingInteraction:](v5, "_configureScrollingInteraction:", v5->_scrollingInteraction);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObserver:selector:name:object:", v5, sel__backgroundContrastDidChange_, *MEMORY[0x1E0DC45B8], 0);
    objc_opt_self();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id)-[SBFolderView registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v46, sel_setNeedsLayout);

  }
  return v5;
}

- (BOOL)_useParallaxOnPageControl
{
  return 1;
}

- (id)_newPageControl
{
  SBIconListPageControl *v2;

  v2 = [SBIconListPageControl alloc];
  return -[SBIconListPageControl initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (unsigned)userInterfaceLayoutDirectionAwareScrollingDirection
{
  unsigned int v3;
  _BOOL4 v4;
  unsigned int v5;
  unsigned int v6;

  v3 = -[SBFolderView scrollingDirection](self, "scrollingDirection");
  v4 = -[SBFolderView isRTL](self, "isRTL");
  if (v3 == 2)
    v5 = 0;
  else
    v5 = v3;
  if (v3)
    v6 = v5;
  else
    v6 = 2;
  if (v4)
    return v6;
  else
    return v3;
}

- (unsigned)scrollingDirection
{
  return -[SBFolderView scrollingDirectionTracking:](self, "scrollingDirectionTracking:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SBFolderView *v7;
  SBFolderView *v8;
  BOOL v9;
  SBFolderView *v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)SBFolderView;
  -[SBFolderView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  v7 = (SBFolderView *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = self->_isScalingViewBorrowed && v7 == self;
  if (v9
    && (-[SBFolderView _frameForScalingView](self, "_frameForScalingView"),
        v13.x = x,
        v13.y = y,
        CGRectContainsPoint(v14, v13)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (void)getLeadingVisiblePageIndex:(int64_t *)a3 trailingVisiblePageIndex:(int64_t *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  int64_t v14;
  _BOOL4 v15;

  -[SBFolderView minimumVisibleScrollOffset](self, "minimumVisibleScrollOffset");
  v8 = v7;
  -[SBFolderView maximumVisibleScrollOffset](self, "maximumVisibleScrollOffset");
  v10 = v9;
  v11 = -[SBFolderView isRTL](self, "isRTL");
  if (v11)
    v12 = v10;
  else
    v12 = v8;
  if (v11)
    v13 = v8;
  else
    v13 = v10;
  if (v8 == v10)
  {
    v14 = -[SBFolderView defaultPageIndex](self, "defaultPageIndex", v12);
    if (a3)
      *a3 = v14;
    if (!a4)
      return;
LABEL_16:
    *a4 = v14;
    return;
  }
  v15 = v11;
  if (a3)
    *a3 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", !v11, 0, v12);
  if (a4)
  {
    v14 = -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", v15, 0, v13);
    goto LABEL_16;
  }
}

- (double)maximumVisibleScrollOffset
{
  double v3;
  long double v4;
  double v5;

  -[SBFolderView minimumVisibleScrollOffset](self, "minimumVisibleScrollOffset");
  v4 = v3;
  -[SBFolderView scrollableWidthForVisibleColumnRange](self, "scrollableWidthForVisibleColumnRange");
  return nexttoward(v4 + v5, v4);
}

- (void)setContentVisibility:(unint64_t)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SBFolderView_setContentVisibility___block_invoke;
    v7[3] = &__block_descriptor_40_e28_v24__0__SBIconListView_8_B16l;
    v7[4] = a3;
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v7);
    v4 = -[SBFolderView _isEligibleForFocusInteraction](self, "_isEligibleForFocusInteraction");
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != (v6 != 0))
      -[SBFolderView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  objc_super v4;

  if (self->_isEditing || -[SBFolderView contentVisibility](self, "contentVisibility"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBFolderView;
  return -[SBFolderView _isEligibleForFocusInteraction](&v4, sel__isEligibleForFocusInteraction);
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)_resetIconListViews
{
  BOOL v3;
  SBFolder *folder;
  id v5;

  -[SBFolderView tearDownListViews](self, "tearDownListViews");
  v3 = -[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages");
  folder = self->_folder;
  if (v3)
    -[SBFolder lists](folder, "lists");
  else
    -[SBFolder visibleLists](folder, "visibleLists");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderView _addIconListViewsForModels:](self, "_addIconListViewsForModels:", v5);

}

- (void)tearDownListViews
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_iconListViews, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBFolderView _removeIconListView:](self, "_removeIconListView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_iconListViews, "removeAllObjects");
  -[SBFolderView validateVisibleColumnRange](self, "validateVisibleColumnRange");

}

- (void)validateVisibleColumnRange
{
  SBVisibleColumnRange *p_visibleColumnRange;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  p_visibleColumnRange = &self->_visibleColumnRange;
  v4 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  v6 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v7 = v4;
  if (!SBVisibleColumnRangeIsEmpty((unint64_t *)&v6))
  {
    v5 = *(_OWORD *)&p_visibleColumnRange->endIconListIndex;
    v6 = *(_OWORD *)&p_visibleColumnRange->startIconListIndex;
    v7 = v5;
    if (!-[SBFolderView isVisibleColumnRangeValid:](self, "isVisibleColumnRangeValid:", &v6))
    {
      -[SBFolderView clearVisibleColumnRange](self, "clearVisibleColumnRange");
      -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
    }
  }
}

- (BOOL)isVisibleColumnRangeValid:(SBVisibleColumnRange *)a3
{
  __int128 v5;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(_OWORD *)&a3->endIconListIndex;
  v9 = *(_OWORD *)&a3->startIconListIndex;
  v10 = v5;
  if (SBVisibleColumnRangeIsEmpty((unint64_t *)&v9))
    return 1;
  v7 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
  if (a3->startIconListIndex >= v7 || a3->endIconListIndex >= v7)
    return 0;
  v8 = *(_OWORD *)&a3->endIconListIndex;
  v9 = *(_OWORD *)&a3->startIconListIndex;
  v10 = v8;
  return SBVisibleColumnRangeMaxIconListIndex((uint64_t *)&v9) < v7;
}

- (void)clearVisibleColumnRange
{
  self->_visibleColumnRange.startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_userVisibleColumnRange.startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_addIconListViewsForModels:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D17DF4E4](v5);
        -[SBFolderView _createIconListViewForList:](self, "_createIconListViewForList:", v9, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolderView _addIconListView:](self, "_addIconListView:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  -[SBFolderView layoutIfNeeded](self, "layoutIfNeeded");
  -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", 1);
  -[SBFolderView _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 0);

}

- (void)_addIconListView:(id)a3 atEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSMutableArray *iconListViews;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v15 = v6;
    -[SBFolderView _configureIconListView:](self, "_configureIconListView:", v6);
    if (v4)
    {
      -[NSMutableArray addObject:](self->_iconListViews, "addObject:", v15);
    }
    else
    {
      -[SBFolderView folder](self, "folder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages"))
        v9 = objc_msgSend(v7, "indexOfList:", v8);
      else
        v9 = objc_msgSend(v7, "visibleIndexOfList:", v8);
      v10 = v9;
      v11 = -[NSMutableArray count](self->_iconListViews, "count");
      iconListViews = self->_iconListViews;
      if (v10 >= v11)
        -[NSMutableArray addObject:](iconListViews, "addObject:", v15);
      else
        -[NSMutableArray insertObject:atIndex:](iconListViews, "insertObject:atIndex:", v15, v10);

    }
    -[SBFolderView scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);

    -[SBFolderView _updatePageControlNumberOfPages](self, "_updatePageControlNumberOfPages");
    -[SBFolderView _didAddIconListView:](self, "_didAddIconListView:", v15);
    -[SBFolderView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "folderView:didAddIconListView:", self, v15);

    v6 = v15;
  }

}

- (void)_configureIconListView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setVisiblySettled:", -[SBFolderView isScrolling](self, "isScrolling") ^ 1);

}

- (void)_addIconListView:(id)a3
{
  -[SBFolderView _addIconListView:atEnd:](self, "_addIconListView:atEnd:", a3, 1);
}

- (void)_didAddIconListView:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutHidingAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addAssertionFromChild:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

uint64_t __44__SBFolderView__updateEditingStateAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)didAddSubview:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBFolderView;
  -[SBFolderView didAddSubview:](&v7, sel_didAddSubview_, v4);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "setContentVisibility:", -[SBFolderView contentVisibility](self, "contentVisibility"));

}

void __35__SBFolderView__precacheIconImages__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_INFO, "finished asynchronous precache of remaining icons for folder %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)doesPageContainIconListView:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:");
  if (v5)
    LOBYTE(v5) = -[SBFolderView _isValidIconListViewIndex:](self, "_isValidIconListViewIndex:", a3);
  return v5;
}

- (BOOL)_isValidIconListViewIndex:(int64_t)a3
{
  return -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)willMoveToWindow:(id)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int64_t currentPageIndex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBFolderView;
  -[SBFolderView willMoveToWindow:](&v12, sel_willMoveToWindow_);
  -[SBFolderView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 0;
  else
    v6 = a3 != 0;

  -[SBFolderView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = a3 != 0;
  else
    v8 = 1;
  if (v6 || !v8)
  {
    v9 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
    v10 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
    currentPageIndex = self->_currentPageIndex;
    if (currentPageIndex < v9 || (v9 = v10 & ~(v10 >> 63), currentPageIndex > v9))
      -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v9, 0);
  }
  if (a3)
    -[SBFolderView setHasEverBeenInAWindow:](self, "setHasEverBeenInAWindow:", 1);
}

- (void)setHasEverBeenInAWindow:(BOOL)a3
{
  self->_hasEverBeenInAWindow = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  -[SBFolderView _markListViewsAsPurged](self, "_markListViewsAsPurged");
  v4.receiver = self;
  v4.super_class = (Class)SBFolderView;
  -[SBFolderView dealloc](&v4, sel_dealloc);
}

- (void)folderWillChange:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "removeFolderObserver:", self);
  v4 = objc_msgSend(v8, "visibleListCount");
  v5 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
  if (v4 < v5)
  {
    v6 = v5;
    do
    {
      -[SBFolderView iconListViewAtIndex:](self, "iconListViewAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderView _removeIconListView:](self, "_removeIconListView:", v7);

      --v6;
    }
    while (v4 != v6);
  }
  -[SBFolderView validateVisibleColumnRange](self, "validateVisibleColumnRange");

}

- (void)folderDidChange
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SBFolderView folder](self, "folder");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SBFolderView iconListViews](self, "iconListViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  if (v4 >= v6)
    v8 = v6;
  else
    v8 = v4;
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setModel:", v10);

    }
  }
  if (v4 > v7)
  {
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderView _createIconListViewForList:](self, "_createIconListViewForList:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderView _addIconListView:](self, "_addIconListView:", v13);

      ++v8;
    }
    while (v4 != v8);
  }
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  -[SBFolderView layoutIfNeeded](self, "layoutIfNeeded");
  -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", 1);
  -[SBFolderView _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 0);
  objc_msgSend(v14, "addFolderObserver:", self);

}

- (void)setFolder:(id)a3
{
  SBFolder *v5;
  SBFolder *v6;

  v5 = (SBFolder *)a3;
  if (self->_folder != v5)
  {
    v6 = v5;
    -[SBFolderView folderWillChange:](self, "folderWillChange:", v5);
    objc_storeStrong((id *)&self->_folder, a3);
    -[SBFolderView folderDidChange](self, "folderDidChange");
    v5 = v6;
  }

}

- (void)setListLayoutProvider:(id)a3
{
  -[SBFolderView setListLayoutProvider:animated:](self, "setListLayoutProvider:animated:", a3, 0);
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  SBIconListLayoutProvider *v7;
  void *v8;
  _QWORD v9[4];
  SBIconListLayoutProvider *v10;
  BOOL v11;

  v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    -[SBFolderView iconLocation](self, "iconLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self->_listLayoutProvider, v7, v8, 1);
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__SBFolderView_setListLayoutProvider_animated___block_invoke;
    v9[3] = &unk_1E8D8E528;
    v10 = v7;
    v11 = a4;
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v9);

  }
}

uint64_t __47__SBFolderView_setListLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutProvider:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (Class)_scrollViewClass
{
  return (Class)objc_opt_self();
}

- (void)cancelScrolling
{
  void *v3;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelTouchTracking");

  -[SBFolderView _updateScrollingIfNeeded](self, "_updateScrollingIfNeeded");
}

- (void)_setPageControlDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *pageControlDisabledReasons;
  id v8;

  v4 = a3;
  v6 = a4;
  pageControlDisabledReasons = self->_pageControlDisabledReasons;
  v8 = v6;
  if (v4)
  {
    -[NSMutableSet addObject:](pageControlDisabledReasons, "addObject:", v6);
LABEL_3:
    -[SBIconListPageControl setUserInteractionEnabled:](self->_pageControl, "setUserInteractionEnabled:", !v4);
    goto LABEL_6;
  }
  if (-[NSMutableSet containsObject:](pageControlDisabledReasons, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_pageControlDisabledReasons, "removeObject:", v8);
    if (!-[NSMutableSet count](self->_pageControlDisabledReasons, "count"))
      goto LABEL_3;
  }
LABEL_6:

}

- (BOOL)isScrollingDisabled
{
  return -[NSMutableSet count](self->_scrollingDisabledReasons, "count") != 0;
}

- (void)_setScrollingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *scrollingDisabledReasons;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  scrollingDisabledReasons = self->_scrollingDisabledReasons;
  if (v4)
  {
    -[NSMutableSet addObject:](scrollingDisabledReasons, "addObject:", v6);
    -[SBIconScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
    SBLogIcon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "Disabling scrolling for reason: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[SBFolderView scrollingDisabledGestureRecognizer](self, "scrollingDisabledGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_scrollingDisabledGestureDidUpdate_);
      -[SBFolderView setScrollingDisabledGestureRecognizer:](self, "setScrollingDisabledGestureRecognizer:", v9);
      -[SBIconScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", v9);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (-[NSMutableSet containsObject:](scrollingDisabledReasons, "containsObject:", v6))
  {
    SBLogIcon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Removing reason to disable scrolling: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_scrollingDisabledReasons, "removeObject:", v6);
    if (!-[NSMutableSet count](self->_scrollingDisabledReasons, "count"))
    {
      SBLogIcon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Re-allowing scrolling after all reasons have gone away", (uint8_t *)&v12, 2u);
      }

      -[SBIconScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
      -[SBFolderView scrollingDisabledGestureRecognizer](self, "scrollingDisabledGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SBIconScrollView removeGestureRecognizer:](self->_scrollView, "removeGestureRecognizer:", v9);
        -[SBFolderView setScrollingDisabledGestureRecognizer:](self, "setScrollingDisabledGestureRecognizer:", 0);
      }
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)scrollingDisabledGestureDidUpdate:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 1)
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableSet allObjects](self->_scrollingDisabledReasons, "allObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "Scrolling is disabled for reasons: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)removeAssertion:(id)a3
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "assertionType"))
    -[SBFolderView _removeDisableAutoScrollAssertion:](self, "_removeDisableAutoScrollAssertion:", v4);

}

- (id)disableAutoScrollForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *autoScrollDisabledAssertions;
  SBFolderViewAssertion *v7;
  void *v8;
  SBFolderViewAssertion *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_autoScrollDisabledAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    autoScrollDisabledAssertions = self->_autoScrollDisabledAssertions;
    self->_autoScrollDisabledAssertions = v5;

  }
  v7 = [SBFolderViewAssertion alloc];
  v12 = CFSTR("reason");
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFolderViewAssertion initWithAssertionType:folderView:extraInfo:](v7, "initWithAssertionType:folderView:extraInfo:", 0, self, v8);

  -[NSHashTable addObject:](self->_autoScrollDisabledAssertions, "addObject:", v9);
  -[SBFolderView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setAutoScrollEnabled:", 0);

  return v9;
}

- (void)_removeDisableAutoScrollAssertion:(id)a3
{
  id v4;

  -[NSHashTable removeObject:](self->_autoScrollDisabledAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_autoScrollDisabledAssertions, "count"))
  {
    -[SBFolderView scrollView](self, "scrollView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAutoScrollEnabled:", 1);

  }
}

- (int64_t)_adjustPageIndexForPageControl:(int64_t)a3
{
  return a3;
}

- (int64_t)_adjustPageIndexFromPageControl:(int64_t)a3
{
  return a3;
}

- (BOOL)isPageControlHidden
{
  return -[SBIconListPageControl isHidden](self->_pageControl, "isHidden");
}

- (void)setPageControlHidden:(BOOL)a3
{
  -[SBIconListPageControl setHidden:](self->_pageControl, "setHidden:", a3);
}

- (double)pageControlAlpha
{
  double result;

  -[SBIconListPageControl alpha](self->_pageControl, "alpha");
  return result;
}

- (void)setPageControlAlpha:(double)a3
{
  -[SBIconListPageControl setAlpha:](self->_pageControl, "setAlpha:", a3);
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation;

  orientation = self->_orientation;
  if (orientation != a3)
  {
    if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
    {
      self->_orientation = a3;
      -[SBFolderView _orientationDidChange:](self, "_orientationDidChange:", orientation);
    }
  }
}

- (void)_orientationDidChange:(int64_t)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBFolderView clearVisibleColumnRange](self, "clearVisibleColumnRange", a3);
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  -[SBFolderView layoutIfNeeded](self, "layoutIfNeeded");
  v4 = -[SBFolderView orientation](self, "orientation");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBFolderView iconListViews](self, "iconListViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setOrientation:", v4);
        objc_msgSend(v10, "layoutIconsNow");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
}

- (int64_t)scrollAnimationTargetPageIndex
{
  int64_t currentPageIndex;
  SBIconScrollView *v4;

  currentPageIndex = self->_currentPageIndex;
  v4 = self->_scrollView;
  if (-[SBIconScrollView isScrollAnimating](v4, "isScrollAnimating")
    && (-[SBIconScrollView isTracking](v4, "isTracking") & 1) == 0)
  {
    if (-[SBIconScrollView isDecelerating](v4, "isDecelerating"))
      -[SBIconScrollView _pageDecelerationTarget](v4, "_pageDecelerationTarget");
    else
      -[SBIconScrollView lastAnimatedScrollContentOffset](v4, "lastAnimatedScrollContentOffset");
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:");
    currentPageIndex = -[SBFolderView _pageIndexForOffset:](self, "_pageIndexForOffset:");
  }

  return currentPageIndex;
}

- (int64_t)pageIndexForIconListModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  -[SBFolderView folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfList:", v4);

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    v7 = -[SBFolderView pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", v6);

  return v7;
}

- (int64_t)closestIconPageIndexForPageIndex:(int64_t)a3
{
  int64_t result;

  result = -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:");
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex");
    if (result <= a3)
    {
      result = -[SBFolderView lastIconPageIndex](self, "lastIconPageIndex");
      if (result >= a3)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    -[SBFolderView _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", a4);
  }
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return -[SBFolderView setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, a4, 0);
}

uint64_t __56__SBFolderView_setCurrentPageIndex_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentPageIndex:animated:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (-[SBFolderView isScrollingDisabled](self, "isScrollingDisabled")
    || -[SBFolderView currentPageIndex](self, "currentPageIndex") == a3
    && !-[SBFolderView isScrolling](self, "isScrolling"))
  {
    if (v6)
      v6[2](v6);
  }
  else if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[SBFolderView setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, 0, 0);
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__SBFolderView_scrollUsingDecelerationAnimationToPageIndex_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E8D86600;
    v15 = v6;
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", self, 5242880, &__block_literal_global_83, v14, 0.3);

  }
  else
  {
    -[SBFolderView setScrollingUsingDecelerationAnimation:](self, "setScrollingUsingDecelerationAnimation:", 1);
    if (v6)
      -[SBFolderView _addScrollingCompletionBlock:](self, "_addScrollingCompletionBlock:", v6);
    -[SBFolderView _willScrollToPageIndex:animated:](self, "_willScrollToPageIndex:animated:", a3, 1);
    -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:", a3);
    v9 = v8;
    v11 = v10;
    -[SBFolderView _ignoreScrollingDidEndNotifications](self, "_ignoreScrollingDidEndNotifications");
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initiating programmatic scroll to page zero - animated: YES", buf, 0xCu);

    }
    -[SBIconScrollView _setContentOffsetWithDecelerationAnimation:](self->_scrollView, "_setContentOffsetWithDecelerationAnimation:", v9, v11);
    -[SBFolderView _unignoreScrollingDidEndNotifications](self, "_unignoreScrollingDidEndNotifications");
  }

}

uint64_t __82__SBFolderView_scrollUsingDecelerationAnimationToPageIndex_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)borrowScalingView
{
  self->_isScalingViewBorrowed = 1;
  return self->_scalingView;
}

- (void)returnScalingView
{
  self->_isScalingViewBorrowed = 0;
  -[SBFolderView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_scalingView, 0);
  -[SBFolderView _updateScalingViewFrame](self, "_updateScalingViewFrame");
}

- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[SBFolderView bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)setContentAlpha:(double)a3
{
  void *v5;

  -[SBFolderView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[SBFolderView setPageControlAlpha:](self, "setPageControlAlpha:", a3);
}

- (void)_setParallaxDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  NSMutableSet *parallaxDisabledReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  v6 = -[SBFolderView isParallaxEnabled](self, "isParallaxEnabled");
  parallaxDisabledReasons = self->_parallaxDisabledReasons;
  if (v4)
  {
    if (!parallaxDisabledReasons)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = self->_parallaxDisabledReasons;
      self->_parallaxDisabledReasons = v8;

      parallaxDisabledReasons = self->_parallaxDisabledReasons;
    }
    -[NSMutableSet addObject:](parallaxDisabledReasons, "addObject:", v10);
  }
  else
  {
    -[NSMutableSet removeObject:](parallaxDisabledReasons, "removeObject:", v10);
  }
  if (v6 != -[SBFolderView isParallaxEnabled](self, "isParallaxEnabled"))
    -[SBFolderView _updateParallaxSettings](self, "_updateParallaxSettings");

}

- (BOOL)isParallaxEnabled
{
  return -[NSMutableSet count](self->_parallaxDisabledReasons, "count") == 0;
}

- (void)_updateParallaxSettings
{
  _BOOL4 v3;
  double *v4;

  if (-[SBFolderView isParallaxEnabled](self, "isParallaxEnabled"))
  {
    v3 = -[SBFolderView _useParallaxOnPageControl](self, "_useParallaxOnPageControl");
    v4 = (double *)MEMORY[0x1E0DC5AD8];
    if (!v3)
      v4 = (double *)MEMORY[0x1E0DC5AD0];
  }
  else
  {
    v4 = (double *)MEMORY[0x1E0DC5AD0];
  }
  -[SBIconListPageControl _setVisualAltitude:](self->_pageControl, "_setVisualAltitude:", *v4);
}

- (void)_layoutSubviews
{
  void *v3;
  id v4;

  -[SBFolderView scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SBFolderView addSubview:](self, "addSubview:", v4);

}

- (double)_offsetToCenterPageControlInSpaceForPageControl
{
  double result;

  -[SBFolderView pageControlAreaHeight](self, "pageControlAreaHeight");
  -[SBIconListPageControl defaultHeight](self->_pageControl, "defaultHeight");
  UIRoundToViewScale();
  return result;
}

- (double)pageControlAreaHeight
{
  double v2;

  -[SBIconListPageControl intrinsicContentSize](self->_pageControl, "intrinsicContentSize");
  return v2;
}

- (int64_t)lastIconPageIndex
{
  int64_t v3;

  v3 = -[SBFolderView maximumPageIndex](self, "maximumPageIndex");
  return v3 - -[SBFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount");
}

- (int64_t)nearestIconPageIndex
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;

  v3 = -[SBFolderView currentPageType](self, "currentPageType");
  v4 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  v5 = v4;
  if (v3 != 1)
  {
    v6 = v4 - 1;
    while (2)
    {
      ++v5;
      do
      {
        if (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", v6)
          && !-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", v5))
        {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", v6))
        {
          if (-[SBFolderView typeForPage:](self, "typeForPage:", v6) == 1)
            return v6;
          --v6;
        }
      }
      while (!-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", v5));
      if (-[SBFolderView typeForPage:](self, "typeForPage:", v5) != 1)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)_hasLeadingCustomPages
{
  return -[SBFolderView _leadingCustomPageCount](self, "_leadingCustomPageCount") != 0;
}

- (BOOL)_hasTrailingCustomPages
{
  return -[SBFolderView _trailingCustomPageCount](self, "_trailingCustomPageCount") != 0;
}

- (double)_pageHeight
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGRect v13;
  CGRect v14;

  -[SBIconScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    -[SBIconScrollView _interpageSpacing](self->_scrollView, "_interpageSpacing");
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    CGRectGetHeight(v13);
    UISizeRoundToViewScale();
    return v11;
  }
  else
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    return CGRectGetHeight(v14);
  }
}

- (double)_pageWidthOrHeight
{
  double result;

  if (-[SBFolderView isVertical](self, "isVertical"))
    -[SBFolderView _pageHeight](self, "_pageHeight");
  else
    -[SBFolderView _pageWidth](self, "_pageWidth");
  return result;
}

- (CGPoint)_scrollOffsetForPageAtIndex:(int64_t)a3 pageHeight:(double)a4
{
  int64_t v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  CGPoint result;

  v6 = a3 - -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  -[SBFolderView _pageSpacing](self, "_pageSpacing");
  v8 = (double)v6 * a4;
  v9 = v7 <= 0.0 || v6 <= 0;
  v10 = v8 + (double)(v6 - 1) * v7;
  if (!v9)
    v8 = v10;
  v11 = 0.0;
  result.y = v8;
  result.x = v11;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  SBHFloatRange result;

  if (-[SBFolderView isVertical](self, "isVertical"))
  {
    -[SBFolderView _pageHeight](self, "_pageHeight");
    -[SBFolderView _scrollRangeForPageAtIndex:pageHeight:](self, "_scrollRangeForPageAtIndex:pageHeight:", a3);
  }
  else
  {
    -[SBFolderView _pageWidth](self, "_pageWidth");
    -[SBFolderView _scrollRangeForPageAtIndex:pageWidth:](self, "_scrollRangeForPageAtIndex:pageWidth:", a3);
  }
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageWidth:(double)a4
{
  double v5;
  double v6;
  SBHFloatRange result;

  -[SBFolderView _scrollOffsetForContentAtPageIndex:](self, "_scrollOffsetForContentAtPageIndex:", a3);
  v6 = a4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (SBHFloatRange)_scrollRangeForPageAtIndex:(int64_t)a3 pageHeight:(double)a4
{
  double v5;
  double v6;
  double v7;
  SBHFloatRange result;

  -[SBFolderView _scrollOffsetForContentAtPageIndex:](self, "_scrollOffsetForContentAtPageIndex:", a3);
  v6 = v5;
  v7 = a4;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageHeight:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBHFloatRange result;

  -[SBFolderView _scrollOffsetForPageAtIndex:](self, "_scrollOffsetForPageAtIndex:");
  v8 = v7;
  -[SBFolderView _scrollOffsetForContentAtPageIndex:](self, "_scrollOffsetForContentAtPageIndex:", a3);
  v10 = v9;
  v11 = a4 - (v9 - v8);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (SBHFloatRange)_scrollRangeForContentAtPageIndex:(int64_t)a3 pageWidthOrHeight:(double)a4
{
  double v7;
  double v8;
  SBHFloatRange result;

  if (-[SBFolderView isVertical](self, "isVertical"))
    -[SBFolderView _scrollRangeForContentAtPageIndex:pageHeight:](self, "_scrollRangeForContentAtPageIndex:pageHeight:", a3, a4);
  else
    -[SBFolderView _scrollRangeForContentAtPageIndex:pageWidth:](self, "_scrollRangeForContentAtPageIndex:pageWidth:", a3, a4);
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (BOOL)_showsTitle
{
  return 0;
}

- (double)_titleFontSize
{
  return 0.0;
}

- (void)_removeIconListView:(id)a3
{
  -[SBFolderView _removeIconListView:purge:](self, "_removeIconListView:purge:", a3, 1);
}

- (void)_removeIconListView:(id)a3 purge:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (v4)
  {
    objc_msgSend(v9, "setPurged:", 1);
    objc_msgSend(v9, "setDragDelegate:", 0);
    objc_msgSend(v9, "removeAllIconViews");
  }
  objc_msgSend(v9, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(v9, "removeFromSuperview");
  -[NSMutableArray removeObject:](self->_iconListViews, "removeObject:", v9);
  -[SBFolderView _updatePageControlNumberOfPages](self, "_updatePageControlNumberOfPages");
  -[SBFolderView _didRemoveIconListView:](self, "_didRemoveIconListView:", v9);
  -[SBFolderView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "folderView:didRemoveIconListView:", self, v9);

}

- (void)_didRemoveIconListView:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutHidingAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeAndInvalidateAssertionsForChild:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)iconListViewWithList:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_iconListViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "model", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)iconListViewDisplayingIconView:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SBFolderView_iconListViewDisplayingIconView___block_invoke;
  v8[3] = &unk_1E8D8E5C0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__SBFolderView_iconListViewDisplayingIconView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isDisplayingIconView:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (unint64_t)indexOfIconListView:(id)a3
{
  return -[NSMutableArray indexOfObjectIdenticalTo:](self->_iconListViews, "indexOfObjectIdenticalTo:", a3);
}

- (void)enumerateIconListViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  if ((v4 & 2) != 0)
  {
    v7 = self->_iconListViews;
  }
  else
  {
    -[SBFolderView allIconListViews](self, "allIconListViews");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__SBFolderView_enumerateIconListViewsWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E8D8E5E8;
  v11 = v6;
  v9 = v6;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v8, "enumerateObjectsWithOptions:usingBlock:", 2 * (v4 & 1), v10);

}

uint64_t __61__SBFolderView_enumerateIconListViewsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateScrollViewPageViewsUsingBlock:(id)a3
{
  -[SBFolderView enumerateIconListViewsWithOptions:usingBlock:](self, "enumerateIconListViewsWithOptions:usingBlock:", 2, a3);
}

+ (NSString)defaultIconLocation
{
  return (NSString *)CFSTR("SBIconLocationNone");
}

- (void)updateIconListViews
{
  -[SBFolderView _updateIconListViews:](self, "_updateIconListViews:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
}

- (void)_updateIconListViews:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;

  v5 = -[SBFolderView iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
    -[SBFolderView _updateIconListViewsWithCurrentPageIndex:currentIconListModel:](self, "_updateIconListViewsWithCurrentPageIndex:currentIconListModel:", a3, 0);
  }
  else
  {
    v6 = v5;
    -[SBFolderView folder](self, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listAtIndex:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[SBFolderView _updateIconListViewsWithCurrentPageIndex:currentIconListModel:](self, "_updateIconListViewsWithCurrentPageIndex:currentIconListModel:", a3, v8);
  }

}

- (void)_updateIconListViewsWithCurrentIconListModel:(id)a3
{
  id v4;

  v4 = a3;
  -[SBFolderView _updateIconListViewsWithCurrentPageIndex:currentIconListModel:](self, "_updateIconListViewsWithCurrentPageIndex:currentIconListModel:", -[SBFolderView pageIndexForIconListModel:](self, "pageIndexForIconListModel:", v4), v4);

}

- (void)_updateIconListViewsWithCurrentPageIndex:(int64_t)a3 currentIconListModel:(id)a4
{
  id v6;
  BOOL v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  SBFolder *folder;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  int64_t v28;
  unint64_t v29;
  void *v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  void *v34;
  unint64_t v35;
  int v36;
  int64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v35 = -[SBFolderView typeForPage:](self, "typeForPage:", a3);
  v7 = -[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages");
  v8 = -[SBFolderView automaticallyCreatesIconListViews](self, "automaticallyCreatesIconListViews");
  if (v6)
    -[SBFolderView iconListViewWithList:](self, "iconListViewWithList:", v6);
  else
    -[SBFolderView iconListViewForPageIndex:](self, "iconListViewForPageIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v9, "isShowingAllIcons");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  folder = self->_folder;
  v38 = v9;
  v39 = v6;
  v37 = a3;
  if (v7)
    -[SBFolder lists](folder, "lists");
  else
    -[SBFolder visibleLists](folder, "visibleLists");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[SBFolderView iconListViewWithList:](self, "iconListViewWithList:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          v19 = 0;
        else
          v19 = v8;
        if (v19)
        {
          -[SBFolderView _createIconListViewForList:](self, "_createIconListViewForList:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogIcon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v17;
            _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_INFO, "adding new view for %@", buf, 0xCu);
          }

          -[SBFolderView _addIconListView:atEnd:](self, "_addIconListView:atEnd:", v18, 0);
        }
        if (v18)
          objc_msgSend(v10, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_iconListViews);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectsInArray:", v10);
  if (objc_msgSend(v21, "count"))
  {
    SBLogIcon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v21;
      _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_INFO, "removing leftover views: %@", buf, 0xCu);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v23);
          -[SBFolderView _removeIconListView:](self, "_removeIconListView:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v25);
    }

  }
  -[NSMutableArray setArray:](self->_iconListViews, "setArray:", v10);
  -[SBFolderView clearVisibleColumnRange](self, "clearVisibleColumnRange");
  -[SBFolderView _updateIconListFrames](self, "_updateIconListFrames");
  -[SBFolderView _updatePageControlNumberOfPages](self, "_updatePageControlNumberOfPages");
  v28 = v37;
  if (v39)
  {
    v29 = -[SBFolder indexOfList:](self->_folder, "indexOfList:", v39);
    v30 = v38;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      v28 = -[SBFolderView pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", v29);
  }
  else
  {
    v30 = v38;
  }
  if (-[SBFolderView _isValidPageIndex:](self, "_isValidPageIndex:", v28))
  {
    if (v35 == 1
      && -[SBFolderView iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v28) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex");
      v32 = -[SBFolderView lastIconPageIndex](self, "lastIconPageIndex");
      if (v28 >= v32)
        v33 = v32;
      else
        v33 = v28;
      if (v28 >= v31)
        v28 = v33;
      else
        v28 = v31;
    }
    -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v28, 0);
  }
  if (v36)
  {
    -[SBFolderView iconListViewForPageIndex:](self, "iconListViewForPageIndex:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 == v30)
      objc_msgSend(v30, "showAllIcons");
  }
  -[SBFolderView updateIconListIndexAndVisibility:](self, "updateIconListIndexAndVisibility:", 1);

}

- (id)lastIconListView
{
  return (id)-[NSMutableArray lastObject](self->_iconListViews, "lastObject");
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGPoint v26;
  CGRect v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x1E0C80C00];
  -[SBFolderView scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v8 = v7;
  v10 = v9;
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || (objc_msgSend(v12, "frame"), v25.x = v8, v25.y = v10, !CGRectContainsPoint(v27, v25)))
  {

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = self->_iconListViews;
    v13 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v15 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v14);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (v17 != v11)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "frame", (_QWORD)v19);
            v26.x = v8;
            v26.y = v10;
            if (CGRectContainsPoint(v28, v26))
            {
              v13 = v17;
              goto LABEL_14;
            }
          }
        }
        v13 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v13;
}

- (id)iconListViewForTouch:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  return -[SBFolderView iconListViewAtPoint:](self, "iconListViewAtPoint:");
}

- (id)iconListViewForDrag:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  return -[SBFolderView iconListViewAtPoint:](self, "iconListViewAtPoint:");
}

- (id)iconListViewAtScrollPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_iconListViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "frame", (_QWORD)v11);
        v17.x = x;
        v17.y = y;
        if (CGRectContainsPoint(v18, v17))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)visibleIconListViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  -[SBFolderView getLeadingVisiblePageIndex:trailingVisiblePageIndex:](self, "getLeadingVisiblePageIndex:trailingVisiblePageIndex:", &v9, &v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9 <= v8)
  {
    do
    {
      -[SBFolderView iconListViewForPageIndex:](self, "iconListViewForPageIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v3, "addObject:", v5);

    }
    while (v4++ < v8);
  }
  return (NSArray *)v3;
}

- (void)setIncludesHiddenIconListPages:(BOOL)a3
{
  id v5;

  if (self->_includesHiddenIconListPages != a3)
  {
    -[SBFolderView currentIconListModel](self, "currentIconListModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    self->_includesHiddenIconListPages = a3;
    -[SBFolderView _updateIconListViewsWithCurrentIconListModel:](self, "_updateIconListViewsWithCurrentIconListModel:", v5);

  }
}

- (void)setAutomaticallyCreatesIconListViews:(BOOL)a3
{
  if (self->_automaticallyCreatesIconListViews != a3)
  {
    self->_automaticallyCreatesIconListViews = a3;
    -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)currentScrollOffset
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBIconScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  if (-[SBFolderView isVertical](self, "isVertical"))
    return v6;
  else
    return v4;
}

- (double)scrollingDimensionForPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[SBFolderView isVertical](self, "isVertical"))
    return y;
  else
    return x;
}

- (CGPoint)pointForScrollingDimension:(double)a3
{
  _BOOL4 v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = -[SBFolderView isVertical](self, "isVertical");
  v5 = 0.0;
  if (v4)
    v6 = 0.0;
  else
    v6 = a3;
  if (v4)
    v5 = a3;
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)prefetchNextVisibleColumn
{
  void *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  SBVisibleColumnRange *p_prefetchedColumnRange;
  __int128 v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;

  -[SBFolderView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDragging");

  if (v4)
  {
    v5 = -[SBFolderView userInterfaceLayoutDirectionAwareScrollingDirection](self, "userInterfaceLayoutDirectionAwareScrollingDirection");
    v6 = v5;
    if (v5 != self->_prefetchedColumnDirection)
    {
      self->_prefetchedColumnRange.startIconListIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_prefetchedColumnDirection = v5;
    }
    p_prefetchedColumnRange = &self->_prefetchedColumnRange;
    if (self->_prefetchedColumnRange.startIconListIndex == 0x7FFFFFFFFFFFFFFFLL
      || (v8 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex,
          v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex,
          v31 = v8,
          v9 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex,
          v29[0] = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex,
          v29[1] = v9,
          SBVisibleColumnRangeContainsVisibleColumnRange(&v30, v29)))
    {
      if (v6 != 2)
      {
        if (!v6)
        {
          v10 = -[SBFolderView columnCountForPageIndex:](self, "columnCountForPageIndex:", self->_userVisibleColumnRange.startIconListIndex);
          v11 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
          v28 = 0;
          *(_QWORD *)&v29[0] = 0;
          v12 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex;
          v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex;
          v31 = v12;
          if (SBVisibleColumnRangeGetPreviousColumn((unint64_t *)&v30, v10, v11, v29, &v28))
          {
            v14 = v28;
            v13 = *(_QWORD *)&v29[0];
            self->_prefetchedColumnRange.endIconListIndex = *(_QWORD *)&v29[0];
            self->_prefetchedColumnRange.endColumnIndex = v14;
            self->_prefetchedColumnRange.startColumnIndex = v14;
          }
          else
          {
            v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          p_prefetchedColumnRange->startIconListIndex = v13;
        }
        goto LABEL_20;
      }
      v21 = -[SBFolderView columnCountForPageIndex:](self, "columnCountForPageIndex:", self->_userVisibleColumnRange.endIconListIndex);
      v22 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
      v28 = 0;
      *(_QWORD *)&v29[0] = 0;
      v23 = *(_OWORD *)&self->_userVisibleColumnRange.endIconListIndex;
      v30 = *(_OWORD *)&self->_userVisibleColumnRange.startIconListIndex;
      v31 = v23;
      if (SBVisibleColumnRangeGetNextColumn((unint64_t *)&v30, v21, v22, (unint64_t *)v29, &v28))
      {
        v20 = v28;
        v19 = *(_QWORD *)&v29[0];
        self->_prefetchedColumnRange.endIconListIndex = *(_QWORD *)&v29[0];
        self->_prefetchedColumnRange.endColumnIndex = v20;
        goto LABEL_17;
      }
    }
    else
    {
      v15 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
      v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
      v31 = v15;
      if (-[SBFolderView columnCountInVisibleColumnRange:](self, "columnCountInVisibleColumnRange:", &v30) <= 3)
      {
        if (v6 == 2)
        {
          v24 = -[SBFolderView columnOrRowCountForScrollingForPageIndex:](self, "columnOrRowCountForScrollingForPageIndex:", self->_prefetchedColumnRange.endIconListIndex);
          v25 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
          v28 = 0;
          *(_QWORD *)&v29[0] = 0;
          v26 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
          v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
          v31 = v26;
          if (SBVisibleColumnRangeGetNextColumn((unint64_t *)&v30, v24, v25, (unint64_t *)v29, &v28))
          {
            v27 = v28;
            self->_prefetchedColumnRange.endIconListIndex = *(_QWORD *)&v29[0];
            self->_prefetchedColumnRange.endColumnIndex = v27;
          }
          goto LABEL_20;
        }
        if (!v6)
        {
          v16 = -[SBFolderView columnOrRowCountForScrollingForPageIndex:](self, "columnOrRowCountForScrollingForPageIndex:", self->_userVisibleColumnRange.startIconListIndex);
          v17 = -[SBFolderView iconListViewCount](self, "iconListViewCount");
          v28 = 0;
          *(_QWORD *)&v29[0] = 0;
          v18 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
          v30 = *(_OWORD *)&p_prefetchedColumnRange->startIconListIndex;
          v31 = v18;
          if (SBVisibleColumnRangeGetPreviousColumn((unint64_t *)&v30, v16, v17, v29, &v28))
          {
            v20 = v28;
            v19 = *(_QWORD *)&v29[0];
LABEL_17:
            p_prefetchedColumnRange->startIconListIndex = v19;
            self->_prefetchedColumnRange.startColumnIndex = v20;
          }
        }
      }
    }
LABEL_20:
    -[SBFolderView updateVisibleColumnRange](self, "updateVisibleColumnRange");
  }
}

- (unint64_t)columnCountForPageIndex:(int64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = -[SBFolderView iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:", a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    -[SBFolderView folder](self, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unsigned __int16)objc_msgSend(v8, "gridSize");

  }
  return v5;
}

- (unint64_t)columnOrRowCountForScrollingForPageIndex:(int64_t)a3
{
  unint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v4 = -[SBFolderView iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:", a3);
  v5 = -[SBFolderView isVertical](self, "isVertical");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    -[SBFolderView folder](self, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "listAtIndex:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "gridSize");
    if (v7)
      v6 = HIWORD(v10);
    else
      v6 = (unsigned __int16)v10;

  }
  return v6;
}

- (unint64_t)columnCountInVisibleColumnRange:(SBVisibleColumnRange *)a3
{
  unint64_t startIconListIndex;
  unint64_t v5;
  unint64_t v7;
  unint64_t i;

  startIconListIndex = a3->startIconListIndex;
  if (startIconListIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (startIconListIndex == a3->endIconListIndex)
    return a3->endColumnIndex - a3->startColumnIndex + 1;
  if (-[SBFolderView columnCountForPageIndex:](self, "columnCountForPageIndex:") == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = -a3->startColumnIndex;
  v5 = a3->endColumnIndex + v7;
  for (i = a3->startIconListIndex + 1; i < a3->endIconListIndex; ++i)
    v5 += -[SBFolderView columnCountForPageIndex:](self, "columnCountForPageIndex:", i);
  return v5;
}

- (id)iconVisibilityDescription
{
  void *v3;
  __int128 v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_OWORD *)&self->_visibleColumnRange.endIconListIndex;
  v10 = *(_OWORD *)&self->_visibleColumnRange.startIconListIndex;
  v11 = v4;
  SBStringFromVisibleColumnRange(&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&self->_prefetchedColumnRange.endIconListIndex;
  v10 = *(_OWORD *)&self->_prefetchedColumnRange.startIconListIndex;
  v11 = v6;
  SBStringFromVisibleColumnRange(&v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Visible column range: %@, prefetched column range: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_markListViewsAsPurged
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_iconListViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setPurged:", 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_shouldIgnoreScrollingDidEndNotifications
{
  return self->_ignoreScrollingDidEndNotificationsCount != 0;
}

- (void)addScrollViewIsScrollingOverrideReason:(id)a3
{
  id v4;
  NSMutableSet *scrollViewIsScrollingOverrides;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  scrollViewIsScrollingOverrides = self->_scrollViewIsScrollingOverrides;
  v8 = v4;
  if (!scrollViewIsScrollingOverrides)
  {
    v6 = (NSMutableSet *)objc_opt_new();
    v7 = self->_scrollViewIsScrollingOverrides;
    self->_scrollViewIsScrollingOverrides = v6;

    v4 = v8;
    scrollViewIsScrollingOverrides = self->_scrollViewIsScrollingOverrides;
  }
  -[NSMutableSet addObject:](scrollViewIsScrollingOverrides, "addObject:", v4);
  -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");

}

- (void)removeScrollViewIsScrollingOverrideReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_scrollViewIsScrollingOverrides, "removeObject:", a3);
  -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
}

uint64_t __38__SBFolderView__updateScrollingState___block_invoke_57(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisiblySettled:", 1);
}

- (unsigned)scrollingDirectionTracking:(BOOL)a3
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;

  v3 = &OBJC_IVAR___SBFolderView__scrollStartContentOffset;
  if (a3)
    v3 = &OBJC_IVAR___SBFolderView__scrollTrackingContentOffset;
  v4 = (double *)((char *)self + *v3);
  v6 = *v4;
  v5 = v4[1];
  -[SBFolderView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  v11 = v10;

  v12 = vabdd_f64(v11, v5);
  v13 = vabdd_f64(v9, v6);
  if (v11 - v5 < 0.0)
    v14 = 1;
  else
    v14 = 3;
  if (v12 <= v13)
    return 2 * (v9 - v6 >= 0.0);
  else
    return v14;
}

- (void)setIconImageCache:(id)a3
{
  SBHIconImageCache *v5;
  _QWORD v6[4];
  SBHIconImageCache *v7;

  v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__SBFolderView_setIconImageCache___block_invoke;
    v6[3] = &unk_1E8D8B208;
    v7 = v5;
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v6);

  }
}

uint64_t __34__SBFolderView_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconImageCache:", *(_QWORD *)(a1 + 32));
}

- (void)setFolderIconImageCache:(id)a3
{
  SBFolderIconImageCache *v5;
  _QWORD v6[4];
  SBFolderIconImageCache *v7;

  v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SBFolderView_setFolderIconImageCache___block_invoke;
    v6[3] = &unk_1E8D8B208;
    v7 = v5;
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v6);

  }
}

uint64_t __40__SBFolderView_setFolderIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFolderIconImageCache:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 0;
}

- (UIEdgeInsets)_scrollingInteractionVisibleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SBIconScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateScrollingInteractionIsScrolling:(BOOL)a3
{
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", a3);
}

- (void)_scrollingInteractionScrollViewDidScroll:(id)a3
{
  -[SBHScrollableIconViewInteraction clippingScrollViewDidScroll:](self->_scrollingInteraction, "clippingScrollViewDidScroll:", a3);
}

- (void)_enumerateScrollableIconViewsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "icons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v4[2](v4, v11, &v16);
          if (v16)
          {

            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  void *v2;
  void *v3;

  -[SBFolderView folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveGridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconGridSizeClassDomain *)v3;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4;
  SBHIconImageAppearance *v5;
  SBHIconImageAppearance *overrideIconImageAppearance;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = (SBHIconImageAppearance *)objc_msgSend(v4, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v5;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SBFolderView_setOverrideIconImageAppearance___block_invoke;
    v7[3] = &unk_1E8D8B208;
    v8 = v4;
    -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v7);

  }
}

uint64_t __47__SBFolderView_setOverrideIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideIconImageAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFolderView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  SBHIconLayoutHidingCompoundAssertion *v10;
  NSHashTable *layoutHidingAssertions;
  NSHashTable *v12;
  NSHashTable *v13;
  SBHIconLayoutHidingCompoundAssertion *v14;
  _QWORD v16[4];
  SBHIconLayoutHidingCompoundAssertion *v17;

  v8 = a4;
  v9 = a3;
  v10 = -[SBHIconLayoutHidingCompoundAssertion initWithInvalidationHandler:icons:reason:options:]([SBHIconLayoutHidingCompoundAssertion alloc], "initWithInvalidationHandler:icons:reason:options:", self, v9, v8, a5);

  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v12;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  -[NSHashTable addObject:](layoutHidingAssertions, "addObject:", v10);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SBFolderView_beginHidingIconsFromLayout_reason_options___block_invoke;
  v16[3] = &unk_1E8D8B208;
  v14 = v10;
  v17 = v14;
  -[SBFolderView enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v16);

  return v14;
}

uint64_t __58__SBFolderView_beginHidingIconsFromLayout_reason_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAssertionFromChild:", a2);
}

- (void)layoutHidingCompoundAssertionDidInvalidate:(id)a3
{
  -[NSHashTable removeObject:](self->_layoutHidingAssertions, "removeObject:", a3);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBFolderView iconListViewForPageIndex:](self, "iconListViewForPageIndex:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)transitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBFolderView _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_toWindowOrientation");
  if (-[SBFolderView orientation](self, "orientation") != v7)
  {
    -[SBFolderView setRotating:](self, "setRotating:", 1);
    -[SBFolderView willTransitionAnimated:withSettings:](self, "willTransitionAnimated:withSettings:", 1, 0);
    if (-[SBFolderView _animatesRotationForAllVisibleIconListViews](self, "_animatesRotationForAllVisibleIconListViews"))
    {
      -[SBFolderView minimumVisibleScrollOffset](self, "minimumVisibleScrollOffset");
      v9 = v8;
      -[SBFolderView maximumVisibleScrollOffset](self, "maximumVisibleScrollOffset");
      v11 = v10;
      -[SBFolderView currentIconListView](self, "currentIconListView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[SBFolderView iconListViews](self, "iconListViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v14)
      {
        v15 = v14;
        v16 = v11 - v9;
        v17 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v19, "frame");
            x = v46.origin.x;
            y = v46.origin.y;
            width = v46.size.width;
            height = v46.size.height;
            MinX = CGRectGetMinX(v46);
            v47.origin.x = x;
            v47.origin.y = y;
            v47.size.width = width;
            v47.size.height = height;
            v25 = CGRectGetWidth(v47);
            v26 = SBHIntersectionFloatRange(MinX, v25, v9, v16);
            if (v27 <= 0.0)
            {
              if (v19 != v12)
                objc_msgSend(v19, "setHidden:", 1, v26);
            }
            else
            {
              objc_msgSend(v19, "willRotateWithTransitionCoordinator:", v5, v26);
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v15);
      }
    }
    else
    {
      -[SBFolderView currentIconListView](self, "currentIconListView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willRotateWithTransitionCoordinator:", v5);
      v38 = 0u;
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      -[SBFolderView iconListViews](self, "iconListViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v36 != v30)
              objc_enumerationMutation(v13);
            v32 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            if (v32 != v12)
              objc_msgSend(v32, "setHidden:", 1);
          }
          v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v29);
      }
    }

    v33[4] = self;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke;
    v34[3] = &unk_1E8D87778;
    v34[4] = self;
    v34[5] = v7;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke_2;
    v33[3] = &unk_1E8D85400;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", v34, v33);
  }

}

uint64_t __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateIconListFrames");
  return objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 40));
}

void __59__SBFolderView_transitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRotating:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "iconListViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v6++), "setHidden:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "cancelScrolling");
  objc_msgSend(*(id *)(a1 + 32), "resetContentOffsetToCurrentPageAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "didTransitionAnimated:", 1);
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 688);
  *(_QWORD *)(v8 + 688) = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (BOOL)_animatesRotationForAllVisibleIconListViews
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_scrollView == a3)
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning user-initiated scroll", (uint8_t *)&v6, 0xCu);

    }
    -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
    self->_scrollFrameCount = 0;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_scrollView == a3)
  {
    -[SBFolderView scrollingDimensionForPoint:](self, "scrollingDimensionForPoint:", a5->x, a5->y);
    -[SBFolderView _updatePageControlToIndex:](self, "_updatePageControlToIndex:", -[SBFolderView _pageIndexForOffset:behavior:fractionOfDistanceThroughPage:](self, "_pageIndexForOffset:behavior:fractionOfDistanceThroughPage:", 1, 0));
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_scrollView == a3)
  {
    v4 = a4;
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 1024;
      v11 = v4;
      v7 = v9;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending user-initiated scroll - willDecelerate: %{BOOL}u", (uint8_t *)&v8, 0x12u);

    }
    if (!v4)
      -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_scrollView == a3)
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ending deceleration of user-initiated scroll", (uint8_t *)&v6, 0xCu);

    }
    -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_scrollView == a3)
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v6 = 138543362;
      *(_QWORD *)&v6[4] = objc_opt_class();
      v5 = *(id *)&v6[4];
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ending programmatic scroll animation", v6, 0xCu);

    }
    if (!-[SBFolderView _shouldIgnoreScrollingDidEndNotifications](self, "_shouldIgnoreScrollingDidEndNotifications"))
      -[SBFolderView _checkIfScrollStateChanged](self, "_checkIfScrollStateChanged");
    -[SBFolderView setScrollingUsingDecelerationAnimation:](self, "setScrollingUsingDecelerationAnimation:", 0, *(_OWORD *)v6);
  }
}

- (BOOL)iconScrollView:(id)a3 shouldSetAutoscrollContentOffset:(CGPoint)a4
{
  return -[SBFolderView contentVisibility](self, "contentVisibility", a3, a4.x, a4.y) == 0;
}

- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = -[SBFolderView _adjustPageIndexFromPageControl:](self, "_adjustPageIndexFromPageControl:", a4);
  v10 = -[SBFolderView scrollAnimationTargetPageIndex](self, "scrollAnimationTargetPageIndex");
  v11 = -[SBFolderView minimumPageIndex](self, "minimumPageIndex");
  v12 = v10 - 1;
  if (v11 + v9 >= v10)
    v12 = v10 + 1;
  if (v5)
    v13 = v11 + v9;
  else
    v13 = v12;
  if (v5)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "folderSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "animatesPageScrubbing");

  }
  else
  {
    v16 = 1;
  }
  objc_initWeak(&location, self);
  -[SBFolderView _disableUserInteractionBeforeSignificantAnimation](self, "_disableUserInteractionBeforeSignificantAnimation");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__SBFolderView_pageControl_didMoveCurrentPageToPage_withScrubbing___block_invoke;
  v17[3] = &unk_1E8D88B98;
  objc_copyWeak(&v18, &location);
  -[SBFolderView setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", v13, v16, v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __67__SBFolderView_pageControl_didMoveCurrentPageToPage_withScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_enableUserInteractionAfterSignificantAnimation");

}

- (id)highlightingViewForPageControl:(id)a3
{
  return 0;
}

- (void)_setFolderName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SBFolderTitleTextField *titleTextField;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    -[SBFolderView folder](self, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v11);

    -[SBFolderTitleTextField setText:](self->_titleTextField, "setText:", v11);
  }
  else
  {
    titleTextField = self->_titleTextField;
    -[SBFolderView folder](self, "folder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderTitleTextField setText:](titleTextField, "setText:", v10);

  }
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;

  v4 = -[SBFolderView isEditing](self, "isEditing", a3);
  if (v4)
  {
    -[SBFolderView folder](self, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canEditDisplayName");

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBFolderView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "folderView:didBeginEditingTitle:", self, v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView _setFolderName:](self, "_setFolderName:", v4);

  -[SBFolderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderView:didEndEditingTitle:", self, v6);

}

- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5
{
  id v7;
  void *v8;
  SBIconListViewSlideInAnimator *v9;
  SBIconListViewSlideInAnimator *v10;

  v7 = a5;
  objc_msgSend(a4, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (SBIconListViewSlideInAnimator *)v7;
  v10 = v9;
  if (-[NSMutableSet containsObject:](self->_iconsNeedingSlideInAnimator, "containsObject:", v8))
  {
    v10 = objc_alloc_init(SBIconListViewSlideInAnimator);

    -[NSMutableSet removeObject:](self->_iconsNeedingSlideInAnimator, "removeObject:", v8);
  }

  return v10;
}

- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  SBIconListViewClusterAnimator *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  BOOL v23;
  SBIconListViewClusterAnimator *v24;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "displayedModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "folder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForList:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isExtraList:", v10);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v26 = v10;
    v27 = v9;
    v28 = v7;
    v15 = 0;
    v16 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v18, "isPlaceholder", v26, v27, v28) & 1) == 0)
        {
          objc_msgSend(v11, "indexPathForIcon:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          objc_msgSend(v11, "folderContainingIndexPath:relativeIndexPath:", v19, &v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v31;
          v22 = objc_msgSend(v20, "isExtraListIndex:", objc_msgSend(v21, "sbListIndex"));
          if (v19)
            v23 = v20 == v11;
          else
            v23 = 0;
          if (!v23 || ((v12 ^ v22) & 1) != 0)
          {

            v9 = v27;
            v7 = v28;
            v10 = v26;
            goto LABEL_22;
          }
          if (!v15)
            v15 = objc_alloc_init(SBIconListViewClusterAnimator);
          -[SBIconListViewClusterAnimator setRemovalDirection:forIcon:](v15, "setRemovalDirection:forIcon:", objc_msgSend(v19, "sbListIndex") < (unint64_t)objc_msgSend(v29, "sbListIndex"), v18);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
        continue;
      break;
    }

    if (v15)
    {
      v15 = v15;
      v24 = v15;
      v9 = v27;
      v7 = v28;
      v10 = v26;
      goto LABEL_24;
    }
    v9 = v27;
    v7 = v28;
    v10 = v26;
  }
  else
  {
    v15 = 0;
LABEL_22:

  }
  v24 = (SBIconListViewClusterAnimator *)v9;
LABEL_24:

  return v24;
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "folderView:iconListView:canHandleIconDropSession:", self, v6, v7);
  else
    v9 = 0;

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderView:iconListView:iconDropSessionDidEnter:", self, v8, v6);

}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "folderView:iconListView:iconDropSessionDidUpdate:", self, v6, v7),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderView:iconListView:iconDropSessionDidExit:", self, v8, v6);

}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderView:iconListView:performIconDrop:", self, v8, v6);

}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "folderView:iconListView:iconViewForDroppingIconDragItem:proposedIconView:", self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "folderView:iconListView:willUseIconView:forDroppingIconDragItem:", self, v11, v8, v9);

}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "folderView:iconListView:previewForDroppingIconDragItem:proposedPreview:", self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "folderView:iconListView:iconDragItem:willAnimateDropWithAnimator:", self, v11, v8, v9);

}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v11, "folderView:iconListView:shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", self, v8, v9, v10);
  else
    v12 = 0;

  return v12;
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderView:iconListView:springLoadedInteractionForIconDragDidCompleteOnIconView:", self, v8, v6);

}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SBFolderView _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "folderView:iconListView:customSpringAnimationBehaviorForDroppingItem:", self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "indexOfList:", v7);
  v9 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  v10 = -[SBFolderView iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:", v9);
  SBLogIcon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "%@ --> %@; index = %lu; currentPage: %li",
      (uint8_t *)&v12,
      0x2Au);
  }

  if (v10 != 0x7FFFFFFFFFFFFFFFLL
    && v8 <= v10
    && (!objc_msgSend(v7, "isHidden")
     || -[SBFolderView includesHiddenIconListPages](self, "includesHiddenIconListPages")))
  {
    ++v9;
  }
  -[SBFolderView _noteFolderListsDidChange:](self, "_noteFolderListsDidChange:", v9);

}

- (void)folder:(id)a3 willRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke;
  v35[3] = &unk_1E8D8E6B8;
  v35[4] = self;
  v35[5] = v11;
  v13 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v35);
  v14 = objc_msgSend(v8, "lastVisibleListIndex");
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_2;
  v32[3] = &unk_1E8D8E6B8;
  v15 = v8;
  v33 = v15;
  v34 = v14;
  v16 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v32);
  if (v13 && v16)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__23;
    v30 = __Block_byref_object_dispose__23;
    v31 = 0;
    objc_msgSend(v15, "lists");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    v21 = 3221225472;
    v22 = __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_3;
    v23 = &unk_1E8D879D8;
    v24 = v9;
    v25 = &v26;
    objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, &v20);

    if (!v27[5]
      || (v18 = -[SBFolderView pageIndexForIconListModel:](self, "pageIndexForIconListModel:", v20, v21, v22, v23),
          v18 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v18 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex", v20, v21, v22, v23);
    }
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      v19 = 0;
    else
      v19 = v11 - v18;
    -[SBFolderView setExtraPageCountDuringScrolling:](self, "setExtraPageCountDuringScrolling:", v19);
    -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v18, 1);

    _Block_object_dispose(&v26, 8);
  }

}

BOOL __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "pageIndexForIconListModel:", a2) == *(_QWORD *)(a1 + 40);
}

BOOL __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexOfList:", a2) == *(_QWORD *)(a1 + 40);
}

void __49__SBFolderView_folder_willRemoveLists_atIndexes___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isHidden") & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIcon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "%@ --> %@; indexes = %@", (uint8_t *)&v12, 0x20u);
  }

  -[SBFolderView _noteFolderListsDidChange:](self, "_noteFolderListsDidChange:", -[SBFolderView currentPageIndex](self, "currentPageIndex"));
}

- (void)folder:(id)a3 listHiddenWillChange:(id)a4
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;

  if ((objc_msgSend(a4, "isHidden", a3) & 1) == 0)
  {
    v5 = -[SBFolderView currentPageIndex](self, "currentPageIndex");
    if (v5 == -[SBFolderView lastIconPageIndex](self, "lastIconPageIndex"))
    {
      v6 = v5 - 1;
      v7 = -[SBFolderView firstIconPageIndex](self, "firstIconPageIndex");
      if (v6 <= v7)
        v8 = v7;
      else
        v8 = v6;
      -[SBFolderView setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v8, 0);
    }
  }
}

- (void)folderDisplayNameDidChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "displayName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderView _setFolderName:](self, "_setFolderName:", v4);

}

- (void)folder:(id)a3 willRestoreOverflowIcon:(id)a4 toList:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *iconsNeedingSlideInAnimator;
  NSMutableSet *v11;
  NSMutableSet *v12;
  id v13;

  v13 = a4;
  -[SBFolderView iconListViewWithList:](self, "iconListViewWithList:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleGridCellIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    iconsNeedingSlideInAnimator = self->_iconsNeedingSlideInAnimator;
    if (!iconsNeedingSlideInAnimator)
    {
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v12 = self->_iconsNeedingSlideInAnimator;
      self->_iconsNeedingSlideInAnimator = v11;

      iconsNeedingSlideInAnimator = self->_iconsNeedingSlideInAnimator;
    }
    -[NSMutableSet addObject:](iconsNeedingSlideInAnimator, "addObject:", v13);
  }

}

- (id)_legibilitySettingsWithPrimaryColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SBFolderView legibilitySettings](self, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DC4270]);
  v7 = objc_msgSend(v5, "style");
  objc_msgSend(v5, "secondaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v7, v4, v8, v9);

  return v10;
}

- (void)_updateTitleLegibilitySettings
{
  SBFolderTitleTextField *titleTextField;
  void *v4;
  void *v5;
  id v6;

  -[SBFolderView legibilitySettings](self, "legibilitySettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled() && objc_msgSend(v6, "style") == 2)
  {
    titleTextField = self->_titleTextField;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderView _legibilitySettingsWithPrimaryColor:](self, "_legibilitySettingsWithPrimaryColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderTitleTextField setLegibilitySettings:](titleTextField, "setLegibilitySettings:", v5);

  }
  else
  {
    -[SBFolderTitleTextField setLegibilitySettings:](self->_titleTextField, "setLegibilitySettings:", v6);
  }

}

- (void)_updateIconListLegibilitySettings
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBFolderView legibilitySettingsForIconListViews](self, "legibilitySettingsForIconListViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_iconListViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setLegibilitySettings:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[SBIconListPageControl setLegibilitySettings:](self->_pageControl, "setLegibilitySettings:", v3);
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFolderView _updateTitleLegibilitySettings](self, "_updateTitleLegibilitySettings");
    -[SBFolderView _updateIconListLegibilitySettings](self, "_updateIconListLegibilitySettings");
  }

}

- (id)accessibilityTintColorForRect:(CGRect)a3 tintStyle:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFolderView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "folderView:accessibilityTintColorForRect:", self, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  SBHomeAccessibilityTintColor(a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityLegibilitySettingsForRect:(CGRect)a3 tintStyle:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFolderView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "folderView:accessibilityTintColorForRect:", self, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  SBHomeAccessibilityTintLegibiliitySettings(a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  return (NSString *)-[SBFolderView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolderView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dragDelegate
{
  id v3;
  void *v4;

  -[SBFolderView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "draggingDelegateForFolderView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  self->_addsFocusGuidesForWrapping = a3;
}

- (void)setScrollingUsingDecelerationAnimation:(BOOL)a3
{
  self->_scrollingUsingDecelerationAnimation = a3;
}

- (UIPanGestureRecognizer)scrollingDisabledGestureRecognizer
{
  return self->_scrollingDisabledGestureRecognizer;
}

- (void)setScrollingDisabledGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingDisabledGestureRecognizer, a3);
}

- (BOOL)isRegisteredForIdleUpdates
{
  return self->_registeredForIdleUpdates;
}

- (void)setRegisteredForIdleUpdates:(BOOL)a3
{
  self->_registeredForIdleUpdates = a3;
}

- (unint64_t)extraPageCountDuringScrolling
{
  return self->_extraPageCountDuringScrolling;
}

- (void)setExtraPageCountDuringScrolling:(unint64_t)a3
{
  self->_extraPageCountDuringScrolling = a3;
}

- (unint64_t)currentPageType
{
  return self->_currentPageType;
}

- (void)setCurrentPageType:(unint64_t)a3
{
  self->_currentPageType = a3;
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (BOOL)automaticallyCreatesIconListViews
{
  return self->_automaticallyCreatesIconListViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingDisabledGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconsNeedingSlideInAnimator, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_rotationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_scrollCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_scrollFrames, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_autoScrollDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_parallaxDisabledReasons, 0);
  objc_storeStrong((id *)&self->_scrollViewIsScrollingOverrides, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageControlDisabledReasons, 0);
  objc_storeStrong((id *)&self->_scrollingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_iconListViews, 0);
}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "Telling page at index %lu to hide all icons", a5, a6, a7, a8, 0);
}

void __78__SBFolderView_updateVisibleColumnRangeWithTotalLists_iconVisibilityHandling___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "Telling page at index %lu to show all icons", a5, a6, a7, a8, 0);
}

@end
