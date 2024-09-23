@implementation UIButtonBar

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

void __38___UIButtonBar__updateEffectiveLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  _UIButtonBarItemGroupLayout *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id location;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = v5[8];
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v6);
  v8 = (_UIButtonBarItemGroupLayout *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    if (v9)
    {
      v8 = -[_UIButtonBarItemGroupLayout initWithLayoutMetrics:barButtonItemGroup:]([_UIButtonBarItemGroupLayout alloc], "initWithLayoutMetrics:barButtonItemGroup:", *(_QWORD *)(v9 + 56), v10);
      -[_UIButtonBarItemGroupLayout setUseGroupSizing:](v8, "setUseGroupSizing:", *(unsigned __int8 *)(v9 + 128));
      objc_initWeak(&location, (id)v9);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __32___UIButtonBar__newGroupLayout___block_invoke;
      v22 = &unk_1E16B5750;
      objc_copyWeak(&v23, &location);
      -[_UIButtonBarItemGroupLayout setItemViewGenerator:](v8, "setItemViewGenerator:", &v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      v8 = 0;
    }

  }
  -[_UIButtonBarItemGroupLayout setFixed:](v8, "setFixed:", a3, v19, v20, v21, v22);
  -[_UIButtonBarItemGroupLayout setSuppressSpacing:](v8, "setSuppressSpacing:", *(unsigned __int8 *)(a1 + 64));
  -[_UIButtonBarItemGroupLayout setSuppressCustomSpacing:](v8, "setSuppressCustomSpacing:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 129));
  -[_UIButtonBarItemGroupLayout setLeadingSpacerType:](v8, "setLeadingSpacerType:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v6);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  if (objc_msgSend(v6, "_isCritical"))
  {
    if (!v6 || (v11 = *((_QWORD *)v6 + 6), v11 != 1) && (v11 || (*((_BYTE *)v6 + 24) & 1) == 0))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (!*(_BYTE *)(v12 + 24))
      {
        *(_BYTE *)(v12 + 24) = 1;
        -[_UIButtonBarItemGroupLayout setCritical:](v8, "setCritical:", 1);
        goto LABEL_21;
      }
      if (!os_variant_has_internal_diagnostics())
      {
        v13 = qword_1ECD7CC78;
        if (!qword_1ECD7CC78)
        {
          v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&qword_1ECD7CC78);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Only one critical group allowed per button bar", (uint8_t *)&v19, 2u);
          if ((a3 & 1) != 0)
            goto LABEL_28;
          goto LABEL_22;
        }
LABEL_21:
        if ((a3 & 1) != 0)
          goto LABEL_28;
        goto LABEL_22;
      }
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v19) = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Only one critical group allowed per button bar", (uint8_t *)&v19, 2u);
      }

      if ((a3 & 1) == 0)
      {
LABEL_22:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v19) = 0;
            _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "critical group should have been marked as fixed already", (uint8_t *)&v19, 2u);
          }

        }
        else
        {
          v15 = qword_1ECD7CC80;
          if (!qword_1ECD7CC80)
          {
            v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&qword_1ECD7CC80);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "critical group should have been marked as fixed already", (uint8_t *)&v19, 2u);
          }
        }
        -[_UIButtonBarItemGroupLayout setFixed:](v8, "setFixed:", 1);
      }
    }
  }
LABEL_28:

}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

id __32___UIButtonBar__newGroupLayout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updatedViewForBarButtonItem:withView:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __35___UIButtonBar_trailingVisibleItem__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __34___UIButtonBar_leadingVisibleItem__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __34___UIButtonBar_needsLeadingSpacer__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __35___UIButtonBar_needsTrailingSpacer__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __33___UIButtonBar_hasVisibleContent__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __39___UIButtonBar_hasAlwaysOverflowGroups__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  _BYTE *v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "isHidden");
  if (v4 && (v3 & 1) == 0 && (v4[24] & 8) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

void __39___UIButtonBar_elementsForOverflowMenu__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  _BYTE *v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "isHidden");
  v4 = v5;
  if (v5 && (v3 & 1) == 0 && (v5[24] & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __35___UIButtonBar_itemAtPoint_inView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *a4 = result;
  return result;
}

void __36___UIButtonBar_trailingClippingItem__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    *a3 = 1;
  else
    *(_BYTE *)(v6 + 24) = 1;

}

uint64_t __36___UIButtonBar__enumerateAllGroups___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
