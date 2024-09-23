@implementation _UIPageControlVisualProvider

- (void)setInteractionState:(int64_t)a3
{
  self->_interactionState = a3;
}

- (int64_t)interactionState
{
  return self->_interactionState;
}

- (void)prepare
{
  self->_displayedPage = -1;
  -[UIView setNeedsLayout](self->_pageControl, "setNeedsLayout");
}

- (_UIPageControlVisualProvider)initWithPageControl:(id)a3
{
  _UIPageControlVisualProvider *result;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIPageControlVisualProvider;
  result = -[_UIPageControlVisualProvider init](&v15, sel_init);
  if (result)
  {
    result->_pageControl = (UIPageControl *)a3;
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_activeTransformForTouchedPage.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_activeTransformForTouchedPage.c = v7;
    v8 = *(_OWORD *)(v5 + 32);
    *(_OWORD *)&result->_activeTransformForTouchedPage.tx = v8;
    *(_OWORD *)&result->_targetTransformForTouchedPage.a = v6;
    *(_OWORD *)&result->_targetTransformForTouchedPage.c = v7;
    *(_OWORD *)&result->_targetTransformForTouchedPage.tx = v8;
    v9 = (__int128 *)MEMORY[0x1E0CD2338];
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    *(_OWORD *)&result->_pageIndicatorVibrantColorMatrix.m24 = v12;
    *(_OWORD *)&result->_pageIndicatorVibrantColorMatrix.m33 = v11;
    v14 = *v9;
    *(_OWORD *)&result->_pageIndicatorVibrantColorMatrix.m11 = *v9;
    *(_OWORD *)&result->_pageIndicatorVibrantColorMatrix.m15 = v13;
    *(_OWORD *)&result->_pageIndicatorVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&result->_activePageIndicatorVibrantColorMatrix.m11 = v14;
    *(_OWORD *)&result->_activePageIndicatorVibrantColorMatrix.m33 = v11;
    *(_OWORD *)&result->_activePageIndicatorVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&result->_activePageIndicatorVibrantColorMatrix.m15 = v13;
    *(_OWORD *)&result->_activePageIndicatorVibrantColorMatrix.m24 = v12;
  }
  return result;
}

- (void)teardownPageControl
{
  self->_pageControl = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredActiveIndicatorImage, 0);
}

- (BOOL)shouldDisableTouchTracking
{
  return 0;
}

- (int64_t)displayedPage
{
  return self->_displayedPage;
}

- (void)setPage:(int64_t)a3 interactionState:(int64_t)a4
{
  -[UIPageControl _updateCurrentPage:updateDisplayImmediately:](self->_pageControl, "_updateCurrentPage:updateDisplayImmediately:", a3, 1);
  -[UIPageControl _emitValueChanged](self->_pageControl, "_emitValueChanged");
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImage)preferredIndicatorImage
{
  return 0;
}

- (id)customIndicatorImageForPage:(int64_t)a3
{
  return 0;
}

- (UIImage)preferredActiveIndicatorImage
{
  return 0;
}

- (id)customActiveIndicatorImageForPage:(int64_t)a3
{
  return 0;
}

- (double)indicatorOpacity
{
  return 1.0;
}

- (CGRect)indicatorFrameForPage:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIView)backgroundView
{
  return 0;
}

- (BOOL)supportsContinuousInteraction
{
  return 0;
}

- (void)setSupportsContinuousInteraction:(BOOL)a3
{
  self->_supportsContinuousInteraction = a3;
}

- (CGAffineTransform)activeTransformForTouchedPage
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setActiveTransformForTouchedPage:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_activeTransformForTouchedPage.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_activeTransformForTouchedPage.tx = v4;
  *(_OWORD *)&self->_activeTransformForTouchedPage.a = v3;
}

- (CGAffineTransform)targetTransformForTouchedPage
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].tx;
  return self;
}

- (void)setTargetTransformForTouchedPage:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransformForTouchedPage.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransformForTouchedPage.tx = v4;
  *(_OWORD *)&self->_targetTransformForTouchedPage.a = v3;
}

- (CAColorMatrix)pageIndicatorVibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].m24;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[2].m15;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[2].m33;
  v4 = *(_OWORD *)&self[2].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m42;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (void)setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_pageIndicatorVibrantColorMatrix.m11 = *(_OWORD *)&a3->m11;
  v3 = *(_OWORD *)&a3->m15;
  v4 = *(_OWORD *)&a3->m24;
  v5 = *(_OWORD *)&a3->m42;
  *(_OWORD *)&self->_pageIndicatorVibrantColorMatrix.m33 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_pageIndicatorVibrantColorMatrix.m42 = v5;
  *(_OWORD *)&self->_pageIndicatorVibrantColorMatrix.m15 = v3;
  *(_OWORD *)&self->_pageIndicatorVibrantColorMatrix.m24 = v4;
}

- (CAColorMatrix)activePageIndicatorVibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[3].m24;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[3].m15;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[3].m33;
  v4 = *(_OWORD *)&self[3].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m42;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (void)setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_activePageIndicatorVibrantColorMatrix.m11 = *(_OWORD *)&a3->m11;
  v3 = *(_OWORD *)&a3->m15;
  v4 = *(_OWORD *)&a3->m24;
  v5 = *(_OWORD *)&a3->m42;
  *(_OWORD *)&self->_activePageIndicatorVibrantColorMatrix.m33 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_activePageIndicatorVibrantColorMatrix.m42 = v5;
  *(_OWORD *)&self->_activePageIndicatorVibrantColorMatrix.m15 = v3;
  *(_OWORD *)&self->_activePageIndicatorVibrantColorMatrix.m24 = v4;
}

- (void)setPreferredActiveIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredActiveIndicatorImage, a3);
}

@end
