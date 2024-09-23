@implementation PXCMMPosterTileController

- (PXCMMPosterTileController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterTileController.m"), 44, CFSTR("%s is not available as initializer"), "-[PXCMMPosterTileController init]");

  abort();
}

- (PXCMMPosterTileController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5
{
  id v9;
  id v10;
  PXCMMPosterTileController *v11;
  PXCMMPosterTileController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXCMMPosterTileController;
  v11 = -[PXCMMPosterTileController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_activityType = a3;
    objc_storeStrong((id *)&v11->_viewModel, a4);
    -[PXCMMViewModel registerChangeObserver:context:](v12->_viewModel, "registerChangeObserver:context:", v12, PXViewModelObservationContext);
    objc_storeStrong((id *)&v12->_momentShareStatusPresentation, a5);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v12->_momentShareStatusPresentation, "registerChangeObserver:context:", v12, PXMomentShareStatusPresentationObservationContext);
  }

  return v12;
}

- (UIView)view
{
  PXCMMPosterHeaderView *posterHeaderView;
  PXCMMPosterHeaderView *v4;
  PXCMMPosterHeaderView *v5;

  posterHeaderView = self->_posterHeaderView;
  if (!posterHeaderView)
  {
    v4 = -[PXCMMPosterHeaderView initWithPresentationStyle:]([PXCMMPosterHeaderView alloc], "initWithPresentationStyle:", 0);
    v5 = self->_posterHeaderView;
    self->_posterHeaderView = v4;

    -[PXCMMPosterTileController _updateContent](self, "_updateContent");
    -[PXCMMPosterTileController _updateStatusString](self, "_updateStatusString");
    posterHeaderView = self->_posterHeaderView;
  }
  return (UIView *)posterHeaderView;
}

- (void)becomeReusable
{
  -[PXCMMPosterHeaderView setHidden:](self->_posterHeaderView, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[PXCMMPosterHeaderView setHidden:](self->_posterHeaderView, "setHidden:", 0);
}

- (void)_updateContent
{
  void *v3;
  _QWORD v4[5];

  -[PXCMMPosterHeaderView viewModel](self->_posterHeaderView, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PXCMMPosterTileController__updateContent__block_invoke;
  v4[3] = &unk_1E513D060;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateStatusString
{
  void *v3;
  int64_t v4;
  int64_t v5;
  BOOL v6;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;

  -[PXMomentShareStatusPresentation idleTitle](self->_momentShareStatusPresentation, "idleTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXMomentShareStatusPresentation type](self->_momentShareStatusPresentation, "type");
  v5 = -[PXMomentShareStatusPresentation state](self->_momentShareStatusPresentation, "state");
  if (v4 | v5)
    v6 = v5 == 5;
  else
    v6 = 1;
  v8 = v6 || v5 == 6;
  -[PXCMMPosterHeaderView viewModel](self->_posterHeaderView, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PXCMMPosterTileController__updateStatusString__block_invoke;
  v11[3] = &unk_1E51162E8;
  v12 = v3;
  v13 = v8;
  v10 = v3;
  objc_msgSend(v9, "performChanges:", v11);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXViewModelObservationContext == a5)
  {
    if ((v6 & 0x81) != 0)
    {
      v11 = v9;
      -[PXCMMPosterTileController _updateContent](self, "_updateContent");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXMomentShareStatusPresentationObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterTileController.m"), 130, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 0x2011) != 0)
    {
      v11 = v9;
      -[PXCMMPosterTileController _updateStatusString](self, "_updateStatusString");
LABEL_7:
      v9 = v11;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterHeaderView, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __48__PXCMMPosterTileController__updateStatusString__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStatusString:", v3);
  objc_msgSend(v4, "setShowStatusCheckmark:", *(unsigned __int8 *)(a1 + 40));

}

void __43__PXCMMPosterTileController__updateContent__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "posterAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "posterMediaProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaProvider:", v8);

}

+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5
{
  double result;

  +[PXCMMPosterHeaderView preferredHeightForWidth:traitCollection:screen:](PXCMMPosterHeaderView, "preferredHeightForWidth:traitCollection:screen:", a4, a5, a3);
  return result;
}

@end
