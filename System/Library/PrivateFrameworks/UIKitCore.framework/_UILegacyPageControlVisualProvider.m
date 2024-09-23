@implementation _UILegacyPageControlVisualProvider

- (void)prepare
{
  NSMutableArray *v3;
  NSMutableArray *pageImages;
  NSMutableArray *v5;
  NSMutableArray *currentPageImages;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UILegacyPageControlVisualProvider;
  -[_UIPageControlVisualProvider prepare](&v7, sel_prepare);
  if (-[UIPageControl _implementsCustomPageImagesOverride](self->super._pageControl, "_implementsCustomPageImagesOverride"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    pageImages = self->_pageImages;
    self->_pageImages = v3;

  }
  if (-[UIPageControl _implementsCustomCurrentPageImagesOverride](self->super._pageControl, "_implementsCustomCurrentPageImagesOverride"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    currentPageImages = self->_currentPageImages;
    self->_currentPageImages = v5;

  }
}

- (void)pruneArchivedSubviews:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v5 = self->_indicators;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)didUpdateNumberOfPages
{
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *indicators;
  void *v7;
  void *v8;
  void *v9;

  -[_UILegacyPageControlVisualProvider _cachePageIndicatorImages](self, "_cachePageIndicatorImages");
  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  v3 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
  v4 = -[NSMutableArray count](self->_indicators, "count");
  if (v3 <= v4)
  {
    if (v3 < 1)
    {
      -[NSMutableArray makeObjectsPerformSelector:](self->_indicators, "makeObjectsPerformSelector:", sel_removeFromSuperview);
      -[NSMutableArray removeAllObjects](self->_indicators, "removeAllObjects");
    }
    else
    {
      while (v4 > v3)
      {
        -[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", --v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");
        -[NSMutableArray removeObjectAtIndex:](self->_indicators, "removeObjectAtIndex:", v4);

      }
    }
  }
  else
  {
    if (!self->_indicators)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      indicators = self->_indicators;
      self->_indicators = v5;

    }
    do
    {
      -[_UILegacyPageControlVisualProvider _indicatorViewEnabled:index:](self, "_indicatorViewEnabled:index:", v4 == -[UIPageControl currentPage](self->super._pageControl, "currentPage"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILegacyPageControlVisualProvider effectiveContentView](self, "effectiveContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      -[NSMutableArray addObject:](self->_indicators, "addObject:", v7);
      ++v4;
    }
    while (v3 != v4);
  }
}

- (void)didUpdatePageIndicatorTintColor
{
  uint64_t v3;

  v3 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
  if (v3 > 1 || v3 == 1 && self->super._displayedPage)
    -[_UILegacyPageControlVisualProvider invalidateIndicators](self, "invalidateIndicators");
}

- (void)didEndTrackingWithTouch:(id)a3
{
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIPageControl *pageControl;
  uint64_t v16;
  double v17;
  _BOOL4 v18;
  NSInteger v19;
  id v20;

  v20 = a3;
  v4 = -[UIControl isTouchInside](self->super._pageControl, "isTouchInside");
  v5 = v20;
  if (v4)
  {
    objc_msgSend(v20, "locationInView:", self->super._pageControl);
    v7 = v6;
    v8 = -[UIPageControl currentPage](self->super._pageControl, "currentPage");
    v9 = -[UIPageControl defersCurrentPageDisplay](self->super._pageControl, "defersCurrentPageDisplay");
    v10 = -[UIView _shouldReverseLayoutDirection](self->super._pageControl, "_shouldReverseLayoutDirection");
    -[UIView bounds](self->super._pageControl, "bounds");
    v12 = v11;
    v14 = v13;
    if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") == 2
      && (v8 & 0x8000000000000000) == 0)
    {
      pageControl = self->super._pageControl;
      v16 = v8 == 0;
LABEL_14:
      -[UIPageControl _updateCurrentPage:updateDisplayImmediately:](pageControl, "_updateCurrentPage:updateDisplayImmediately:", v16, !v9);
      -[UIPageControl _emitValueChanged](self->super._pageControl, "_emitValueChanged");
      v5 = v20;
      goto LABEL_15;
    }
    v17 = v12 + v14 * 0.5;
    if (v10)
      v18 = v7 >= v17;
    else
      v18 = v7 <= v17;
    if (v18)
    {
      v16 = v8 - 1;
      v5 = v20;
      if (v8 >= 1)
      {
        pageControl = self->super._pageControl;
        goto LABEL_14;
      }
    }
    else
    {
      v5 = v20;
      if ((v8 & 0x8000000000000000) == 0)
      {
        v19 = -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages");
        v5 = v20;
        if (v8 < v19 - 1)
        {
          pageControl = self->super._pageControl;
          v16 = v8 + 1;
          goto LABEL_14;
        }
      }
    }
  }
LABEL_15:

}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  double v4;
  double v5;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3)
  {
    v7 = 0;
    v8 = a3 - 1;
    do
    {
      if (v7 < v8)
      {
        -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
        v4 = v4 + v9;
      }
      ++v7;
    }
    while (a3 != v7);
  }
  -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
  v11 = v4 + v10;
  -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
  v13 = v5 + v12 + 30.0;
  v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v5 = -[NSMutableArray count](self->_indicators, "count");
  if (v5)
  {
    v6 = v5;
    if (v5 != 1 || !-[UIPageControl hidesForSinglePage](self->super._pageControl, "hidesForSinglePage"))
    {
      -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
      v8 = v4 + v7 * (double)(v6 - 1);
      if (v6 >= 1)
      {
        for (i = 0; i != v6; ++i)
        {
          if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", i, i == -[UIPageControl currentPage](self->super._pageControl, "currentPage")))
          {
            -[_UILegacyPageControlVisualProvider _indicatorFrameAtIndex:](self, "_indicatorFrameAtIndex:", i);
            v8 = v8 + v10;
          }
        }
      }
      -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
      v12 = v8 + v11;
      -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
      v3 = v3 + v13 + 30.0;
      v4 = v12 + 0.0;
    }
  }
  v14 = v4;
  v15 = v3;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[_UILegacyPageControlVisualProvider intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[UIView superview](self->super._pageControl, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIView superview](self->super._pageControl, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v5 = v10;

  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIPageControl *pageControl;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;

  -[UIView bounds](self->super._pageControl, "bounds");
  -[UIView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
  v3 = -[NSMutableArray count](self->_indicators, "count");
  if (v3)
  {
    v4 = v3;
    if (v3 != 1 || !-[UIPageControl hidesForSinglePage](self->super._pageControl, "hidesForSinglePage"))
    {
      -[UIView bounds](self->super._pageControl, "bounds");
      v6 = v5;
      -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
      v8 = v7 * (double)(v4 - 1) + 0.0;
      if (v4 >= 1)
      {
        for (i = 0; i != v4; ++i)
        {
          if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", i, i == -[UIPageControl currentPage](self->super._pageControl, "currentPage")))
          {
            -[_UILegacyPageControlVisualProvider _indicatorFrameAtIndex:](self, "_indicatorFrameAtIndex:", i);
            v8 = v8 + v10;
          }
        }
      }
      -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
      UIRoundToViewScale(self->super._pageControl);
      v12 = v11;
      -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
      if (v4 >= 1)
      {
        v14 = 0;
        if ((*((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4) & 0x80000) != 0)
          v15 = v6 - (v12 + v13 * 0.5);
        else
          v15 = v12 + v13 * 0.5;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UILegacyPageControlVisualProvider _indicatorFrameAtIndex:](self, "_indicatorFrameAtIndex:", v14);
          if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", v14, v14 == -[UIPageControl currentPage](self->super._pageControl, "currentPage")))
          {
            -[_UILegacyPageControlVisualProvider _indicatorFrameAtIndex:](self, "_indicatorFrameAtIndex:", v14);
            v18 = v17;
            -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
            v20 = v19 + v18;
            pageControl = self->super._pageControl;
            if ((*((_DWORD *)&pageControl->super.super._viewFlags + 4) & 0x80000) != 0)
            {
              if (!v14)
              {
                -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
                v15 = v15 + v22;
                pageControl = self->super._pageControl;
              }
              v15 = v15 - v20;
            }
            UIRoundToViewScale(pageControl);
            v24 = v23;
            UIRoundToViewScale(self->super._pageControl);
            objc_msgSend(v16, "setOrigin:", v24, v25);
            v26 = -0.0;
            if ((*((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4) & 0x80000) == 0)
              v26 = v20;
            v15 = v15 + v26;
          }
          else
          {
            UIRoundToViewScale(self->super._pageControl);
            v28 = v27;
            UIRoundToViewScale(self->super._pageControl);
            v30 = v29;
            v31 = *((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4);
            -[_UILegacyPageControlVisualProvider _indicatorSpacing](self, "_indicatorSpacing");
            if ((*(_QWORD *)&v31 & 0x80000) != 0)
              v32 = -v32;
            v15 = v15 + v32;
            objc_msgSend(v16, "setOrigin:", v28, v30);
          }

          ++v14;
        }
        while (v4 != v14);
      }
    }
  }
}

- (void)invalidateIndicators
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSInteger v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIView invalidateIntrinsicContentSize](self->super._pageControl, "invalidateIntrinsicContentSize");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_indicators;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_indicators, "removeAllObjects");
  if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") >= 1)
  {
    v8 = 0;
    do
    {
      -[_UILegacyPageControlVisualProvider _indicatorViewEnabled:index:](self, "_indicatorViewEnabled:index:", v8 == -[UIPageControl currentPage](self->super._pageControl, "currentPage", (_QWORD)v10), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self->super._pageControl, "addSubview:", v9);
      -[NSMutableArray addObject:](self->_indicators, "addObject:", v9);

      ++v8;
    }
    while (v8 < -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"));
  }
  -[UIPageControl setCurrentPage:](self->super._pageControl, "setCurrentPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage", (_QWORD)v10));
  -[UIView setNeedsLayout](self->super._pageControl, "setNeedsLayout");
}

