@implementation KBXPCService

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000093A0;
  block[3] = &unk_10002CC60;
  block[4] = a1;
  if (qword_1000358C8 != -1)
    dispatch_once(&qword_1000358C8, block);
  return (id)qword_1000358C0;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", v3));

  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (id)remoteServiceName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceName"));

  return v3;
}

- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  char v17;

  v7 = a3;
  v8 = v7;
  if (!a4)
    goto LABEL_5;
  if (read((int)objc_msgSend(v7, "fileDescriptor"), a5, a4) != a4)
  {
    sub_10001595C("-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:]", CFSTR("Failed to read the retrievePasscodeFromFileHandle"), v9, v10, v11, v12, v13, v14, v17);
LABEL_5:
    v15 = 1;
    goto LABEL_6;
  }
  v15 = 0;
LABEL_6:

  return v15;
}

- (void)changeSystemSecretfromOldSecret:(id)a3 oldSize:(unint64_t)a4 toNewSecret:(id)a5 newSize:(unint64_t)a6 opaqueData:(id)a7 withParams:(unsigned int)a8 reply:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  vm_map_t v43;
  vm_address_t v44;
  vm_size_t v45;
  rsize_t v46;
  vm_address_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  vm_map_t v57;
  vm_address_t v58;
  vm_size_t v59;
  vm_size_t v60;
  char v61;
  vm_address_t v62;
  _QWORD block[4];
  id v64;
  _QWORD *v65;
  uint64_t *v66;
  _QWORD *v67;
  vm_address_t v68;
  unint64_t v69;
  vm_address_t v70;
  unint64_t v71;
  unsigned int v72;
  _QWORD v73[3];
  char v74;
  _QWORD v75[3];
  int v76;
  vm_address_t address;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, _QWORD))a9;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = sub_1000099A8;
  v82 = sub_1000099B8;
  v83 = 0;
  address = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v76 = -1;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    if (vm_page_size < a4 || vm_page_size < a6)
    {
      sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v19, v20, v21, v22, v23, v61);
      v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
      goto LABEL_8;
    }
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", CFSTR("FAILED to allocate VM"), v27, v28, v29, v30, v31, v32, v61);
      v33 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
      v34 = (void *)v79[5];
      v79[5] = v33;

      address = 0;
LABEL_24:
      v18[2](v18, v79[5]);
      goto LABEL_25;
    }
    if (a4)
    {
      v62 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v15, a4))
      {
        sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", CFSTR("Failed to retrieve oldpasscode"), v35, v36, v37, v38, v39, v40, v62);
        v41 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v42 = (void *)v79[5];
        v79[5] = v41;

        v43 = mach_task_self_;
        v44 = address;
        v45 = vm_page_size;
        if (vm_page_size >= a4)
          v46 = a4;
        else
          v46 = vm_page_size;
LABEL_23:
        memset_s((void *)address, v46, 0, v46);
        vm_deallocate(v43, v44, v45);
        goto LABEL_24;
      }
    }
    else
    {
      v62 = 0;
    }
    if (a6)
    {
      v47 = address + 1024;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v16, a6, address + 1024))
      {
        sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]", CFSTR("Failed to retrieve newpasscode"), v48, v49, v50, v51, v52, v53, v62);
        v54 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v55 = (void *)v79[5];
        v79[5] = v54;

        v43 = mach_task_self_;
        v44 = address;
        v45 = vm_page_size;
        if (vm_page_size >= a6 + 1024)
          v46 = a6 + 1024;
        else
          v46 = vm_page_size;
        goto LABEL_23;
      }
    }
    else
    {
      v47 = 0;
    }
    v56 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000099C0;
    block[3] = &unk_10002CC88;
    v68 = v62;
    v69 = a4;
    v70 = v47;
    v71 = a6;
    v72 = a8;
    v64 = v17;
    v65 = v73;
    v66 = &v78;
    v67 = v75;
    dispatch_sync(v56, block);
    v57 = mach_task_self_;
    v58 = address;
    v59 = vm_page_size;
    if (vm_page_size >= a6 + 1024)
      v60 = a6 + 1024;
    else
      v60 = vm_page_size;
    memset_s((void *)address, v60, 0, v60);
    vm_deallocate(v57, v58, v59);
    v18[2](v18, v79[5]);

    goto LABEL_25;
  }
  v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
LABEL_8:
  v26 = (void *)v79[5];
  v79[5] = v25;

  if (v18)
    goto LABEL_24;
LABEL_25:
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(&v78, 8);

}

- (void)setSpacedRepetitionMode:(unsigned int)a3 reply:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSErrorDomain v12;
  uint64_t v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = (void (**)(id, void *))a4;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    sub_10001595C("-[KBXPCService setSpacedRepetitionMode:reply:]", CFSTR("setting spaced repetition verification mode to %d"), v6, v7, v8, v9, v10, v11, a3);
    dword_100035850 = a3;
    v12 = NSPOSIXErrorDomain;
    v13 = 0;
  }
  else
  {
    v12 = NSPOSIXErrorDomain;
    v13 = 1;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, v13, 0));
  if (v15)
    v15[2](v15, v14);

}

