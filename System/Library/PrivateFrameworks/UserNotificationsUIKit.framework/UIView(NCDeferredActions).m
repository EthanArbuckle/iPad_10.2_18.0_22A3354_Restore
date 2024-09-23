@implementation UIView(NCDeferredActions)

- (void)_nc_setHasDeferredActions:()NCDeferredActions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("UIView.NCDeferredActions.hasDeferredActions"), v2, (void *)0x303);

}

- (uint64_t)_nc_subviewHasDeferredActions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, CFSTR("UIView.NCDeferredActions.subviewHasDeferredActions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)_nc_setSubviewHasDeferredActions:()NCDeferredActions
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("UIView.NCDeferredActions.subviewHasDeferredActions"), v5, (void *)0x303);

  if ((a3 & 1) != 0 || (objc_msgSend(a1, "nc_hasDeferredActions") & 1) == 0)
  {
    objc_msgSend(a1, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_nc_setSubviewHasDeferredActions:", a3);

  }
}

- (uint64_t)_nc_setSubviewHasDeferredActions
{
  return objc_msgSend(a1, "_nc_setSubviewHasDeferredActions:", 1);
}

- (uint64_t)nc_hasDeferredActions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, CFSTR("UIView.NCDeferredActions.hasDeferredActions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)nc_setHasDeferredActions
{
  id v2;

  objc_msgSend(a1, "_nc_setHasDeferredActions:", 1);
  objc_msgSend(a1, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_nc_setSubviewHasDeferredActions");

}

- (void)nc_performDeferredActionsIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "_nc_subviewHasDeferredActions") & 1) != 0
    || objc_msgSend(a1, "nc_hasDeferredActions"))
  {
    if (objc_msgSend(a1, "_nc_subviewHasDeferredActions"))
      objc_msgSend(a1, "_nc_setSubviewHasDeferredActions:", 0);
    objc_msgSend(a1, "_nc_setHasDeferredActions:", 0);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "nc_performDeferredActionsIfNeeded");
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (uint64_t)nc_performCrossFadeForDeferredActions
{
  uint64_t result;

  result = objc_msgSend(a1, "nc_hasDeferredActions");
  if ((_DWORD)result)
    return objc_msgSend(a1, "pl_performCrossFadeIfNecessary");
  return result;
}

@end
