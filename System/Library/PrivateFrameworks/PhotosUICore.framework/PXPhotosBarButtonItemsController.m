@implementation PXPhotosBarButtonItemsController

- (PXPhotosBarButtonItemsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarButtonItemsController.m"), 47, CFSTR("%s is not available as initializer"), "-[PXPhotosBarButtonItemsController init]");

  abort();
}

- (PXPhotosBarButtonItemsController)initWithExtendedTraitCollection:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  PXPhotosBarButtonItemsController *v8;
  _PXPhotosBarButtonSpecManager *v9;
  _PXPhotosBarButtonSpecManager *specManager;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosBarButtonItemsController;
  v8 = -[PXPhotosBarButtonItemsController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PXFeatureSpecManager initWithExtendedTraitCollection:]([_PXPhotosBarButtonSpecManager alloc], "initWithExtendedTraitCollection:", v6);
    specManager = v8->_specManager;
    v8->_specManager = v9;

    objc_storeStrong((id *)&v8->_viewModel, a4);
  }

  return v8;
}

- (id)createBarButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return -[PXPhotosBarButtonItemsController _createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:](self, "_createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:", a3, 0, 0, a4, a5, a6);
}

- (id)createBarButtonItemWithSystemItem:(int64_t)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return -[PXPhotosBarButtonItemsController _createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:](self, "_createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:", 0, a3, 0, a4, a5, a6);
}

- (id)createBarButtonItemWithSystemIconName:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return -[PXPhotosBarButtonItemsController _createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:](self, "_createBarButtonItemWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:", 0, 0, a3, a4, a5, a6);
}

- (id)_createBarButtonItemWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8
{
  id v14;
  id v15;
  id v16;
  _PXPhotosBarButtonView *v17;
  void *v18;
  void *v19;
  _PXPhotosBarButtonView *v20;
  void *v21;

  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = [_PXPhotosBarButtonView alloc];
  -[PXPhotosBarButtonItemsController specManager](self, "specManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosBarButtonItemsController viewModel](self, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_PXPhotosBarButtonView initWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:specManager:viewModel:](v17, "initWithTitle:orSystemItem:orSystemIconName:target:action:menuAction:specManager:viewModel:", v16, a4, v15, v14, a7, a8, v18, v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v20);
  -[_PXPhotosBarButtonView setBarButtonItem:](v20, "setBarButtonItem:", v21);

  return v21;
}

- (_PXPhotosBarButtonSpecManager)specManager
{
  return self->_specManager;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
}

@end
