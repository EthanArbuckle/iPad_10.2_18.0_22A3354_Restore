@implementation SAInternalAPI

+ (void)getAppPaths:(id)a3 options:(int)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];
  char v32;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke;
  v22[3] = &unk_2518F3918;
  v24 = v31;
  v10 = v8;
  v23 = v10;
  v30 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v22);
  v11 = (void *)v26[5];
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_2;
  v18[3] = &unk_2518F3940;
  v20 = v31;
  v12 = v10;
  v19 = v12;
  v21 = &v25;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_3;
  v15[3] = &unk_2518F3968;
  v14 = v12;
  v16 = v14;
  v17 = &v25;
  objc_msgSend(v13, "getAppPaths:options:reply:", 0, v6, v15);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "invalidate");
  }
  return result;
}

uint64_t __43__SAInternalAPI_getAppPaths_options_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)getAppPathsWithReplyBlock:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v4 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke;
  v18[3] = &unk_2518F3878;
  v5 = v3;
  v19 = v5;
  v20 = &v21;
  v6 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v18);
  v7 = (void *)v22[5];
  v22[5] = (uint64_t)v6;

  v8 = (void *)v22[5];
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_2;
  v15[3] = &unk_2518F3878;
  v9 = v5;
  v16 = v9;
  v17 = &v21;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_3;
  v12[3] = &unk_2518F3968;
  v11 = v9;
  v13 = v11;
  v14 = &v21;
  objc_msgSend(v10, "getAppPaths:options:reply:", 0, 1, v12);

  _Block_object_dispose(&v21, 8);
}

uint64_t __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

void __43__SAInternalAPI_getAppPathsWithReplyBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundles"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("path"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");

}

+ (void)runAppSizerWithReplyBlock:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];
  char v27;

  v3 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v4 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke;
  v17[3] = &unk_2518F3918;
  v19 = v26;
  v5 = v3;
  v18 = v5;
  v25 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v17);
  v6 = (void *)v21[5];
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_2;
  v13[3] = &unk_2518F3940;
  v15 = v26;
  v7 = v5;
  v14 = v7;
  v16 = &v20;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_3;
  v10[3] = &unk_2518F3878;
  v9 = v7;
  v11 = v9;
  v12 = &v20;
  objc_msgSend(v8, "runAppSizer:", v10);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);

}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "invalidate");
  }
  return result;
}

uint64_t __43__SAInternalAPI_runAppSizerWithReplyBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)getPurgeableInfo:(id)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];
  char v32;

  v7 = a3;
  v8 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke;
  v22[3] = &unk_2518F3918;
  v24 = v31;
  v10 = v8;
  v23 = v10;
  v30 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v22);
  v11 = (void *)v26[5];
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_2;
  v18[3] = &unk_2518F3940;
  v20 = v31;
  v12 = v10;
  v19 = v12;
  v21 = &v25;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_3;
  v15[3] = &unk_2518F3990;
  v14 = v12;
  v16 = v14;
  v17 = &v25;
  objc_msgSend(v13, "getPurgeableInfo:options:reply:", v7, a4, v15);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "invalidate");
  }
  return result;
}

uint64_t __48__SAInternalAPI_getPurgeableInfo_options_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)addAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;

  v5 = a3;
  v6 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAppSizerUpdateHandler:", v5);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke;
  v18[3] = &unk_2518F39B8;
  v21 = v22;
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke_2;
  v15[3] = &unk_2518F39E0;
  v13 = v8;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v12, "addAppSizerHandler:reply:", v13, v15);

  _Block_object_dispose(v22, 8);
}

uint64_t __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    return objc_msgSend(*(id *)(v2 + 32), "invalidate");
  }
  return result;
}

void __42__SAInternalAPI_addAppSizerHandler_reply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setControllerID:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)removeAppSizerHandler:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v5 = a3;
  v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__SAInternalAPI_removeAppSizerHandler_reply___block_invoke;
  v11[3] = &unk_2518F39B8;
  v14 = v15;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAppSizerHandler:", v5);
  (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

  _Block_object_dispose(v15, 8);
}

uint64_t __45__SAInternalAPI_removeAppSizerHandler_reply___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    return objc_msgSend(*(id *)(v2 + 32), "invalidate");
  }
  return result;
}

+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];
  char v32;

  v7 = a3;
  v8 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke;
  v22[3] = &unk_2518F3918;
  v24 = v31;
  v10 = v8;
  v23 = v10;
  v30 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v22);
  v11 = (void *)v26[5];
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2;
  v18[3] = &unk_2518F3940;
  v20 = v31;
  v12 = v10;
  v19 = v12;
  v21 = &v25;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_3;
  v15[3] = &unk_2518F3A08;
  v14 = v12;
  v16 = v14;
  v17 = &v25;
  objc_msgSend(v13, "computeSizeOfVolumeAtURL:options:completionHandler:", v7, a4, v15);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40), "invalidate");
  }
  return result;
}

uint64_t __68__SAInternalAPI_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v7, "used");
  v9 = objc_msgSend(v7, "capacity");
  v10 = objc_msgSend(v7, "rawUsed");
  v11 = objc_msgSend(v7, "purgeableSize");
  objc_msgSend(v7, "mountedOn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, id))(v5 + 16))(v5, v8, v9, v10, v11, v12, v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)disableAppSizerResultsFilteringWithReply:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v3);
  v4 = (void *)v16[5];
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke;
  v12[3] = &unk_2518F3878;
  v6 = v3;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke_2;
  v9[3] = &unk_2518F3878;
  v8 = v6;
  v10 = v8;
  v11 = &v15;
  objc_msgSend(v7, "disableAppSizerResultsFilteringWithReply:", v9);

  _Block_object_dispose(&v15, 8);
}

