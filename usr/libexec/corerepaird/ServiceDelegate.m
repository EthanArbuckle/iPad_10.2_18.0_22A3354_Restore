@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSSet *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  __objc2_class **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;

  v4 = a4;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a connection!", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D48));
  if (!v7)
  {
    v39 = handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v41 = "%s: audit token does not have entitlements needed.";
      v42 = v40;
      v43 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    }
LABEL_29:
    v11 = 0;
    v9 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v44 = handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v50 = 2112;
      v51 = v7;
      v41 = "%s: format not correct: %@";
      v42 = v40;
      v43 = 22;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  if (!objc_msgSend(v7, "BOOLValue"))
  {
    v11 = 0;
    v9 = 0;
LABEL_37:
    objc_msgSend(v4, "invalidate");
    v37 = 0;
    goto LABEL_23;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D50));
  if (v9)
  {
    v10 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {
      v45 = handleForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
        v50 = 2112;
        v51 = v9;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s: format not correct: %@", buf, 0x16u);
      }
      v11 = 0;
      goto LABEL_36;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D58));
  if (!v11)
  {
LABEL_14:
    v29 = objc_opt_class(NSArray);
    v30 = objc_opt_class(NSString);
    v31 = objc_opt_class(NSDictionary);
    v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, v30, v31, objc_opt_class(NSData), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
    objc_msgSend(v4, "setExportedInterface:", v33);

    if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
    {
      v34 = handleForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRFactoryHelper instance for factory service", buf, 2u);
      }
      v28 = &off_100050398;
    }
    else
    {
      v35 = handleForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CoreRepairHelper instance", buf, 2u);
      }
      v28 = &off_100050400;
    }
    goto LABEL_22;
  }
  v12 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v46 = handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v50 = 2112;
      v51 = v11;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s: format not correct: %@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if (!objc_msgSend(v11, "BOOLValue"))
    goto LABEL_14;
  v47 = v7;
  v13 = objc_opt_class(NSArray);
  v14 = objc_opt_class(NSString);
  v15 = objc_opt_class(NSDictionary);
  v16 = objc_opt_class(NSNumber);
  v17 = objc_opt_class(NSData);
  v18 = objc_opt_class(CRChallengeObject);
  v19 = objc_opt_class(CRChallengeResponse);
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, v17, v18, v19, objc_opt_class(CRStrongComponent), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRAttestationProtocol));
  objc_msgSend(v4, "setExportedInterface:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v21, "challengeComponentsWith:withReply:", 0, 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v21, "challengeComponentsWith:withReply:", 1, 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v21, "getStrongComponentsWithReply:", 1, 1);

  v26 = handleForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRCAttestationHandler instance", buf, 2u);
  }
  v28 = (__objc2_class **)CRAttestationHandler_ptr;
  v7 = v47;
LABEL_22:

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v28, "sharedInstance"));
  objc_msgSend(v4, "setExportedObject:", v36);
  objc_msgSend(v4, "resume");

  v37 = 1;
LABEL_23:

  return v37;
}

@end
