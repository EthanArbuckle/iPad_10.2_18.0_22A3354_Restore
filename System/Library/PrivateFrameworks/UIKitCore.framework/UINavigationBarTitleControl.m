@implementation UINavigationBarTitleControl

uint64_t __49___UINavigationBarTitleControl_updateConstraints__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureNecessaryViews");
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v5)
    {
LABEL_7:
      objc_initWeak(&location, *(id *)(a1 + 40));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v8[3] = &unk_1E16C42B0;
      v9 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 48);
      objc_copyWeak(&v11, &location);
      objc_msgSend(v6, "setHeaderViewProvider:", v8);
      objc_destroyWeak(&v11);

      objc_destroyWeak(&location);
      goto LABEL_8;
    }
LABEL_6:
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v8[3] = &unk_1E16C4288;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_msgSend(v4, "_headerViewForMenuInteraction:sourceViewProvider:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  return v6;
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

uint64_t __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
