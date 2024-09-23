@implementation WFContentCollection

void __91__WFContentCollection_QLPreviewControllerDataSource__previewController_previewItemAtIndex___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id v5;

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (v2 && (v5 = v2, v4 = objc_msgSend(v2, "conformsToProtocol:", &unk_25590A180), v3 = v5, v4))
  {
    objc_msgSend(v5, "wf_refreshPreviewItemAtIndex:", *(_QWORD *)(a1 + 40));

  }
  else
  {

    if (objc_msgSend(*(id *)(a1 + 32), "currentPreviewItemIndex") == *(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "refreshCurrentPreviewItem");
  }
}

uint64_t __72__WFContentCollection_Previewing__previewProxyItemAtIndex_refreshBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOriginalItem:", *(_QWORD *)(a1 + 40));
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_setAssociatedObject(v5, &originalCollectionKey, *(id *)(a1 + 32), (void *)1);
  v3 = objc_msgSend(v5, "numberOfItems");
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "numberOfItems"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("WFContentCollection+Previewing.m"), 178, CFSTR("The Quick Look data source should not have a different number of items"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  id v39;
  id v40;

  v4 = a2;
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_2;
  aBlock[3] = &unk_24EF604B8;
  v7 = v4;
  v39 = v7;
  v8 = v5;
  v40 = v8;
  v9 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v7, "preferredFileType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", CFSTR("md"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "conformsToType:", v13);

      if (v14)
      {
        v15 = objc_opt_class();
        v34[0] = v6;
        v34[1] = 3221225472;
        v34[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_4;
        v34[3] = &unk_24EF604E0;
        v35 = v9;
        objc_msgSend(v7, "coerceToItemClass:completionHandler:", v15, v34);
        v11 = v35;
        goto LABEL_4;
      }
      objc_msgSend(v7, "preferredFileType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "conformsToUTType:", *MEMORY[0x24BDF8558]);

      if (v17)
      {
        v32[0] = v6;
        v32[1] = 3221225472;
        v32[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_5;
        v32[3] = &unk_24EF603E0;
        v33 = v9;
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getFileRepresentation:forType:", v32, v18);

        v11 = v33;
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "preferredFileType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BDF83F8];
        v21 = objc_msgSend(v19, "conformsToUTType:", *MEMORY[0x24BDF83F8]);

        if (v21)
        {
          v29[0] = v6;
          v29[1] = 3221225472;
          v29[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_6;
          v29[3] = &unk_24EF60508;
          v30 = v7;
          v31 = v9;
          objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "getFileRepresentation:forType:", v29, v22);

          v11 = v30;
          goto LABEL_4;
        }
        objc_msgSend(v7, "preferredFileType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "conformsToUTType:", *MEMORY[0x24BDF83B0]))
        {

LABEL_16:
          v27[0] = v6;
          v27[1] = 3221225472;
          v27[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7;
          v27[3] = &unk_24EF603E0;
          v28 = v9;
          objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8560], v6, 3221225472, __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7, &unk_24EF603E0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "getFileRepresentation:forType:", v27, v26);

          v11 = v28;
          goto LABEL_4;
        }
        objc_msgSend(v7, "preferredFileType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "conformsToUTType:", *MEMORY[0x24BDF8658]);

        if (v25)
          goto LABEL_16;
      }
      (*((void (**)(void *, id, _QWORD))v9 + 2))(v9, v7, 0);
      goto LABEL_5;
    }
  }
  v10 = objc_opt_class();
  v36[0] = v6;
  v36[1] = 3221225472;
  v36[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_3;
  v36[3] = &unk_24EF604E0;
  v37 = v9;
  objc_msgSend(v7, "coerceToItemClass:completionHandler:", v10, v36);
  v11 = v37;
LABEL_4:

LABEL_5:
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v15 = a2;
  v7 = a3;
  v8 = v15;
  v9 = v7;
  if (!v15)
  {
    v10 = (void *)MEMORY[0x24BE19620];
    objc_msgSend(v7, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Quick Look failed to preview %@"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v3, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "localizedFailureReason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemWithObject:named:", v12, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {

    }
    v8 = v16;
  }
  v17 = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v11, "copyWithName:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BE195E8], "itemWithFile:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BE195E8];
  objc_msgSend(a2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedHTMLDocumentFromHTMLData:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BE195E8];
  v6 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileWithData:ofType:proposedFilename:", v11, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