- (void)getPasscodeBlobWithReply:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    if ((sub_100005754() & 1) != 0)
      v4 = 0;
    else
      v4 = (void *)sub_100017118(0);
    v6[2](v6, v4, 0);

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      ((void (*)(void))v6[2])();
  }

}

- (void)changeSystemSecretWithEscrow:(id)a3 fromOldSecret:(id)a4 oldSize:(unint64_t)a5 toNewSecret:(id)a6 newSize:(unint64_t)a7 opaqueData:(id)a8 keepstate:(BOOL)a9 reply:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  vm_map_t v45;
  vm_address_t v46;
  vm_size_t v47;
  rsize_t v48;
  vm_address_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  vm_size_t v58;
  vm_map_t v59;
  vm_address_t v60;
  vm_size_t v61;
  vm_size_t v62;
  char v63;
  NSObject *queue;
  vm_address_t v65;
  _QWORD block[4];
  id v67;
  id v68;
  uint64_t *v69;
  _QWORD *v70;
  vm_address_t v71;
  unint64_t v72;
  vm_address_t v73;
  unint64_t v74;
  BOOL v75;
  _QWORD v76[3];
  int v77;
  vm_address_t address;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = (void (**)(id, _QWORD))a10;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_1000099A8;
  v83 = sub_1000099B8;
  v84 = 0;
  address = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = -1;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    if (vm_page_size < a5 || vm_page_size < a7)
    {
      sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v21, v22, v23, v24, v25, v63);
      v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
      goto LABEL_8;
    }
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", CFSTR("FAILED to allocate VM"), v29, v30, v31, v32, v33, v34, v63);
      v35 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
      v36 = (void *)v80[5];
      v80[5] = v35;

      address = 0;
LABEL_24:
      v20[2](v20, v80[5]);
      goto LABEL_25;
    }
    if (a5)
    {
      v65 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v17, a5))
      {
        sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", CFSTR("Failed to retrieve oldpasscode"), v37, v38, v39, v40, v41, v42, v63);
        v43 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v44 = (void *)v80[5];
        v80[5] = v43;

        v45 = mach_task_self_;
        v46 = address;
        v47 = vm_page_size;
        if (vm_page_size >= a5)
          v48 = a5;
        else
          v48 = vm_page_size;
LABEL_23:
        memset_s((void *)address, v48, 0, v48);
        vm_deallocate(v45, v46, v47);
        goto LABEL_24;
      }
    }
    else
    {
      v65 = 0;
    }
    if (a7)
    {
      v49 = address + 1024;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v18, a7, address + 1024))
      {
        sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]", CFSTR("Failed to retrieve newpasscode"), v50, v51, v52, v53, v54, v55, v63);
        v56 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v57 = (void *)v80[5];
        v80[5] = v56;

        v46 = address;
        v47 = vm_page_size;
        v58 = a7 + 1024;
        v45 = mach_task_self_;
        if (vm_page_size >= v58)
          v48 = v58;
        else
          v48 = vm_page_size;
        goto LABEL_23;
      }
    }
    else
    {
      v49 = 0;
    }
    queue = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A1B0;
    block[3] = &unk_10002CCB0;
    v71 = v65;
    v72 = a5;
    v73 = v49;
    v74 = a7;
    v67 = v19;
    v75 = a9;
    v68 = v16;
    v69 = &v79;
    v70 = v76;
    dispatch_sync(queue, block);
    v59 = mach_task_self_;
    v60 = address;
    v61 = vm_page_size;
    if (vm_page_size >= a7 + 1024)
      v62 = a7 + 1024;
    else
      v62 = vm_page_size;
    memset_s((void *)address, v62, 0, v62);
    vm_deallocate(v59, v60, v61);
    v20[2](v20, v80[5]);

    goto LABEL_25;
  }
  v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
LABEL_8:
  v28 = (void *)v80[5];
  v80[5] = v27;

  if (v20)
    goto LABEL_24;
LABEL_25:
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(&v79, 8);

}

- (void)changeClassKeysGenerationWithSecret:(id)a3 secretSize:(unint64_t)a4 generationOption:(int)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSErrorDomain v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  vm_address_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSErrorDomain v33;
  uint64_t v34;
  int v35;
  vm_map_t v36;
  vm_address_t v37;
  vm_size_t v38;
  rsize_t v39;
  char v40;
  vm_address_t address;

  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  address = 0;
  if (!-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    v17 = NSPOSIXErrorDomain;
    v18 = 1;
LABEL_5:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, v18, 0));
    if (!v11)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (vm_page_size < a4)
  {
    sub_10001595C("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v12, v13, v14, v15, v16, v40);
    v17 = NSPOSIXErrorDomain;
    v18 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a4)
    {
      v26 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v10, a4, address))
      {
        sub_10001595C("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", CFSTR("Failed to retrieve oldpasscode"), v27, v28, v29, v30, v31, v32, v40);
        v33 = NSPOSIXErrorDomain;
        v34 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v26 = 0;
    }
    v35 = sub_100018B24(v26, a4, a5);
    if (!v35)
    {
      v19 = 0;
      goto LABEL_17;
    }
    v33 = NSPOSIXErrorDomain;
    v34 = v35;
