@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  _BYTE v19[24];

  v4 = a4;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a connection!", v19, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", off_10001E8D0));
  if (!v7)
  {
    v13 = handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315138;
      *(_QWORD *)&v19[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      v15 = "%s: audit token does not have entitlements needed.";
      v16 = v14;
      v17 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, v19, v17);
    }
LABEL_13:

    goto LABEL_14;
  }
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v18 = handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315394;
      *(_QWORD *)&v19[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v7;
      v15 = "%s: format not correct: %@";
      v16 = v14;
      v17 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v7, "BOOLValue"))
  {
LABEL_14:
    objc_msgSend(v4, "invalidate", *(_OWORD *)v19, *(_QWORD *)&v19[16]);
    v11 = 0;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRSystemHealthProtocol));
  objc_msgSend(v4, "setExportedInterface:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRComponentHealthHandler sharedInstance](MRComponentHealthHandler, "sharedInstance"));
  objc_msgSend(v4, "setExportedObject:", v10);
  objc_msgSend(v4, "resume");

  v11 = 1;
LABEL_7:

  return v11;
}

@end
