@implementation SXInteractionContextManager

- (SXInteractionContextManager)initWithViewport:(id)a3
{
  id v5;
  SXInteractionContextManager *v6;
  SXInteractionContextManager *v7;
  uint64_t v8;
  NSMutableArray *providers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXInteractionContextManager;
  v6 = -[SXInteractionContextManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewport, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    providers = v7->_providers;
    v7->_providers = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)registerOnView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BDF6988];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithDelegate:", self);
  objc_msgSend(v5, "addInteraction:", v7);
  v6 = objc_alloc_init(MEMORY[0x24BDF6F08]);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v5, "addInteraction:", v6);

}

- (void)addProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXInteractionContextManager providers](self, "providers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  v21 = *MEMORY[0x24BDAC8D0];
  if (-[SXInteractionContextManager shouldStartPreviewing](self, "shouldStartPreviewing", a3))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SXInteractionContextManager providers](self, "providers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          -[SXInteractionContextManager viewport](self, "viewport");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "contextMenuAtLocation:viewport:", v13, x, y);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[SXInteractionContextManager setActiveProvider:](self, "setActiveProvider:", v12);
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_13:

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __103__SXInteractionContextManager_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration___block_invoke;
  v7[3] = &unk_24D687408;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "addCompletion:", v7);

}

void __103__SXInteractionContextManager_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activeProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "previewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitPreviewViewController:", v2);

}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[SXInteractionContextManager activeProvider](self, "activeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXInteractionContextManager viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetedPreviewAtLocation:viewport:", v12, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXInteractionContextManager setActivePreview:](self, "setActivePreview:", v13);

  return -[SXInteractionContextManager activePreview](self, "activePreview");
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v6 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__SXInteractionContextManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_24D6874A8;
  v9[4] = self;
  v7 = MEMORY[0x219A070A8](v9);
  v8 = (void *)v7;
  if (v6)
    objc_msgSend(v6, "addCompletion:", v7);
  else
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  -[SXInteractionContextManager didEndPreviewing](self, "didEndPreviewing");

}

uint64_t __87__SXInteractionContextManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "activePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setActivePreview:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setActiveProvider:", 0);
}

- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SXInteractionContextManager providers](self, "providers", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SXInteractionContextManager viewport](self, "viewport");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "toolTipAtLocation:viewport:", v13, x, y);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldStartPreviewing
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SXInteractionContextManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[SXInteractionContextManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldStartPreviewForInteractionContextManager:", self);

  return v6;
}

- (void)willStartPreviewing
{
  void *v3;
  char v4;
  id v5;

  -[SXInteractionContextManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXInteractionContextManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willStartPreviewingForInteractionContextManager:", self);

  }
}

- (void)didEndPreviewing
{
  void *v3;
  char v4;
  id v5;

  -[SXInteractionContextManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXInteractionContextManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willEndPreviewingForInteractionContextManager:", self);

  }
}

- (SXInteractionContextManagerDelegate)delegate
{
  return (SXInteractionContextManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (NSMutableArray)providers
{
  return self->_providers;
}

- (SXInteractionContextProviding)activeProvider
{
  return self->_activeProvider;
}

- (void)setActiveProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activeProvider, a3);
}

- (UITargetedPreview)activePreview
{
  return self->_activePreview;
}

- (void)setActivePreview:(id)a3
{
  objc_storeStrong((id *)&self->_activePreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePreview, 0);
  objc_storeStrong((id *)&self->_activeProvider, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
