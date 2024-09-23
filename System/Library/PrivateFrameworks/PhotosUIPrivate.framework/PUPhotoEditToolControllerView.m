@implementation PUPhotoEditToolControllerView

- (PUPhotoEditToolControllerView)initWithToolController:(id)a3
{
  id v4;
  PUPhotoEditToolControllerView *v5;
  PUPhotoEditToolControllerView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditToolControllerView;
  v5 = -[PUPhotoEditToolControllerView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PUPhotoEditToolControllerView setToolController:](v5, "setToolController:", v4);

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PUPhotoEditToolControllerView *v11;
  id v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUPhotoEditToolControllerView toolController](self, "toolController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toolControllerHitEventForwardView:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (v16.receiver = self,
        v16.super_class = (Class)PUPhotoEditToolControllerView,
        -[PUPhotoEditToolControllerView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y),
        v11 = (PUPhotoEditToolControllerView *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11 == self))
  {
    v12 = v10;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUPhotoEditToolControllerView;
    -[PUPhotoEditToolControllerView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (PUPhotoEditToolController)toolController
{
  return (PUPhotoEditToolController *)objc_loadWeakRetained((id *)&self->_toolController);
}

- (void)setToolController:(id)a3
{
  objc_storeWeak((id *)&self->_toolController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toolController);
}

@end
