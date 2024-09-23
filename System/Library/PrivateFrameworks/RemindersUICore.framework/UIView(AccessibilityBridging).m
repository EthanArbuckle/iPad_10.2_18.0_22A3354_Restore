@implementation UIView(AccessibilityBridging)

- (uint64_t)ttriAccessibilityShowContextMenuAtPoint:()AccessibilityBridging
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v6, "interactions", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = v13;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v14, "_presentMenuAtLocation:", a2, a3);

                  v7 = 1;
                  goto LABEL_16;
                }

              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_16:

      objc_msgSend(v6, "superview");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }
    while (v15);
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

- (id)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)UIView_0;
  return objc_msgSendSuper2(&v2, sel__accessibilityShouldUseViewHierarchyForFindingScrollParent);
}

@end
