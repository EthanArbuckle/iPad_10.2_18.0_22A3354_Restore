@implementation PUPXOneUpPresentationImplementation

- (void)registerStateChangeHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[PUPXOneUpPresentationImplementation stateChangeHandler](self, "stateChangeHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PUPXOneUpPresentationImplementation_registerStateChangeHandler___block_invoke;
  v8[3] = &unk_1E58A38D8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PUPXOneUpPresentationImplementation setStateChangeHandler:](self, "setStateChangeHandler:", v8);

}

- (id)stateChangeHandler
{
  return self->_stateChangeHandler;
}

- (void)setStateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)presentingViewControllerViewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerViewIsAppearing:", v3);

}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerViewWillAppear:", v3);

}

+ (id)implementationForOneUpPresentation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_getAssociatedObject(v3, (const void *)PUImplementationAssociationKey);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PUPXOneUpPresentationImplementation _initWithOneUpPresentation:]([PUPXOneUpPresentationImplementation alloc], "_initWithOneUpPresentation:", v3);
    objc_setAssociatedObject(v3, (const void *)PUImplementationAssociationKey, v4, (void *)1);
  }

  return v4;
}

- (void)invalidatePresentingGeometry
{
  id v2;

  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewControllerScrollViewDidScroll:", 0);

}

- (PUOneUpPresentationHelper)_helper
{
  return self->__helper;
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerViewDidAppear:", v3);

}

- (id)_initWithOneUpPresentation:(id)a3
{
  id v4;
  PUPXOneUpPresentationImplementation *v5;
  id *p_isa;
  PUOneUpPresentationHelper *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  PUBrowsingSession *(*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUPXOneUpPresentationImplementation;
  v5 = -[PUPXOneUpPresentationImplementation init](&v17, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__oneUpPresentation, v4);
    objc_initWeak(&location, v4);
    v7 = [PUOneUpPresentationHelper alloc];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__PUPXOneUpPresentationImplementation__initWithOneUpPresentation___block_invoke;
    v14 = &unk_1E58A38B0;
    objc_copyWeak(&v15, &location);
    v8 = -[PUOneUpPresentationHelper initWithBrowsingSessionCreationBlock:](v7, "initWithBrowsingSessionCreationBlock:", &v11);
    v9 = p_isa[1];
    p_isa[1] = (id)v8;

    objc_msgSend(p_isa[1], "setDelegate:", p_isa, v11, v12, v13, v14);
    objc_msgSend(p_isa[1], "setAssetDisplayDelegate:", p_isa);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return p_isa;
}

- (id)oneUpPresentationHelperViewController:(id)a3
{
  void *v3;
  void *v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PXOneUpPresentation)_oneUpPresentation
{
  return (PXOneUpPresentation *)objc_loadWeakRetained((id *)&self->__oneUpPresentation);
}

- (PUPXOneUpPresentationImplementation)init
{
  return (PUPXOneUpPresentationImplementation *)-[PUPXOneUpPresentationImplementation _initWithOneUpPresentation:](self, "_initWithOneUpPresentation:", 0);
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerViewWillDisappear:", v3);

}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerViewDidDisappear:", v3);

}

- (BOOL)canStartAnimated:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "canPresentOneUpViewControllerAnimated:", v3);

  return v3;
}

- (PXAssetReference)lastViewedAssetReference
{
  void *v2;
  void *v3;

  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastViewedAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetReference *)v3;
}

- (BOOL)startWithConfigurationHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_opt_new();
  if (v4)
    v4[2](v4, v5);
  v6 = -[PUPXOneUpPresentationImplementation canStartAnimated:](self, "canStartAnimated:", objc_msgSend(v5, "isAnimated"));
  if (v6)
  {
    -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initialAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    if (!v8)
      goto LABEL_8;
    objc_msgSend(v7, "dataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "indexPathForAssetReference:", v8);

    if (*MEMORY[0x1E0D7CE28])
    {
      PXIndexPathFromSimpleIndexPath();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      v12 = 0;
    }
    -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "isAnimated");
    v15 = objc_msgSend(v5, "pu_interactiveMode");
    v16 = objc_msgSend(v5, "pu_activity");
    objc_msgSend(v5, "activityCompletion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentOneUpViewControllerFromAssetAtIndexPath:animated:interactiveMode:activity:editActivityCompletion:", v12, v14, v15, v16, v17);

  }
  return v6;
}

- (id)previewViewControllerAllowingActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = a3;
  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPathForAssetReference:", v6);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }

  if ((_QWORD)v18 != *MEMORY[0x1E0D7CE28])
  {
    v16 = v18;
    v17 = v19;
    PXIndexPathFromSimpleIndexPath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper", v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewViewControllerForItemAtIndexPath:allowingActions:", v10, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionManagerForPreviewing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topmostPresentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createMenuActionControllerForManagerIfNeeded:withPresentingViewController:regionOfInterestProvider:", v13, v14, self);

  return v12;
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didDismissPreviewViewController:committing:", v6, v4);

}

- (void)commitPreviewViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitPreviewViewController:", v4);

}

- (BOOL)canStop
{
  void *v2;
  char v3;

  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canDismissOneUpViewController");

  return v3;
}

