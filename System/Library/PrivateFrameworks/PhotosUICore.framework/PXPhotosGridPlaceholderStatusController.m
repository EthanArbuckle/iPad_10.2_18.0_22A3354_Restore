@implementation PXPhotosGridPlaceholderStatusController

- (PXPhotosGridPlaceholderStatusController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPlaceholderStatusController.m"), 31, CFSTR("%s is not available as initializer"), "-[PXPhotosGridPlaceholderStatusController init]");

  abort();
}

- (id)initForPresentingCPLStatus:(BOOL)a3 fallbackTitle:(id)a4 fallbackAttributedMessage:(id)a5
{
  id v10;
  id v11;
  void *v12;
  PXPhotosGridPlaceholderStatusController *v13;
  id *p_isa;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPlaceholderStatusController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fallbackTitle"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridPlaceholderStatusController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fallbackAttributedMessage"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosGridPlaceholderStatusController;
  v13 = -[PXPhotosGridPlaceholderStatusController init](&v18, sel_init);
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_presentCPLStatus = a3;
    objc_storeStrong((id *)&v13->_fallbackTitle, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (PXStatusController)statusController
{
  PXStatusController *statusController;
  void *v4;
  PXPhotoKitCPLActionManager *v5;
  PXCPLUIStatusProvider *v6;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  PXStatusController *v8;
  PXStatusController *v9;
  PXCPLStatusController *v10;
  void *v11;
  PXCPLStatusController *v12;
  PXCPLStatusController *cplStatusController;

  statusController = self->_statusController;
  if (!statusController)
  {
    if (self->_presentCPLStatus)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v4);
      v6 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v4, v5);
      cplUIStatusProvider = self->_cplUIStatusProvider;
      self->_cplUIStatusProvider = v6;

    }
    v8 = objc_alloc_init(PXStatusController);
    v9 = self->_statusController;
    self->_statusController = v8;

    v10 = [PXCPLStatusController alloc];
    -[PXStatusController viewModel](self->_statusController, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXCPLStatusController initWithViewModel:](v10, "initWithViewModel:", v11);
    cplStatusController = self->_cplStatusController;
    self->_cplStatusController = v12;

    -[PXCPLStatusController setStatusProvider:](self->_cplStatusController, "setStatusProvider:", self->_cplUIStatusProvider);
    -[PXCPLStatusController setFallbackTitle:](self->_cplStatusController, "setFallbackTitle:", self->_fallbackTitle);
    -[PXCPLStatusController setFallbackAttributedMessage:](self->_cplStatusController, "setFallbackAttributedMessage:", self->_fallbackAttributedMessage);
    statusController = self->_statusController;
  }
  return statusController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplStatusController, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_fallbackAttributedMessage, 0);
  objc_storeStrong((id *)&self->_fallbackTitle, 0);
}

@end
