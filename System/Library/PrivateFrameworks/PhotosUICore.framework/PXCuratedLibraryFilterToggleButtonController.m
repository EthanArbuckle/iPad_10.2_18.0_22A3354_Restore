@implementation PXCuratedLibraryFilterToggleButtonController

- (PXCuratedLibraryFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4
{
  id v7;
  PXCuratedLibraryFilterToggleButtonController *v8;
  PXCuratedLibraryFilterToggleButtonController *v9;
  id *p_viewModel;
  void *v11;
  void *v12;
  _QWORD v14[4];
  PXCuratedLibraryFilterToggleButtonController *v15;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibraryFilterToggleButtonController;
  v8 = -[PXContentFilterToggleButtonController initWithButtonConfiguration:roundedButton:](&v16, sel_initWithButtonConfiguration_roundedButton_, a4, 1);
  v9 = v8;
  if (v8)
  {
    p_viewModel = (id *)&v8->_viewModel;
    objc_storeStrong((id *)&v8->_viewModel, a3);
    objc_msgSend(*p_viewModel, "registerChangeObserver:context:", v9, PXCuratedLibraryViewModelObserverContext_179176);
    objc_msgSend(*p_viewModel, "zoomablePhotosViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:context:", v9, PXCuratedLibraryZoomablePhotosViewModelObserverContext);

    objc_msgSend(*p_viewModel, "libraryFilterState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerChangeObserver:context:", v9, PXLibraryFilterStateObservationContext_179177);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PXCuratedLibraryFilterToggleButtonController_initWithViewModel_buttonConfiguration___block_invoke;
    v14[3] = &unk_1E51321B0;
    v15 = v9;
    -[PXContentFilterToggleButtonController performChanges:](v15, "performChanges:", v14);

  }
  return v9;
}

- (PXCuratedLibraryFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterToggleButtonController.m"), 57, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryFilterToggleButtonController initWithButtonConfiguration:roundedButton:]");

  abort();
}

- (void)_updateLibraryState
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  -[PXContentFilterToggleButtonController setLibraryFilterState:](self, "setLibraryFilterState:", v4);

}

- (void)_updateContentFilterState
{
  void *v3;
  id v4;

  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentContentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentFilterToggleButtonController setContentFilterState:](self, "setContentFilterState:", v3);

}

- (void)_updateStyling
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke;
  v2[3] = &unk_1E5149198;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.3, 0.0);
}

- (id)filterMenuItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFiltersMenu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filterMenuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewOptionsMenuItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFiltersMenu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewOptionsMenuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allMenuItems
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionPerformerForActionType:", CFSTR("PXCuratedLibraryActionShowFiltersMenu"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_8;
    }
    -[PXContentFilterToggleButtonController button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSender:", v8);

    objc_msgSend(v7, "menuElement");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        objc_msgSend(v9, "children");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

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
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterToggleButtonController.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("filterMenuElement"), v15, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterToggleButtonController.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("filterMenuElement"), v15);
    }

    goto LABEL_5;
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
  return v11;
}

- (BOOL)shouldHideButton
{
  char v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryFilterToggleButtonController;
  if (-[PXContentFilterToggleButtonController shouldHideButton](&v7, sel_shouldHideButton))
    return 1;
  -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "zoomLevel") == 4)
  {
    -[PXCuratedLibraryFilterToggleButtonController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "shouldShowEmptyPlaceholder");

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_179176 == a5)
  {
    if ((a4 & 0x10) != 0)
      -[PXCuratedLibraryFilterToggleButtonController _updateLibraryState](self, "_updateLibraryState");
    if ((a4 & 0x2000000) != 0)
      -[PXCuratedLibraryFilterToggleButtonController _updateContentFilterState](self, "_updateContentFilterState");
    if (a4 >> 31)
      -[PXCuratedLibraryFilterToggleButtonController _updateStyling](self, "_updateStyling");
    if ((a4 & 4) != 0)
      goto LABEL_5;
  }
  else
  {
    if ((void *)PXCuratedLibraryZoomablePhotosViewModelObserverContext == a5)
    {
      if ((a4 & 3) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((void *)PXLibraryFilterStateObservationContext_179177 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterToggleButtonController.m"), 140, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 2) != 0)
LABEL_5:
      -[PXContentFilterToggleButtonController invalidateButtonMenu](self, "invalidateButtonMenu");
  }
LABEL_6:

}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke_2;
  v3[3] = &unk_1E51321B0;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

void __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PXCuratedLibraryFilterToggleButtonController foregroundColorOverLegibilityGradient:](PXCuratedLibraryFilterToggleButtonController, "foregroundColorOverLegibilityGradient:", objc_msgSend(v5, "secondaryToolbarLegibilityGradientIsVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryTintColor:", v4);

}

uint64_t __86__PXCuratedLibraryFilterToggleButtonController_initWithViewModel_buttonConfiguration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLibraryState");
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentFilterState");
}

+ (id)foregroundColorOverLegibilityGradient:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
