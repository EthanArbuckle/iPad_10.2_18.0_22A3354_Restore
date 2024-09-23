@implementation SLRemoteView

- (SLRemoteView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4
{
  SLRemoteView *v5;
  SLRemoteView *v6;
  _UISlotView *v7;
  _UISlotView *slotView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *remoteRenderingQueue;
  uint64_t v24;
  SLDServiceProxy *serviceProxy;
  NSObject *v26;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)SLRemoteView;
  v5 = -[SLRemoteView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_maxWidth = a4;
    v5->_remoteRenderingEnabled = 0;
    v7 = (_UISlotView *)objc_alloc_init(MEMORY[0x1E0DC4360]);
    slotView = v6->_slotView;
    v6->_slotView = v7;

    -[SLRemoteView _contentProviderForCurrentConfiguration](v6, "_contentProviderForCurrentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISlotView _setSlotAnyContentProvider:](v6->_slotView, "_setSlotAnyContentProvider:", v9);

    -[_UISlotView setUserInteractionEnabled:](v6->_slotView, "setUserInteractionEnabled:", 0);
    -[_UISlotView setTranslatesAutoresizingMaskIntoConstraints:](v6->_slotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SLRemoteView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SLRemoteView slotView](v6, "slotView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView addSubview:](v6, "addSubview:", v10);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[SLRemoteView slotView](v6, "slotView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView centerXAnchor](v6, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v34;
    -[SLRemoteView slotView](v6, "slotView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView centerYAnchor](v6, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v30;
    -[SLRemoteView heightAnchor](v6, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView slotView](v6, "slotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v14;
    -[SLRemoteView widthAnchor](v6, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView slotView](v6, "slotView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v19);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INTERACTIVE, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.SocialLayer.SLRemoteView.RemoteRendering", v21);
    remoteRenderingQueue = v6->_remoteRenderingQueue;
    v6->_remoteRenderingQueue = (OS_dispatch_queue *)v22;

    +[SLDServiceProxy proxyForServiceClass:targetSerialQueue:delegate:](SLDServiceProxy, "proxyForServiceClass:targetSerialQueue:delegate:", a3, v6->_remoteRenderingQueue, v6);
    v24 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (SLDServiceProxy *)v24;

    objc_initWeak(&location, v6);
    -[SLRemoteView remoteRenderingQueue](v6, "remoteRenderingQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SLRemoteView_initWithServiceProxyClass_maxWidth___block_invoke;
    block[3] = &unk_1E3794220;
    objc_copyWeak(&v39, &location);
    dispatch_async(v26, block);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __51__SLRemoteView_initWithServiceProxyClass_maxWidth___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serviceProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connect");

}

- (void)setMaxWidth:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  if (!SL_CGFloatApproximatelyEqualToFloat(a3, self->_maxWidth))
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SLRemoteView setMaxWidth:].cold.1((uint64_t)self, v5, v6, a3);

    self->_maxWidth = a3;
    -[SLRemoteView slotView](self, "slotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateContent");

    -[SLRemoteView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setRemoteContentIsLoaded:(BOOL)a3
{
  if (self->_remoteContentIsLoaded != a3)
  {
    self->_remoteContentIsLoaded = a3;
    -[SLRemoteView remoteContentIsLoadedValueChanged](self, "remoteContentIsLoadedValueChanged");
  }
}

- (void)setRemoteRenderingEnabled:(BOOL)a3
{
  NSObject *v4;
  void *v5;

  if (self->_remoteRenderingEnabled != a3)
  {
    self->_remoteRenderingEnabled = a3;
    if (a3)
    {
      SLFrameworkLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        -[SLRemoteView setRemoteRenderingEnabled:].cold.1(self, v4);

      -[SLRemoteView slotView](self, "slotView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_updateContent");

    }
  }
}

- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4
{
  return 1;
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  return 0;
}

- (id)_finalSlotStyleForStyle:(id)a3
{
  return a3;
}

- (id)_contentProviderForCurrentConfiguration
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SLRemoteView__contentProviderForCurrentConfiguration__block_invoke;
  v4[3] = &unk_1E3794BC0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __55__SLRemoteView__contentProviderForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_provideContentForLayerContextID:style:yield:", a2, v8, v7);

}

- (void)_provideContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  _BOOL4 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[5];
  void (**v29)(id, void *);
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = -[SLRemoteView remoteContentIsLoaded](self, "remoteContentIsLoaded");
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  -[SLRemoteView _finalSlotStyleForStyle:](self, "_finalSlotStyleForStyle:", v8);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[SLRemoteView placeholderSlotContent](self, "placeholderSlotContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SLRemoteView shouldInvalidatePreviousPlaceHolderSlotContent:forStyle:](self, "shouldInvalidatePreviousPlaceHolderSlotContent:forStyle:", v11, v33[5]))
  {
    -[SLRemoteView makePlaceholderSlotContentForStyle:](self, "makePlaceholderSlotContentForStyle:", v33[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteView setPlaceholderSlotContent:](self, "setPlaceholderSlotContent:", v12);

  }
  if (!v10)
    goto LABEL_6;
  objc_msgSend(v11, "contentSize");
  v14 = v13;
  v16 = v15;
  -[SLRemoteView placeholderSlotContent](self, "placeholderSlotContent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v19 = v18;
  v21 = v20;

  if (v14 != v19 || v16 != v21)
  {
LABEL_6:
    -[SLRemoteView placeholderSlotContent](self, "placeholderSlotContent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v22);

  }
  if (-[SLRemoteView remoteRenderingEnabled](self, "remoteRenderingEnabled")
    && (-[SLRemoteView maxWidth](self, "maxWidth"), v23 <= 0.0))
  {
    SLFrameworkLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SLRemoteView _provideContentForLayerContextID:style:yield:].cold.1((uint64_t)self, v27);

  }
  else if (-[SLRemoteView remoteRenderingEnabled](self, "remoteRenderingEnabled"))
  {
    -[SLRemoteView serviceProxy](self, "serviceProxy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "connectionActive");

    if (v25)
    {
      -[SLRemoteView remoteRenderingQueue](self, "remoteRenderingQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __61__SLRemoteView__provideContentForLayerContextID_style_yield___block_invoke;
      v28[3] = &unk_1E3794BE8;
      v28[4] = self;
      v30 = &v32;
      v31 = a3;
      v29 = v9;
      dispatch_async(v26, v28);

    }
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __61__SLRemoteView__provideContentForLayerContextID_style_yield___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderRemoteContentForLayerContextID:style:yield:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (void)serviceProxyDidConnect:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SLRemoteView_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __39__SLRemoteView_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "slotView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateContent");

}

- (void)serviceProxyDidDisconnect:(id)a3
{
  -[SLRemoteView setLastRenderedSlotStyle:](self, "setLastRenderedSlotStyle:", 0);
  -[SLRemoteView setRemoteContentIsLoaded:](self, "setRemoteContentIsLoaded:", 0);
}

- (BOOL)remoteContentIsLoaded
{
  return self->_remoteContentIsLoaded;
}

- (BOOL)remoteRenderingEnabled
{
  return self->_remoteRenderingEnabled;
}

- (OS_dispatch_queue)remoteRenderingQueue
{
  return self->_remoteRenderingQueue;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (UISSlotAnyContent)placeholderSlotContent
{
  return self->_placeholderSlotContent;
}

- (void)setPlaceholderSlotContent:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderSlotContent, a3);
}

- (UISSlotStyle)lastRenderedSlotStyle
{
  return self->_lastRenderedSlotStyle;
}

- (void)setLastRenderedSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, a3);
}

- (SLDServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (_UISlotView)slotView
{
  return self->_slotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotView, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, 0);
  objc_storeStrong((id *)&self->_placeholderSlotContent, 0);
  objc_storeStrong((id *)&self->_remoteRenderingQueue, 0);
}

- (void)setMaxWidth:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, a2, a3, "[SLRemoteView: %p] Updating remote content with NEW max width: [%f]", (uint8_t *)&v4);
}

- (void)setRemoteRenderingEnabled:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "maxWidth");
  v6 = 134218240;
  v7 = a1;
  v8 = 2048;
  v9 = v4;
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, a2, v5, "[SLRemoteView: %p] Remote rendering is now enabled. Updating remote content with max width: [%f]", (uint8_t *)&v6);
}

- (void)_provideContentForLayerContextID:(uint64_t)a1 style:(NSObject *)a2 yield:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLRemoteView %p] Remote rendering was enabled, but maxWidth is still zero; this is a bug! We will not render remote"
    " content to avoid unexpected behavior.",
    (uint8_t *)&v2,
    0xCu);
}

@end
