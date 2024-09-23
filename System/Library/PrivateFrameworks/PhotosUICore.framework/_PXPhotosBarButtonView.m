@implementation _PXPhotosBarButtonView

- (_PXPhotosBarButtonView)initWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8 specManager:(id)a9 viewModel:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  _PXPhotosBarButtonView *v20;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSString *systemIconImageName;
  uint64_t v25;
  PXPhotosHeaderCustomizationModel *headerCustomizationModel;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  PXUpdater *updater;
  id v35;
  objc_super v36;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v35 = a9;
  v19 = a10;
  v36.receiver = self;
  v36.super_class = (Class)_PXPhotosBarButtonView;
  v20 = -[_PXPhotosBarButtonView init](&v36, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v21;

    v20->_systemItem = a4;
    v23 = objc_msgSend(v17, "copy");
    systemIconImageName = v20->_systemIconImageName;
    v20->_systemIconImageName = (NSString *)v23;

    objc_storeWeak(&v20->_target, v18);
    v20->_action = a7;
    v20->_menuAction = a8;
    objc_storeStrong((id *)&v20->_specManager, a9);
    -[_PXPhotosBarButtonSpecManager registerChangeObserver:context:](v20->_specManager, "registerChangeObserver:context:", v20, SpecManagerObservationContext_259133);
    objc_storeStrong((id *)&v20->_viewModel, a10);
    -[PXPhotosViewModel registerChangeObserver:context:](v20->_viewModel, "registerChangeObserver:context:", v20, ViewModelObservationContext_259134);
    objc_msgSend(v19, "headerCustomizationModel");
    v25 = objc_claimAutoreleasedReturnValue();
    headerCustomizationModel = v20->_headerCustomizationModel;
    v20->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v25;

    -[PXPhotosHeaderCustomizationModel registerChangeObserver:context:](v20->_headerCustomizationModel, "registerChangeObserver:context:", v20, HeaderCustomizationModelObservationContext_259135);
    -[_PXPhotosBarButtonView _createButtonConfiguration](v20, "_createButtonConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", v27);
    v29 = v28;
    v31 = v30;

    -[_PXPhotosBarButtonView setFrame:](v20, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v29, v31);
    v32 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v20, sel_setNeedsLayout);
    updater = v20->_updater;
    v20->_updater = (PXUpdater *)v32;

    -[PXUpdater addUpdateSelector:needsUpdate:](v20->_updater, "addUpdateSelector:needsUpdate:", sel__updateButtons, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v20->_updater, "addUpdateSelector:needsUpdate:", sel__updateAlpha, 1);
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[_PXPhotosBarButtonView _resumeChangeDeliveryIfPossible](self, "_resumeChangeDeliveryIfPossible");
  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosBarButtonView;
  -[_PXPhotosBarButtonView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  -[_PXPhotosBarButtonView updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  -[_PXPhotosBarButtonView button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosBarButtonView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setExtendedHitTestInsetsEdges:", -[_PXPhotosBarButtonView extendedHitTestInsetsEdges](self, "extendedHitTestInsetsEdges"));
  objc_msgSend(v4, "updateHitTestInsets");
  objc_msgSend(v4, "hitTestInsets");
  -[_PXPhotosBarButtonView setHitTestInsets:](self, "setHitTestInsets:");
  -[_PXPhotosBarButtonView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (layoutSubviews_onceToken != -1)
    dispatch_once(&layoutSubviews_onceToken, &__block_literal_global_259154);
  if (layoutSubviews_adaptorClass)
  {
    if (v5)
    {
      objc_msgSend(v5, "hitTestInsets");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v4, "hitTestInsets");
      if ((v9 != v17 || v7 != v14 || v13 != v16 || v11 != v15) && (objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "hitTestInsets");
        objc_msgSend(v5, "setHitTestInsets:");
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)_PXPhotosBarButtonView;
  -[_PXPhotosBarButtonView layoutSubviews](&v18, sel_layoutSubviews);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosBarButtonView;
  -[_PXPhotosBarButtonView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_PXPhotosBarButtonView _invalidateButtons](self, "_invalidateButtons");
}

- (void)setBarButtonItem:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_barButtonItem, obj);
    -[_PXPhotosBarButtonView _invalidateButtons](self, "_invalidateButtons");
    v5 = obj;
  }

}

- (id)_createButtonConfiguration
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location[2];

  -[_PXPhotosBarButtonView viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosBarButtonView specManager](self, "specManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  v7 = objc_msgSend(v5, "viewMode");
  v8 = 1;
  if (v7 == 1)
    v8 = 2;
  if (v7 == 2)
    v9 = 3;
  else
    v9 = v8;
  objc_msgSend(v6, "setVariant:", v9);
  objc_msgSend(v6, "setEllipsisButtonSpecialTreatment:", objc_msgSend(v4, "allowsSwitchLibraryAction"));
  -[_PXPhotosBarButtonView title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosBarButtonView systemIconImageName](self, "systemIconImageName");
  v11 = objc_claimAutoreleasedReturnValue();
  -[_PXPhotosBarButtonView tintColor](self, "tintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "requiresLightTopBars"))
    v12 = 0;
  else
    v12 = 15;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosBarButtonView viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isAnyItemSelected");

  v26 = (void *)v11;
  if (v10)
  {
    +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v10, v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (v11)
  {
    +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", v11, v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    switch(-[_PXPhotosBarButtonView systemItem](self, "systemItem"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarButtonItemsController.m"), 228, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        if (objc_msgSend(v28, "isFiltering"))
        {

          v30 = 0;
          v16 = 1;
          v12 = 14;
        }
        else
        {
          v16 = 1;
        }
        break;
      case 2:
      case 6:
        v12 = 2;
        v16 = 2;
        break;
      case 3:
        v16 = 3;
        break;
      case 4:
        v16 = 5;
        break;
      case 5:

        v30 = 0;
        v16 = 6;
        v12 = 13;
        break;
      default:
        v16 = 0;
        break;
    }
    +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:spec:", v16, v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v15;
  objc_initWeak(location, self);
  -[_PXPhotosBarButtonView barButtonItem](self, "barButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEnabled");
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    v21 = -[_PXPhotosBarButtonView action](self, "action");

    if (v21)
    {
      v37[0] = v20;
      v37[1] = 3221225472;
      v37[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke;
      v37[3] = &unk_1E5148D30;
      objc_copyWeak(&v38, location);
      objc_msgSend(v17, "setActionHandler:", v37);
      objc_destroyWeak(&v38);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v17, "setActionHandler:", 0);
LABEL_28:
  -[_PXPhotosBarButtonView barButtonItem](self, "barButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEnabled"))
  {

    goto LABEL_32;
  }
  v23 = -[_PXPhotosBarButtonView menuAction](self, "menuAction");

  if (!v23)
  {
LABEL_32:
    objc_msgSend(v17, "setMenuActionHandler:", 0);
    goto LABEL_33;
  }
  v35[0] = v20;
  v35[1] = 3221225472;
  v35[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_2;
  v35[3] = &unk_1E5148D30;
  objc_copyWeak(&v36, location);
  objc_msgSend(v17, "setMenuActionHandler:", v35);
  objc_destroyWeak(&v36);
LABEL_33:
  objc_msgSend(v17, "setTintColor:", v30);
  objc_msgSend(v17, "setStyle:", v12);
  objc_msgSend(v17, "setBackgroundColor:", v29);
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_3;
  v33[3] = &unk_1E5148D30;
  objc_copyWeak(&v34, location);
  objc_msgSend(v17, "setWillDisplayMenuActionHandler:", v33);
  v31[0] = v20;
  v31[1] = 3221225472;
  v31[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_4;
  v31[3] = &unk_1E5148D30;
  objc_copyWeak(&v32, location);
  objc_msgSend(v17, "setWillDismissMenuActionHandler:", v31);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

  return v17;
}

- (void)_handleAction
{
  void *v3;
  id v4;

  -[_PXPhotosBarButtonView barButtonItem](self, "barButtonItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEnabled") && -[_PXPhotosBarButtonView action](self, "action"))
  {
    -[_PXPhotosBarButtonView target](self, "target");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performSelector:withObject:", -[_PXPhotosBarButtonView action](self, "action"), v4);

  }
}

- (void)_handleMenuAction
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;

  -[_PXPhotosBarButtonView barButtonItem](self, "barButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEnabled") && -[_PXPhotosBarButtonView menuAction](self, "menuAction"))
  {
    -[_PXPhotosBarButtonView target](self, "target");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_PXPhotosBarButtonView menuAction](self, "menuAction");
    -[_PXPhotosBarButtonView button](self, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performSelector:withObject:", v4, v5);

  }
}

- (void)_handleWillDisplayMenu
{
  id v3;

  -[_PXPhotosBarButtonView _pauseChangeDelivery](self, "_pauseChangeDelivery");
  -[_PXPhotosBarButtonView viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "swift_actionMenuVisibilityChangedToVisible:", 1);

}

- (void)_handleWillDismissMenu
{
  id v3;

  -[_PXPhotosBarButtonView _resumeChangeDeliveryIfPossible](self, "_resumeChangeDeliveryIfPossible");
  -[_PXPhotosBarButtonView viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "swift_actionMenuVisibilityChangedToVisible:", 0);

}

- (void)_pauseChangeDelivery
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_PXPhotosBarButtonView _resumeChangeDeliveryIfPossible](self, "_resumeChangeDeliveryIfPossible");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__259145;
  v12 = __Block_byref_object_dispose__259146;
  v13 = 0;
  -[_PXPhotosBarButtonView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46___PXPhotosBarButtonView__pauseChangeDelivery__block_invoke;
  v7[3] = &unk_1E5145E98;
  v7[4] = &v8;
  objc_msgSend(v4, "performChanges:", v7);

  -[_PXPhotosBarButtonView setChangeDeliveryHandle:](self, "setChangeDeliveryHandle:", v9[5]);
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v9[5];
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Paused change delivery with handle: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v8, 8);
}

