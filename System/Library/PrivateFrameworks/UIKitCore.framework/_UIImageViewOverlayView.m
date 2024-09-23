@implementation _UIImageViewOverlayView

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIImageViewOverlayView;
  -[UIView setClipsToBounds:](&v6, sel_setClipsToBounds_);
  -[_UIImageViewOverlayView overlayViewDelegate](self, "overlayViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayView:didChangeClipsToBounds:", self, v3);

}

- (_UIImageViewOverlayViewDelegate)overlayViewDelegate
{
  return (_UIImageViewOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_overlayViewDelegate);
}

- (void)setOverlayViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overlayViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayViewDelegate);
}

@end
