@implementation UIStatusBarCellularCondensedItem

BOOL __63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
  {
    objc_msgSend(v2, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

__CFString *__63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  __CFString *v6;

  v5 = a2;
  if (objc_msgSend(v5, "status") == 5 || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0)
  {
    *a3 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 0;
    if (objc_msgSend(v5, "status") == 1 || objc_msgSend(v5, "status") == 2)
    {
      v6 = CFSTR("– –");
      goto LABEL_5;
    }
  }
  objc_msgSend(v5, "string");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v6;
}

uint64_t __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setMarqueeRunning:", 1);
  return result;
}

void __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMarqueeRunning:", 1);

    objc_msgSend(*(id *)(a1 + 32), "stringViews");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMarqueeRunning:", 1);

  }
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "wifiCallingEnabled"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

@end
