@implementation KTIDStaticKeyStore

- (id)findByContact:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2_130;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_128);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__KTIDStaticKeyStore_findByContact_error___block_invoke_129;
    v10[3] = &unk_24DC90100;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "findStaticKeyStoreMappingByContact:complete:", v8, v10);
  }

}

- (BOOL)addMapping:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)setContactServerPath:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)addStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 error:(id *)a6
{
  return -[KTIDStaticKeyStore updateStaticKeyEntry:contactServerPath:contactIdentifier:mappings:error:](self, "updateStaticKeyEntry:contactServerPath:contactIdentifier:mappings:error:", a3, a4, a5, MEMORY[0x24BDBD1A8], a6);
}

- (BOOL)updateStaticKeyEntry:(id)a3 contactServerPath:(id)a4 contactIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke;
  v23[3] = &unk_24DC90128;
  v28 = &v30;
  v16 = v11;
  v24 = v16;
  v17 = v13;
  v25 = v17;
  v18 = v12;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v29 = &v36;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_3;
  v22[3] = &unk_24DC8F078;
  v22[4] = &v30;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v23, v22);
  v20 = v37[5];
  if (a7 && !v20)
    *a7 = objc_retainAutorelease((id)v31[5]);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20 != 0;
}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;

  v6 = a3;
  v7 = v6;
  if (!a2 || v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
  }
  else
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_2;
    v12[3] = &unk_24DC90100;
    v13 = *((_OWORD *)a1 + 4);
    objc_msgSend(a2, "updateStaticKeyEntry:contactIdentifier:contactExternalIdentifier:mappings:error:", v8, v9, v10, v11, v12);
  }

}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_15);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown updateStaticKeyEntry error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __94__KTIDStaticKeyStore_updateStaticKeyEntry_contactServerPath_contactIdentifier_mappings_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)updateStaticKeyEntry:(id)a3 contact:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke;
  v15[3] = &unk_24DC90150;
  v18 = &v20;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v19 = &v26;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_3;
  v14[3] = &unk_24DC8F078;
  v14[4] = &v20;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v15, v14);
  v12 = v27[5];
  if (a5 && !v12)
    *a5 = objc_retainAutorelease((id)v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12 != 0;
}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    v7 = a1[4];
    v8 = a1[5];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_2;
    v9[3] = &unk_24DC90100;
    v10 = *((_OWORD *)a1 + 3);
    objc_msgSend(a2, "updateStaticKeyEntry:contact:complete:", v7, v8, v9);
  }

}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_106);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown updateStaticKeyEntry error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __57__KTIDStaticKeyStore_updateStaticKeyEntry_contact_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)removeMapping:(id)a3 forKTId:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)removeEntryByKDID:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v19;
  v7 = v5;
  v12 = v7;
  v14 = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2_110;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v19;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_107);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByKDID error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_108;
    v10[3] = &unk_24DC90198;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "removeEntryByKDID:complete:", v8, v10);
  }

}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_108(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_2_110(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_111);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByKDID error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __46__KTIDStaticKeyStore_removeEntryByKDID_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)removeEntryByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v19;
  v7 = v5;
  v12 = v7;
  v14 = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2_114;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v19;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_112);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByContactIdentifier error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_113;
    v10[3] = &unk_24DC90198;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "removeEntryByContactIdentifier:complete:", v8, v10);
  }

}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_113(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_2_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_115);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __59__KTIDStaticKeyStore_removeEntryByContactIdentifier_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)removeEntryByContact:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v19;
  v7 = v5;
  v12 = v7;
  v14 = &v15;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2_118;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v19;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_116);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection removeEntryByContactIdentifier error: %@", buf, 0xCu);
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v7;
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_117;
    v12[3] = &unk_24DC90198;
    v13 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "removeEntryByContactIdentifier:complete:", v8, v12);
  }

}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_117(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_2_118(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_119);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__KTIDStaticKeyStore_removeEntryByContact_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)findKeyByContactsServerPath:(id)a3 contactIdentifier:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)findKeyByHandle:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2_122;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_120);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_121;
    v10[3] = &unk_24DC90100;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "findStaticKeyStoreMappingByIDSURI:complete:", v8, v10);
  }

}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_2_122(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_123_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown removeEntryByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __44__KTIDStaticKeyStore_findKeyByHandle_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)findByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2_126;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_124);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Connection findKeyByHandle error: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_125;
    v10[3] = &unk_24DC90100;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "findStaticKeyStoreMappingByContactIdentifer:complete:", v8, v10);
  }

}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_2_126(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_127);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown findByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__KTIDStaticKeyStore_findByContactIdentifier_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_2_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_131);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown findByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __42__KTIDStaticKeyStore_findByContact_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)findByIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_3;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_2;
    v8[3] = &unk_24DC90100;
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(a2, "findStaticKeyStoreMappingByKey:complete:", v7, v8);
  }

}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_132);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown findByIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __45__KTIDStaticKeyStore_findByIdentifier_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)validateByIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_3;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_2;
    v8[3] = &unk_24DC90100;
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(a2, "validateStaticKeyStoreMappingByKey:complete:", v7, v8);
  }

}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_133);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown validateByIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__KTIDStaticKeyStore_validateByIdentifier_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)validateByContact:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTIDStaticKeyStore validateByContactIdentifier:error:](self, "validateByContactIdentifier:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)validateByContactIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke;
  v11[3] = &unk_24DC8F030;
  v13 = &v15;
  v7 = v5;
  v12 = v7;
  v14 = &v21;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_3;
  v10[3] = &unk_24DC8F078;
  v10[4] = &v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v11, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_2;
    v8[3] = &unk_24DC90100;
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(a2, "validateStaticKeyStoreMappingByContactIdentifer:complete:", v7, v8);
  }

}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_134);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown validateByContactIdentifier error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __56__KTIDStaticKeyStore_validateByContactIdentifier_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)mappings:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[KTIDStaticKeyStore findByIdentifier:error:](self, "findByIdentifier:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)listKTID:(id *)a3
{
  id v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke;
  v7[3] = &unk_24DC8F2F8;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke_3;
  v6[3] = &unk_24DC8F078;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __31__KTIDStaticKeyStore_listKTID___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6;
  _QWORD v7[4];
  int8x16_t v8;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __31__KTIDStaticKeyStore_listKTID___block_invoke_2;
    v7[3] = &unk_24DC8F3F0;
    v8 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(a2, "listStaticKey:", v7);
  }

}