- (void)_resumeChangeDeliveryIfPossible
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_PXPhotosBarButtonView changeDeliveryHandle](self, "changeDeliveryHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Will resume change delivery with handle: %@", buf, 0xCu);
    }

    -[_PXPhotosBarButtonView viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57___PXPhotosBarButtonView__resumeChangeDeliveryIfPossible__block_invoke;
    v7[3] = &unk_1E5145F88;
    v8 = v3;
    objc_msgSend(v6, "performChanges:", v7);

    -[_PXPhotosBarButtonView setChangeDeliveryHandle:](self, "setChangeDeliveryHandle:", 0);
  }

}

- (void)_invalidateButtons
{
  id v2;

  -[_PXPhotosBarButtonView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateButtons);

}

- (void)_updateButtons
{
  uint64_t v3;
  PXCuratedLibraryOverlayButton *button;
  PXCuratedLibraryOverlayButton *v5;
  PXCuratedLibraryOverlayButton *v6;
  id v7;

  -[_PXPhotosBarButtonView _createButtonConfiguration](self, "_createButtonConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  button = self->_button;
  v7 = (id)v3;
  if (!button)
  {
    v5 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    v6 = self->_button;
    self->_button = v5;

    v3 = (uint64_t)v7;
    button = self->_button;
  }
  -[PXCuratedLibraryOverlayButton setUserData:](button, "setUserData:", v3);
  -[_PXPhotosBarButtonView addSubview:](self, "addSubview:", self->_button);

}

- (void)_invalidateAlpha
{
  id v2;

  -[_PXPhotosBarButtonView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAlpha);

}

- (void)_updateAlpha
{
  void *v3;
  double v4;
  id v5;

  -[_PXPhotosBarButtonView headerCustomizationModel](self, "headerCustomizationModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    objc_msgSend(v3, "alpha");
  else
    v4 = 1.0;
  -[_PXPhotosBarButtonView setAlpha:](self, "setAlpha:", v4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)SpecManagerObservationContext_259133 == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  if ((void *)ViewModelObservationContext_259134 == a5)
  {
    if ((v6 & 0x1000000) == 0)
      goto LABEL_11;
LABEL_9:
    v11 = v9;
    -[_PXPhotosBarButtonView _invalidateButtons](self, "_invalidateButtons");
    goto LABEL_10;
  }
  if ((void *)HeaderCustomizationModelObservationContext_259135 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarButtonItemsController.m"), 393, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 4) != 0)
  {
    v11 = v9;
    -[_PXPhotosBarButtonView _invalidateAlpha](self, "_invalidateAlpha");
LABEL_10:
    v9 = v11;
  }
LABEL_11:

}

- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3
{
  if (self->_extendedHitTestInsetsEdges != a3)
  {
    self->_extendedHitTestInsetsEdges = a3;
    -[_PXPhotosBarButtonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)extendedHitTestInsetsEdges
{
  return self->_extendedHitTestInsetsEdges;
}

- (UIBarButtonItem)barButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_barButtonItem);
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)systemItem
{
  return self->_systemItem;
}

- (NSString)systemIconImageName
{
  return self->_systemIconImageName;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (SEL)menuAction
{
  return self->_menuAction;
}

- (_PXPhotosBarButtonSpecManager)specManager
{
  return self->_specManager;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryOverlayButton)button
{
  return self->_button;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)changeDeliveryHandle
{
  return self->_changeDeliveryHandle;
}

- (void)setChangeDeliveryHandle:(id)a3
{
  objc_storeStrong(&self->_changeDeliveryHandle, a3);
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong(&self->_changeDeliveryHandle, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_systemIconImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_barButtonItem);
}

@end
