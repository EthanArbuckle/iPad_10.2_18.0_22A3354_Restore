@implementation PXCMMInvitationGadget

- (PXCMMInvitationGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 68, CFSTR("%s is not available as initializer"), "-[PXCMMInvitationGadget init]");

  abort();
}

- (PXCMMInvitationGadget)initWithWorkflowPresenter:(id)a3
{
  id v6;
  PXCMMInvitationGadget *v7;
  PXCMMInvitationGadget *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowPresenter"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCMMInvitationGadget;
  v7 = -[PXCMMInvitationGadget init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_workflowPresenter, a3);
    v8->_requestedPosterImageSize = *(CGSize *)off_1E50B8810;
  }

  return v8;
}

- (void)setInvitation:(id)a3
{
  PXCMMInvitation *v5;
  PXCMMInvitation *invitation;
  PXCMMInvitation *v7;
  PXCMMInvitationViewModelManager *viewModelManager;
  void *v9;

  v5 = (PXCMMInvitation *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

  }
  invitation = self->_invitation;
  self->_invitation = v5;
  v7 = v5;

  self->_didRequestCachingOfPosterImage = 0;
  viewModelManager = self->_viewModelManager;
  self->_viewModelManager = 0;

  -[PXCMMInvitationGadget _createViewModelManagerIfNecessary](self, "_createViewModelManagerIfNecessary");
}

- (unint64_t)gadgetType
{
  return 1;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;
  BOOL v7;
  PXGadgetSpec *v8;

  v8 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXGadgetSpec isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      -[PXCMMInvitationGadget _updateOpaqueAncestorBackgroundColor](self, "_updateOpaqueAncestorBackgroundColor");
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXCMMInvitationGadget _createViewModelManagerIfNecessary](self, "_createViewModelManagerIfNecessary");
  -[PXCMMInvitationViewModelManager viewModel](self->_viewModelManager, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCMMInvitationView sizeThatFits:viewModel:](PXCMMInvitationView, "sizeThatFits:viewModel:", v6, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXCMMInvitationView *invitationView;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PXCMMInvitationView *v12;

  v12 = (PXCMMInvitationView *)a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMInvitationView px_descriptionForAssertionMessage](v12, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  invitationView = self->_invitationView;
  self->_invitationView = v12;

  -[PXCMMInvitationView setDelegate:](self->_invitationView, "setDelegate:", self);
  -[PXCMMInvitationGadget _createViewModelManagerIfNecessary](self, "_createViewModelManagerIfNecessary");
  -[PXCMMInvitationViewModelManager viewModel](self->_viewModelManager, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationView setViewModel:](self->_invitationView, "setViewModel:", v6);

}

- (BOOL)supportsHighlighting
{
  return 1;
}

- (void)userDidSelectGadget
{
  -[PXCMMInvitationGadget _presentDetailViewAnimated:](self, "_presentDetailViewAnimated:", 1);
}

- (id)uniqueGadgetIdentifier
{
  void *v2;
  void *v3;

  -[PXCMMInvitationGadget invitation](self, "invitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contentHasBeenSeen
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PXCMMInvitationGadget invitation](self, "invitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shareType");

  v4 = CFSTR("com.apple.photos.CPAnalytics.cmmSentSharesSeen");
  if (v3)
    v4 = 0;
  if (v3 == 1)
    v5 = CFSTR("com.apple.photos.CPAnalytics.cmmReceivedSharesSeen");
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x1E0D09910];
  v10 = *MEMORY[0x1E0D09830];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:withPayload:", v5, v9);

}

- (PXCMMInvitation)invitation
{
  PXCMMInvitation **p_invitation;
  PXCMMInvitation *v5;
  void *v6;
  void *v8;

  p_invitation = &self->_invitation;
  v5 = self->_invitation;
  if (!v5)
  {
    -[PXCMMInvitationGadget invitationGadgetDelegate](self, "invitationGadgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invitationForGadget:", self);
    v5 = (PXCMMInvitation *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationGadget.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

    }
    objc_storeStrong((id *)p_invitation, v5);
  }
  return v5;
}

