@implementation REInterfaceCache

- (BOOL)_supportsCache
{
  if (_supportsCache_onceToken != -1)
    dispatch_once(&_supportsCache_onceToken, &__block_literal_global_50);
  return _supportsCache_Supported;
}

void __34__REInterfaceCache__supportsCache__block_invoke()
{
  char v0;

  if (_fetchedInternalBuildOnceToken_5 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_5, &__block_literal_global_32_0);
  v0 = _isInternalDevice_5;
  if (_isInternalDevice_5)
    v0 = REProcessIsRelevanced() ^ 1;
  _supportsCache_Supported = v0;
}

uint64_t __34__REInterfaceCache__supportsCache__block_invoke_2()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_5 = result;
  return result;
}

- (id)_init
{
  _QWORD *v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REInterfaceCache;
  v2 = -[RESingleton _init](&v8, sel__init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.RelevanceEngine.REInterfaceCache", 0);
    v4 = (void *)v2[1];
    v2[1] = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[2];
    v2[2] = v5;

  }
  return v2;
}

- (id)_supportedProtocols
{
  if (_supportedProtocols_onceToken != -1)
    dispatch_once(&_supportedProtocols_onceToken, &__block_literal_global_35_1);
  return (id)_supportedProtocols_Protocols;
}

void __39__REInterfaceCache__supportedProtocols__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_254B9CBD0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_supportedProtocols_Protocols;
  _supportedProtocols_Protocols = v0;

}

- (id)_queue_valueForKey:(id)a3 level:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  Protocol *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[5];
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  unint64_t v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_supportedInterfaces, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_21;
  if (a4 != 5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 256);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 256, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 256, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke;
    v79[3] = &unk_24CF8F080;
    v23 = v20;
    v80 = v23;
    v24 = v21;
    v81 = v24;
    v25 = (void *)MEMORY[0x2199B2434](v79);
    v73[0] = v22;
    v73[1] = 3221225472;
    v73[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_2;
    v73[3] = &unk_24CF8F0A8;
    v73[4] = self;
    v78 = a4;
    v56 = v17;
    v74 = v56;
    v55 = v18;
    v75 = v55;
    v26 = v19;
    v76 = v26;
    v27 = v25;
    v77 = v27;
    v28 = (void *)MEMORY[0x2199B2434](v73);
    v72[0] = v22;
    v72[1] = 3221225472;
    v72[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_3;
    v72[3] = &unk_24CF8F0D0;
    v72[4] = self;
    v66[0] = v22;
    v66[1] = 3221225472;
    v66[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_4;
    v66[3] = &unk_24CF8F120;
    v29 = (id)MEMORY[0x2199B2434](v72);
    v69 = v29;
    v57 = v28;
    v70 = v57;
    v30 = v26;
    v67 = v30;
    v31 = v6;
    v68 = v31;
    v32 = v27;
    v71 = v32;
    objc_msgSend(v31, "enumerateConformedProperties:", v66);
    if (objc_msgSend(v31, "isProtocol"))
    {
      objc_msgSend(v31, "protocol");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (*((uint64_t (**)(id, void *))v29 + 2))(v29, v33);

      if (!v34)
      {
LABEL_20:
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setType:", v31);
        objc_msgSend(v7, "setConformedInterfaces:", v55);
        objc_msgSend(v7, "setConformedProtocols:", v30);
        objc_msgSend(v7, "setProperties:", v23);
        objc_msgSend(v7, "setMethods:", v24);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_supportedInterfaces, "setObject:forKeyedSubscript:", v7, v31);

        goto LABEL_21;
      }
      v51 = v29;
      v52 = v30;
      v53 = v24;
      v54 = v23;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x24BDAC760];
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_6;
      v64[3] = &unk_24CF8F0F8;
      v37 = v35;
      v65 = v37;
      objc_msgSend(v31, "enumerateExposedProperties:", v64);
      objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 256);
      v62[0] = v36;
      v62[1] = 3221225472;
      v62[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_7;
      v62[3] = &unk_24CF8F148;
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v63 = v38;
      objc_msgSend(v31, "enumerateExposedMethods:", v62);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[REInterfaceCache _supportedProtocols](self, "_supportedProtocols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v59 != v42)
              objc_enumerationMutation(v39);
            (*((void (**)(id, _QWORD, id, id))v32 + 2))(v32, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), v37, v38);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
        }
        while (v41);
      }

      v24 = v53;
      v23 = v54;
      v29 = v51;
      v30 = v52;
    }
    else
    {
      objc_msgSend(v31, "superclassKey");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (v37)
        (*((void (**)(id, id))v57 + 2))(v57, v37);
    }

    goto LABEL_20;
  }
  v8 = (void *)*MEMORY[0x24BDD1108];
  if ((objc_msgSend(v6, "isProtocol") & 1) != 0)
  {
    objc_msgSend(v6, "protocol");
    v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v8, CFSTR("Attempting to unwrap %@, but we're already 5 levels deep. Is this an error?"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);

  }
  else
  {
    NSStringFromClass((Class)objc_msgSend(v6, "cls"));
    v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v8, CFSTR("Attempting to unwrap %@, but we're already 5 levels deep. Is this an error?"), v44, v45, v46, v47, v48, v49, (uint64_t)v9);
  }

  v7 = 0;