LABEL_15:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, v34, 0));
LABEL_17:
    v36 = mach_task_self_;
    v37 = address;
    v38 = vm_page_size;
    if (vm_page_size >= a4)
      v39 = a4;
    else
      v39 = vm_page_size;
    memset_s((void *)address, v39, 0, v39);
    vm_deallocate(v36, v37, v38);
    goto LABEL_21;
  }
  sub_10001595C("-[KBXPCService changeClassKeysGenerationWithSecret:secretSize:generationOption:reply:]", CFSTR("FAILED to allocate VM"), v20, v21, v22, v23, v24, v25, v40);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
  address = 0;
LABEL_21:
  v11[2](v11, v19);
LABEL_22:

}

- (void)setSystemSecretBlob:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.device")))
  {
    v7 = sub_100017250((uint64_t)v9);
    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (!v6)
      goto LABEL_8;
  }
  v6[2](v6, v8);
LABEL_8:

}

- (void)registerBackupBag:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSErrorDomain v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  vm_address_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSErrorDomain v34;
  uint64_t v35;
  int v36;
  vm_map_t v37;
  vm_address_t v38;
  vm_size_t v39;
  rsize_t v40;
  char v41;
  vm_address_t address;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  address = 0;
  if (!-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v18 = NSPOSIXErrorDomain;
    v19 = 1;
LABEL_5:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, 0));
    if (!v12)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (vm_page_size < a5)
  {
    sub_10001595C("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v13, v14, v15, v16, v17, v41);
    v18 = NSPOSIXErrorDomain;
    v19 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a5)
    {
      v27 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v11, a5, address))
      {
        sub_10001595C("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", CFSTR("Failed to retrieve oldpasscode"), v28, v29, v30, v31, v32, v33, v41);
        v34 = NSPOSIXErrorDomain;
        v35 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v27 = 0;
    }
    v36 = sub_100017354((uint64_t)v10, v27, a5);
    if (!v36)
    {
      v20 = 0;
      goto LABEL_17;
    }
    v34 = NSPOSIXErrorDomain;
    v35 = v36;
LABEL_15:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v34, v35, 0));
LABEL_17:
    v37 = mach_task_self_;
    v38 = address;
    v39 = vm_page_size;
    if (vm_page_size >= a5)
      v40 = a5;
    else
      v40 = vm_page_size;
    memset_s((void *)address, v40, 0, v40);
    vm_deallocate(v37, v38, v39);
    goto LABEL_21;
  }
  sub_10001595C("-[KBXPCService registerBackupBag:withSecret:secretSize:reply:]", CFSTR("FAILED to allocate VM"), v21, v22, v23, v24, v25, v26, v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
  address = 0;
LABEL_21:
  v12[2](v12, v20);
LABEL_22:

}

- (void)getBackupBlobreply:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v4 = (void *)sub_100017118(1);
    v6[2](v6, v4, 0);

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v6)
      ((void (*)(void))v6[2])();
  }

}

- (void)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withReply:(id)a5
{
  const __CFData *v8;
  void (**v9)(id, void *, void *);
  void *v10;
  void *v11;
  void *v12;

  v8 = (const __CFData *)a3;
  v9 = (void (**)(id, void *, void *))a5;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v12 = 0;
    v10 = (void *)sub_10001749C(v8, a4, (uint64_t)&v12);
    if (v10)
      v11 = 0;
    else
      v11 = v12;
    v9[2](v9, v10, v11);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v9)
      v9[2](v9, 0, v11);
  }

}

- (void)startBackupSessionForVolume:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  int v7;
  void *v8;
  const __CFData *v9;

  v9 = (const __CFData *)a3;
  v6 = (void (**)(id, void *))a4;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v7 = sub_100017768(v9, 1);
    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (!v6)
      goto LABEL_8;
  }
  v6[2](v6, v8);
LABEL_8:

}

- (void)stopBackupSessionForVolume:(id)a3 withReply:(id)a4
{
  void (**v6)(id, void *);
  int v7;
  void *v8;
  const __CFData *v9;

  v9 = (const __CFData *)a3;
  v6 = (void (**)(id, void *))a4;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v7 = sub_100017768(v9, 0);
    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (!v6)
      goto LABEL_8;
  }
  v6[2](v6, v8);
LABEL_8:

}