void __31__KTIDStaticKeyStore_listKTID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __31__KTIDStaticKeyStore_listKTID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_136);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown listKTID error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __31__KTIDStaticKeyStore_listKTID___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke;
  v13[3] = &unk_24DC90200;
  v15 = &v18;
  v17 = a3;
  v9 = v7;
  v14 = v9;
  v16 = &v24;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_3;
  v12[3] = &unk_24DC8F078;
  v12[4] = &v18;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v13, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v10 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  int8x16_t v10;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v7 = *(unsigned int *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_2;
    v9[3] = &unk_24DC90198;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    objc_msgSend(a2, "setErrorCode:forMapping:complete:", v7, v8, v9);
  }

}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_137);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown setErrorCode error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__KTIDStaticKeyStore_setErrorCode_forMapping_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)triggerSync:(id *)a3
{
  char v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke;
  v7[3] = &unk_24DC8F2F8;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke_3;
  v6[3] = &unk_24DC8F078;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6;
  _QWORD v7[4];
  int8x16_t v8;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__KTIDStaticKeyStore_triggerSync___block_invoke_2;
    v7[3] = &unk_24DC90198;
    v8 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(a2, "staticKeyTriggerSync:", v7);
  }

}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_138);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown triggerSync error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __34__KTIDStaticKeyStore_triggerSync___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4
{
  char v5;
  _QWORD v7[5];
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke;
  v8[3] = &unk_24DC90228;
  v9 = a3;
  v8[4] = &v10;
  v8[5] = &v16;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_3;
  v7[3] = &unk_24DC8F078;
  v7[4] = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v5 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  int8x16_t v9;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7 = a1[3].u8[0];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_2;
    v8[3] = &unk_24DC90198;
    v9 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(a2, "setupCloudSchema:complete:", v7, v8);
  }

}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_139);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown setupCloudSchema error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __45__KTIDStaticKeyStore_setupCloudSchema_error___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)resetCloudKit:(id *)a3
{
  char v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke;
  v7[3] = &unk_24DC8F2F8;
  v7[4] = &v8;
  v7[5] = &v14;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_3;
  v6[3] = &unk_24DC8F078;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v6;
  _QWORD v7[4];
  int8x16_t v8;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_2;
    v7[3] = &unk_24DC90198;
    v8 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(a2, "resetCloudZone:", v7);
  }

}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_14, &__block_literal_global_140);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown resetCloudKit error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __36__KTIDStaticKeyStore_resetCloudKit___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

@end
