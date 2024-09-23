@implementation PXGScrollViewModel

- (PXGScrollViewModel)init
{
  PXGScrollViewModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewModel;
  result = -[PXGScrollViewModel init](&v3, sel_init);
  if (result)
    result->_transfersScrollToContainer = 1;
  return result;
}

- (void)performChanges:(id)a3 options:(unint64_t)a4
{
  id v6;
  unint64_t changesOptions;
  NSObject *v9;
  unint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  changesOptions = self->_changesOptions;
  if ((changesOptions & 4) == 0 && changesOptions && changesOptions != a4)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = self->_changesOptions;
      *(_DWORD *)buf = 134218240;
      v13 = a4;
      v14 = 2048;
      v15 = v10;
      _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "changes with origin %li nested within different origin %li", buf, 0x16u);
    }

  }
  self->_changesOptions = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXGScrollViewModel;
  -[PXGScrollViewModel performChanges:](&v11, sel_performChanges_, v6);

}

- (void)didEndChangeHandling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGScrollViewModel;
  -[PXGScrollViewModel didEndChangeHandling](&v3, sel_didEndChangeHandling);
  self->_changesOptions = 0;
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  if (a3.x != self->_contentOffset.x || a3.y != self->_contentOffset.y)
  {
    self->_contentOffset = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setScrollRegime:(int64_t)a3
{
  if (self->_scrollRegime != a3)
  {
    self->_scrollRegime = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setScrollDecelerationRate:(int64_t)a3
{
  if (self->_scrollDecelerationRate != a3)
  {
    self->_scrollDecelerationRate = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)stopScrolling
{
  -[PXGScrollViewModel signalChange:](self, "signalChange:", 16);
}

- (void)setClipsToBounds:(BOOL)a3
{
  if (self->_clipsToBounds != a3)
  {
    self->_clipsToBounds = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 256);
  }
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  if (self->_showsHorizontalScrollIndicator != a3)
  {
    self->_showsHorizontalScrollIndicator = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  if (self->_showsVerticalScrollIndicator != a3)
  {
    self->_showsVerticalScrollIndicator = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  if (self->_alwaysBounceHorizontal != a3)
  {
    self->_alwaysBounceHorizontal = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  if (self->_alwaysBounceVertical != a3)
  {
    self->_alwaysBounceVertical = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_horizontalScrollIndicatorInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_horizontalScrollIndicatorInsets = &self->_horizontalScrollIndicatorInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_horizontalScrollIndicatorInsets->top = top;
    p_horizontalScrollIndicatorInsets->left = left;
    p_horizontalScrollIndicatorInsets->bottom = bottom;
    p_horizontalScrollIndicatorInsets->right = right;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_verticalScrollIndicatorInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_verticalScrollIndicatorInsets = &self->_verticalScrollIndicatorInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_verticalScrollIndicatorInsets->top = top;
    p_verticalScrollIndicatorInsets->left = left;
    p_verticalScrollIndicatorInsets->bottom = bottom;
    p_verticalScrollIndicatorInsets->right = right;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_hitTestContentInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_hitTestContentInsets = &self->_hitTestContentInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_hitTestContentInsets->top = top;
    p_hitTestContentInsets->left = left;
    p_hitTestContentInsets->bottom = bottom;
    p_hitTestContentInsets->right = right;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  if (self->_horizontalInterPageSpacing != a3)
  {
    self->_horizontalInterPageSpacing = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    -[PXGScrollViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  int64_t scrollRegime;
  int64_t scrollDecelerationRate;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  scrollRegime = self->_scrollRegime;
  scrollDecelerationRate = self->_scrollDecelerationRate;
  if (self->_clipsToBounds)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  if (self->_showsHorizontalScrollIndicator)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v14 = v13;
  if (self->_showsVerticalScrollIndicator)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v15;
  if (self->_draggingPerformsScroll)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = v17;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; contentSize={%g, %g}; contentOffset={%g, %g}; scrollRegime=%ti; scrollDecelerationRate=%ti; clipsToBounds=%@; showsHorizontalScrollIndicator=%@; showsVerticalScrollIndicator=%@; draggingPerformsScroll=%@>"),
    v4,
    self,
    *(_QWORD *)&width,
    *(_QWORD *)&height,
    *(_QWORD *)&x,
    *(_QWORD *)&y,
    scrollRegime,
    scrollDecelerationRate,
    v12,
    v14,
    v16,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)scrollRegime
{
  return self->_scrollRegime;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_horizontalScrollIndicatorInsets.top;
  left = self->_horizontalScrollIndicatorInsets.left;
  bottom = self->_horizontalScrollIndicatorInsets.bottom;
  right = self->_horizontalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_verticalScrollIndicatorInsets.top;
  left = self->_verticalScrollIndicatorInsets.left;
  bottom = self->_verticalScrollIndicatorInsets.bottom;
  right = self->_verticalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestContentInsets.top;
  left = self->_hitTestContentInsets.left;
  bottom = self->_hitTestContentInsets.bottom;
  right = self->_hitTestContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)draggingPerformsScroll
{
  return self->_draggingPerformsScroll;
}

- (BOOL)transfersScrollToContainer
{
  return self->_transfersScrollToContainer;
}

- (double)horizontalInterPageSpacing
{
  return self->_horizontalInterPageSpacing;
}

- (unint64_t)changesOptions
{
  return self->_changesOptions;
}

@end