- (id)effectiveContentView
{
  void *pageControl;
  void *v4;
  id v5;

  -[UIVisualEffectView contentView](self->_backgroundVisualEffectView, "contentView");
  pageControl = (void *)objc_claimAutoreleasedReturnValue();
  v4 = pageControl;
  if (!pageControl)
    pageControl = self->super._pageControl;
  v5 = pageControl;

  return v5;
}

- (void)updateDisplayedPageToCurrentPage
{
  -[_UILegacyPageControlVisualProvider _setDisplayedPage:](self, "_setDisplayedPage:", -[UIPageControl currentPage](self->super._pageControl, "currentPage"));
}

- (void)_setDisplayedPage:(int64_t)a3
{
  int64_t displayedPage;
  void *v6;
  id v7;

  displayedPage = self->super._displayedPage;
  if (displayedPage != a3)
  {
    if ((displayedPage & 0x8000000000000000) == 0
      && displayedPage < -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"))
    {
      -[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", self->super._displayedPage);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILegacyPageControlVisualProvider _transitionIndicator:toEnabled:index:](self, "_transitionIndicator:toEnabled:index:", v6, 0, self->super._displayedPage);

    }
    self->super._displayedPage = -1;
    if ((a3 & 0x8000000000000000) == 0
      && -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") > a3)
    {
      self->super._displayedPage = a3;
      -[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[_UILegacyPageControlVisualProvider _transitionIndicator:toEnabled:index:](self, "_transitionIndicator:toEnabled:index:", v7, 1, a3);

    }
  }
}

- (CGRect)_indicatorFrameAtIndex:(int64_t)a3
{
  void *v5;
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
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", a3, self->super._displayedPage == a3))
  {
    -[NSMutableArray objectAtIndex:](self->_indicators, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_indicatorSpacing
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 16.0;
  -[UIPageControl _indicatorSpacing](self->super._pageControl, "_indicatorSpacing");
  return result;
}

- (CGRect)_modernBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v4 = 7.0;
  v5 = 7.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_modernCornerRadius
{
  double v2;

  -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
  return v2 * 0.5;
}

- (id)_modernColorEnabled:(BOOL)a3
{
  UIPageControl *pageControl;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  pageControl = self->super._pageControl;
  if (a3)
  {
    -[UIPageControl currentPageIndicatorTintColor](pageControl, "currentPageIndicatorTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    -[UIPageControl pageIndicatorTintColor](pageControl, "pageIndicatorTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[UIView traitCollection](self->super._pageControl, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, dbl_1866842D0[objc_msgSend(v8, "userInterfaceIdiom") == 3]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v7 = v5;
  v6 = v7;
LABEL_8:

  return v6;
}

- (BOOL)_hasCustomImageForPage:(int64_t)a3 enabled:(BOOL)a4
{
  NSInteger v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;

  v6 = -[UIPageControl currentPage](self->super._pageControl, "currentPage", a3, a4);
  v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UILegacyPageControlVisualProvider__pageImages[v6 == a3]);
  if (v7)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 != v9;

  }
  else
  {
    v11 = 5;
    if (v6 == a3)
      v11 = 4;
    return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UILegacyPageControlVisualProvider__pageImages[v11]) != 0;
  }
  return v10;
}

- (void)_transitionIndicator:(id)a3 toEnabled:(BOOL)a4 index:(int64_t)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", a5, v6))
  {
    if (v6)
      -[_UILegacyPageControlVisualProvider _cachedPageIndicatorCurrentImageForPage:](self, "_cachedPageIndicatorCurrentImageForPage:", a5);
    else
      -[_UILegacyPageControlVisualProvider _cachedPageIndicatorImageForPage:](self, "_cachedPageIndicatorImageForPage:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

  }
  else
  {
    -[_UILegacyPageControlVisualProvider _drawModernIndicatorInView:enabled:](self, "_drawModernIndicatorInView:enabled:", v9, v6);
  }

}

- (id)_indicatorViewEnabled:(BOOL)a3 index:(int64_t)a4
{
  _BOOL8 v5;
  UIImageView *v7;
  void *v8;

  v5 = a3;
  if (-[_UILegacyPageControlVisualProvider _hasCustomImageForPage:enabled:](self, "_hasCustomImageForPage:enabled:", a4, a3))
  {
    if (-[UIPageControl currentPage](self->super._pageControl, "currentPage") == a4)
      -[_UILegacyPageControlVisualProvider _cachedPageIndicatorCurrentImageForPage:](self, "_cachedPageIndicatorCurrentImageForPage:", a4);
    else
      -[_UILegacyPageControlVisualProvider _cachedPageIndicatorImageForPage:](self, "_cachedPageIndicatorImageForPage:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v8);

  }
  else
  {
    v7 = objc_alloc_init(UIView);
    -[_UILegacyPageControlVisualProvider _drawModernIndicatorInView:enabled:](self, "_drawModernIndicatorInView:enabled:", v7, v5);
  }
  -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  return v7;
}

- (void)_drawModernIndicatorInView:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v4 = a4;
  v6 = a3;
  -[_UILegacyPageControlVisualProvider _modernColorEnabled:](self, "_modernColorEnabled:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[_UILegacyPageControlVisualProvider _modernBounds](self, "_modernBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBounds:", v9, v11, v13, v15);

  -[_UILegacyPageControlVisualProvider _modernCornerRadius](self, "_modernCornerRadius");
  v18 = v17;
  objc_msgSend(v6, "layer");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setCornerRadius:", v18);
}

- (id)preferredIndicatorImage
{
  return _UIImageWithName(CFSTR("UIPageIndicator.png"));
}

- (id)defaultActivePageIndicatorImage
{
  return _UIImageWithName(CFSTR("UIPageIndicatorCurrent.png"));
}

- (id)_cachedPageIndicatorImageForPage:(int64_t)a3
{
  NSMutableArray *pageImages;
  void *v6;
  void *v7;

  pageImages = self->_pageImages;
  if (!pageImages)
    goto LABEL_4;
  -[NSMutableArray objectAtIndexedSubscript:](pageImages, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {

LABEL_4:
    -[_UILegacyPageControlVisualProvider _pageIndicatorImageForPage:](self, "_pageIndicatorImageForPage:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_cachedPageIndicatorCurrentImageForPage:(int64_t)a3
{
  NSMutableArray *currentPageImages;
  void *v6;
  void *v7;

  currentPageImages = self->_currentPageImages;
  if (!currentPageImages)
    goto LABEL_4;
  -[NSMutableArray objectAtIndexedSubscript:](currentPageImages, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {

LABEL_4:
    -[_UILegacyPageControlVisualProvider _pageIndicatorCurrentImageForPage:](self, "_pageIndicatorCurrentImageForPage:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_pageIndicatorImageForPage:(int64_t)a3
{
  UIImage *pageImage;

  pageImage = self->_pageImage;
  if (pageImage)
    return pageImage;
  -[_UILegacyPageControlVisualProvider preferredIndicatorImage](self, "preferredIndicatorImage", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pageIndicatorCurrentImageForPage:(int64_t)a3
{
  UIImage *currentPageImage;

  currentPageImage = self->_currentPageImage;
  if (currentPageImage)
    return currentPageImage;
  -[_UILegacyPageControlVisualProvider defaultActivePageIndicatorImage](self, "defaultActivePageIndicatorImage", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_cachePageIndicatorImages
{
  NSMutableArray *pageImages;
  void *v4;
  NSInteger v5;
  void *v6;
  char v7;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *currentPageImages;
  NSInteger v11;
  void *v12;
  char v13;
  NSMutableArray *v14;
  void *v15;
  id v16;

  pageImages = self->_pageImages;
  if (pageImages)
  {
    -[NSMutableArray removeAllObjects](pageImages, "removeAllObjects");
    -[_UILegacyPageControlVisualProvider preferredIndicatorImage](self, "preferredIndicatorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") >= 1)
    {
      v5 = 0;
      do
      {
        -[_UILegacyPageControlVisualProvider _pageIndicatorImageForPage:](self, "_pageIndicatorImageForPage:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v4, "isEqual:", v6);
        v8 = self->_pageImages;
        if ((v7 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v8, "addObject:", v9);

        }
        else
        {
          -[NSMutableArray addObject:](self->_pageImages, "addObject:", v6);
        }

        ++v5;
      }
      while (v5 < -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"));
    }

  }
  currentPageImages = self->_currentPageImages;
  if (currentPageImages)
  {
    -[NSMutableArray removeAllObjects](currentPageImages, "removeAllObjects");
    -[_UILegacyPageControlVisualProvider defaultActivePageIndicatorImage](self, "defaultActivePageIndicatorImage");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (-[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages") >= 1)
    {
      v11 = 0;
      do
      {
        -[_UILegacyPageControlVisualProvider _pageIndicatorCurrentImageForPage:](self, "_pageIndicatorCurrentImageForPage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "isEqual:", v12);
        v14 = self->_currentPageImages;
        if ((v13 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v14, "addObject:", v15);

        }
        else
        {
          -[NSMutableArray addObject:](self->_currentPageImages, "addObject:", v12);
        }

        ++v11;
      }
      while (v11 < -[UIPageControl numberOfPages](self->super._pageControl, "numberOfPages"));
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicators, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_pageImages, 0);
  objc_storeStrong((id *)&self->_currentPageImages, 0);
  objc_storeStrong((id *)&self->_pageImage, 0);
  objc_storeStrong((id *)&self->_currentPageImage, 0);
}

@end