- (void)prefetchDuringScrollingForWidth:(double)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  +[PXCMMPosterHeaderView preheatSharedValuesForPresentationStyle:](PXCMMPosterHeaderView, "preheatSharedValuesForPresentationStyle:", 1);
  if (self->_invitation)
  {
    -[PXCMMInvitationGadget _cachePosterImageWithWidth:](self, "_cachePosterImageWithWidth:", a3);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "_sharedUserInitiatedQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PXCMMInvitationGadget_prefetchDuringScrollingForWidth___block_invoke;
    block[3] = &unk_1E51447A0;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&a3;
    dispatch_async(v5, block);

    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  CGFloat y;
  CGFloat x;
  PXCMMInvitationView *invitationView;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  invitationView = self->_invitationView;
  v8 = a4;
  -[PXCMMInvitationView headerViewBounds](invitationView, "headerViewBounds");
  -[PXCMMInvitationView convertRect:toCoordinateSpace:](self->_invitationView, "convertRect:toCoordinateSpace:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v20, v19))
  {
    -[PXCMMInvitationView previewView](self->_invitationView, "previewView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  id v5;
  PXCMMPosterHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  v6 = -[PXCMMPosterHeaderView initWithPresentationStyle:]([PXCMMPosterHeaderView alloc], "initWithPresentationStyle:", 1);
  -[PXCMMInvitationGadget invitation](self, "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "posterMediaProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[PXCMMPosterHeaderView viewModel](v6, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__PXCMMInvitationGadget_previewViewControllerAtLocation_fromSourceView___block_invoke;
  v21[3] = &unk_1E5127490;
  v22 = v7;
  v23 = v8;
  v24 = v9;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v10, "performChanges:", v21);

  objc_msgSend(v5, "setView:", v6);
  objc_msgSend(v11, "assetCollectionActionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationGadget delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gadgetViewControllerHostingGadget:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMInvitationView previewView](self->_invitationView, "previewView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PXCMMPreviewActionMenusWithActionManager(v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_setPreviewActionMenus:", v19);

  return v5;
}

- (void)commitPreviewViewController:(id)a3
{
  -[PXCMMInvitationGadget _presentDetailViewAnimated:](self, "_presentDetailViewAnimated:", 0);
}

- (void)_createViewModelManagerIfNecessary
{
  uint64_t v3;
  PXCMMInvitationViewModelManager *v4;
  void *v5;
  PXCMMInvitationViewModelManager *v6;
  PXCMMInvitationViewModelManager *viewModelManager;
  void *v8;
  id v9;

  if (!self->_viewModelManager)
  {
    -[PXCMMInvitationGadget invitation](self, "invitation");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PXCMMInvitationView effectiveUserInterfaceLayoutDirection](self->_invitationView, "effectiveUserInterfaceLayoutDirection"))
    {
      v3 = 2;
    }
    else
    {
      v3 = 1;
    }
    v4 = [PXCMMInvitationViewModelManager alloc];
    +[PXCMMInvitationView spec](PXCMMInvitationView, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXCMMInvitationViewModelManager initWithInvitation:invitationSpec:bulletPrefix:](v4, "initWithInvitation:invitationSpec:bulletPrefix:", v9, v5, v3);
    viewModelManager = self->_viewModelManager;
    self->_viewModelManager = v6;

    -[PXCMMInvitationViewModelManager viewModel](self->_viewModelManager, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMInvitationView setViewModel:](self->_invitationView, "setViewModel:", v8);

    -[PXCMMInvitationGadget _updateOpaqueAncestorBackgroundColor](self, "_updateOpaqueAncestorBackgroundColor");
  }
}

- (void)_updateOpaqueAncestorBackgroundColor
{
  void *v3;
  _QWORD v4[5];

  if (self->_gadgetSpec)
  {
    -[PXCMMInvitationViewModelManager viewModel](self->_viewModelManager, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__PXCMMInvitationGadget__updateOpaqueAncestorBackgroundColor__block_invoke;
    v4[3] = &unk_1E51274B8;
    v4[4] = self;
    objc_msgSend(v3, "performChanges:", v4);

  }
}

- (void)_presentDetailViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  PXCMMInvitation *invitation;
  int v20;
  void *v21;
  __int16 v22;
  PXCMMInvitation *v23;
  uint64_t v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PXCMMInvitation shareType](self->_invitation, "shareType");
  v6 = v5;
  if (v5 == 1)
  {
    -[PXCMMInvitation acceptWithCompletionHandler:](self->_invitation, "acceptWithCompletionHandler:", 0);
    v7 = 2;
  }
  else if (v5)
  {
    v7 = 0;
  }
  else
  {
    v7 = 3;
  }
  -[PXCMMInvitation contextForActivityType:](self->_invitation, "contextForActivityType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMWorkflowPresenting workflowViewControllerWithContext:](self->_workflowPresenter, "workflowViewControllerWithContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (-[PXCMMInvitationGadget delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "gadget:transitionToViewController:animated:completion:", self, v9, v3, 0),
        v10,
        v11))
  {
    v12 = CFSTR("com.apple.photos.CPAnalytics.cmmSentSharesOpened");
    if (v6)
      v12 = 0;
    if (v6 == 1)
      v13 = CFSTR("com.apple.photos.CPAnalytics.cmmReceivedSharesOpened");
    else
      v13 = v12;
    v14 = (void *)MEMORY[0x1E0D09910];
    v24 = *MEMORY[0x1E0D09830];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:withPayload:", v13, v17);

  }
  else
  {
    PLSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      invitation = self->_invitation;
      v20 = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = invitation;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Failed to present CMM workflow view controller %@ for invitation: %@", (uint8_t *)&v20, 0x16u);
    }

    -[PXCMMWorkflowPresenting cancelWorkflow](self->_workflowPresenter, "cancelWorkflow");
  }

}

- (void)_cachePosterImageWithWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_didRequestCachingOfPosterImage || self->_requestedWidth != a3)
  {
    -[PXCMMInvitationGadget _clearPosterImageCache](self, "_clearPosterImageCache");
    -[PXCMMInvitationGadget gadgetSpec](self, "gadgetSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;

    if (!self->_didRequestCachingOfPosterImage && v7 > 0.0)
    {
      -[PXCMMInvitationGadget invitation](self, "invitation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "posterAsset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "posterMediaProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "_imageRequestOptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXCMMInvitationView posterImageSizeThatFits:scale:](PXCMMInvitationView, "posterImageSizeThatFits:scale:", a3, 1.79769313e308, v7);
        v13 = v12;
        v15 = v14;
        v17[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startCachingImagesForAssets:targetSize:contentMode:options:", v16, 1, v11, v13, v15);

        self->_requestedPosterImageSize.width = v13;
        self->_requestedPosterImageSize.height = v15;
        self->_requestedWidth = a3;
        self->_didRequestCachingOfPosterImage = 1;

      }
    }
  }
}

- (void)_clearPosterImageCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_didRequestCachingOfPosterImage && (PXSizeIsNull() & 1) == 0)
  {
    -[PXCMMInvitationGadget invitation](self, "invitation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "posterAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "posterMediaProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "_imageRequestOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopCachingImagesForAssets:targetSize:contentMode:options:", v7, 1, v6, self->_requestedPosterImageSize.width, self->_requestedPosterImageSize.height);

    }
  }
  self->_requestedPosterImageSize = *(CGSize *)off_1E50B8810;
  self->_didRequestCachingOfPosterImage = 0;
}

