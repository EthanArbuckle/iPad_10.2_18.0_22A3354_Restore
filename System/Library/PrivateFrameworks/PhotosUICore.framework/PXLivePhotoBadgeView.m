@implementation PXLivePhotoBadgeView

- (PXLivePhotoBadgeView)initWithFrame:(CGRect)a3
{
  PXLivePhotoBadgeView *v3;
  PXLivePhotoBadgeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLivePhotoBadgeView;
  v3 = -[PXLivePhotoBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXLivePhotoBadgeView _setUpContent](v3, "_setUpContent");
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.wantsPlayback = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setTrackedRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_trackedRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_trackedRect = &self->_trackedRect;
  if (!CGRectEqualToRect(a3, self->_trackedRect))
  {
    p_trackedRect->origin.x = x;
    p_trackedRect->origin.y = y;
    p_trackedRect->size.width = width;
    p_trackedRect->size.height = height;
  }
}

- (void)setWantsPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_delegateRespondsTo.wantsPlayback)
  {
    v3 = a3;
    -[PXLivePhotoBadgeView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "livePhotoBadgeView:wantsPlayback:", self, v3);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoBadgeView;
  -[PXLivePhotoBadgeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXLivePhotoBadgeView bounds](self, "bounds");
  -[PXLivePhotoBadgeView setTrackedRect:](self, "setTrackedRect:");
}

- (PXLivePhotoBadgeViewDelegate)delegate
{
  return (PXLivePhotoBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGRect)trackedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trackedRect.origin.x;
  y = self->_trackedRect.origin.y;
  width = self->_trackedRect.size.width;
  height = self->_trackedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