- (void)enableBackupForVolume:(id)a3 withSecret:(id)a4 secretSize:(unint64_t)a5 reply:(id)a6
{
  const __CFData *v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSErrorDomain v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  vm_address_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  vm_map_t v34;
  vm_address_t v35;
  vm_size_t v36;
  rsize_t v37;
  int v38;
  vm_map_t v39;
  vm_address_t v40;
  vm_size_t v41;
  rsize_t v42;
  void *v43;
  void *v44;
  vm_address_t address;

  v10 = (const __CFData *)a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v44 = 0;
  address = 0;
  if (!-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v18 = NSPOSIXErrorDomain;
    v19 = 1;
LABEL_5:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, 0));
    if (!v12)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (vm_page_size < a5)
  {
    sub_10001595C("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v13, v14, v15, v16, v17, (char)v44);
    v18 = NSPOSIXErrorDomain;
    v19 = 7;
    goto LABEL_5;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_10001595C("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", CFSTR("FAILED to allocate VM"), v21, v22, v23, v24, v25, v26, (char)v44);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
    address = 0;
LABEL_9:
    v12[2](v12, 0, v20);
    goto LABEL_10;
  }
  if (a5)
  {
    v27 = address;
    if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v11, a5, address))
    {
      sub_10001595C("-[KBXPCService enableBackupForVolume:withSecret:secretSize:reply:]", CFSTR("Failed to retrieve oldpasscode"), v28, v29, v30, v31, v32, v33, (char)v44);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v34 = mach_task_self_;
      v35 = address;
      v36 = vm_page_size;
      if (vm_page_size >= a5)
        v37 = a5;
      else
        v37 = vm_page_size;
      memset_s((void *)address, v37, 0, v37);
      vm_deallocate(v34, v35, v36);
      goto LABEL_9;
    }
  }
  else
  {
    v27 = 0;
  }
  v38 = sub_1000179DC(v10, v27, a5, (uint64_t)&v44);
  if (v38)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v38, 0));
  else
    v20 = 0;
  v39 = mach_task_self_;
  v40 = address;
  v41 = vm_page_size;
  if (vm_page_size >= a5)
    v42 = a5;
  else
    v42 = vm_page_size;
  memset_s((void *)address, v42, 0, v42);
  vm_deallocate(v39, v40, v41);
  v43 = v44;
  ((void (**)(id, void *, void *))v12)[2](v12, v44, v20);

LABEL_10:
}

- (void)disableBackupForVolume:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  int v7;
  void *v8;
  const __CFData *v9;

  v9 = (const __CFData *)a3;
  v6 = (void (**)(id, void *))a4;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.devicebackup")))
  {
    v7 = sub_100017C08(v9);
    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v7, 0));
    else
      v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (!v6)
      goto LABEL_8;
  }
  v6[2](v6, v8);
LABEL_8:

}

- (void)backupUUIDForVolume:(id)a3 reply:(id)a4
{
  void (**v4)(id, _QWORD, id);
  id v5;

  v4 = (void (**)(id, _QWORD, id))a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
  v4[2](v4, 0, v5);

}

- (void)stashCreatewithSecret:(id)a3 secrestSize:(unint64_t)a4 withMode:(int)a5 withUID:(unsigned int)a6 WithFlags:(unsigned int)a7 reply:(id)a8
{
  char v9;
  id v14;
  void (**v15)(id, void *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSErrorDomain v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  vm_address_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSErrorDomain v37;
  uint64_t v38;
  int v39;
  vm_map_t v40;
  vm_address_t v41;
  vm_size_t v42;
  rsize_t v43;
  char v44;
  vm_address_t address;

  v9 = a7;
  v14 = a3;
  v15 = (void (**)(id, void *))a8;
  address = 0;
  if (!-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.stash.access")))
  {
    v21 = NSPOSIXErrorDomain;
    v22 = 1;
LABEL_5:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, v22, 0));
    if (!v15)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (vm_page_size < a4)
  {
    sub_10001595C("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v16, v17, v18, v19, v20, v44);
    v21 = NSPOSIXErrorDomain;
    v22 = 7;
    goto LABEL_5;
  }
  if (!vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    if (a4)
    {
      v30 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v14, a4, address))
      {
        sub_10001595C("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", CFSTR("Failed to retrieve Passcode"), v31, v32, v33, v34, v35, v36, v44);
        v37 = NSPOSIXErrorDomain;
        v38 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v30 = 0;
    }
    v39 = sub_100017DD4(v30, a4, a5, v9, a6);
    if (!v39)
    {
      v23 = 0;
      goto LABEL_17;
    }
    v37 = NSPOSIXErrorDomain;
    v38 = v39;
LABEL_15:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, v38, 0));
LABEL_17:
    v40 = mach_task_self_;
    v41 = address;
    v42 = vm_page_size;
    if (vm_page_size >= a4)
      v43 = a4;
    else
      v43 = vm_page_size;
    memset_s((void *)address, v43, 0, v43);
    vm_deallocate(v40, v41, v42);
    goto LABEL_21;
  }
  sub_10001595C("-[KBXPCService stashCreatewithSecret:secrestSize:withMode:withUID:WithFlags:reply:]", CFSTR("FAILED to allocate VM"), v24, v25, v26, v27, v28, v29, v44);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
  address = 0;
LABEL_21:
  v15[2](v15, v23);
LABEL_22:

}

- (void)stashCommitwithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5
{
  char v5;
  int v8;
  void *v9;
  void (**v10)(id, void *);
  void (**v11)(id, void *);

  v5 = a4;
  v11 = (void (**)(id, void *))a5;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.stash.access")))
  {
    v8 = sub_100018864(a3, v5);
    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v8, 0));
    else
      v9 = 0;
    v10 = v11;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v10 = v11;
    if (!v11)
      goto LABEL_9;
  }
  v10[2](v10, v9);
LABEL_9:

}

