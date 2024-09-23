uint64_t receive_nspace_handle()
{
  return 5;
}

uint64_t receive_vfs_resolve_dir_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  int v8;
  int v9;
  NSObject *v14;
  int v15;
  void *v16;
  NSFileProviderKernelMaterializationInfo *v17;
  __int128 v18;
  _BYTE v20[34];

  if (*a7 | a7[1] | a7[2] | a7[3])
  {
    v8 = a2;
    v9 = 1;
LABEL_3:
    make_nspace_handle_response(v8, 0, 0, v9);
    return 0;
  }
  v14 = _NSFCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_DWORD *)(a6 + 20);
    *(_DWORD *)v20 = 67109891;
    *(_DWORD *)&v20[4] = v15;
    *(_WORD *)&v20[8] = 2081;
    *(_QWORD *)&v20[10] = a5;
    *(_WORD *)&v20[18] = 1024;
    *(_DWORD *)&v20[20] = a2;
    *(_WORD *)&v20[24] = 2081;
    *(_QWORD *)&v20[26] = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - subitem: %{private}s", v20, 0x22u);
  }
  if (!a5)
  {
    v8 = a2;
    v9 = 22;
    goto LABEL_3;
  }
  v16 = objc_autoreleasePoolPush();
  if ((_DWORD)a3 == 0x4000)
    v17 = (NSFileProviderKernelMaterializationInfo *)+[NSFileProviderKernelMaterializationInfo partialFolderMaterializationInfoWithOperation:fileName:](NSFileProviderKernelMaterializationInfo, "partialFolderMaterializationInfoWithOperation:fileName:", 0x4000, a4);
  else
    v17 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:](NSFileProviderKernelMaterializationInfo, "kernelMaterializationInfoWithOperation:", a3);
  v18 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)v20 = *(_OWORD *)a6;
  *(_OWORD *)&v20[16] = v18;
  handle_nspace_request_with_info(a2, v20, a5, (uint64_t)v17);
  objc_autoreleasePoolPop(v16);
  return 0;
}

uint64_t make_nspace_handle_response(int a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v8;
  size_t v9;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v8 = _NSFCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 67109120;
    v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Made nspace response - req: %d", (uint8_t *)&v11, 8u);
  }
  if (a3)
  {
    v11 = a1;
    v12 = a4;
    v13 = a2;
    v14 = a3;
    v9 = 24;
  }
  else
  {
    v11 = a1;
    v12 = a4;
    if (a2)
    {
      v13 = a2;
      v9 = 16;
    }
    else
    {
      v9 = 8;
    }
  }
  return sysctlbyname("vfs.nspace.complete", 0, 0, &v11, v9);
}

void handle_nspace_request_with_info(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  NSURL *v8;
  int v9;
  void *v10;
  NSNumber *v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];
  _QWORD v21[5];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v8 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, 0, 0);
  if (!v8)
  {
    v13 = _NSFCLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      handle_nspace_request_with_info_cold_1(a3, v13, v14, v15, v16, v17, v18, v19);
    v9 = 12;
    *((_DWORD *)v24 + 6) = 12;
    goto LABEL_7;
  }
  v9 = *((_DWORD *)v24 + 6);
  if (v9)
  {
LABEL_7:
    make_nspace_handle_response(a1, 0, 0, v9);
    goto LABEL_8;
  }
  v10 = (void *)mainArbiter;
  v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a1);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __handle_nspace_request_with_info_block_invoke;
  v21[3] = &unk_1000041E0;
  v21[4] = &v23;
  v22 = a1;
  v12 = a2[1];
  v20[0] = *a2;
  v20[1] = v12;
  objc_msgSend(v10, "makeProviderMaterializeFileAtURL:kernelInfo:withRequestID:fromProcess:completionHandler:", v8, a4, v11, v20, v21);
LABEL_8:
  _Block_object_dispose(&v23, 8);
}

