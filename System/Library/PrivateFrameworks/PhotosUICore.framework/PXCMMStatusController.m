@implementation PXCMMStatusController

- (PXCMMStatusController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStatusController.m"), 28, CFSTR("%s is not available as initializer"), "-[PXCMMStatusController init]");

  abort();
}

- (PXCMMStatusController)initWithStatusPresentation:(id)a3 viewModel:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXCMMStatusController *v11;
  PXCMMStatusController *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStatusController.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statusPresentation"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStatusController.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXCMMStatusController;
  v11 = -[PXCMMStatusController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusPresentation, a3);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v12->_statusPresentation, "registerChangeObserver:context:", v12, PXMomentShareStatusPresentationChangeObserverContext);
    objc_storeStrong((id *)&v12->_viewModel, a4);
    -[PXCMMStatusController _updateWithChangeDescriptor:](v12, "_updateWithChangeDescriptor:", -1);
  }

  return v12;
}

- (void)_updateWithChangeDescriptor:(unint64_t)a3
{
  PXStatusViewModel *viewModel;
  _QWORD v4[6];

  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PXCMMStatusController__updateWithChangeDescriptor___block_invoke;
  v4[3] = &unk_1E51426C8;
  v4[4] = self;
  v4[5] = a3;
  -[PXStatusViewModel performChanges:](viewModel, "performChanges:", v4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;
  id v12;

  v9 = a3;
  if ((void *)PXMomentShareStatusPresentationChangeObserverContext != a5)
  {
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStatusController.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context == PXMomentShareStatusPresentationChangeObserverContext"));

    v9 = v12;
  }
  if ((a4 & 0x7E8) != 0)
  {
    v11 = v9;
    -[PXCMMStatusController _updateWithChangeDescriptor:](self, "_updateWithChangeDescriptor:", a4);
    v9 = v11;
  }

}

- (PXStatusViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusPresentation, 0);
}

void __53__PXCMMStatusController__updateWithChangeDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 8) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activityTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v5);

    v3 = *(_QWORD *)(a1 + 40);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pauseTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMessage:", v6);

  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "actionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActionTitle:", v7);

  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "actionConfirmationAlertTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActionConfirmationAlertTitle:", v8);

  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "actionConfirmationAlertButtonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActionConfirmationAlertButtonTitle:", v10);

    if ((*(_QWORD *)(a1 + 40) & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "actionConfirmationAlertSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActionConfirmationAlertSubtitle:", v9);

  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x200) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x400) != 0)
  {
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAction:", v4);

  }
LABEL_9:

}

@end