- (void)stashVerifywithUID:(unsigned int)a3 WithFlags:(unsigned int)a4 WithReply:(id)a5
{
  char v5;
  void (**v8)(id, _QWORD, void *);
  int v9;
  void *v10;
  unsigned int v11;

  v5 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v11 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.stash.access")))
  {
    v9 = sub_100018054(a3, v5, &v11);
    if (v9)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v9, 0));
    else
      v10 = 0;
    v8[2](v8, v11, v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (v8)
      v8[2](v8, 0, v10);
  }

}

- (void)stashDestroywithReply:(id)a3
{
  int v4;
  void *v5;
  void (**v6)(id, void *);
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.keystore.stash.access")))
  {
    v4 = sub_100018998();
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, 0));
    else
      v5 = 0;
    v6 = v7;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v6 = v7;
    if (!v7)
      goto LABEL_9;
  }
  v6[2](v6, v5);
LABEL_9:

}

- (void)isKeyRollingInProgresswithreply:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;

  v3 = (void (**)(id, _QWORD, void *))a3;
  v7 = 0;
  v4 = sub_100018DF0((uint64_t)&v7);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v7 = v5;
  }
  else
  {
    v6 = 0;
    v5 = v7;
  }
  v3[2](v3, v5, v6);

}

- (void)migrationWithReply:(id)a3
{
  int v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = aks_migrate_fs("/private/var", 0);
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v3, 0));
  else
    v4 = 0;
  v5[2](v5, v4);

}

- (void)forgottenPasscodeEventWithReply:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  sub_10001902C();
}

- (void)getLockSateInfoforUser:(int)a3 WithReply:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *);

  v7 = (void (**)(id, void *, void *))a4;
  v5 = (void *)sub_100018F54(a3);
  if (v5)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  v7[2](v7, v5, v6);

}

- (void)getDeviceLockState:(int)a3 needsExtended:(BOOL)a4 withReply:(id)a5
{
  _BOOL4 v5;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  unsigned int v9;

  v5 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  v9 = 0;
  if (sub_100019194(a3, v5, &v9))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  v7[2](v7, v9, v8);

}

- (void)passcodeUnlockStartWithReply:(id)a3
{
  uint64_t v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = sub_100015958();
  sub_10000EFD0(v3);
  v4[2](v4, 0);

}

- (void)passcodeUnlockSuccessWithReply:(id)a3
{
  uint64_t v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = sub_100015958();
  sub_10000EFF0(v3);
  v4[2](v4, 0);

}

- (void)passcodeUnlockFailedWithReply:(id)a3
{
  uint64_t v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = sub_100015958();
  sub_10000F010(v3);
  v4[2](v4, 0);

}

- (void)SeshatEnrollWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(id, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const UInt8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSErrorDomain v29;
  uint64_t v30;
  int v31;
  vm_map_t v32;
  vm_address_t v33;
  vm_size_t v34;
  rsize_t v35;
  char v36;
  vm_address_t address;

  v8 = a3;
  v14 = (void (**)(id, void *))a5;
  address = 0;
  if (vm_page_size < a4)
  {
    sub_10001595C("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v9, v10, v11, v12, v13, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
    goto LABEL_17;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_10001595C("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", CFSTR("FAILED to allocate VM"), v16, v17, v18, v19, v20, v21, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
    address = 0;
    goto LABEL_17;
  }
  if (a4)
  {
    v22 = (const UInt8 *)address;
    if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v8, a4, address))
    {
      sub_10001595C("-[KBXPCService SeshatEnrollWithSecret:secretSize:withReply:]", CFSTR("Failed to retrieve oldpasscode"), v23, v24, v25, v26, v27, v28, v36);
      v29 = NSPOSIXErrorDomain;
      v30 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    v22 = 0;
  }
  v31 = sub_100019308(v22, a4);
  if (!v31)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v29 = NSPOSIXErrorDomain;
  v30 = v31;
LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v29, v30, 0));
LABEL_13:
  v32 = mach_task_self_;
  v33 = address;
  v34 = vm_page_size;
  if (vm_page_size >= a4)
    v35 = a4;
  else
    v35 = vm_page_size;
  memset_s((void *)address, v35, 0, v35);
  vm_deallocate(v32, v33, v34);
LABEL_17:
  v14[2](v14, v15);

}

- (void)Event:(int)a3
{
  sub_10001B2A0(a3);
}

