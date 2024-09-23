@implementation _UIEditMenuCollectionView

- (void)setPages:(id)a3
{
  double v4;

  objc_storeStrong((id *)&self->_pages, a3);
  -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", (double)self->_targetPage);
  self->_targetPage = (uint64_t)v4;
}

- (double)currentPage
{
  double result;

  -[UIScrollView contentOffset](self, "contentOffset");
  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0);
  return result;
}

- (double)pageProgressForContentOffset:(CGPoint)a3 clamped:(BOOL)a4
{
  _BOOL4 v4;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UIEditMenuCollectionView pages](self, "pages", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      if (x <= 0.0)
        break;
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
      objc_msgSend(v13, "width");
      v15 = v14;
      objc_msgSend(v13, "overlapWidth");
      v17 = fmin(x, v15 - v16);
      objc_msgSend(v13, "width");
      v19 = v18;
      objc_msgSend(v13, "overlapWidth");
      v11 = v11 + v17 / (v19 - v20);
      x = x - v17;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v11 = 0.0;
  }

  if (v4)
  {
    -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", v11);
    return v21;
  }
  return v11;
}

- (CGPoint)contentOffsetForPage:(int64_t)a3
{
  NSArray *pages;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v12 = &unk_18685B0AF;
  v13 = *MEMORY[0x1E0C9D538];
  pages = self->_pages;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___UIEditMenuCollectionView_contentOffsetForPage___block_invoke;
  v8[3] = &unk_1E16DAA98;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](pages, "enumerateObjectsUsingBlock:", v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)viewWidthForPageProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double result;

  if (!-[NSArray count](self->_pages, "count"))
    return 0.0;
  -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", a3);
  v6 = v5;
  -[NSArray count](self->_pages, "count");
  -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", floor(v6));
  v8 = (uint64_t)v7;
  -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", (double)((uint64_t)v7 + 1));
  v10 = (uint64_t)v9;
  v11 = (double)(uint64_t)v9 - v6;
  -[NSArray objectAtIndex:](self->_pages, "objectAtIndex:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "width");
  v14 = v13;

  -[NSArray objectAtIndex:](self->_pages, "objectAtIndex:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "width");
  v17 = v16;

  -[UIView _currentScreenScale](self, "_currentScreenScale");
  UIRoundToScale(v11 * v14 + (1.0 - v11) * v17, v18);
  return result;
}

- (void)resetTargetPage
{
  self->_targetPage = 0;
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)incrementTargetPage
{
  unint64_t targetPage;

  targetPage = self->_targetPage;
  if (targetPage < -[NSArray count](self->_pages, "count") - 1)
  {
    ++self->_targetPage;
    -[_UIEditMenuCollectionView scrollToTargetPageAnimated:](self, "scrollToTargetPageAnimated:", 1);
  }
}

- (void)decrementTargetPage
{
  int64_t targetPage;
  BOOL v3;
  int64_t v4;

  targetPage = self->_targetPage;
  v3 = targetPage < 1;
  v4 = targetPage - 1;
  if (!v3)
  {
    self->_targetPage = v4;
    -[_UIEditMenuCollectionView scrollToTargetPageAnimated:](self, "scrollToTargetPageAnimated:", 1);
  }
}

- (void)scrollToTargetPageAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  if (!-[NSArray count](self->_pages, "count"))
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v3)
      goto LABEL_3;
LABEL_7:
    -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v7, v9);
    return;
  }
  -[NSArray objectAtIndex:](self->_pages, "objectAtIndex:", self->_targetPage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuCollectionView contentOffsetForPage:](self, "contentOffsetForPage:", self->_targetPage);
  v7 = v6;
  v9 = v8;

  if (!v3)
    goto LABEL_7;
LABEL_3:
  if (qword_1ECD79EA0 != -1)
    dispatch_once(&qword_1ECD79EA0, &__block_literal_global_415);
  -[UIScrollView _setContentOffset:animation:](self, "_setContentOffset:animation:", _MergedGlobals_1_16, v7, v9);
}

- (double)clampedPageForPageProgress:(double)a3
{
  return fmax(fmin(a3, (double)-[NSArray count](self->_pages, "count") + -1.0), 0.0);
}

- (void)_prepareToPageWithHorizontalVelocity:(double)a3 verticalVelocity:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;

  -[UIView bounds](self, "bounds", a3, a4);
  v7 = v6;
  -[UIScrollView _pagingOrigin](self, "_pagingOrigin");
  v9 = v8;
  v10 = -[NSArray count](self->_pages, "count");
  -[_UIEditMenuCollectionView targetPage](self, "targetPage");
  -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
  v12 = v11;
  -[UIScrollView contentOffset](self, "contentOffset");
  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0);
  v14 = v13;
  -[_UIEditMenuCollectionView pages](self, "pages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = floor(v14);
    if (v16 == v14 && (-[UIScrollView contentOffset](self, "contentOffset"), v17 >= v9))
    {

      if (v14 <= (double)v10 + -1.0)
        goto LABEL_13;
    }
    else
    {

    }
    if (a3 <= 0.3)
    {
      if (a3 >= -0.3)
        v16 = round(v14);
    }
    else
    {
      v16 = ceil(v14);
    }
    -[_UIEditMenuCollectionView clampedPageForPageProgress:](self, "clampedPageForPageProgress:", (double)(uint64_t)v16);
    v19 = (uint64_t)v18;
    -[_UIEditMenuCollectionView contentOffsetForPage:](self, "contentOffsetForPage:", (uint64_t)v18);
    v7 = v20;
    v12 = v21;
    if (!v19)
    {
      -[UIScrollView _firstPageOffset](self, "_firstPageOffset");
      v7 = v7 + v22;
    }
  }
  else
  {

  }
LABEL_13:
  -[UIScrollView _setPageDecelerationTarget:](self, "_setPageDecelerationTarget:", v7, v12);
}

- (BOOL)_contentOffsetIsAtPagingBoundary:(CGPoint)a3
{
  double v3;

  -[_UIEditMenuCollectionView pageProgressForContentOffset:clamped:](self, "pageProgressForContentOffset:clamped:", 0, a3.x, a3.y);
  return v3 == round(v3);
}

- (NSArray)pages
{
  return self->_pages;
}

- (int64_t)targetPage
{
  return self->_targetPage;
}

- (void)setTargetPage:(int64_t)a3
{
  self->_targetPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pages, 0);
}

@end
