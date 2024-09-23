@implementation CHSWidgetExtensionProvider(SBHUtilities)

- (id)sbh_extensions
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "containers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "allExtensions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "unionSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_descriptorsByExtensionIdentifier
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "sbh_extensions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extensionBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "orderedWidgetDescriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v11, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_descriptors
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "sbh_extensions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "orderedWidgetDescriptors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)sbh_descriptorForWidgetIdentifiable:()SBHUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "sbh_extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "orderedWidgetDescriptors", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if ((objc_msgSend(v16, "matches:", v4) & 1) != 0)
              {
                v17 = v16;

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v7);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)sbh_extensionForWidget:()SBHUtilities
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widgetExtensionContainerForExtensionBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "extensionForExtensionIdentity:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sbh_descriptorWithKind:()SBHUtilities extensionBundleIdentifier:containerBundleIdentifier:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v30 = a5;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(a1, "sbh_extensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v27)
  {
    v10 = *(_QWORD *)v38;
    v11 = v31;
    v29 = v9;
    v26 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v9);
        v28 = v12;
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v13, "orderedWidgetDescriptors");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v34 != v16)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v18, "extensionIdentity");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "kind");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "isEqualToString:", v8))
              {
                objc_msgSend(v19, "extensionBundleIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v21, "isEqualToString:", v11) & 1) != 0)
                {
                  objc_msgSend(v19, "containerBundleIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", v30);

                  v11 = v31;
                  if ((v23 & 1) != 0)
                  {
                    v24 = v18;

                    v9 = v29;
                    goto LABEL_22;
                  }
                }
                else
                {

                }
              }

            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v15);
        }

        v12 = v28 + 1;
        v9 = v29;
        v10 = v26;
      }
      while (v28 + 1 != v27);
      v24 = 0;
      v27 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v27);
  }
  else
  {
    v24 = 0;
    v11 = v31;
  }
LABEL_22:

  return v24;
}

- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbh_defaultDescriptorForContainerBundleIdentifier:gridSizeClassDomain:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sbh_defaultDescriptorForContainerBundleIdentifier:()SBHUtilities gridSizeClassDomain:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "widgetExtensionContainerForContainerBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "localExtensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "orderedWidgetDescriptors");
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v6, "filterKnownCHSWidgetFamilies:", objc_msgSend(v15, "supportedFamilies", (_QWORD)v17)))
            {
              v12 = v15;
              goto LABEL_14;
            }
          }
          v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sbh_controlDescriptorsByExtensionIdentifier
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "sbh_extensions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extensionBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "orderedControlDescriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v2, "setObject:forKey:", v11, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

@end