- (void)invitationViewSizeThatFitsDidChange:(id)a3
{
  id v4;

  -[PXCMMInvitationGadget delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (void)presentDetailViewForInvitationView:(id)a3 animated:(BOOL)a4
{
  -[PXCMMInvitationGadget _presentDetailViewAnimated:](self, "_presentDetailViewAnimated:", a4);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCMMWorkflowPresenting)workflowPresenter
{
  return self->_workflowPresenter;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (PXCMMInvitationGadgetDelegate)invitationGadgetDelegate
{
  return (PXCMMInvitationGadgetDelegate *)objc_loadWeakRetained((id *)&self->_invitationGadgetDelegate);
}

- (void)setInvitationGadgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_invitationGadgetDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_invitationGadgetDelegate);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_workflowPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_invitationView, 0);
  objc_storeStrong((id *)&self->_viewModelManager, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

void __61__PXCMMInvitationGadget__updateOpaqueAncestorBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = a2;
  objc_msgSend(v2, "backgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaqueAncestorBackgroundColor:", v4);

}

void __72__PXCMMInvitationGadget_previewViewControllerAtLocation_fromSourceView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v5);

  objc_msgSend(v6, "setAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setMediaProvider:", *(_QWORD *)(a1 + 48));

}

void __57__PXCMMInvitationGadget_prefetchDuringScrollingForWidth___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cachePosterImageWithWidth:", *(double *)(a1 + 40));

}

+ (id)_sharedUserInitiatedQueue
{
  if (_sharedUserInitiatedQueue_onceToken != -1)
    dispatch_once(&_sharedUserInitiatedQueue_onceToken, &__block_literal_global_108536);
  return (id)_sharedUserInitiatedQueue_workQueue;
}

+ (id)_imageRequestOptions
{
  id v2;

  v2 = objc_alloc_init((Class)off_1E50B3068);
  objc_msgSend(v2, "setAllowPlaceholder:", 1);
  objc_msgSend(v2, "setNetworkAccessAllowed:", 1);
  return v2;
}

void __50__PXCMMInvitationGadget__sharedUserInitiatedQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.cmminvitation.tasks", attr);
  v2 = (void *)_sharedUserInitiatedQueue_workQueue;
  _sharedUserInitiatedQueue_workQueue = (uint64_t)v1;

}

@end