void sub_100002140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t receive_vfs_resolve_file_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  int v9;
  int v10;
  NSObject *v16;
  int v17;
  void *v18;
  id v19;
  __int128 v20;
  _BYTE v22[34];
  __int16 v23;
  uint64_t v24;

  if (*a8 | a8[1] | a8[2] | a8[3])
  {
    v9 = a2;
    v10 = 1;
  }
  else
  {
    v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_DWORD *)(a7 + 20);
      *(_DWORD *)v22 = 67110147;
      *(_DWORD *)&v22[4] = v17;
      *(_WORD *)&v22[8] = 2081;
      *(_QWORD *)&v22[10] = a6;
      *(_WORD *)&v22[18] = 1024;
      *(_DWORD *)&v22[20] = a2;
      *(_WORD *)&v22[24] = 2048;
      *(_QWORD *)&v22[26] = a4;
      v23 = 2048;
      v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - offset: %lld, size: %lld", v22, 0x2Cu);
    }
    if (a6)
    {
      v18 = objc_autoreleasePoolPush();
      v19 = +[NSFileProviderKernelMaterializationInfo fileMaterializationInfoWithOperation:size:offset:](NSFileProviderKernelMaterializationInfo, "fileMaterializationInfoWithOperation:size:offset:", a3, a5, a4);
      v20 = *(_OWORD *)(a7 + 16);
      *(_OWORD *)v22 = *(_OWORD *)a7;
      *(_OWORD *)&v22[16] = v20;
      handle_nspace_request_with_info(a2, v22, a6, (uint64_t)v19);
      objc_autoreleasePoolPop(v18);
      return 0;
    }
    v9 = a2;
    v10 = 22;
  }
  make_nspace_handle_response(v9, 0, 0, v10);
  return 0;
}

uint64_t receive_vfs_resolve_reparent_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  NSObject *v12;
  int v13;
  void *v14;
  NSURL *v15;
  NSURL *v16;
  NSURL *v17;
  int v18;
  void *v19;
  NSNumber *v20;
  __int128 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD v37[2];
  _QWORD v38[5];
  int v39;
  uint8_t buf[8];
  __int128 v41;
  _DWORD v42[4];

  if (!(*a7 | a7[1] | a7[2] | a7[3]))
  {
    v12 = ((uint64_t (*)(void))_NSFCLog)();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_DWORD *)(a6 + 20);
      *(_DWORD *)buf = 67109891;
      *(_DWORD *)&buf[4] = v13;
      LOWORD(v41) = 2081;
      *(_QWORD *)((char *)&v41 + 2) = a4;
      WORD5(v41) = 1024;
      HIDWORD(v41) = a2;
      LOWORD(v42[0]) = 2081;
      *(_QWORD *)((char *)v42 + 2) = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received nspace reparent IPC from %u for %{private}s - req: %d - destination %{private}s", buf, 0x22u);
    }
    if (!a4 || !a5)
    {
      make_nspace_handle_response(a2, 0, 0, 22);
      return 0;
    }
    v14 = objc_autoreleasePoolPush();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v41 = buf;
    *((_QWORD *)&v41 + 1) = 0x2020000000;
    v42[0] = 0;
    v15 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a4, 0, 0);
    v16 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a5, 1, 0);
    if (v15)
    {
      v17 = v16;
      if (v16)
      {
        v18 = *(_DWORD *)(v41 + 24);
        if (!v18)
        {
          v19 = (void *)mainArbiter;
          v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a2);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = __receive_vfs_resolve_reparent_with_audit_token_block_invoke;
          v38[3] = &unk_100004158;
          v38[4] = buf;
          v39 = a2;
          v21 = *(_OWORD *)(a6 + 16);
          v37[0] = *(_OWORD *)a6;
          v37[1] = v21;
          objc_msgSend(v19, "resolveReparentRequestOfFileAtURL:toDestinationDirectory:withRequestID:operation:fromProcess:completionHandler:", v15, v17, v20, a3, v37, v38);
LABEL_18:
          _Block_object_dispose(buf, 8);
          objc_autoreleasePoolPop(v14);
          return 0;
        }
LABEL_17:
        make_nspace_handle_response(a2, 0, 0, v18);
        goto LABEL_18;
      }
      v29 = _NSFCLog(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        handle_nspace_request_with_info_cold_1(a5, v29, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      v22 = _NSFCLog(v16);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        handle_nspace_request_with_info_cold_1(a4, v22, v23, v24, v25, v26, v27, v28);
    }
    v18 = 12;
    *(_DWORD *)(v41 + 24) = 12;
    goto LABEL_17;
  }
  make_nspace_handle_response(a2, 0, 0, 1);
  return 0;
}

