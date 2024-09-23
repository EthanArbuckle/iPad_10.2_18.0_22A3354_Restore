@implementation WFRunWorkflowURLHandler

+ (void)registerOpenWorkflowHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Registering the open-shortcut handler", buf, 0xCu);
  }

  +[ICManager sharedManager](ICManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__WFRunWorkflowURLHandler_registerOpenWorkflowHandler___block_invoke;
  v8[3] = &unk_1E7AF6618;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  objc_msgSend(v6, "registerHandler:forIncomingRequestsWithAction:legacyAction:scheme:", v8, CFSTR("open-shortcut"), CFSTR("open-workflow"), 0);

}

+ (void)registerRunWorkflowHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  +[ICManager sharedManager](ICManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke;
  v7[3] = &unk_1E7AF6618;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "registerHandler:forIncomingRequestsWithAction:legacyAction:scheme:", v7, CFSTR("run-shortcut"), CFSTR("run-workflow"), 0);

}

+ (id)workflowWithInputParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "workflowWithName:identifier:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)workflowWithName:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8
    || (objc_msgSend(v9, "referenceForWorkflowID:", v8), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!v7)
    {
      WFLocalizedString(CFSTR("Could not find the specified shortcut."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v10, "uniqueVisibleReferenceForWorkflowName:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      WFLocalizedString(CFSTR("Could not find the specified shortcut."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Could not find the shortcut “%@.”"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB28A8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }
  }

  return v11;
}

void __55__WFRunWorkflowURLHandler_registerOpenWorkflowHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Received the open-shortcut request", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "workflowWithInputParameters:error:", v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v7)
  {
    objc_msgSend(v3, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("actionIndex"));
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("actionErrorMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

    goto LABEL_10;
  }
  getWFGeneralLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "+[WFRunWorkflowURLHandler registerOpenWorkflowHandler:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Received the open-shortcut request but failed to find the workflow to open", buf, 0xCu);
  }

  objc_msgSend(v3, "failureHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "failureHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v8);
    goto LABEL_9;
  }
LABEL_10:

}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  Class UIPasteboardClass_52970;
  void *v22;
  void *v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  __int128 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_2;
  aBlock[3] = &unk_1E7AF65F0;
  v5 = v4;
  v26 = v5;
  v6 = v3;
  v27 = v6;
  v24 = *(_OWORD *)(a1 + 32);
  v7 = (id)v24;
  v28 = v24;
  v8 = _Block_copy(aBlock);
  objc_msgSend(v5, "objectForKey:", CFSTR("input"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(void *, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
      goto LABEL_17;
    }
    v10 = v9;
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("text"))
      && (objc_msgSend(v5, "objectForKey:", CFSTR("text")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = (void *)MEMORY[0x1E0D13EA8];
      v13 = (void *)MEMORY[0x1E0D13EC0];
      objc_msgSend(v5, "objectForKey:", CFSTR("text"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "collectionWithItems:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *, _QWORD))v8 + 2))(v8, v17, 0);

    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("clipboard"), v24))
      {
        v18 = (void *)MEMORY[0x1E0D13EA8];
        -[objc_class generalPasteboard](getUIPasteboardClass_52970(), "generalPasteboard");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "generateCollectionFromPasteboard:completionHandler:", v14, v8);
LABEL_16:

        goto LABEL_17;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("pasteboard"))
        && (objc_msgSend(v5, "objectForKey:", CFSTR("pasteboard")),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v19))
      {
        v20 = (void *)MEMORY[0x1E0D13EA8];
        UIPasteboardClass_52970 = getUIPasteboardClass_52970();
        objc_msgSend(v5, "objectForKey:", CFSTR("pasteboard"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class pasteboardWithName:create:](UIPasteboardClass_52970, "pasteboardWithName:create:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "generateCollectionFromPasteboard:completionHandler:", v15, v8);
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0D13EA8];
        objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "collectionWithItems:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, _QWORD))v8 + 2))(v8, v23, 0);

      }
    }

    goto LABEL_16;
  }
  (*((void (**)(void *, void *, _QWORD))v8 + 2))(v8, v9, 0);
LABEL_17:

}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sourceName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v21 = v6;
  objc_msgSend(v11, "workflowWithInputParameters:error:", v12, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v13)
  {
    v15 = *(_QWORD *)(a1 + 48);
    v16 = objc_msgSend(*(id *)(a1 + 40), "isInternalCallbackRequest");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_3;
    v19[3] = &unk_1E7AF65C8;
    v20 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, uint64_t, id, _QWORD *, void *))(v15 + 16))(v15, v13, v16, v5, v19, v10);
    v17 = (void (**)(_QWORD, _QWORD))v20;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "failureHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "failureHandler");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v17)[2](v17, v14);
    goto LABEL_8;
  }
LABEL_9:

}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_3(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v7 = a2;
  v8 = a4;
  if (!v8 || (a3 & 1) != 0)
  {
    v11 = v7;
    if (!v7)
      v11 = (void *)objc_opt_new();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_4;
    v12[3] = &unk_1E7AF65A0;
    v13 = *(id *)(a1 + 32);
    v14 = a3;
    objc_msgSend(v11, "getStringRepresentation:", v12);
    if (!v7)

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failureHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "failureHandler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v10)[2](v10, v8);

    }
  }

}

void __54__WFRunWorkflowURLHandler_registerRunWorkflowHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v7 = CFSTR("result");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "successHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "successHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v4, *(unsigned __int8 *)(a1 + 40));

  }
}

@end
