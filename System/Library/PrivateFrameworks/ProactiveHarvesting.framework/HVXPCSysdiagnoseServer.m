@implementation HVXPCSysdiagnoseServer

- (void)sysdiagnoseStringWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = (void (**)(id, void *, _QWORD))a3;
  hv_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA1D000, v4, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseServer: sysdiagnoseStringWithCompletion called.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__41;
  v22 = __Block_byref_object_dispose__42;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__41;
  v16 = __Block_byref_object_dispose__42;
  v17 = 0;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__HVXPCSysdiagnoseServer_sysdiagnoseStringWithCompletion___block_invoke;
  v11[3] = &unk_24DD7F3B0;
  v11[4] = &v12;
  v11[5] = buf;
  objc_msgSend(v5, "statsWithCompletion:", v11);

  v6 = v13[5];
  v7 = (id *)(v19 + 40);
  if (v6)
  {
    obj = (id)*((_QWORD *)v19 + 5);
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, obj);
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      v3[2](v3, v9, 0);

    }
    else
    {
      v3[2](v3, 0, *((_QWORD *)v19 + 5));
    }

  }
  else
  {
    v3[2](v3, 0, *((_QWORD *)v19 + 5));
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
}

void __58__HVXPCSysdiagnoseServer_sysdiagnoseStringWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    hv_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_ERROR, "HVXPCSysdiagnoseServer: sysdiagnoseStringWithCompletion: error: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

@end