- (void)SeshatUnlockWithSecret:(id)a3 secretSize:(unint64_t)a4 withMemento:(BOOL)a5 verifyOnly:(BOOL)a6 withACMRef:(id)a7 withReply:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(id, _QWORD, id);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  UInt8 *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  vm_map_t v36;
  vm_address_t v37;
  vm_size_t v38;
  rsize_t v39;
  vm_map_t v40;
  vm_address_t v41;
  vm_size_t v42;
  rsize_t v43;
  char v44;
  _QWORD v45[4];
  id v46;
  void (**v47)(id, _QWORD, id);
  vm_address_t address;

  v11 = a5;
  v14 = a3;
  v15 = a7;
  v21 = (void (**)(id, _QWORD, id))a8;
  address = 0;
  if (vm_page_size < a4)
  {
    sub_10001595C("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v16, v17, v18, v19, v20, v44);
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
LABEL_5:
    v21[2](v21, 0, v22);
    goto LABEL_6;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_10001595C("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", CFSTR("FAILED to allocate VM"), v23, v24, v25, v26, v27, v28, v44);
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
    address = 0;
    goto LABEL_5;
  }
  if (a4)
  {
    v29 = (UInt8 *)address;
    if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v14, a4, address))
    {
      sub_10001595C("-[KBXPCService SeshatUnlockWithSecret:secretSize:withMemento:verifyOnly:withACMRef:withReply:]", CFSTR("Failed to retrieve oldpasscode"), v30, v31, v32, v33, v34, v35, v44);
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v36 = mach_task_self_;
      v37 = address;
      v38 = vm_page_size;
      if (vm_page_size >= a4)
        v39 = a4;
      else
        v39 = vm_page_size;
      memset_s((void *)address, v39, 0, v39);
      vm_deallocate(v36, v37, v38);
      goto LABEL_5;
    }
  }
  else
  {
    v29 = 0;
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000BC20;
  v45[3] = &unk_10002CCD8;
  v46 = (id)os_transaction_create("com.apple.mkb.resettoken");
  v47 = v21;
  v22 = v46;
  sub_1000199C0(v29, a4, v11, a6, (uint64_t)v15, (uint64_t)v45);
  v40 = mach_task_self_;
  v41 = address;
  v42 = vm_page_size;
  if (vm_page_size >= a4)
    v43 = a4;
  else
    v43 = vm_page_size;
  memset_s((void *)address, v43, 0, v43);
  vm_deallocate(v40, v41, v42);

LABEL_6:
}

- (void)SeshatRecoverWithSecret:(id)a3 secretSize:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UInt8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  vm_map_t v30;
  vm_address_t v31;
  vm_size_t v32;
  rsize_t v33;
  uint64_t v34;
  vm_map_t v35;
  vm_address_t v36;
  vm_size_t v37;
  rsize_t v38;
  char v39;
  vm_address_t address;

  v8 = a3;
  v14 = (void (**)(id, _QWORD, void *))a5;
  address = 0;
  if (vm_page_size < a4)
  {
    sub_10001595C("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", CFSTR("Long Secret, can't handle ..."), vm_page_size, v9, v10, v11, v12, v13, v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 7, 0));
LABEL_5:
    v14[2](v14, 0, v15);

    goto LABEL_6;
  }
  if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
  {
    sub_10001595C("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", CFSTR("FAILED to allocate VM"), v16, v17, v18, v19, v20, v21, v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
    address = 0;
    goto LABEL_5;
  }
  if (a4)
  {
    v22 = (UInt8 *)address;
    if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v8, a4, address))
    {
      sub_10001595C("-[KBXPCService SeshatRecoverWithSecret:secretSize:withReply:]", CFSTR("Failed to retrieve oldpasscode"), v23, v24, v25, v26, v27, v28, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v30 = mach_task_self_;
      v31 = address;
      v32 = vm_page_size;
      if (vm_page_size >= a4)
        v33 = a4;
      else
        v33 = vm_page_size;
      memset_s((void *)address, v33, 0, v33);
      vm_deallocate(v30, v31, v32);
      v14[2](v14, 0, v29);

      goto LABEL_6;
    }
  }
  else
  {
    v22 = 0;
  }
  v34 = sub_10001AB30(v22, a4);
  v35 = mach_task_self_;
  v36 = address;
  v37 = vm_page_size;
  if (vm_page_size >= a4)
    v38 = a4;
  else
    v38 = vm_page_size;
  memset_s((void *)address, v38, 0, v38);
  vm_deallocate(v35, v36, v37);
  v14[2](v14, v34, 0);
LABEL_6:

}

- (void)SeshatDebugWithDebugMask:(int)a3 withReply:(id)a4
{
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a4;
  if (sub_10001B184(a3))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
  else
    v5 = 0;
  v6[2](v6, v5);

}

- (void)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 secretSize:(unint64_t)a6 withGracePeriod:(int)a7 withOpaqeStuff:(id)a8 withReply:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  vm_address_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  vm_map_t v38;
  vm_address_t v39;
  vm_size_t v40;
  rsize_t v41;
  NSObject *v42;
  vm_map_t v43;
  vm_address_t v44;
  vm_size_t v45;
  rsize_t v46;
  char v47;
  _QWORD block[4];
  id v49;
  id v50;
  uint64_t *v51;
  _QWORD *v52;
  unint64_t v53;
  vm_address_t v54;
  int v55;
  int v56;
  _QWORD v57[3];
  int v58;
  vm_address_t address;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = (void (**)(id, _QWORD))a9;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = sub_1000099A8;
  v64 = sub_1000099B8;
  v65 = 0;
  address = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v58 = -1;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_10001595C("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]", CFSTR("FAILED to allocate VM"), v19, v20, v21, v22, v23, v24, v47);
      v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
      v26 = (void *)v61[5];
      v61[5] = v25;

      address = 0;