void sub_100002570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __receive_vfs_resolve_reparent_with_audit_token_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nspaceErrnoFromNSError(a4);
  return make_nspace_handle_response(*(_DWORD *)(a1 + 40), a3, a2, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t nspaceErrnoFromNSError(void *a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend(a1, "code");
  v3 = objc_msgSend(a1, "domain");
  if ((uint64_t)v2 > 0)
  {
    if (v2 != (id)1)
    {
      if (v2 == (id)3072 && (objc_msgSend(v3, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
        return 89;
      return 60;
    }
    if (objc_msgSend(v3, "isEqualToString:", NSPOSIXErrorDomain))
      return 1;
    else
      return 60;
  }
  else
  {
    if (v2 != (id)-1005)
    {
      if (v2 == (id)-1000)
        return 81;
      return 60;
    }
    return 70;
  }
}

uint64_t receive_vfs_resolve_dir(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSObject *v11;
  void *v12;
  NSFileProviderKernelMaterializationInfo *v13;
  _BYTE v15[20];
  int v16;
  _QWORD v17[2];

  v11 = _NSFCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v15 = 67109891;
    *(_DWORD *)&v15[4] = a3;
    *(_WORD *)&v15[8] = 2081;
    *(_QWORD *)&v15[10] = a6;
    *(_WORD *)&v15[18] = 1024;
    v16 = a2;
    LOWORD(v17[0]) = 2081;
    *(_QWORD *)((char *)v17 + 2) = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - subitem: %{private}s", v15, 0x22u);
  }
  if (a6)
  {
    v12 = objc_autoreleasePoolPush();
    if ((_DWORD)a4 == 0x4000)
      v13 = (NSFileProviderKernelMaterializationInfo *)+[NSFileProviderKernelMaterializationInfo partialFolderMaterializationInfoWithOperation:fileName:](NSFileProviderKernelMaterializationInfo, "partialFolderMaterializationInfoWithOperation:fileName:", 0x4000, a5);
    else
      v13 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:](NSFileProviderKernelMaterializationInfo, "kernelMaterializationInfoWithOperation:", a4);
    memset(v15, 0, sizeof(v15));
    v16 = a3;
    v17[0] = 0;
    handle_nspace_request_with_info(a2, v15, a6, (uint64_t)v13);
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_vfs_resolve_file(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSObject *v13;
  void *v14;
  id v15;
  _BYTE v17[20];
  int v18;
  _BYTE v19[10];
  __int16 v20;
  uint64_t v21;

  v13 = _NSFCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v17 = 67110147;
    *(_DWORD *)&v17[4] = a3;
    *(_WORD *)&v17[8] = 2081;
    *(_QWORD *)&v17[10] = a7;
    *(_WORD *)&v17[18] = 1024;
    v18 = a2;
    *(_WORD *)v19 = 2048;
    *(_QWORD *)&v19[2] = a5;
    v20 = 2048;
    v21 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - offset: %lld, size: %lld", v17, 0x2Cu);
  }
  if (a7)
  {
    memset(v17, 0, sizeof(v17));
    v14 = objc_autoreleasePoolPush();
    v15 = +[NSFileProviderKernelMaterializationInfo fileMaterializationInfoWithOperation:size:offset:](NSFileProviderKernelMaterializationInfo, "fileMaterializationInfoWithOperation:size:offset:", a4, a6, a5);
    v18 = a3;
    *(_QWORD *)v19 = 0;
    handle_nspace_request_with_info(a2, v17, a7, (uint64_t)v15);
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_nspace_resolve_path(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  NSObject *v9;
  void *v10;
  NSFileProviderKernelMaterializationInfo *v11;
  _BYTE v13[20];
  int v14;
  uint64_t v15;

  v9 = _NSFCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v13 = 67109635;
    *(_DWORD *)&v13[4] = a3;
    *(_WORD *)&v13[8] = 2081;
    *(_QWORD *)&v13[10] = a5;
    *(_WORD *)&v13[18] = 1024;
    v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d", v13, 0x18u);
  }
  if (a5)
  {
    memset(v13, 0, sizeof(v13));
    v10 = objc_autoreleasePoolPush();
    v11 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:](NSFileProviderKernelMaterializationInfo, "kernelMaterializationInfoWithOperation:", a4);
    v14 = a3;
    v15 = 0;
    handle_nspace_request_with_info(a2, v13, a5, (uint64_t)v11);
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_nspace_resolve_cancel(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _DWORD v6[2];

  v3 = objc_autoreleasePoolPush();
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received nspace cancel request - req: %d", (uint8_t *)v6, 8u);
  }
  objc_msgSend((id)mainArbiter, "cancelMaterializationWithRequestID:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a2));
  objc_autoreleasePoolPop(v3);
  return 0;
}

void init_mig_server()
{
  NSObject *v0;
  kern_return_t v1;
  uint8_t v2[12];
  int v3;

  v3 = 1;
  if (sysctlbyname("vfs.nspace.resolver", 0, 0, &v3, 4uLL))
  {
    v0 = _NSFCLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "filecoordinationd is unable to mark itself as an nspace resolver", v2, 2u);
    }
  }
  else
  {
    v1 = bootstrap_check_in(bootstrap_port, "com.apple.FileCoordination.kernel.ipc", (mach_port_t *)&server_port);
    if (v1)
      init_mig_server_cold_1(v1);
    mig_queue = (uint64_t)dispatch_queue_create("com.apple.FileCoordination.fault-mig", 0);
    mig_source = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, server_port, 0, (dispatch_queue_t)mig_queue);
    dispatch_source_set_cancel_handler((dispatch_source_t)mig_source, &__block_literal_global);
    dispatch_source_set_event_handler((dispatch_source_t)mig_source, &__block_literal_global_7);
    dispatch_resume((dispatch_object_t)mig_source);
  }
}

void __init_mig_server_block_invoke(id a1)
{
  kern_return_t v1;

  v1 = mach_port_mod_refs(mach_task_self_, server_port, 1u, -1);
  if (v1)
    _os_assumes_log(v1);
}

void __init_mig_server_block_invoke_2(id a1)
{
  int v1;

  v1 = dispatch_mig_server(mig_source, 16456, vfs_nspace_server);
  if (v1)
    _os_assumes_log(v1);
}

int main(int argc, const char **argv, const char **envp)
{
  id v3;
  id v4;

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.FileCoordination"));
  objc_msgSend(v3, "_setQueue:", &_dispatch_main_q);
  mainArbiter = (uint64_t)objc_msgSend(objc_alloc((Class)NSFileAccessArbiter), "initWithQueue:isSubarbiter:listener:", &_dispatch_main_q, 0, v3);
  objc_msgSend(v3, "setDelegate:", mainArbiter);
  objc_msgSend(v3, "resume");
  v4 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.ProgressReporting"));
  objc_msgSend(v4, "setDelegate:", objc_msgSend(objc_alloc(NSClassFromString(CFSTR("NSProgressRegistrar"))), "initWithQueue:rootFileAccessNode:", &_dispatch_main_q, objc_msgSend((id)mainArbiter, "rootNode")));
  objc_msgSend(v4, "resume");
  init_mig_server();
  dispatch_main();
}

uint64_t __handle_nspace_request_with_info_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nspaceErrnoFromNSError(a3);
  return make_nspace_handle_response(*(_DWORD *)(a1 + 40), a2, 0, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t vfs_nspace_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 867808) >= 0xFFFFFFF8)
    return (uint64_t)*(&receive_vfs_nspace_subsystem + 5 * (v1 - 867800) + 5);
  else
    return 0;
}

