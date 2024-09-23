@implementation SLCollaborationFooterView

- (SLCollaborationFooterView)initWithModel:(id)a3 maxWidth:(double)a4
{
  SLCollaborationFooterViewModel *v6;
  uint64_t v7;
  SLCollaborationFooterView *v8;
  SLCollaborationFooterViewModel *model;
  objc_super v11;

  v6 = (SLCollaborationFooterViewModel *)a3;
  v7 = objc_opt_class();
  v11.receiver = self;
  v11.super_class = (Class)SLCollaborationFooterView;
  v8 = -[SLRemoteView initWithServiceProxyClass:maxWidth:](&v11, sel_initWithServiceProxyClass_maxWidth_, v7, a4);
  model = v8->_model;
  v8->_model = v6;

  -[SLCollaborationFooterView updateRemoteRenderingEnabled](v8, "updateRemoteRenderingEnabled");
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[SLCollaborationFooterView expectedHeightForWidth:](self, "expectedHeightForWidth:", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SLRemoteView maxWidth](self, "maxWidth");
  v4 = v3;
  -[SLRemoteView maxWidth](self, "maxWidth");
  -[SLCollaborationFooterView expectedHeightForWidth:](self, "expectedHeightForWidth:");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)expectedHeightForWidth:(double)a3
{
  double v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  double v9;

  -[SLRemoteView maxWidth](self, "maxWidth");
  v6 = SL_CGFloatApproximatelyEqualToFloat(a3, v5);
  v7 = 0.0;
  if (v6)
  {
    -[SLRemoteView slotView](self, "slotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intrinsicContentSize");
    v7 = v9;

  }
  return v7;
}

- (void)updateWithNewModel:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SLCollaborationFooterView model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_model, a3);
    -[SLCollaborationFooterView updateRemoteRenderingEnabled](self, "updateRemoteRenderingEnabled");
    -[SLRemoteView slotView](self, "slotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateContent");

  }
}

- (void)updateRemoteRenderingEnabled
{
  -[SLRemoteView setRemoteRenderingEnabled:](self, "setRemoteRenderingEnabled:", 1);
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4;
  SLDFooterViewEmptySlotContent *v5;
  SLDFooterViewEmptySlotContent *v6;

  v4 = a3;
  v5 = [SLDFooterViewEmptySlotContent alloc];
  -[SLRemoteView maxWidth](self, "maxWidth");
  v6 = -[SLDFooterViewEmptySlotContent initWithStyle:maxWidth:forRemote:](v5, "initWithStyle:maxWidth:forRemote:", v4, 0);

  return v6;
}

- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  -[SLRemoteView serviceProxy](self, "serviceProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLCollaborationFooterView model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteView maxWidth](self, "maxWidth");
  v14 = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke;
  v17[3] = &unk_1E3795820;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v11, "footerViewForModel:style:maxWidth:layerContextID:reply:", v12, v16, a3, v17, v14);

}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2;
  v6[3] = &unk_1E37956C0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  id v6;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "lastRenderedSlotStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v2 + 8));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setLastRenderedSlotStyle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setRemoteContentIsLoaded:", *(_QWORD *)(a1 + 48) != 0);
  if (*(_QWORD *)(a1 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerViewContentsDidChange:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1((id *)v2, v5);

  }
}

- (SLCollaborationFooterViewDelegate)delegate
{
  return (SLCollaborationFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SLCollaborationFooterViewModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(*a1, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "maxWidth");
  v7 = 134218498;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLCollaborationFooterView: %p] sociallayerd returned nil remote content for model: [%@], maxWidth: [%f]", (uint8_t *)&v7, 0x20u);

}

@end
