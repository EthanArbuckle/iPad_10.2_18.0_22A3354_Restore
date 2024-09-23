@implementation ISURLBagBackend

- (ISURLBagBackend)init
{
  ISURLBagBackend *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *bagValuesDictionary;
  SSDoubleLinkedList *v7;
  SSDoubleLinkedList *bagValuesList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ISURLBagBackend;
  v2 = -[ISURLBagBackend init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStore.URLBagBackend", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bagValuesDictionary = v2->_bagValuesDictionary;
    v2->_bagValuesDictionary = v5;

    v7 = (SSDoubleLinkedList *)objc_alloc_init(MEMORY[0x24BEB1DF8]);
    bagValuesList = v2->_bagValuesList;
    v2->_bagValuesList = v7;

  }
  return v2;
}

- (id)deltaDictionaryRepresentationForBagWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ISURLBagBackend_deltaDictionaryRepresentationForBagWithKey___block_invoke;
  block[3] = &unk_24C43C418;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __62__ISURLBagBackend_deltaDictionaryRepresentationForBagWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v3, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 != v14)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (id)diagnostics
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__ISURLBagBackend_diagnostics__block_invoke;
  v6[3] = &unk_24C43C1D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__ISURLBagBackend_diagnostics__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  id v45;
  id v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR("ISURLBagBackend Diagnostics\n\n"));
  v53 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v40 = a1;
  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v43 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (!v43)
  {
    v47 = 0;
    v51 = 0;
    goto LABEL_38;
  }
  v47 = 0;
  v51 = 0;
  v42 = *(_QWORD *)v71;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v71 != v42)
        objc_enumerationMutation(obj);
      v44 = v7;
      v8 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v7);
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v8, "object");
      v49 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v67 != v11)
              objc_enumerationMutation(v49);
            v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v14 = v53;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            if (v15)
            {
              v16 = v15;
              v17 = 0;
              v18 = 0;
              v19 = *(_QWORD *)v63;
              while (2)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v63 != v19)
                    objc_enumerationMutation(v14);
                  v18 |= v13 == *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                  v17 |= objc_msgSend(v13, "isEqualToString:");
                  if ((v18 & 1) != 0 && (v17 & 1) != 0)
                  {

                    v18 = 1;
                    LOBYTE(v17) = 1;
                    goto LABEL_22;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                if (v16)
                  continue;
                break;
              }
            }
            else
            {
              LOBYTE(v17) = 0;
              v18 = 0;
            }

            if ((v18 & 1) == 0 && (v17 & 1) == 0)
            {
              v21 = v14;
              goto LABEL_31;
            }
LABEL_22:
            if ((v18 & 1) != 0 && (v17 & 1) != 0)
            {
              ++v51;
              continue;
            }
            if (!(v18 & 1 | ((v17 & 1) == 0)))
            {
              v21 = v46;
              ++v47;
LABEL_31:
              objc_msgSend(v21, "addObject:", v13);
              continue;
            }
          }
          v10 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        }
        while (v10);
      }

      v7 = v44 + 1;
    }
    while (v44 + 1 != (char *)v43);
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  }
  while (v43);
LABEL_38:

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendString:", CFSTR("KEYS\n"));
  v22 = (double)(v51 + v47);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendFormat:", CFSTR("Total Reused Keys: %li (%f)\n"), v51, (double)v51 / v22);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendFormat:", CFSTR("Total Copied Keys: %li (%f)\n\n"), v47, (double)v47 / v22);
  v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(*(id *)(v40 + 32), "bagValuesDictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v25;
  v50 = (id)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
  v26 = 0;
  v27 = 0;
  if (v50)
  {
    v48 = *(_QWORD *)v59;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(v45);
        v52 = v28;
        v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v29, "object");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v55;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v55 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k);
              objc_msgSend(v29, "object");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKey:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37 == v38)
              {
                ++v26;
              }
              else if (objc_msgSend(v23, "containsObject:", v37))
              {
                ++v27;
              }
              else
              {
                objc_msgSend(v23, "addObject:", v37);
              }

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
          }
          while (v32);
        }

        v28 = v52 + 1;
      }
      while ((id)(v52 + 1) != v50);
      v50 = (id)objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    }
    while (v50);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendString:", CFSTR("VALUES\n"));
  v39 = (double)(v27 + v26);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendFormat:", CFSTR("Total Delta Values: %li (%f)\n"), v26, (double)v26 / v39);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendFormat:", CFSTR("Total Duplicate Values: %li (%f)\n\n"), v27, (double)v27 / v39);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 40), "appendFormat:", CFSTR("Copied Keys: %@"), v46);

}

- (id)dictionaryRepresentationForBagWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ISURLBagBackend_dictionaryRepresentationForBagWithKey___block_invoke;
  block[3] = &unk_24C43C418;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ISURLBagBackend_dictionaryRepresentationForBagWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "object", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_valueForKey:forBagValuesNode:", v14, v3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (id)valueForKey:(id)a3 forBagWithKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__ISURLBagBackend_valueForKey_forBagWithKey___block_invoke;
  v13[3] = &unk_24C43CCC0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __45__ISURLBagBackend_valueForKey_forBagWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_valueForKey:forBagValuesNode:", *(_QWORD *)(a1 + 48), v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)addBagValues:(id)a3 forBagWithKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ISURLBagBackend_addBagValues_forBagWithKey___block_invoke;
  block[3] = &unk_24C43C1A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

void __46__ISURLBagBackend_addBagValues_forBagWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_bagValuesMapTableWithInitialValues:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E00]), "initWithObject:", v5);
  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "bagValuesList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendNode:", v2);

}

- (void)removeBagValuesForBagWithKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__ISURLBagBackend_removeBagValuesForBagWithKey___block_invoke;
  v7[3] = &unk_24C43C178;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __48__ISURLBagBackend_removeBagValuesForBagWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bagValuesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v20 = a1;
    objc_msgSend(v3, "next");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v5, "copy");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "object");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
          objc_msgSend(v4, "object");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v13)
          {
            v14 = v3;
            objc_msgSend(v3, "object");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16 != v17)
                objc_msgSend(v21, "setObject:forKey:", v16, v10);
            }

            v3 = v14;
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "setObject:", v21);
    objc_msgSend(*(id *)(v20 + 32), "bagValuesDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", *(_QWORD *)(v20 + 40));

    objc_msgSend(*(id *)(v20 + 32), "bagValuesList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeNode:", v3);

  }
}

- (id)description
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[ISURLBagBackend accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__ISURLBagBackend_description__block_invoke;
  v6[3] = &unk_24C43C1D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__ISURLBagBackend_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "bagValuesList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)_bagValue:(id)a3 equalsBagValue:(id)a4
{
  id v5;
  id v6;
  char v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v5, "isEqualToArray:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_bagValuesMapTableWithInitialValues:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = (void *)MEMORY[0x24BDD1650];
  v5 = a3;
  objc_msgSend(v4, "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLBagBackend bagValuesList](self, "bagValuesList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__ISURLBagBackend__bagValuesMapTableWithInitialValues___block_invoke;
  v14[3] = &unk_24C43CCE8;
  v14[4] = self;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v10 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __55__ISURLBagBackend__bagValuesMapTableWithInitialValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_valueForKey:forBagValuesNode:", v10, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)objc_opt_class(), "_bagValue:equalsBagValue:", v5, v6);
  v8 = *(void **)(a1 + 48);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
  else
  {
    objc_msgSend(v8, "setObject:forKey:", v5, v10);
  }

}

- (id)_valueForKey:(id)a3 forBagValuesNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = v8;
      objc_msgSend(v7, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v11)
        break;
      objc_msgSend(v7, "previous");
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
      if (!v12)
        goto LABEL_8;
    }

  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSMutableDictionary)bagValuesDictionary
{
  return self->_bagValuesDictionary;
}

- (void)setBagValuesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_bagValuesDictionary, a3);
}

- (SSDoubleLinkedList)bagValuesList
{
  return self->_bagValuesList;
}

- (void)setBagValuesList:(id)a3
{
  objc_storeStrong((id *)&self->_bagValuesList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagValuesList, 0);
  objc_storeStrong((id *)&self->_bagValuesDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