_DWORD *_Xnspace_handle(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) == 0 && result[1] == 4132 && (result = memchr(result + 9, 0, 0x1000uLL)) != 0)
  {
    result = (_DWORD *)receive_nspace_handle();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *_Xnspace_resolve_cancel(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)receive_nspace_resolve_cancel(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xnspace_resolve_path(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  NDR_record_t v4;

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 8236)
    && (result = memchr(result + 11, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_nspace_resolve_path(v3[3], v3[8], v3[9], v3[10], (uint64_t)(v3 + 11));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v4 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    v4 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

_DWORD *_Xvfs_resolve_file(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 8252)
    && (result = memchr(result + 15, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_vfs_resolve_file(v3[3], v3[8], v3[9], v3[10], *(_QWORD *)(v3 + 11), *(_QWORD *)(v3 + 13), (uint64_t)(v3 + 15));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_dir(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 16428)
    && (result = memchr(result + 11, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2059, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_vfs_resolve_dir(v3[3], v3[8], v3[9], v3[10], (uint64_t)(v3 + 11), (uint64_t)(v3 + 2059));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_file_with_audit_token(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  _OWORD v13[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 8280)
    && (result = memchr(result + 14, 0, 0x2000uLL)) != 0)
  {
    if (!v3[2070] && v3[2071] > 0x1Fu)
    {
      v5 = v3[3];
      v6 = v3[8];
      v7 = v3[9];
      v8 = *((_QWORD *)v3 + 5);
      v9 = *((_QWORD *)v3 + 6);
      v10 = *(_OWORD *)(v3 + 2066);
      v13[0] = *(_OWORD *)(v3 + 2062);
      v13[1] = v10;
      v11 = *(_OWORD *)(v3 + 2079);
      v12[0] = *(_OWORD *)(v3 + 2075);
      v12[1] = v11;
      result = (_DWORD *)receive_vfs_resolve_file_with_audit_token(v5, v6, v7, v8, v9, (uint64_t)(v3 + 14), (uint64_t)v13, v12);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_9;
    }
    v4 = -309;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_dir_with_audit_token(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  _OWORD v11[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 16456)
    && (result = memchr(result + 10, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2058, 0, 0x2000uLL)) != 0)
  {
    if (!v3[4114] && v3[4115] > 0x1Fu)
    {
      v5 = v3[3];
      v6 = v3[8];
      v7 = v3[9];
      v8 = *(_OWORD *)(v3 + 4110);
      v11[0] = *(_OWORD *)(v3 + 4106);
      v11[1] = v8;
      v9 = *(_OWORD *)(v3 + 4123);
      v10[0] = *(_OWORD *)(v3 + 4119);
      v10[1] = v9;
      result = (_DWORD *)receive_vfs_resolve_dir_with_audit_token(v5, v6, v7, (uint64_t)(v3 + 10), (uint64_t)(v3 + 2058), (uint64_t)v11, v10);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_10;
    }
    v4 = -309;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_reparent_with_audit_token(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  _OWORD v11[2];

  if ((*result & 0x80000000) == 0
    && (v3 = result, result[1] == 16456)
    && (result = memchr(result + 10, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2058, 0, 0x2000uLL)) != 0)
  {
    if (!v3[4114] && v3[4115] > 0x1Fu)
    {
      v5 = v3[3];
      v6 = v3[8];
      v7 = v3[9];
      v8 = *(_OWORD *)(v3 + 4110);
      v11[0] = *(_OWORD *)(v3 + 4106);
      v11[1] = v8;
      v9 = *(_OWORD *)(v3 + 4123);
      v10[0] = *(_OWORD *)(v3 + 4119);
      v10[1] = v9;
      result = (_DWORD *)receive_vfs_resolve_reparent_with_audit_token(v5, v6, v7, (uint64_t)(v3 + 10), (uint64_t)(v3 + 2058), (uint64_t)v11, v10);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_10;
    }
    v4 = -309;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t vfs_nspace_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 867808) >= 0xFFFFFFF8
    && (v5 = (void (*)(void))*(&receive_vfs_nspace_subsystem + 5 * (v4 - 867800) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void handle_nspace_request_with_info_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Failed to convert path %{private}s to URL", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

void init_mig_server_cold_1(int a1)
{
  uint64_t v1;
  NSString *v2;

  v1 = _os_assert_log(a1);
  v2 = (NSString *)_os_crash(v1);
  __break(1u);
  NSClassFromString(v2);
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_cancelMaterializationWithRequestID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelMaterializationWithRequestID:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_fileMaterializationInfoWithOperation_size_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileMaterializationInfoWithOperation:size:offset:");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithQueue_isSubarbiter_listener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:isSubarbiter:listener:");
}

id objc_msgSend_initWithQueue_rootFileAccessNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:rootFileAccessNode:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_kernelMaterializationInfoWithOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kernelMaterializationInfoWithOperation:");
}

id objc_msgSend_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeProviderMaterializeFileAtURL:kernelInfo:withRequestID:fromProcess:completionHandler:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_partialFolderMaterializationInfoWithOperation_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "partialFolderMaterializationInfoWithOperation:fileName:");
}

id objc_msgSend_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveReparentRequestOfFileAtURL:toDestinationDirectory:withRequestID:operation:fromProcess:completionHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootNode");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}
