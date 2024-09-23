@implementation SAPathManager

+ (SAPathManager)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SAPathManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_once != -1)
    dispatch_once(&defaultManager_once, block);
  return (SAPathManager *)(id)defaultManager__self;
}

void __31__SAPathManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager__self;
  defaultManager__self = (uint64_t)v1;

}

- (id)checkUnAllowedBundleIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[128];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v25[0] = CFSTR("com.apple.fakeapp.System");
  v25[1] = CFSTR("com.apple.fakeapp.SystemData");
  v25[2] = CFSTR("com.apple.fakeapp.SoftwareUpdate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  v7 = (void *)v6;
  if (v6)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)MEMORY[0x249583724](v6);
        objc_msgSend(v10, "bundleID", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v12))
        {
          v13 = (void *)MEMORY[0x24BDD1540];
          v14 = *MEMORY[0x24BDD1128];
          v22 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Un-allowed bundleID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 22, v16);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v11);
          goto LABEL_11;
        }

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v7 = (void *)v6;
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)checkUnAllowedPaths:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke;
  v6[3] = &unk_2518F3850;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(&unk_2518F76A8, "containsObject:", v8);

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD1128];
      v38 = *MEMORY[0x24BDD0FC8];
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Path (%@) is not permitted to be registered for bundle (%@)"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    else
    {
      v27 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke_2;
      v35[3] = &unk_2518F3828;
      v28 = v6;
      v29 = *(_QWORD *)(a1 + 32);
      v36 = v28;
      v37 = v29;
      objc_msgSend(&unk_2518F76C0, "enumerateObjectsUsingBlock:", v35);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      {
        v32[0] = v27;
        v32[1] = 3221225472;
        v32[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke_3;
        v32[3] = &unk_2518F3828;
        v30 = v28;
        v31 = *(_QWORD *)(a1 + 32);
        v33 = v30;
        v34 = v31;
        objc_msgSend(&unk_2518F76D8, "enumerateObjectsUsingBlock:", v32);

      }
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD1128];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid paths input, not all objects in the paths array are of type SAPathInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a4 = 1;

}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", v6);

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD1128];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Registering paths under %@ is not permitted"), v6, *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsString:", v7);

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD1128];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("Registering paths with reference to current/parent directory is not allowed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

- (id)checkForDuplicatePathsWithDifferentExclusivity:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  id obj;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v26 = 0;
    v27 = *(_QWORD *)v29;
    v24 = *MEMORY[0x24BDD0B88];
    v23 = *MEMORY[0x24BDD0FD8];
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x249583724]();
        objc_msgSend(v8, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v10);
          goto LABEL_12;
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "exclusive");
        if (v13 == objc_msgSend(v8, "exclusive"))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
        v18 = (void *)MEMORY[0x24BDD1540];
        v32 = v23;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Path %@ is supplied more than once with different exclusivity OR multiple bundles"), v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", v24, 1024, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v26 = (id)v21;
LABEL_12:

        objc_autoreleasePoolPop(v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (!v6)
        goto LABEL_16;
    }
  }
  v26 = 0;
LABEL_16:

  return v26;
}

- (BOOL)validatePaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bundleID", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10 || !objc_msgSend(v10, "length"))
          {

            v12 = 0;
            goto LABEL_16;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v12 = 1;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v12 = 1;
    }
LABEL_16:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)registerPaths:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[SAPathManager checkUnAllowedPaths:](self, "checkUnAllowedPaths:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10[2](v10, v11);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setBundleID:", v9, (_QWORD)v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

    -[SAPathManager registerPaths:completionHandler:](self, "registerPaths:completionHandler:", v12, v10);
  }

}

- (void)registerPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(id, void *);
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, void *);
  uint64_t *v26;
  _QWORD v27[4];
  void (**v28)(id, void *);
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (-[SAPathManager validatePaths:](self, "validatePaths:", v6))
    {
      -[SAPathManager checkUnAllowedBundleIDs:](self, "checkUnAllowedBundleIDs:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[SAPathManager checkUnAllowedPaths:](self, "checkUnAllowedPaths:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v7[2](v7, v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "allObjects");
          v18 = objc_claimAutoreleasedReturnValue();

          -[SAPathManager checkForDuplicatePathsWithDifferentExclusivity:](self, "checkForDuplicatePathsWithDifferentExclusivity:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v7[2](v7, v19);
          }
          else
          {
            v30 = 0;
            v31 = &v30;
            v32 = 0x3032000000;
            v33 = __Block_byref_object_copy__1;
            v34 = __Block_byref_object_dispose__1;
            v35 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", 0);
            v20 = (void *)v31[5];
            v21 = MEMORY[0x24BDAC760];
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __49__SAPathManager_registerPaths_completionHandler___block_invoke;
            v27[3] = &unk_2518F3878;
            v22 = v7;
            v28 = v22;
            v29 = &v30;
            objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v27);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = v21;
            v24[1] = 3221225472;
            v24[2] = __49__SAPathManager_registerPaths_completionHandler___block_invoke_2;
            v24[3] = &unk_2518F3878;
            v25 = v22;
            v26 = &v30;
            objc_msgSend(v23, "registerPaths:reply:", v18, v24);

            _Block_object_dispose(&v30, 8);
          }

          v6 = (id)v18;
        }

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 1024, 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v7[2](v7, v8);
    goto LABEL_10;
  }
  SALog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SAPathManager registerPaths:completionHandler:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
LABEL_10:

}

uint64_t __49__SAPathManager_registerPaths_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __49__SAPathManager_registerPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_2478E3000, v4, OS_LOG_TYPE_DEFAULT, "registerPaths returned err %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");

}

- (void)unregisterPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *);
  void *v8;
  uint64_t v9;
  void (**v10)(id, NSObject *);
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  void (**v29)(id, NSObject *);
  uint64_t *v30;
  _QWORD v31[4];
  void (**v32)(id, NSObject *);
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  if (!v7)
  {
    SALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SAPathManager unregisterPaths:completionHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_9;
  }
  if (!-[SAPathManager validatePaths:](self, "validatePaths:", v6))
  {
    SALog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SAPathManager unregisterPaths:completionHandler:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 1024, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
LABEL_9:

    goto LABEL_10;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  v39 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", 0);
  v8 = (void *)v35[5];
  v9 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __51__SAPathManager_unregisterPaths_completionHandler___block_invoke;
  v31[3] = &unk_2518F3878;
  v10 = v7;
  v32 = v10;
  v33 = &v34;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_130;
  v28[3] = &unk_2518F3878;
  v29 = v10;
  v30 = &v34;
  objc_msgSend(v11, "unregisterPaths:reply:", v6, v28);

  _Block_object_dispose(&v34, 8);
LABEL_10:

}

uint64_t __51__SAPathManager_unregisterPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_cold_1(v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_130_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");

}

- (void)unregisterURLs:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v8;
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
        +[SAPathInfo pathInfoWithURL:bundleID:](SAPathInfo, "pathInfoWithURL:bundleID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), v9, (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  -[SAPathManager unregisterPaths:completionHandler:](self, "unregisterPaths:completionHandler:", v11, v10);
}

- (void)registerPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s: completionHandler is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s: completionHandler is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a1, a3, "%s: Invalid paths", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2478E3000, log, OS_LOG_TYPE_ERROR, "connection dropped", v1, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_130_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2478E3000, a2, a3, "unregisterURLs returned err %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
