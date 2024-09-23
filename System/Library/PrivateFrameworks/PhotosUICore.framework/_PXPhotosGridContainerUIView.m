@implementation _PXPhotosGridContainerUIView

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosGridContainerUIView;
  v4 = a3;
  -[_PXPhotosGridContainerUIView willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);
  -[_PXPhotosGridContainerUIView delegate](self, "delegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView:willMoveToWindow:", self, v4);

}

- (_PXPhotosGridContainerDelegate)delegate
{
  return (_PXPhotosGridContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
