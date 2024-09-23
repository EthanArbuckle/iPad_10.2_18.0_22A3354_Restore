@implementation _PXPhotosGridFooterMaskView

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosGridFooterMaskView;
  -[_PXPhotosGridFooterMaskView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_PXPhotosGridFooterMaskView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerMaskViewDidMoveToWindow:", self);

}

- (_PXPhotosGridFooterMaskViewDelegate)delegate
{
  return (_PXPhotosGridFooterMaskViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
