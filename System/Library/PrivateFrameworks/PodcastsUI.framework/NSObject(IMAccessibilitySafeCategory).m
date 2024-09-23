@implementation NSObject(IMAccessibilitySafeCategory)

- (id)imaxIdentification
{
  return objc_getAssociatedObject(a1, &AXIdentifier);
}

- (void)imaxSetIdentification:()IMAccessibilitySafeCategory
{
  objc_setAssociatedObject(a1, &AXIdentifier, a3, (void *)1);
}

- (void)imaxStorageSetRetainedValue:()IMAccessibilitySafeCategory forKey:
{
  id v6;
  id value;

  v6 = a4;
  value = a3;
  objc_setAssociatedObject(a1, (const void *)objc_msgSend(v6, "hash"), value, (void *)0x301);

}

- (id)imaxStorageValueForKey:()IMAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_getAssociatedObject(a1, (const void *)objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imaxValueForKey:()IMAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imaxValueForKeyPath:()IMAccessibilitySafeCategory
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)imaxBoolForKey:()IMAccessibilitySafeCategory
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "imaxValueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)_imaxFindAncestor:()IMAccessibilitySafeCategory
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "imaxValueForKey:", CFSTR("accessibilityContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    do
    {
      if ((v4[2](v4, v5) & 1) != 0)
        break;
      objc_msgSend(v5, "imaxValueForKey:", CFSTR("accessibilityContainer"));
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (id)imaxElementIsAncestor:()IMAccessibilitySafeCategory
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__NSObject_IMAccessibilitySafeCategory__imaxElementIsAncestor___block_invoke;
  v8[3] = &unk_1EA0C5D70;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_imaxFindAncestor:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imaxAncestorIsKindOf:()IMAccessibilitySafeCategory
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__NSObject_IMAccessibilitySafeCategory__imaxAncestorIsKindOf___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "_imaxFindAncestor:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityFindDescendant:()IMAccessibilitySafeCategory
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  objc_msgSend(v5, "addObject:", a1);
  if (objc_msgSend(v5, "count"))
  {
    while (1)
    {
      objc_msgSend(v5, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeLastObject");
      if ((v4[2](v4, v6) & 1) != 0)
        break;
      v7 = objc_msgSend(v6, "accessibilityElementCount");
      if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(v6, "subviews", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "reverseObjectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v19;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v19 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            }
            while (v14);
          }

        }
      }
      else
      {
        v8 = v7 + 1;
        do
        {
          objc_msgSend(v6, "accessibilityElementAtIndex:", v8 - 2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v5, "addObject:", v9);

          --v8;
        }
        while (v8 > 1);
      }

      if (!objc_msgSend(v5, "count"))
        goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
    v6 = 0;
  }

  return v6;
}

- (id)imaxDescendentOfType:()IMAccessibilitySafeCategory
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__NSObject_IMAccessibilitySafeCategory__imaxDescendentOfType___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "_accessibilityFindDescendant:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)imaxUnignoredDescendant
{
  return objc_msgSend(a1, "_accessibilityFindDescendant:", &__block_literal_global_10);
}

@end
