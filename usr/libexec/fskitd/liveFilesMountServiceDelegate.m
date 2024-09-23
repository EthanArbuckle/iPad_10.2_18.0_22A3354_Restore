@implementation liveFilesMountServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void **v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id buf;

  v5 = a3;
  v6 = a4;
  v7 = ((uint64_t (*)(void))fskit_std_log)();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100039AF0(v8, v9, v10, v11, v12, v13, v14, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.LiveFS.connection")));
  v17 = v16;
  if (v16)
    v18 = objc_msgSend(v16, "BOOLValue");
  else
    v18 = 0;
  v19 = ((uint64_t (*)(void))fskit_std_log)();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = (_DWORD)v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Incomming connection, entitled %d", (uint8_t *)&buf, 8u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LiveFSMounter));
  objc_msgSend(v6, "setExportedInterface:", v21);

  v22 = -[fskitdXPCServer initForEntitledClient:]([fskitdXPCServer alloc], "initForEntitledClient:", v18);
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "setOurConn:", v6);
    objc_msgSend(v6, "setExportedObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LiveFSMounterClient));
    objc_msgSend(v6, "setRemoteObjectInterface:", v24);

    objc_initWeak(&buf, v23);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10000FFD4;
    v49[3] = &unk_100054DB0;
    objc_copyWeak(&v50, &buf);
    objc_msgSend(v6, "setInterruptionHandler:", v49);
    v44 = _NSConcreteStackBlock;
    v45 = 3221225472;
    v46 = sub_100010070;
    v47 = &unk_100054DB0;
    objc_copyWeak(&v48, &buf);
    objc_msgSend(v6, "setInvalidationHandler:", &v44);
    v25 = fskit_std_log(objc_msgSend(v6, "resume", v44, v45, v46, v47));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_100039A10(v26, v27, v28, v29, v30, v31, v32, v33);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&buf);
  }
  else
  {
    v34 = ((uint64_t (*)(void))fskit_std_log)();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      sub_100039A80(v35, v36, v37, v38, v39, v40, v41, v42);

  }
  return v23 != 0;
}

@end