LABEL_5:
      v18[2](v18, v61[5]);
      goto LABEL_17;
    }
    if (a6)
    {
      v29 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v16, a6, address))
      {
        sub_10001595C("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]", CFSTR("Failed to retrieve passcode info"), v30, v31, v32, v33, v34, v35, v47);
        v36 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v37 = (void *)v61[5];
        v61[5] = v36;

        v38 = mach_task_self_;
        v39 = address;
        v40 = vm_page_size;
        if (vm_page_size >= a6)
          v41 = a6;
        else
          v41 = vm_page_size;
        memset_s((void *)address, v41, 0, v41);
        vm_deallocate(v38, v39, v40);
        goto LABEL_5;
      }
    }
    else
    {
      v29 = 0;
    }
    v42 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C268;
    block[3] = &unk_10002CD00;
    v49 = v15;
    v53 = a6;
    v54 = v29;
    v55 = a4;
    v56 = a7;
    v50 = v17;
    v51 = &v60;
    v52 = v57;
    dispatch_sync(v42, block);
    v43 = mach_task_self_;
    v44 = address;
    v45 = vm_page_size;
    if (vm_page_size >= a6)
      v46 = a6;
    else
      v46 = vm_page_size;
    memset_s((void *)address, v46, 0, v46);
    vm_deallocate(v43, v44, v45);
    v18[2](v18, v61[5]);

  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v28 = (void *)v61[5];
    v61[5] = v27;

    if (v18)
      goto LABEL_5;
  }
LABEL_17:
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v60, 8);

}

- (void)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 secretSize:(unint64_t)a6 shouldSetGracePeriod:(BOOL)a7 withGracePeriod:(int)a8 isInEarlyStar:(BOOL)a9 withReply:(id)a10
{
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  vm_address_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  vm_map_t v38;
  vm_address_t v39;
  vm_size_t v40;
  rsize_t v41;
  NSObject *v42;
  vm_map_t v43;
  vm_address_t v44;
  vm_size_t v45;
  rsize_t v46;
  char v47;
  _QWORD block[4];
  id v49;
  uint64_t *v50;
  _QWORD *v51;
  unint64_t v52;
  vm_address_t v53;
  int v54;
  int v55;
  BOOL v56;
  BOOL v57;
  _QWORD v58[3];
  int v59;
  vm_address_t address;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v16 = a3;
  v17 = a5;
  v18 = (void (**)(id, _QWORD))a10;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_1000099A8;
  v65 = sub_1000099B8;
  v66 = 0;
  address = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = -1;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_10001595C("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]", CFSTR("FAILED to allocate VM"), v19, v20, v21, v22, v23, v24, v47);
      v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
      v26 = (void *)v62[5];
      v62[5] = v25;

      address = 0;
LABEL_5:
      v18[2](v18, v62[5]);
      goto LABEL_17;
    }
    if (a6)
    {
      v29 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v17, a6, address))
      {
        sub_10001595C("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]", CFSTR("Failed to retrieve passcode info"), v30, v31, v32, v33, v34, v35, v47);
        v36 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v37 = (void *)v62[5];
        v62[5] = v36;

        v38 = mach_task_self_;
        v39 = address;
        v40 = vm_page_size;
        if (vm_page_size >= a6)
          v41 = a6;
        else
          v41 = vm_page_size;
        memset_s((void *)address, v41, 0, v41);
        vm_deallocate(v38, v39, v40);
        goto LABEL_5;
      }
    }
    else
    {
      v29 = 0;
    }
    v42 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C6C0;
    block[3] = &unk_10002CD28;
    v52 = a6;
    v53 = v29;
    v56 = a7;
    v54 = a4;
    v55 = a8;
    v57 = a9;
    v49 = v16;
    v50 = &v61;
    v51 = v58;
    dispatch_sync(v42, block);
    v43 = mach_task_self_;
    v44 = address;
    v45 = vm_page_size;
    if (vm_page_size >= a6)
      v46 = a6;
    else
      v46 = vm_page_size;
    memset_s((void *)address, v46, 0, v46);
    vm_deallocate(v43, v44, v45);
    v18[2](v18, v62[5]);

  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v28 = (void *)v62[5];
    v62[5] = v27;

    if (v18)
      goto LABEL_5;
  }
LABEL_17:
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&v61, 8);

}

- (void)unloadKeybagForUserSession:(int)a3 withReply:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = (void (**)(id, _QWORD))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000099A8;
  v15 = sub_1000099B8;
  v16 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C8D8;
    v9[3] = &unk_10002CD50;
    v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_100035870, v9);
LABEL_4:
    v6[2](v6, v12[5]);
    goto LABEL_5;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v8 = (void *)v12[5];
  v12[5] = v7;

  if (v6)
    goto LABEL_4;
LABEL_5:
  _Block_object_dispose(&v11, 8);

}

- (void)deleteKeybagForUserSession:(int)a3 withReply:(id)a4
{
  uint64_t v4;
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000099A8;
  v16 = sub_1000099B8;
  v17 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000CAE0;
    v10[3] = &unk_10002CD50;
    v11 = v4;
    v10[4] = &v12;
    dispatch_sync((dispatch_queue_t)qword_100035870, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", v4));
    objc_msgSend(v7, "userDeleted");

LABEL_4:
    v6[2](v6, v13[5]);
    goto LABEL_5;
  }
  v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
  v9 = (void *)v13[5];
  v13[5] = v8;

  if (v6)
    goto LABEL_4;
LABEL_5:
  _Block_object_dispose(&v12, 8);

}