LABEL_21:

  return v7;
}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
    {
LABEL_3:
      objc_msgSend(v9, "unionSet:", v7);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v13);
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 256);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v11, v13);
    if (v8)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 256);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionHashTable:", v12);

    goto LABEL_11;
  }
  if (!v8)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v11, "unionHashTable:", v8);
LABEL_11:

}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_queue_valueForKey:level:", v3, *(_QWORD *)(a1 + 72) + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v17 = v3;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v5 = *(void **)(a1 + 56);
    objc_msgSend(v4, "conformedProtocols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionHashTable:", v6);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_supportedProtocols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_msgSend(v4, "properties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "methods");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v3 = v17;
  }

}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_3(uint64_t a1, void *a2)
{
  Protocol *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_supportedProtocols", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (protocol_conformsToProtocol(v3, *(Protocol **)(*((_QWORD *)&v9 + 1) + 8 * i)))
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke_4(uint64_t a1, void *a2)
{
  Protocol *v3;
  _REInterfaceKey *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v4 = -[_REInterfaceKey initWithProtocol:]([_REInterfaceKey alloc], "initWithProtocol:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    if (protocol_isEqual(v3, (Protocol *)&unk_254BA4C78) || protocol_conformsToProtocol(v3, (Protocol *)&unk_254BA4C78))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_5;
      v10[3] = &unk_24CF8F0F8;
      v11 = v5;
      v7 = v5;
      objc_msgSend(v6, "enumerateAutomaticProperties:", v10);
      v8 = *(_QWORD *)(a1 + 64);
      v9 = (void *)objc_opt_new();
      (*(void (**)(uint64_t, void *, id, void *))(v8 + 16))(v8, &unk_254B9CBD0, v7, v9);

    }
  }

}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_accessInterfaceForKey:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__19;
  v16 = __Block_byref_object_dispose__19;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__REInterfaceCache__accessInterfaceForKey___block_invoke;
  block[3] = &unk_24CF8DCF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__REInterfaceCache__accessInterfaceForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_valueForKey:level:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_enumeratePropertiesOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v10 && -[REInterfaceCache _supportsCache](self, "_supportsCache"))
  {
    -[REInterfaceCache _accessInterfaceForKey:](self, "_accessInterfaceForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v11, "properties", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (void)_enumerateMethodsOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v10 && -[REInterfaceCache _supportsCache](self, "_supportsCache"))
  {
    -[REInterfaceCache _accessInterfaceForKey:](self, "_accessInterfaceForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v11, "methods", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (BOOL)_interface:(id)a3 implementsInterface:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (-[REInterfaceCache _supportsCache](self, "_supportsCache"))
  {
    -[REInterfaceCache _accessInterfaceForKey:](self, "_accessInterfaceForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conformedProtocols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)exportedInterfaceClass:(Class)a3
{
  _REInterfaceKey *v4;

  v4 = -[_REInterfaceKey initWithClass:]([_REInterfaceKey alloc], "initWithClass:", a3);
  LOBYTE(self) = -[REInterfaceCache _interface:implementsInterface:](self, "_interface:implementsInterface:", v4, &unk_254B9CBD0);

  return (char)self;
}

- (BOOL)exportedInterfaceProtocol:(id)a3
{
  id v4;
  _REInterfaceKey *v5;

  v4 = a3;
  v5 = -[_REInterfaceKey initWithProtocol:]([_REInterfaceKey alloc], "initWithProtocol:", v4);

  LOBYTE(self) = -[REInterfaceCache _interface:implementsInterface:](self, "_interface:implementsInterface:", v5, &unk_254B9CBD0);
  return (char)self;
}

- (void)enumerateExportedPropertiesOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6;
  _REInterfaceKey *v7;

  v6 = a4;
  v7 = -[_REInterfaceKey initWithClass:]([_REInterfaceKey alloc], "initWithClass:", a3);
  -[REInterfaceCache _enumeratePropertiesOfInterface:forProtocol:usingBlock:](self, "_enumeratePropertiesOfInterface:forProtocol:usingBlock:", v7, &unk_254B9CBD0, v6);

}

- (void)enumerateExportedPropertiesOfProtocol:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _REInterfaceKey *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_REInterfaceKey initWithProtocol:]([_REInterfaceKey alloc], "initWithProtocol:", v7);

  -[REInterfaceCache _enumeratePropertiesOfInterface:forProtocol:usingBlock:](self, "_enumeratePropertiesOfInterface:forProtocol:usingBlock:", v8, &unk_254B9CBD0, v6);
}

- (void)enumerateExportedMethodsOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6;
  _REInterfaceKey *v7;

  v6 = a4;
  v7 = -[_REInterfaceKey initWithClass:]([_REInterfaceKey alloc], "initWithClass:", a3);
  -[REInterfaceCache _enumerateMethodsOfInterface:forProtocol:usingBlock:](self, "_enumerateMethodsOfInterface:forProtocol:usingBlock:", v7, &unk_254B9CBD0, v6);

}

- (void)enumerateExportedMethodsOfProtocol:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _REInterfaceKey *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_REInterfaceKey initWithProtocol:]([_REInterfaceKey alloc], "initWithProtocol:", v7);

  -[REInterfaceCache _enumerateMethodsOfInterface:forProtocol:usingBlock:](self, "_enumerateMethodsOfInterface:forProtocol:usingBlock:", v8, &unk_254B9CBD0, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInterfaces, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
