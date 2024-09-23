@implementation PreferencesDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  _BYTE v25[24];

  v4 = a4;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a connection com.apple.corerepair.intentControl !", v25, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D48));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_100065D68));
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v24 = handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 136315138;
      *(_QWORD *)&v25[4] = "-[PreferencesDelegate listener:shouldAcceptNewConnection:]";
      v21 = "%s: audit token does not have entitlements needed.";
      v22 = v20;
      v23 = 12;
      goto LABEL_19;
    }
LABEL_20:

LABEL_21:
    objc_msgSend(v4, "invalidate", *(_OWORD *)v25, *(_QWORD *)&v25[16]);
    v17 = 0;
    goto LABEL_14;
  }
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) == 0
    || (v12 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v12) & 1) == 0))
  {
    v19 = handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[PreferencesDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&v25[12] = 2112;
      *(_QWORD *)&v25[14] = v7;
      v21 = "%s: format not correct: %@";
      v22 = v20;
      v23 = 22;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, v25, v23);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!objc_msgSend(v7, "BOOLValue") || !objc_msgSend(v9, "BOOLValue"))
    goto LABEL_21;
  v13 = handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Set exportedObject as a CRBootIntentHelper instance", v25, 2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairBootIntentProtocol));
  objc_msgSend(v4, "setExportedInterface:", v15);

  v16 = (void *)objc_opt_new(CRBootIntentHelper);
  objc_msgSend(v4, "setExportedObject:", v16);
  objc_msgSend(v4, "resume");

  v17 = 1;
LABEL_14:

  return v17;
}

@end
