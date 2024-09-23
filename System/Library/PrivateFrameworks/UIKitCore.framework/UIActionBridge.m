@implementation UIActionBridge

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 56), "actionMenuForMenu:firstTarget:includeHidden:validation:", a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v3 = v4;
  }

}

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  char v17;
  id location;
  char v19;

  v3 = a2;
  v19 = 0;
  objc_msgSend(v3, "_resolvedTargetFromFirstTarget:sender:shouldUseFallbackActionOut:", *(_QWORD *)(a1 + 32), 0, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "validatedCommandForTarget:command:alternate:sender:", v4, v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "attributes") & 4) == 0)
    {
      objc_initWeak(&location, v4);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_4;
      aBlock[3] = &unk_1E16C26A8;
      v17 = v19;
      v15 = v3;
      objc_copyWeak(&v16, &location);
      v7 = _Block_copy(aBlock);
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
      v8 = 0;
LABEL_7:
      NSStringFromSelector((SEL)objc_msgSend(v6, "action"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v10, v11, v9, v7);
      v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "discoverabilityTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDiscoverabilityTitle:", v13);

      objc_msgSend(v12, "setAttributes:", objc_msgSend(v6, "attributes") | v8);
      objc_msgSend(v12, "setState:", objc_msgSend(v6, "state"));
      v12[72] = objc_msgSend(v3, "requiresAuthenticatedInput");
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

      goto LABEL_8;
    }
  }
  else
  {
    v6 = v3;
  }
  v7 = &__block_literal_global_141;
  if (*(_BYTE *)(a1 + 56))
  {
    v8 = 4;
    goto LABEL_7;
  }
LABEL_8:

}

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_4(uint64_t a1)
{
  int v1;
  void *v2;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v1)
    objc_msgSend(v2, "_performFallbackActionWithSender:target:", 0, WeakRetained);
  else
    objc_msgSend(v2, "performWithSender:target:", 0, WeakRetained);

}

uint64_t __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 56), "validatedCommandMenuForMenu:context:validation:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v3 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      v3 = v6;
    }
  }

}

void __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "set_useSenderForResolvingTarget:", objc_msgSend(*(id *)(a1 + 32), "useSenderAsResponderSender"));
    v18 = 0;
    objc_msgSend(*(id *)(a1 + 32), "firstResponderTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_resolvedTargetFromFirstTarget:sender:shouldUseFallbackActionOut:", v5, v6, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "useSenderAsResponderSender") & 1) != 0)
    {
      if (!v7)
        goto LABEL_17;
      v8 = v4;
      if (!v8)
        goto LABEL_17;
LABEL_11:
      if (v8 == v4)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
        v8 = v4;
      }
      else
      {
        v13 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
        objc_msgSend(v8, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitle:", v14);

        objc_msgSend(v8, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v15);

        objc_msgSend(v8, "discoverabilityTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDiscoverabilityTitle:", v16);

        objc_msgSend(v13, "setAttributes:", objc_msgSend(v8, "attributes"));
        objc_msgSend(v13, "setState:", objc_msgSend(v8, "state"));
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
        objc_msgSend(v4, "_getStateObservers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setStateObservers:", v17);

      }
      goto LABEL_17;
    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedCommandForTarget:command:alternate:sender:", v7, v4, 0, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_11;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_msgSend(*(id *)(a1 + 32), "supportsCustomViewMenuElements") & 1) != 0
      || (objc_msgSend(v4, "menuElementRepresentation"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
LABEL_18:

      goto LABEL_19;
    }
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v4, "menuElementRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
LABEL_19:

}

@end