- (void)stopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id v6;

  v3 = a3;
  v5 = -[PUPXOneUpPresentationImplementation canStop](self, "canStop");
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissOneUpViewControllerForced:animated:", !v5, v3);

}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUPXOneUpPresentationImplementation _helper](self, "_helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "handlePresentingPinchGestureRecognizer:", v4);

  return v6;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionOfInterestForAssetReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)oneUpPresentationHelperOriginalViewController:(id)a3
{
  void *v3;
  void *v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalPresentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "origin");

  return v4;
}

- (BOOL)oneUpPresentationHelperShouldAutoPlay:(id)a3
{
  void *v3;
  char v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAutoPlay");

  return v4;
}

- (BOOL)oneUpPresentationHelperPreventRevealInMomentAction:(id)a3
{
  void *v3;
  char v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preventShowInAllPhotosAction");

  return v4;
}

- (BOOL)oneUpPresentationHelperWantsShowInLibraryButton:(id)a3
{
  void *v3;
  char v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsShowInLibraryButton");

  return v4;
}

- (unint64_t)oneUpPresentationHelperAdditionalOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  unint64_t v8;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "actionContext");

  if (v4 > 3)
  {
    v8 = 65728;
    if (v4 != 0xFFFF)
      v8 = 0;
    if (v4 == 4)
      return 133312;
    else
      return v8;
  }
  else if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3)
      return 224;
    else
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "disableDetailView");

    if (v6)
      return 192;
    else
      return 128;
  }
}

- (void)oneUpPresentationHelperStateDidChange:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[PUPXOneUpPresentationImplementation stateChangeHandler](self, "stateChangeHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v7, "state");
    if ((unint64_t)(v5 - 1) >= 7)
      v6 = 0;
    else
      v6 = v5;
    v4[2](v4, v6);
  }

}

- (id)oneUpPresentationHelperViewHostingTilingView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalPresentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oneUpPresentationHelper:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pxAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentingScrollViewForAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 1;
}

- (id)oneUpPresentationHelperSearchQueryMatchInfo:(id)a3
{
  void *v3;
  void *v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQueryMatchInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  id v4;

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanUp");

}

- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "pxAssetReference", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXOneUpPresentationImplementation regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pxAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentImageForAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "pxAssetReference", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollAssetReferenceToVisible:", v6);

}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "pxAssetReference", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[PUPXOneUpPresentationImplementation _oneUpPresentation](self, "_oneUpPresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHiddenAssetReferences:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeHandler, 0);
  objc_destroyWeak((id *)&self->__oneUpPresentation);
  objc_storeStrong((id *)&self->__helper, 0);
}

uint64_t __66__PUPXOneUpPresentationImplementation_registerStateChangeHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

PUBrowsingSession *__66__PUPXOneUpPresentationImplementation__initWithOneUpPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  void *v4;
  PUPhotoKitDataSourceManager *v5;
  PUBrowsingSession *v6;
  PUPhotoKitDataSourceManager *v7;
  void *v8;
  void *v9;
  id v10;
  PUPhotoKitMediaProvider *v11;
  PUPhotoKitMediaProvider *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  PUPXAssetActionManager *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
  {
    v6 = 0;
    goto LABEL_27;
  }
  objc_msgSend(WeakRetained, "dataSourceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "currentDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[PUPhotoKitDataSourceManager initWithAssetsDataSourceManager:]([PUPhotoKitDataSourceManager alloc], "initWithAssetsDataSourceManager:", v4);
LABEL_9:
    v7 = v5;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PUPXAssetsDataSourceManager initWithUnderlyingDataSourceManager:]([PUPXAssetsDataSourceManager alloc], "initWithUnderlyingDataSourceManager:", v4);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PUAssetsDataSourceManager *PUAssetsDataSourceManagerFromPXAssetsDataSourceManager(PXAssetsDataSourceManager *__strong)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PUPXOneUpPresentationImplementation.m"), 53, CFSTR("unsupported data source manager %@"), v4);

  v7 = 0;
LABEL_11:

  objc_msgSend(v2, "mediaProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_alloc_init(PUPhotoKitMediaProvider);
LABEL_15:
    v12 = v11;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[PUPXMediaProvider initWithUnderlyingMediaProvider:]([PUPXMediaProvider alloc], "initWithUnderlyingMediaProvider:", v10);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PUMediaProvider *PUMediaProviderFromPXMediaProvider(PXMediaProvider *__strong)");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PUPXOneUpPresentationImplementation.m"), 66, CFSTR("unsupported media provider %@"), v10);

  v12 = 0;
LABEL_17:

  v15 = v2;
  objc_msgSend(v15, "actionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && objc_msgSend(v15, "actionContext") != 6)
  {
    v18 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = -[PUPXAssetActionManager initWithUnderlyingActionManager:]([PUPXAssetActionManager alloc], "initWithUnderlyingActionManager:", v18);
    else
      v17 = 0;

  }
  else if (objc_msgSend(v15, "actionContext") == 6)
  {
    v17 = objc_alloc_init(PUPickerActionManager);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v15, "photosDetailsContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "privacyController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "importStatusManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:]([PUBrowsingSession alloc], "initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:", v7, v17, v12, v19, 0, v21, v20);

LABEL_27:
  return v6;
}

@end
