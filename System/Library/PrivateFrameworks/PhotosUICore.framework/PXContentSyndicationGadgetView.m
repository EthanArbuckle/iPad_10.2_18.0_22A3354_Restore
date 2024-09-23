@implementation PXContentSyndicationGadgetView

- (PXContentSyndicationGadgetView)initWithFrame:(CGRect)a3
{
  PXContentSyndicationGadgetView *v3;
  PXContentSyndicationItemAssetPreviewView *v4;
  uint64_t v5;
  PXContentSyndicationItemAssetPreviewView *assetPreviewView;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXContentSyndicationGadgetView;
  v3 = -[PXContentSyndicationGadgetView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PXContentSyndicationItemAssetPreviewView alloc];
    v5 = -[PXContentSyndicationItemAssetPreviewView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    assetPreviewView = v3->_assetPreviewView;
    v3->_assetPreviewView = (PXContentSyndicationItemAssetPreviewView *)v5;

    -[PXContentSyndicationGadgetView contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_assetPreviewView);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleContentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)setViewModel:(id)a3
{
  PXContentSyndicationGadgetViewModel *v5;
  PXContentSyndicationGadgetViewModel *viewModel;
  PXContentSyndicationGadgetViewModel *v7;
  void *v8;

  v5 = (PXContentSyndicationGadgetViewModel *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetView.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  -[PXContentSyndicationGadgetViewModel unregisterChangeObserver:context:](self->_viewModel, "unregisterChangeObserver:context:", self, PXContentSyndicationGadgetViewModelObservationContext);
  viewModel = self->_viewModel;
  self->_viewModel = v5;
  v7 = v5;

  -[PXContentSyndicationGadgetViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, PXContentSyndicationGadgetViewModelObservationContext);
  -[PXContentSyndicationGadgetView _updateKeyImageCount](self, "_updateKeyImageCount");
  -[PXContentSyndicationGadgetView _updateKeyImages](self, "_updateKeyImages");
  -[PXContentSyndicationGadgetView _updateOverlayTitle](self, "_updateOverlayTitle");
  -[PXContentSyndicationGadgetView _updateSocialLayerAttributionView](self, "_updateSocialLayerAttributionView");
}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  return -[PXContentSyndicationItemAssetPreviewView regionOfInterestForOneUpTransition](self->_assetPreviewView, "regionOfInterestForOneUpTransition");
}

- (void)setContentViewHiddenForOneUpTransition:(BOOL)a3
{
  if (self->_contentViewHiddenForOneUpTransition != a3)
  {
    self->_contentViewHiddenForOneUpTransition = a3;
    -[PXContentSyndicationItemAssetPreviewView setHidden:](self->_assetPreviewView, "setHidden:");
  }
}

- (UIView)previewView
{
  return (UIView *)self->_assetPreviewView;
}

- (id)replyActionFromAttributionView
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SLAttributionView contextMenuItems](self->_socialLayerAttributionView, "contextMenuItems");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = *MEMORY[0x1E0DA88C0];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "identifier", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v6);

        if (v10)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXContentSyndicationGadgetView *v7;
  PXContentSyndicationGadgetView *v8;
  PXContentSyndicationGadgetView *v9;
  _QWORD v10[5];
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationGadgetView;
  -[PXContentSyndicationGadgetView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXContentSyndicationGadgetView *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__PXContentSyndicationGadgetView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    v10[3] = &unk_1E512EF78;
    v10[4] = self;
    +[PXFocusRing updateView:infoProviderBlock:](PXFocusRing, "updateView:infoProviderBlock:", self, v10);
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (PXContentSyndicationGadgetView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (id)focusEffect
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationGadgetView;
  -[PXContentSyndicationGadgetView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXContentSyndicationGadgetView bounds](self, "bounds");
  -[PXContentSyndicationGadgetView _performLayoutInWidth:applyLayoutToSubviews:](self, "_performLayoutInWidth:applyLayoutToSubviews:", 1, v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXContentSyndicationGadgetView _performLayoutInWidth:applyLayoutToSubviews:](self, "_performLayoutInWidth:applyLayoutToSubviews:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_performLayoutInWidth:(double)a3 applyLayoutToSubviews:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  SLAttributionView *socialLayerAttributionView;
  double v10;
  double v11;
  double v12;
  CGFloat MaxY;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;
  CGRect v18;

  v4 = a4;
  v7 = a3 + 10.0;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = a3;
  v17.size.height = v7;
  v8 = CGRectGetMaxY(v17) + 8.0;
  socialLayerAttributionView = self->_socialLayerAttributionView;
  if (v4)
  {
    -[SLAttributionView prepareLayoutWithMaxWidth:](socialLayerAttributionView, "prepareLayoutWithMaxWidth:", a3);
    -[SLAttributionView sizeThatFits:](self->_socialLayerAttributionView, "sizeThatFits:", a3, 1.79769313e308);
    v11 = v10;
  }
  else if (socialLayerAttributionView)
  {
    -[SLAttributionView sizeThatFits:](socialLayerAttributionView, "sizeThatFits:", a3, 1.79769313e308);
    v11 = fmax(v12, 24.0);
  }
  else
  {
    v11 = 24.0;
  }
  v18.origin.x = 0.0;
  v18.origin.y = v8;
  v18.size.width = a3;
  v18.size.height = v11;
  MaxY = CGRectGetMaxY(v18);
  if (v4)
  {
    -[PXContentSyndicationItemAssetPreviewView setFrame:](self->_assetPreviewView, "setFrame:", 0.0, 0.0, a3, v7);
    -[SLAttributionView setFrame:](self->_socialLayerAttributionView, "setFrame:", 0.0, v8, a3, v11);
  }
  v14 = a3;
  v15 = MaxY;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_updateKeyImageCount
{
  -[PXContentSyndicationItemAssetPreviewView setVisiblePreviewCount:](self->_assetPreviewView, "setVisiblePreviewCount:", -[PXContentSyndicationGadgetViewModel keyImageCount](self->_viewModel, "keyImageCount"));
}

- (void)_updateKeyImages
{
  int64_t v3;
  void *v4;

  if (-[PXContentSyndicationGadgetViewModel keyImageCount](self->_viewModel, "keyImageCount") >= 1)
  {
    v3 = 0;
    do
    {
      -[PXContentSyndicationGadgetViewModel keyImageAtIndex:](self->_viewModel, "keyImageAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentSyndicationItemAssetPreviewView setPreviewImage:atIndex:](self->_assetPreviewView, "setPreviewImage:atIndex:", v4, v3);

      ++v3;
    }
    while (v3 < -[PXContentSyndicationGadgetViewModel keyImageCount](self->_viewModel, "keyImageCount"));
  }
}

- (void)_updateOverlayTitle
{
  id v3;

  -[PXContentSyndicationGadgetViewModel overlayTitle](self->_viewModel, "overlayTitle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationItemAssetPreviewView setOverlayTitle:](self->_assetPreviewView, "setOverlayTitle:", v3);

}

- (void)_updateSocialLayerAttributionView
{
  SLAttributionView *socialLayerAttributionView;
  void *v4;
  void *v5;
  SLAttributionView *v6;
  id v7;
  void *v8;
  id v9;

  -[SLAttributionView removeFromSuperview](self->_socialLayerAttributionView, "removeFromSuperview");
  socialLayerAttributionView = self->_socialLayerAttributionView;
  self->_socialLayerAttributionView = 0;

  -[PXContentSyndicationGadgetViewModel socialLayerHighlight](self->_viewModel, "socialLayerHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    PXContentSyndicationAttributionViewForSocialLayerHighlight(v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "updateAlignment:", 0);
    v6 = self->_socialLayerAttributionView;
    self->_socialLayerAttributionView = (SLAttributionView *)v5;
    v7 = v5;

    -[PXContentSyndicationGadgetView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);

    -[PXContentSyndicationGadgetView setNeedsLayout](self, "setNeedsLayout");
    v4 = v9;
  }

}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXContentSyndicationGadgetView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if ((v5 & 1) != 0)
  {
    -[PXContentSyndicationGadgetView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalContextMenuActionsForAttributionViewInContentSyndicationGadgetView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
    v9 = v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)PXContentSyndicationGadgetViewModelObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetView.m"), 252, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    -[PXContentSyndicationGadgetView _updateKeyImageCount](self, "_updateKeyImageCount");
    if ((v6 & 4) == 0)
    {
LABEL_4:
      if ((v6 & 1) == 0)
        goto LABEL_5;
LABEL_10:
      -[PXContentSyndicationGadgetView _updateOverlayTitle](self, "_updateOverlayTitle");
      if ((v6 & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_4;
  }
  -[PXContentSyndicationGadgetView _updateKeyImages](self, "_updateKeyImages");
  if ((v6 & 1) != 0)
    goto LABEL_10;
LABEL_5:
  if ((v6 & 0x10) != 0)
LABEL_6:
    -[PXContentSyndicationGadgetView _updateSocialLayerAttributionView](self, "_updateSocialLayerAttributionView");
LABEL_7:

}

- (PXContentSyndicationGadgetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXContentSyndicationGadgetViewDelegate)delegate
{
  return (PXContentSyndicationGadgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)contentViewHiddenForOneUpTransition
{
  return self->_contentViewHiddenForOneUpTransition;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_socialLayerAttributionView, 0);
  objc_storeStrong((id *)&self->_assetPreviewView, 0);
}

uint64_t __83__PXContentSyndicationGadgetView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "focusInfo");
}

+ (CGSize)sizeThatFits:(CGSize)a3 viewModel:(id)a4
{
  double height;
  double width;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = sizeThatFits_viewModel__onceToken;
  v7 = a4;
  if (v6 != -1)
    dispatch_once(&sizeThatFits_viewModel__onceToken, &__block_literal_global_141970);
  objc_msgSend((id)sizeThatFits_viewModel__view, "setViewModel:", v7);

  objc_msgSend((id)sizeThatFits_viewModel__view, "sizeThatFits:", width, height);
  result.height = v9;
  result.width = v8;
  return result;
}

void __57__PXContentSyndicationGadgetView_sizeThatFits_viewModel___block_invoke()
{
  PXContentSyndicationGadgetView *v0;
  void *v1;

  v0 = objc_alloc_init(PXContentSyndicationGadgetView);
  v1 = (void *)sizeThatFits_viewModel__view;
  sizeThatFits_viewModel__view = (uint64_t)v0;

}

@end
