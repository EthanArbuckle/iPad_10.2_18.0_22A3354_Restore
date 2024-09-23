@implementation PLTileContainerView

- (PLTileContainerView)initWithFrame:(CGRect)a3 photoTileController:(id)a4
{
  PLTileContainerView *v5;
  PLTileContainerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLTileContainerView;
  v5 = -[PLTileContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    objc_msgSend((id)-[PLTileContainerView layer](v5, "layer"), "setEdgeAntialiasingMask:", 0);
    v6->_photoTileController = (PLPhotoTileViewController *)a4;
  }
  return v6;
}

- (PLTileContainerView)initWithFrame:(CGRect)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoTileViewController.m"), 134, CFSTR("Call -initWithFrame:photoTileController: or you get <rdar://problem/14272922> Comments using only half width of screen after swiping in landscape"));
  return 0;
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLTileContainerView;
  -[PLTileContainerView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  -[PLPhotoTileViewController _viewWillMoveToSuperView:](self->_photoTileController, "_viewWillMoveToSuperView:", a3);
}

- (void)clearBackReference
{
  self->_photoTileController = 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end
