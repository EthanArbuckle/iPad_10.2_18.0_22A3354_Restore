@implementation SXAXCustomRotorProvider

- (SXAXCustomRotorProvider)init
{
  return (SXAXCustomRotorProvider *)-[SXAXCustomRotorProvider initWithRootElement:](self, 0);
}

- (_QWORD)initWithRootElement:(_QWORD *)a1
{
  id v3;
  id v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SXAXCustomRotorProvider;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 2, v3);
      v5 = (void *)a1[1];
      a1[1] = 0;

    }
  }

  return a1;
}

- (id)graphSearchForAvailableCustomRotorsAndUpdateCache
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v2 = *(id *)(a1 + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v49 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "setRotorItems:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  v35 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v34 = (void *)v7;
  objc_msgSend(WeakRetained, "_accessibilityLeafDescendantsWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v14 = &selRef_pageNumber;
    v36 = *(_QWORD *)v45;
    do
    {
      v15 = 0;
      v37 = v12;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v15);
        if (objc_msgSend(v16, "conformsToProtocol:", v14[465]))
        {
          v39 = v15;
          v17 = v16;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v17, "supportedCustomRotors");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v41 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                objc_msgSend(v17, "itemsForCustomRotor:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "count"))
                {
                  objc_msgSend(v10, "addObject:", v23);
                  v25 = objc_alloc(MEMORY[0x24BDBCEE0]);
                  objc_msgSend(v23, "rotorItems");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = (void *)objc_msgSend(v25, "initWithOrderedSet:", v26);

                  objc_msgSend(v24, "array");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "addObjectsFromArray:", v28);

                  v29 = (void *)objc_msgSend(v27, "copy");
                  objc_msgSend(v23, "setRotorItems:", v29);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v20);
          }

          v13 = v36;
          v12 = v37;
          v14 = &selRef_pageNumber;
          v15 = v39;
        }
        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v12);
  }

  v30 = objc_msgSend(v10, "copy");
  v31 = *(void **)(v35 + 8);
  *(_QWORD *)(v35 + 8) = v30;

  v32 = *(id *)(v35 + 8);
  return v32;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootElement);
  objc_storeStrong((id *)&self->_cachedAvailableRotors, 0);
}

@end
