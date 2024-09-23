@implementation SMBClientManager

+ (id)newManager
{
  char *v2;
  void *v3;

  v2 = (char *)objc_msgSend(a1, "newConnectionForService:", CFSTR("machp://com.apple.filesystems.smbclientd"));
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255AA1FE0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&v2[*MEMORY[0x24BE60470]], "setRemoteObjectInterface:", v3);

  }
  return v2;
}

- (id)volumes:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMBClientManager;
  -[LiveFSClient volumes:](&v4, sel_volumes_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)volumesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__SMBClientManager_volumesWithCompletionHandler___block_invoke;
  v12[3] = &unk_24F34F098;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__SMBClientManager_volumesWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24F34F0C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "listVolumes:", v10);

}

uint64_t __49__SMBClientManager_volumesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__SMBClientManager_volumesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)listenerForVolume:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SMBClientManager;
  -[LiveFSClient listenerForVolume:error:](&v5, sel_listenerForVolume_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)listenerForVolume:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke;
  v15[3] = &unk_24F34F098;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke_2;
  v13[3] = &unk_24F34F0E8;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "listenerForVolume:reply:", v10, v13);

}

uint64_t __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)forgetVolume:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMBClientManager;
  -[LiveFSClient forgetVolume:withFlags:](&v4, sel_forgetVolume_withFlags_, a3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)forgetVolume:(id)a3 completionHandler:(id)a4
{
  -[SMBClientManager forgetVolume:withFlags:completionHandler:](self, "forgetVolume:withFlags:completionHandler:", a3, 3, a4);
}

- (void)forgetVolume:(id)a3 withFlags:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke;
  v17[3] = &unk_24F34F098;
  v11 = v8;
  v18 = v11;
  v12 = a3;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke_2;
  v15[3] = &unk_24F34F098;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "ejectVolume:usingFlags:reply:", v12, v5, v15);

}

uint64_t __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v13)
    -[SMBClientManager addVolume:atServer:credentialType:credential:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v22 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke;
  v27[3] = &unk_24F34F110;
  v27[4] = &v28;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke_2;
  v26[3] = &unk_24F34F110;
  v26[4] = &v28;
  objc_msgSend(v23, "addVolume:atServer:credentialType:credential:reply:", v10, v11, a5, v12, v26);
  v24 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v24;
}

void __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addSMBServerOrShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SMBClientManager_addSMBServerOrShare_completionHandler___block_invoke;
  v11[3] = &unk_24F34F098;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSMBServerOrShare:completionHandler:", v9, v8);

}

uint64_t __58__SMBClientManager_addSMBServerOrShare_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addVolumes:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int v75;
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v38 = a4;
  v39 = a6;
  v12 = a7;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v35 = v11;
  v71 = objc_msgSend(v11, "count");
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy_;
  v66 = __Block_byref_object_dispose_;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__41;
  v60 = __Block_byref_object_dispose__42;
  v33 = v12;
  v61 = (id)MEMORY[0x22E2DA3A8](v12);
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:].cold.3();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:].cold.2((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);
  if (objc_msgSend(v11, "count") < 0)
  {
    v30 = v57[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 34, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v30 + 16))(v30, v14, v13, v24);
  }
  else
  {
    if (!*((_DWORD *)v69 + 6))
    {
      (*(void (**)(void))(v57[5] + 16))();
      goto LABEL_25;
    }
    v22 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke;
    v52[3] = &unk_24F34F138;
    v23 = v34;
    v53 = v23;
    v54 = &v72;
    v55 = &v62;
    objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v52);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v11;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
    if (v25)
    {
      v26 = MEMORY[0x24BDACB70];
      v27 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v49 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:].cold.1(buf, v29, &v77);
          objc_msgSend(v23, "lock");
          if (*((_DWORD *)v73 + 6))
          {
            v31 = v57[5];
            if (v31)
            {
              (*(void (**)(uint64_t, void *, void *, uint64_t))(v31 + 16))(v31, v14, v13, v63[5]);
              v32 = (void *)v57[5];
              v57[5] = 0;

            }
            objc_msgSend(v23, "unlock");
            goto LABEL_22;
          }
          objc_msgSend(v23, "unlock");
          v40[0] = MEMORY[0x24BDAC760];
          v40[1] = 3221225472;
          v40[2] = __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47;
          v40[3] = &unk_24F34F160;
          v40[4] = v29;
          v44 = &v68;
          v41 = v23;
          v45 = &v72;
          v46 = &v56;
          v42 = v14;
          v43 = v13;
          v47 = &v62;
          objc_msgSend(v24, "addVolume:atServer:credentialType:credential:reply:", v29, v38, a5, v39, v40);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_22:

  }
