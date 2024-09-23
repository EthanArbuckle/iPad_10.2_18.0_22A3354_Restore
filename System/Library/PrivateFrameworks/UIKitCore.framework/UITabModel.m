@implementation UITabModel

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTabModel:", 0);
}

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTabModel:", *(_QWORD *)(a1 + 32));
}

void __42___UITabModel_setTabItems_inferSelection___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isTabHidden:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke_2_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModelDidReload:", *(_QWORD *)(a1 + 32));
}

void __42___UITabModel_setTabItems_inferSelection___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    -[UITabBarController _selectedElementDidChange:previousElement:](WeakRetained, *(void **)(*(_QWORD *)(a1 + 32) + 48), *(void **)(a1 + 40));

  }
}

uint64_t __43___UITabModel_replaceItemAtIndex_withItem___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:didReplaceOldItem:newItem:", a1[4], a1[5], a1[6]);
}

void __60___UITabModel__setSelectedItem_notifyDelegateOnReselection___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  if (*(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    -[UITabBarController _selectedElementDidChange:previousElement:](WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48));

  }
}

uint64_t __49___UITabModel_visibilityDidChangeForTab_editing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:visibilityDidChangeForTab:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __35___UITabModel_tabContentDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:tabContentDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __41___UITabModel_elementsDidChangeForGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:elementsDidChangeForGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __59___UITabModel__selectElement_notifyObserversOnReselection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectElement:notifyObserversOnReselection:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __62___UITabModel__updateSelectedLeafPerformBeforeNotifyingBlock___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:didChangeSelectedLeaf:previousElement:", a1[4], a1[5], a1[6]);
}

void __39___UITabModel__inferCurrentEditability__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  char v7;
  BOOL v8;

  v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "_isCustomizable");
  v7 = objc_msgSend(v6, "_isUniquelySPI");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v8 = 1;
  else
    v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *a4 = v8;
}

uint64_t __40___UITabModel_setPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:favoriteOrderDidChange:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __38___UITabModel_favoriteOrderDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:favoriteOrderDidChange:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
}

uint64_t __42___UITabModel_customizationStoreDidReset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:favoriteOrderDidReset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __27___UITabModel_setEditable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_tabModel:editableDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
