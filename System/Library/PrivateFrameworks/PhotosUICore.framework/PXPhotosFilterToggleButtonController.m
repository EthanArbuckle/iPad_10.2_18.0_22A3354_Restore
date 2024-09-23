@implementation PXPhotosFilterToggleButtonController

- (PXPhotosFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4
{
  id v7;
  PXPhotosFilterToggleButtonController *v8;
  PXPhotosFilterToggleButtonController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosFilterToggleButtonController;
  v8 = -[PXContentFilterToggleButtonController initWithButtonConfiguration:roundedButton:](&v11, sel_initWithButtonConfiguration_roundedButton_, a4, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](v9->_viewModel, "registerChangeObserver:context:", v9, PXPhotosViewModelObserverContext);
    -[PXPhotosFilterToggleButtonController _updateContentFilterState](v9, "_updateContentFilterState");
  }

  return v9;
}

- (PXPhotosFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosFilterToggleButtonController.m"), 41, CFSTR("%s is not available as initializer"), "-[PXPhotosFilterToggleButtonController initWithButtonConfiguration:roundedButton:]");

  abort();
}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  _QWORD v9[4];
  UIColor *v10;

  v5 = (UIColor *)a3;
  v6 = self->_foregroundColor;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_foregroundColor, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__PXPhotosFilterToggleButtonController_setForegroundColor___block_invoke;
      v9[3] = &unk_1E51321B0;
      v10 = v5;
      -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v9);

    }
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  _QWORD v9[4];
  UIColor *v10;

  v5 = (UIColor *)a3;
  v6 = self->_backgroundColor;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__PXPhotosFilterToggleButtonController_setBackgroundColor___block_invoke;
      v9[3] = &unk_1E51321B0;
      v10 = v5;
      -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v9);

    }
  }

}

- (void)_updateContentFilterState
{
  id v3;

  -[PXPhotosViewModel contentFilterState](self->_viewModel, "contentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContentFilterToggleButtonController setContentFilterState:](self, "setContentFilterState:", v3);

}

- (id)filterMenuItems
{
  PXPhotosGridShowFiltersMenuActionPerformer *v3;
  void *v4;
  PXPhotosGridShowFiltersMenuActionPerformer *v5;
  void *v6;

  v3 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
  -[PXPhotosFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](v3, "initWithViewModel:actionType:", v4, CFSTR("PXPhotosGridActionShowFiltersMenu"));

  -[PXPhotosGridShowFiltersMenuActionPerformer filterMenuItems](v5, "filterMenuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)viewOptionsMenuItems
{
  PXPhotosGridShowFiltersMenuActionPerformer *v3;
  void *v4;
  PXPhotosGridShowFiltersMenuActionPerformer *v5;
  void *v6;

  v3 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
  -[PXPhotosFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](v3, "initWithViewModel:actionType:", v4, CFSTR("PXPhotosGridActionShowFiltersMenu"));

  -[PXPhotosGridShowFiltersMenuActionPerformer viewOptionsMenuItems](v5, "viewOptionsMenuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allMenuItems
{
  void *v4;
  PXPhotosGridShowFiltersMenuActionPerformer *v5;
  void *v6;
  PXPhotosGridShowFiltersMenuActionPerformer *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  -[PXPhotosFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [PXPhotosGridShowFiltersMenuActionPerformer alloc];
    -[PXPhotosFilterToggleButtonController viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](v5, "initWithViewModel:actionType:", v6, CFSTR("PXPhotosGridActionShowFiltersMenu"));

    -[PXContentFilterToggleButtonController button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setSender:](v7, "setSender:", v8);

    if (!v7)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_8;
    }
    -[PXPhotosGridShowFiltersMenuActionPerformer menuElement](v7, "menuElement");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v9, "children");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

LABEL_8:
        return v11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosFilterToggleButtonController.m"), 94, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("filterMenuElement"), v15, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosFilterToggleButtonController.m"), 94, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("filterMenuElement"), v15);
    }

    goto LABEL_5;
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)PXPhotosViewModelObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosFilterToggleButtonController.m"), 112, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x2000000) != 0)
    -[PXPhotosFilterToggleButtonController _updateContentFilterState](self, "_updateContentFilterState");
  if ((*(_QWORD *)&v6 & 0x9C000) != 0)
    -[PXContentFilterToggleButtonController invalidateButtonMenu](self, "invalidateButtonMenu");

}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

uint64_t __59__PXPhotosFilterToggleButtonController_setBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBaseBackgroundColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__PXPhotosFilterToggleButtonController_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSecondaryTintColor:", *(_QWORD *)(a1 + 32));
}

@end
