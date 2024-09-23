@implementation PXPhotosSortOrderButtonController

- (PXPhotosSortOrderButtonController)initWithModel:(id)a3
{
  id v5;
  PXPhotosSortOrderButtonController *v6;
  PXPhotosSortOrderButtonController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIButton *button;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosSortOrderButtonController;
  v6 = -[PXPhotosSortOrderButtonController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6, 14.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.arrow.down"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    button = v7->_button;
    v7->_button = (UIButton *)v11;

    -[PXPhotosSortOrderButtonController _updateButtonMenu](v7, "_updateButtonMenu");
    -[PXPhotosViewOptionsModel registerChangeObserver:context:](v7->_model, "registerChangeObserver:context:", v7, PXPhotosViewOptionsModelObserverContext_210893);

  }
  return v7;
}

- (void)_updateButtonMenu
{
  void *v3;

  -[PXPhotosViewOptionsModel sortOrderMenu](self->_model, "sortOrderMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](self->_button, "setMenu:", v3);

  -[UIButton setShowsMenuAsPrimaryAction:](self->_button, "setShowsMenuAsPrimaryAction:", 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXPhotosViewOptionsModelObserverContext_210893 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSortOrderButtonController.m"), 59, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x12) != 0)
  {
    v11 = v9;
    -[PXPhotosSortOrderButtonController _updateButtonMenu](self, "_updateButtonMenu");
    v9 = v11;
  }

}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
