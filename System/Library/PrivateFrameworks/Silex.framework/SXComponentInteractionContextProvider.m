@implementation SXComponentInteractionContextProvider

- (SXComponentInteractionContextProvider)initWithComponentInteractionHandlerManager:(id)a3 actionManager:(id)a4
{
  id v7;
  id v8;
  SXComponentInteractionContextProvider *v9;
  SXComponentInteractionContextProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentInteractionContextProvider;
  v9 = -[SXComponentInteractionContextProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentInteractionHandlerManager, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SXComponentInteractionHandlerManager interactionsForComponentView:](self->_componentInteractionHandlerManager, "interactionsForComponentView:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "handler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SXComponentInteractionContextProvider setCurrentInteraction:](self, "setCurrentInteraction:", v11);
            objc_msgSend(v5, "bounds");
            objc_msgSend(v12, "contextMenuForComponentView:sourceRect:", v5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[SXComponentInteractionContextProvider setCurrentInteraction:](self, "setCurrentInteraction:", 0);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)commitPreviewViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXComponentInteractionContextProvider currentInteraction](self, "currentInteraction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentInteractionContextProvider currentInteraction](self, "currentInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentInteractionContextProvider currentInteraction](self, "currentInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v5, "handleInteractionType:sourceView:sourceRect:", 2, v7);

  -[SXComponentInteractionContextProvider setCurrentInteraction:](self, "setCurrentInteraction:", 0);
}

- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "absoluteFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v7, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertRect:toView:", v19, v11, v13, v15, v17);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(v7, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v21, v23, v25, v27, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v30, "setFrame:", v21, v23, v25, v27);
      objc_msgSend(v7, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "superview");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v30);

      v33 = objc_alloc_init(MEMORY[0x24BDF6CC8]);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBackgroundColor:", v34);

      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E90]), "initWithView:parameters:", v30, v33);
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SXComponentInteractionHandlerManager interactionsForComponentView:](self->_componentInteractionHandlerManager, "interactionsForComponentView:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "handler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = (void *)MEMORY[0x24BDF6F00];
            objc_msgSend(v10, "toolTipForComponentView:", v5);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "absoluteFrame");
            objc_msgSend(v11, "configurationWithToolTip:inRect:", v12);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }

        }
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SXComponentInteractionHandlerManager)componentInteractionHandlerManager
{
  return self->_componentInteractionHandlerManager;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXComponentInteraction)currentInteraction
{
  return (SXComponentInteraction *)objc_loadWeakRetained((id *)&self->_currentInteraction);
}

- (void)setCurrentInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_currentInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentInteraction);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_componentInteractionHandlerManager, 0);
}

@end
