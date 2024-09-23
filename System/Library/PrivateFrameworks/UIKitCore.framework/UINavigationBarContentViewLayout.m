@implementation UINavigationBarContentViewLayout

void __59___UINavigationBarContentViewLayout_setDocumentProperties___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDocumentIconViewIfNecessary");

}

void __74___UINavigationBarContentViewLayout__updateRenamingContentViewIfNecessary__block_invoke(uint64_t a1, double a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[1] == *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "setConstant:", -a2);
    WeakRetained = v5;
  }

}

uint64_t __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTitleControlVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_updateRenamingContentViewVisibilityIfNecessary");
}

uint64_t __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke_2(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_updateRenamingContentViewIfNecessary");
  return result;
}

void __50___UINavigationBarContentViewLayout__overflowItem__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
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
  void (**v20)(id, void *);
  _BYTE v21[64];

  v20 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout _resolvedButtonBarLayoutInfo]((uint64_t)v21, WeakRetained);
    v5 = v21[57];
    objc_msgSend(WeakRetained, "titleMenuProvider");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void (**)(_QWORD, _QWORD))v6;
    if (v5 && v6)
    {
      objc_msgSend(WeakRetained, "documentProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_representedURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UINavigationBarTitleControl titleMenuSuggestedActionsWithDocumentFileURL:](_UINavigationBarTitleControl, "titleMenuSuggestedActionsWithDocumentFileURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)objc_msgSend(v11, "_copyWithOptions:", objc_msgSend(v11, "options") | 1);
        objc_msgSend(v4, "addObject:", v12);

      }
    }
    objc_msgSend(WeakRetained, "additionalOverflowItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "addObject:", v13);
    objc_msgSend(WeakRetained, "leadingBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "elementsForOverflowMenu");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v15);

    objc_msgSend(WeakRetained, "leadingBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __addItemsFromBarForMode(v4, v16, objc_msgSend(WeakRetained, "leadingGroupsMode"));

    objc_msgSend(WeakRetained, "centerBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __addItemsFromBarForMode(v4, v17, objc_msgSend(WeakRetained, "centerGroupsMode"));

    objc_msgSend(WeakRetained, "trailingBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __addItemsFromBarForMode(v4, v18, 1);

    if (objc_msgSend(WeakRetained, "_canCustomizeBar"))
    {
      objc_msgSend(WeakRetained, "_fixedItemsMenu");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

    }
    v20[2](v20, v4);

  }
  else
  {
    v20[2](v20, (void *)MEMORY[0x1E0C9AA60]);
  }

}

id __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _BYTE v14[64];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UINavigationBarContentViewLayout _resolvedButtonBarLayoutInfo]((uint64_t)v14, WeakRetained);
  if (v14[57])
  {
    objc_msgSend(WeakRetained, "documentProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(WeakRetained, "overflowItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v5, "contextMenuInteraction");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), WeakRetained, CFSTR("_UINavigationBarContentViewLayout.m"), 1961, CFSTR("Trying to present the overflow menu without a view to present it from."));

        objc_msgSend(0, "contextMenuInteraction");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), WeakRetained, CFSTR("_UINavigationBarContentViewLayout.m"), 1963, CFSTR("Trying to present the overflow menu but the button does not have a context menu interaction."));

      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_3;
      v12[3] = &unk_1E16B6288;
      v13 = v5;
      v7 = v5;
      objc_msgSend(v3, "_headerViewForMenuInteraction:sourceViewProvider:", v6, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __52___UINavigationBarContentViewLayout__fixedItemsMenu__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[41], "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationBarContentViewDidTriggerCustomization:", v3[41]);

    WeakRetained = v3;
  }

}

void __62___UINavigationBarContentViewLayout__updateFixedLeadingGroups__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[41];
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBarContentViewDidTriggerBackAction:fromBackButtonItem:", v5, v7);

  }
}

BOOL __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v2, "image");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __51___UINavigationBarContentViewLayout_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

@end
