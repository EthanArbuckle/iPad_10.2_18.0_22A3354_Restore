@implementation WFMediaPickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
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
  id obj;

  v5 = (objc_class *)MEMORY[0x24BDDC7F8];
  v6 = a4;
  obj = (id)objc_msgSend([v5 alloc], "initWithSupportedTypeIdentifiers:selectionMode:", &unk_24EE46AF8, 4);
  objc_msgSend(obj, "setShowsCloudItems:", 1);
  objc_msgSend(obj, "setShowsItemsWithProtectedAssets:", 1);
  objc_msgSend(obj, "setShowsCatalogContent:", 1);
  objc_msgSend(obj, "setAllowsPickingMultipleItems:", 0);
  objc_msgSend(obj, "setDelegate:", self);
  objc_msgSend(obj, "setModalPresentationStyle:", 7);
  objc_msgSend(obj, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  objc_msgSend(v6, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceView:", v8);

  objc_msgSend(v6, "sourceRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(obj, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  objc_msgSend(v6, "sourceViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "presentViewController:animated:completion:", obj, 1, 0);
  objc_storeWeak((id *)&self->_presentedViewController, obj);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFMediaPickerParameterSummaryEditor *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __74__WFMediaPickerParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke;
  v5[3] = &unk_24EE25B28;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFMediaPickerParameterSummaryEditor;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFModuleSummaryEditor cancelEditingWithCompletionHandler:](&v4, sel_cancelEditingWithCompletionHandler_, v5);

}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFMediaPickerParameterSummaryEditor *v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickPlaybackArchive___block_invoke;
  v8[3] = &unk_24EE252E0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFMediaPickerParameterSummaryEditor *v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickMediaItems___block_invoke;
  v8[3] = &unk_24EE252E0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)mediaPickerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__WFMediaPickerParameterSummaryEditor_mediaPickerDidCancel___block_invoke;
  v3[3] = &unk_24EE25C70;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == 1)
    return 2;
  else
    return -1;
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
}

uint64_t __60__WFMediaPickerParameterSummaryEditor_mediaPickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeEditing");
}

void __69__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickMediaItems___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "itemsQuery");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filterPredicates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v25;
    v6 = *MEMORY[0x24BDDBD50];
    v23 = *MEMORY[0x24BDDBAF0];
    v21 = *MEMORY[0x24BEC44B0];
    v22 = *MEMORY[0x24BEC44C0];
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v1);
        v8 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "property");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "isEqualToString:", v6);

            if (v10)
            {
              v11 = objc_alloc(MEMORY[0x24BEC3EB0]);
              objc_msgSend(v8, "value");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v11;
              v14 = v22;
            }
            else
            {
              objc_msgSend(v8, "property");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v23);

              if (!v16)
                goto LABEL_16;
              v17 = objc_alloc(MEMORY[0x24BEC3EB0]);
              objc_msgSend(v8, "value");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v17;
              v14 = v21;
            }
            v18 = objc_msgSend(v13, "initWithMediaType:persistentID:", v14, v12);

            v4 = (void *)v18;
          }
          else
          {
            v12 = v8;
            v8 = 0;
          }
        }
        else
        {
          v12 = 0;
        }

LABEL_16:
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v3)
        goto LABEL_20;
    }
  }
  v4 = 0;
LABEL_20:

  objc_msgSend(*(id *)(a1 + 40), "commitState:", v4);
  objc_msgSend(*(id *)(a1 + 40), "completeEditing");

}

void __74__WFMediaPickerParameterSummaryEditor_mediaPicker_didPickPlaybackArchive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "copyWithOptions:", 8);
  objc_msgSend(v7, "displayProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3EA8]), "initWithMediaItemName:playbackArchiveData:", v3, v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3EB0]), "initWithValue:", v5);
  objc_msgSend(*(id *)(a1 + 40), "commitState:", v6);
  objc_msgSend(*(id *)(a1 + 40), "completeEditing");

}

void __74__WFMediaPickerParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
