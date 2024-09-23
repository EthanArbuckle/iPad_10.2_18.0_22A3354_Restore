@implementation PreflightDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;

  v4 = a4;
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(NSString);
  v7 = objc_opt_class(NSDictionary);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(NSData), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received a connection on com.apple.corerepair.preflightControl!", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D48));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D58));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D60));
  v15 = (void *)v14;
  if (!v12 || !(v13 | v14))
  {
    v25 = handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[PreflightDelegate listener:shouldAcceptNewConnection:]";
      v27 = "%s: audit token does not have entitlements needed.";
      v28 = v26;
      v29 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    }
LABEL_18:

LABEL_19:
    objc_msgSend(v4, "invalidate");
    v22 = 0;
    goto LABEL_12;
  }
  v16 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v12, v16) & 1) == 0
    || (v17 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v13, v17) & 1) == 0)
    && (v18 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v15, v18) & 1) == 0))
  {
    v30 = handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[PreflightDelegate listener:shouldAcceptNewConnection:]";
      v33 = 2112;
      v34 = v12;
      v27 = "%s: format not correct: %@";
      v28 = v26;
      v29 = 22;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v12, "BOOLValue")
    || (objc_msgSend((id)v13, "BOOLValue") & 1) == 0 && !objc_msgSend(v15, "BOOLValue"))
  {
    goto LABEL_19;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairPreflightProtocol));
  objc_msgSend(v4, "setExportedInterface:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v9, "challengeStrongComponents:withReply:", 0, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  v22 = 1;
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v9, "challengeStrongComponents:withReply:", 1, 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CoreRepairHelper sharedInstance](CoreRepairHelper, "sharedInstance"));
  objc_msgSend(v4, "setExportedObject:", v23);
  objc_msgSend(v4, "resume");

LABEL_12:
  return v22;
}

@end