- (void)setVolumeToPersona:(id)a3 withPersonaString:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000099A8;
  v23 = sub_1000099B8;
  v24 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v11 = qword_100035870;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000CD20;
    v14[3] = &unk_10002CD78;
    v15 = v8;
    v18 = &v19;
    v16 = v9;
    v17 = v10;
    dispatch_sync(v11, v14);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v13 = (void *)v20[5];
    v20[5] = v12;

    if (v10)
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v20[5]);
  }
  _Block_object_dispose(&v19, 8);

}

- (void)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000099A8;
  v21 = sub_1000099B8;
  v22 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D0F0;
    block[3] = &unk_10002CDA0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9)
      v9[2](v9, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000099A8;
  v21 = sub_1000099B8;
  v22 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D310;
    block[3] = &unk_10002CDA0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9)
      v9[2](v9, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000099A8;
  v21 = sub_1000099B8;
  v22 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D530;
    block[3] = &unk_10002CDA0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9)
      v9[2](v9, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000099A8;
  v21 = sub_1000099B8;
  v22 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D750;
    block[3] = &unk_10002CDA0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9)
      v9[2](v9, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000099A8;
  v21 = sub_1000099B8;
  v22 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v10 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D9C0;
    block[3] = &unk_10002CDA0;
    v16 = a4;
    v14 = v8;
    v15 = &v17;
    dispatch_sync(v10, block);
    v9[2](v9, v18[5]);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v12 = (void *)v18[5];
    v18[5] = v11;

    if (v9)
      v9[2](v9, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

- (void)createPersonaKeyForUserSession:(id)a3 forPath:(id)a4 withUID:(unsigned int)a5 WithSecret:(id)a6 secretSize:(unint64_t)a7 withReply:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  vm_address_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  vm_map_t v37;
  vm_address_t v38;
  vm_size_t v39;
  rsize_t v40;
  NSObject *v41;
  vm_map_t v42;
  vm_address_t v43;
  vm_size_t v44;
  rsize_t v45;
  char v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t *v50;
  _QWORD *v51;
  unint64_t v52;
  vm_address_t v53;
  unsigned int v54;
  _QWORD v55[3];
  int v56;
  vm_address_t address;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = (void (**)(id, _QWORD))a8;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1000099A8;
  v62 = sub_1000099B8;
  v63 = 0;
  address = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = -1;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      sub_10001595C("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]", CFSTR("FAILED to allocate VM"), v18, v19, v20, v21, v22, v23, v46);
      v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
      v25 = (void *)v59[5];
      v59[5] = v24;

      address = 0;
LABEL_5:
      v17[2](v17, v59[5]);
      goto LABEL_17;
    }
    if (a7)
    {
      v28 = address;
      if (-[KBXPCService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:](self, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:", v16, a7, address))
      {
        sub_10001595C("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]", CFSTR("Failed to passcode info"), v29, v30, v31, v32, v33, v34, v46);
        v35 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v36 = (void *)v59[5];
        v59[5] = v35;

        v37 = mach_task_self_;
        v38 = address;
        v39 = vm_page_size;
        if (vm_page_size >= a7)
          v40 = a7;
        else
          v40 = vm_page_size;
        memset_s((void *)address, v40, 0, v40);
        vm_deallocate(v37, v38, v39);
        goto LABEL_5;
      }
    }
    else
    {
      v28 = 0;
    }
    v41 = qword_100035870;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DE38;
    block[3] = &unk_10002CDC8;
    v54 = a5;
    v48 = v15;
    v52 = a7;
    v53 = v28;
    v49 = v14;
    v50 = &v58;
    v51 = v55;
    dispatch_sync(v41, block);
    v42 = mach_task_self_;
    v43 = address;
    v44 = vm_page_size;
    if (vm_page_size >= a7)
      v45 = a7;
    else
      v45 = vm_page_size;
    memset_s((void *)address, v45, 0, v45);
    vm_deallocate(v42, v43, v44);
    v17[2](v17, v59[5]);

  }
  else
  {
    v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v27 = (void *)v59[5];
    v59[5] = v26;

    if (v17)
      goto LABEL_5;
  }
LABEL_17:
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v58, 8);

}

- (void)removePersonaKeyForUserSession:(id)a3 withUID:(unsigned int)a4 withVolumeUUIDString:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000099A8;
  v25 = sub_1000099B8;
  v26 = 0;
  if (-[KBXPCService remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.mkb.usersession.ops")))
  {
    v13 = qword_100035870;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E09C;
    v16[3] = &unk_10002CDF0;
    v20 = a4;
    v17 = v10;
    v18 = v11;
    v19 = &v21;
    dispatch_sync(v13, v16);
    v12[2](v12, v22[5]);

  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    v15 = (void *)v22[5];
    v22[5] = v14;

    if (v12)
      v12[2](v12, v22[5]);
  }
  _Block_object_dispose(&v21, 8);

}

@end
