@implementation SXActionManager

- (SXActionManager)initWithActionActivityManager:(id)a3 viewManager:(id)a4 postActionHandlerManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXActionManager *v12;
  SXActionManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionManager;
  v12 = -[SXActionManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityManager, a3);
    objc_storeStrong((id *)&v13->_viewManager, a4);
    objc_storeStrong((id *)&v13->_postActionHandlerManager, a5);
  }

  return v13;
}

- (void)performAction:(id)a3 postActionHandlers:(id)a4
{
  -[SXActionManager performAction:postActionHandlers:sourceView:sourceRect:mode:](self, "performAction:postActionHandlers:sourceView:sourceRect:mode:", a3, a4, 0, 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)performAction:(id)a3 postActionHandlers:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 mode:(unint64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  SXActionManager *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  SXActionManager *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v43 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (v15 && v16)
  {
    -[SXActionManager activityManager](self, "activityManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activityGroupForAction:sourceView:sourceRect:", v15, v17, x, y, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a7 | 2) == 2)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v19, "activities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v21)
      {
        v33 = v19;
        v22 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            if (!objc_msgSend(v24, "type", v33))
            {
              v21 = v24;
              goto LABEL_14;
            }
          }
          v21 = (id)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v21)
            continue;
          break;
        }
LABEL_14:
        v19 = v33;
      }

    }
    else
    {
      v21 = 0;
    }
    if (a7 == 2 && !v21)
    {
      objc_msgSend(v19, "activities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v21)
    {
      objc_msgSend(v21, "invokeWithAction:invocationMethod:", v15, 0);
      v26 = self;
      v27 = v16;
      v28 = v15;
      v29 = 2;
    }
    else
    {
      objc_msgSend(v19, "activities");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v31)
      {
        -[SXActionManager viewManager](self, "viewManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __79__SXActionManager_performAction_postActionHandlers_sourceView_sourceRect_mode___block_invoke;
        v34[3] = &unk_24D6875C8;
        v35 = v15;
        v36 = self;
        v37 = v16;
        objc_msgSend(v32, "presentActivityGroup:action:sourceView:sourceRect:completion:", v19, v35, v17, v34, x, y, width, height);

        goto LABEL_25;
      }
      v26 = self;
      v27 = v16;
      v28 = v15;
      v29 = 0;
    }
    -[SXActionManager notifyPostActionHandlers:action:state:](v26, "notifyPostActionHandlers:action:state:", v27, v28, v29);
LABEL_25:

  }
}

void __79__SXActionManager_performAction_postActionHandlers_sourceView_sourceRect_mode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2 == 1)
  {
    v6 = 1;
  }
  else if (a2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "invokeWithAction:invocationMethod:", *(_QWORD *)(a1 + 32), 1);
    v6 = 2;
  }
  objc_msgSend(*(id *)(a1 + 40), "notifyPostActionHandlers:action:state:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v6);

}

- (id)contextMenuConfigurationForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v53 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  -[SXActionManager activityManager](self, "activityManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  objc_msgSend(v13, "activityGroupForAction:sourceView:sourceRect:", v11, v12, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v11;
  -[SXActionManager previewViewControllerForAction:](self, "previewViewControllerForAction:", v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v39 = v14;
  objc_msgSend(v14, "activities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!objc_msgSend(v21, "type"))
        {
          if (v40)
            continue;
          objc_msgSend(v39, "activities");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v27 == 1)
            continue;
        }
        v22 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend(v21, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "image");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke;
        v46[3] = &unk_24D6875F0;
        v46[4] = v21;
        v47 = v41;
        objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v23, v24, 0, v46);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v25);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count") || v40)
  {
    v31 = (void *)MEMORY[0x24BDF6BA8];
    v30 = v39;
    objc_msgSend(v39, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "menuWithTitle:children:", v32, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x24BDF6980];
    v35 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_2;
    v44[3] = &unk_24D687618;
    v45 = v40;
    v42[0] = v35;
    v42[1] = 3221225472;
    v42[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_3;
    v42[3] = &unk_24D687640;
    v43 = v33;
    v36 = v33;
    objc_msgSend(v34, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v44, v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v38;
  }
  else
  {
    v28 = 0;
    v29 = v38;
    v30 = v39;
  }

  return v28;
}

uint64_t __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithAction:invocationMethod:", *(_QWORD *)(a1 + 40), 1);
}

id __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)previewViewControllerForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  v4 = a3;
  -[SXActionManager activityManager](self, "activityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewActivityForAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previewViewControllerForAction:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[SXActionManagerPreview initWithAction:viewController:previewActivity:]((id *)[SXActionManagerPreview alloc], v4, v7, v6);
    -[SXActionManager setCurrentPreview:](self, "setCurrentPreview:", v8);

  }
  return v7;
}

- (void)commitPreviewViewController:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SXActionManager currentPreview](self, "currentPreview");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[SXActionManagerPreview viewController](v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v9)
    {
      -[SXActionManager setCurrentPreview:](self, "setCurrentPreview:", 0);
      -[SXFullscreenCaption caption]((uint64_t)v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCaption text]((uint64_t)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "commitViewController:action:", v9, v8);

    }
  }

}

- (void)notifyPostActionHandlers:(id)a3 action:(id)a4 state:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "handledAction:state:", v9, a5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  -[SXActionManager postActionHandlerManager](self, "postActionHandlerManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handledAction:state:", v9, a5);

}

- (SXActionActivityManager)activityManager
{
  return self->_activityManager;
}

- (SXActionViewManager)viewManager
{
  return self->_viewManager;
}

- (SXActionManagerPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreview, a3);
}

- (SXPostActionHandlerManager)postActionHandlerManager
{
  return self->_postActionHandlerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postActionHandlerManager, 0);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