LABEL_25:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47_cold_1((uint64_t)v3, a1);
  objc_msgSend(*(id *)(a1 + 40), "lock");
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    goto LABEL_4;
  if (v3)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(_DWORD *)(v7 + 24) - 1;
  *(_DWORD *)(v7 + 24) = v8;
  if (!v8)
  {
LABEL_4:
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "unlock");

}

- (id)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v12)
    -[SMBClientManager sharesAtServer:credentialType:credential:error:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[SMBClientManager sharesAtServer:credentialType:credential:error:].cold.1((uint64_t)v10);
  v20 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v21 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke;
  v26[3] = &unk_24F34F110;
  v26[4] = &v33;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke_2;
  v25[3] = &unk_24F34F188;
  v25[4] = &v27;
  v25[5] = &v33;
  objc_msgSend(v22, "sharesAtServer:credentialType:credential:reply:", v10, a4, v11, v25);
  if (a6)
    *a6 = objc_retainAutorelease((id)v34[5]);
  v23 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke;
  v20[3] = &unk_24F34F098;
  v13 = v10;
  v21 = v13;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke_2;
  v18[3] = &unk_24F34F1B0;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "sharesAtServer:credentialType:credential:reply:", v15, a4, v14, v18);

}

uint64_t __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialTypesForServer:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__SMBClientManager_credentialTypesForServer_completionHandler___block_invoke;
  v11[3] = &unk_24F34F098;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "SMBClientProtocolCredentialsForServer:completionHandler:", v9, v8);

}

uint64_t __63__SMBClientManager_credentialTypesForServer_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addVolume:(uint64_t)a3 atServer:(uint64_t)a4 credentialType:(uint64_t)a5 credential:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229F7C000, MEMORY[0x24BDACB70], a3, "%s: starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addVolumes:(_QWORD *)a3 atServer:credentialType:credential:completionHandler:.cold.1(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_229F7C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Iteration: '%@'", buf, 0xCu);
}

- (void)addVolumes:(uint64_t)a3 atServer:(uint64_t)a4 credentialType:(uint64_t)a5 credential:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229F7C000, MEMORY[0x24BDACB70], a3, "addVolumes: Volumes array is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addVolumes:atServer:credentialType:credential:completionHandler:.cold.3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_229F7C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "addVolumes: starting", v0, 2u);
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229F7C000, MEMORY[0x24BDACB70], a3, "addVolumes: Remote context proxy failed with error (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a2 + 32);
  v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 8) + 24);
  v4 = 138412802;
  v5 = a1;
  v6 = 2112;
  v7 = v2;
  v8 = 1024;
  v9 = v3;
  _os_log_error_impl(&dword_229F7C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "addVolumes: multi calback got err %@ for mount %@, count was %d", (uint8_t *)&v4, 0x1Cu);
}

- (void)sharesAtServer:(uint64_t)a1 credentialType:credential:error:.cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[SMBClientManager sharesAtServer:credentialType:credential:error:]";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_229F7C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: starting. server %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)sharesAtServer:(uint64_t)a3 credentialType:(uint64_t)a4 credential:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229F7C000, MEMORY[0x24BDACB70], a3, "%s: starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
