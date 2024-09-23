@implementation NSObject(UIAccessibilityMathExpression)

- (uint64_t)accessibilityExpandMathEquation:()UIAccessibilityMathExpression
{
  id v3;
  char isKindOfClass;
  UIAccessibilityMathViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  UIAccessibilityMathViewController *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v5 = -[UIAccessibilityMathViewController initWithMathDictionary:]([UIAccessibilityMathViewController alloc], "initWithMathDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityPresentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v20 = v5;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v8, "viewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "mathDictionary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToDictionary:", v3);

            if ((v16 & 1) != 0)
            {

              _AXLogWithFacility();
              v5 = v20;
              goto LABEL_14;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v12)
            continue;
          break;
        }
      }

      v5 = v20;
      objc_msgSend(v9, "pushViewController:animated:", v20, 1);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
      objc_msgSend(v9, "pushViewController:animated:", v5, 0);
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessibilityPresentingViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "presentViewController:animated:completion:", v9, 1, 0);
    }
LABEL_14:

  }
  return isKindOfClass & 1;
}

@end
