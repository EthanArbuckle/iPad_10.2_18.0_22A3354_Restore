@implementation LiveFSUSBLocalStorageClient

+ (id)newManager
{
  return (id)objc_msgSend(a1, "newConnectionForService:", CFSTR("machp://com.apple.filesystems.localLiveFiles"));
}

- (id)getConnectionForVolume:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v14 = 0;
  -[LiveFSClient listenerForVolume:error:](self, "listenerForVolume:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v7);
    objc_msgSend(MEMORY[0x24BE60428], "interfaceForListeners");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRemoteObjectInterface:", v10);

    objc_msgSend(MEMORY[0x24BE60468], "exportedClientInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v9, "setExportedObject:", v12);

    objc_msgSend(v9, "resume");
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[LiveFSUSBLocalStorageClient getConnectionForVolume:withError:].cold.1();
    if (a4)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
LABEL_6:
  v9 = 0;
  *a4 = objc_retainAutorelease(v8);
LABEL_10:

  return v9;
}

- (id)getVolumeName:(id)a3 withError:(id *)a4
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  v5 = dispatch_semaphore_create(0);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  v6 = MEMORY[0x24BDAC760];
  v52 = 0;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke;
  v46[3] = &unk_24E38E898;
  v46[4] = &v59;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4;
  v42[3] = &unk_24E38E8C0;
  v44 = &v59;
  v45 = &v53;
  v8 = v5;
  v43 = v8;
  objc_msgSend(v7, "getRootFileHandleWithError:", v42);
  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[LiveFSUSBLocalStorageClient getVolumeName:withError:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v60[5];
    v60[5] = v18;

  }
  if (v60[5])
  {
    v20 = (void *)v48[5];
    v48[5] = (uint64_t)CFSTR("Untitled");

    v21 = (id)v48[5];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v54[5];
      *(_DWORD *)buf = 136315394;
      v66 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]";
      v67 = 2112;
      v68 = v22;
      _os_log_impl(&dword_21ED39000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: got rootFH(%@), about to get volume name", buf, 0x16u);
    }
    v23 = v54[5];
    v38[0] = v6;
    v38[1] = 3221225472;
    v38[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_11;
    v38[3] = &unk_24E38E8E8;
    v40 = &v59;
    v41 = &v47;
    v24 = v8;
    v39 = v24;
    objc_msgSend(v7, "otherAttributeOf:named:requestID:reply:", v23, CFSTR("_S_f_vol_name"), -1, v38);
    v25 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v24, v25))
    {
      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v26)
        -[LiveFSUSBLocalStorageClient getVolumeName:withError:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v60[5];
      v60[5] = v34;

    }
    if (v60[5])
    {
      v36 = (void *)v48[5];
      v48[5] = (uint64_t)CFSTR("Untitled");

    }
    v21 = (id)v48[5];

  }
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v21;
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_cold_1((uint64_t)v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v6 || v8)
  {
    if (!(v6 | v8))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4_cold_1();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_11(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    if (v5)
    {
      v7 = objc_retainAutorelease(v5);
      if (objc_msgSend(v7, "bytes"))
      {
        v8 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = 0;

        v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v8);
        v12 = *(_QWORD *)(a1 + 48);
LABEL_9:
        v15 = *(_QWORD *)(v12 + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v11;

        goto LABEL_10;
      }
    }
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = CFSTR("Untitled");

  if (a2 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_11_cold_1(a2);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a2, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[5];
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
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[LiveFSUSBLocalStorageClient loadVolumes:ofType:withError:].cold.1();

  v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke;
  v19[3] = &unk_24E38E898;
  v19[4] = &v26;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2;
  v18[3] = &unk_24E38E910;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend(v13, "addDisk:fileSystemType:reply:", v8, v9, v18);
  if (v27[5] || !objc_msgSend((id)v21[5], "count"))
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v27[5]);
  }
  else
  {
    livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = v21[5];
      *(_DWORD *)buf = 136315906;
      v33 = "-[LiveFSUSBLocalStorageClient loadVolumes:ofType:withError:]";
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v17;
      _os_log_debug_impl(&dword_21ED39000, v14, OS_LOG_TYPE_DEBUG, "%s:finish:%@:%@:%@", buf, 0x2Au);
    }

  }
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

void __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)loadVolume:(id)a3 ofType:(id)a4 withReply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__LiveFSUSBLocalStorageClient_loadVolume_ofType_withReply___block_invoke;
  v14[3] = &unk_24E38E938;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDisk:fileSystemType:reply:", v12, v11, v10);

}

uint64_t __59__LiveFSUSBLocalStorageClient_loadVolume_ofType_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)removeAllVirtualDisks
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v2 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE60470]);
  v3 = MEMORY[0x24BDAC760];
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke;
  v13[3] = &unk_24E38E898;
  v13[4] = &v20;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_2;
  v12[3] = &unk_24E38E960;
  v12[4] = &v14;
  objc_msgSend(v4, "listVolumes:", v12);
  v5 = (void *)v21[5];
  if (!v5)
  {
    v6 = (void *)v15[5];
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_3;
    v9[3] = &unk_24E38E9B0;
    v10 = v4;
    v11 = &v20;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

    v5 = (void *)v21[5];
  }
  v7 = v5;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v7;
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v7, "containsString:", CFSTR("/var/mobile/")))
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_4;
      v9[3] = &unk_24E38E988;
      v8 = *(void **)(a1 + 32);
      v9[4] = *(_QWORD *)(a1 + 40);
      v9[5] = a4;
      objc_msgSend(v8, "ejectDisk:usingFlags:reply:", v7, 1, v9);
    }

  }
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[LiveFSUSBLocalStorageClient removeAllVirtualDisks]_block_invoke_4";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21ED39000, v5, OS_LOG_TYPE_DEFAULT, "%s: eject got %@", (uint8_t *)&v6, 0x16u);
  }

  if (v4)
  {
    **(_BYTE **)(a1 + 40) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)getConnectionForVolume:withError:.cold.1()
{
  int v0[10];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21ED39000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Unable to get connection endpoint to volume %@ : %@", (uint8_t *)v0, 0x20u);
}

- (void)getVolumeName:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21ED39000, MEMORY[0x24BDACB70], a3, "%s:timed out getting volume name.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)getVolumeName:(uint64_t)a3 withError:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21ED39000, MEMORY[0x24BDACB70], a3, "%s:timed out getting root fh for the volume.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_21ED39000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: connection error handler called: %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  _os_log_fault_impl(&dword_21ED39000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: no error but also no fh", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_11_cold_1(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl(&dword_21ED39000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: error getting volume name: %d", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)loadVolumes:ofType:withError:.cold.1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21ED39000, v0, OS_LOG_TYPE_DEBUG, "%s:start:%@:%@", (uint8_t *)v1, 0x20u);
}

@end