uint64_t __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __58__SAInternalAPI_disableAppSizerResultsFilteringWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)setAppSizerFilteringOptionsToDefaultWithReply:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke;
  v16[3] = &unk_2518F37E0;
  v5 = v3;
  v17 = v5;
  v23 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v16);
  v6 = (void *)v19[5];
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_2;
  v13[3] = &unk_2518F3878;
  v7 = v5;
  v14 = v7;
  v15 = &v18;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_3;
  v10[3] = &unk_2518F3878;
  v9 = v7;
  v11 = v9;
  v12 = &v18;
  objc_msgSend(v8, "setAppSizerResultsFilteringOptionsToDefaultWithReply:", v10);

  _Block_object_dispose(&v18, 8);
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __63__SAInternalAPI_setAppSizerFilteringOptionsToDefaultWithReply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)setForceTelemetry:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke;
  v16[3] = &unk_2518F37E0;
  v5 = v3;
  v17 = v5;
  v23 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v16);
  v6 = (void *)v19[5];
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke_2;
  v13[3] = &unk_2518F3878;
  v7 = v5;
  v14 = v7;
  v15 = &v18;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __35__SAInternalAPI_setForceTelemetry___block_invoke_3;
  v10[3] = &unk_2518F3878;
  v9 = v7;
  v11 = v9;
  v12 = &v18;
  objc_msgSend(v8, "setForceTelemetry:", v10);

  _Block_object_dispose(&v18, 8);
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __35__SAInternalAPI_setForceTelemetry___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)setForceTTR:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v5);
  v6 = (void *)v18[5];
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __35__SAInternalAPI_setForceTTR_reply___block_invoke;
  v14[3] = &unk_2518F3878;
  v8 = v5;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __35__SAInternalAPI_setForceTTR_reply___block_invoke_2;
  v11[3] = &unk_2518F3878;
  v10 = v8;
  v12 = v10;
  v13 = &v17;
  objc_msgSend(v9, "setForceTTR:reply:", v4, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __35__SAInternalAPI_setForceTTR_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __35__SAInternalAPI_setForceTTR_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)setEnableTTR:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v5);
  v6 = (void *)v18[5];
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __36__SAInternalAPI_setEnableTTR_reply___block_invoke;
  v14[3] = &unk_2518F3878;
  v8 = v5;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __36__SAInternalAPI_setEnableTTR_reply___block_invoke_2;
  v11[3] = &unk_2518F3878;
  v10 = v8;
  v12 = v10;
  v13 = &v17;
  objc_msgSend(v9, "setEnableTTR:reply:", v4, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __36__SAInternalAPI_setEnableTTR_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __36__SAInternalAPI_setEnableTTR_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)setAppSizerMaxRerunTimeout:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v5);
  v6 = (void *)v18[5];
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke;
  v14[3] = &unk_2518F3878;
  v8 = v5;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke_2;
  v11[3] = &unk_2518F3878;
  v10 = v8;
  v12 = v10;
  v13 = &v17;
  objc_msgSend(v9, "setAppSizerMaxRerunTimeout:reply:", v4, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __50__SAInternalAPI_setAppSizerMaxRerunTimeout_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)getLastTelemetryData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke;
  v16[3] = &unk_2518F37E0;
  v5 = v3;
  v17 = v5;
  v23 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v16);
  v6 = (void *)v19[5];
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke_2;
  v13[3] = &unk_2518F3878;
  v7 = v5;
  v14 = v7;
  v15 = &v18;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __38__SAInternalAPI_getLastTelemetryData___block_invoke_3;
  v10[3] = &unk_2518F3990;
  v9 = v7;
  v11 = v9;
  v12 = &v18;
  objc_msgSend(v8, "getLastTelemetryData:", v10);

  _Block_object_dispose(&v18, 8);
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __38__SAInternalAPI_getLastTelemetryData___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)importFromPlist:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke;
  v19[3] = &unk_2518F37E0;
  v8 = v6;
  v20 = v8;
  v26 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v19);
  v9 = (void *)v22[5];
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke_2;
  v16[3] = &unk_2518F3878;
  v10 = v8;
  v17 = v10;
  v18 = &v21;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __39__SAInternalAPI_importFromPlist_reply___block_invoke_3;
  v13[3] = &unk_2518F3878;
  v12 = v10;
  v14 = v12;
  v15 = &v21;
  objc_msgSend(v11, "importFromPlist:reply:", v5, v13);

  _Block_object_dispose(&v21, 8);
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __39__SAInternalAPI_importFromPlist_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

+ (void)clearLastTelemetryData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v3);
  v4 = (void *)v16[5];
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__SAInternalAPI_clearLastTelemetryData___block_invoke;
  v12[3] = &unk_2518F3878;
  v6 = v3;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __40__SAInternalAPI_clearLastTelemetryData___block_invoke_2;
  v9[3] = &unk_2518F3878;
  v8 = v6;
  v10 = v8;
  v11 = &v15;
  objc_msgSend(v7, "clearLastTelemetryData:", v9);

  _Block_object_dispose(&v15, 8);
}

uint64_t __40__SAInternalAPI_clearLastTelemetryData___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

uint64_t __40__SAInternalAPI_clearLastTelemetryData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

@end
