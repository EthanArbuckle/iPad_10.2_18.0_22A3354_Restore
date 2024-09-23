@implementation KTLoggableData

- (void)computeHashesForSalt:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_sha256WithSalt:", v9));
    -[KTLoggableData setDeviceIdHash:](self, "setDeviceIdHash:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256WithSalt:", v9));
  -[KTLoggableData setClientDataHash:](self, "setClientDataHash:", v8);

}

- (BOOL)verifySignatureWithAccountKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *log;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature")),
        v9,
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature"));
    v43 = 0;
    v12 = +[KTAccountKeyServer verifyData:signature:accountPublicKeyInfo:error:](KTAccountKeyServer, "verifyData:signature:accountPublicKeyInfo:error:", v10, v11, v6, &v43);
    v13 = v43;

    if ((v12 & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      if (qword_1002A77F8 != -1)
        dispatch_once(&qword_1002A77F8, &stru_100248290);
      v31 = (void *)qword_1002A7800;
      if (os_log_type_enabled((os_log_t)qword_1002A7800, OS_LOG_TYPE_ERROR))
      {
        log = v31;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "kt_hexString"));
        v32 = -[KTLoggableData ktCapable](self, "ktCapable");
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "kt_hexString"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData signature](self, "signature"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "kt_hexString"));
        *(_DWORD *)buf = 138413314;
        v45 = v40;
        v46 = 1024;
        v47 = v32;
        v48 = 2112;
        v49 = v34;
        v50 = 2112;
        v51 = v35;
        v52 = 2112;
        v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to verify signature for deviceID %@, ktCapable %d, client data %@ key: %@ signature: %@", buf, 0x30u);

      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -272, v13, CFSTR("failed to validate loggable data signature")));

      if (qword_1002A77F8 != -1)
        dispatch_once(&qword_1002A77F8, &stru_1002482B0);
      v39 = qword_1002A7800;
      if (os_log_type_enabled((os_log_t)qword_1002A7800, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v38;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "failed to validate loggable data signatures: %@", buf, 0xCu);
      }
      v14 = 0;
      if (a4 && v38)
      {
        v13 = objc_retainAutorelease(v38);
        v14 = 0;
        *a4 = v13;
      }
      else
      {
        v13 = v38;
      }
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_hexString"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("deviceID"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData product](self, "product"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("product"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData build](self, "build"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("build"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[KTLoggableData ktCapable](self, "ktCapable")));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("ktCapable"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
    if (v21)
      v22 = -286;
    else
      v22 = -362;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), v22, 4, 0, v15, CFSTR("no signature for client data")));
    if (qword_1002A77F8 != -1)
      dispatch_once(&qword_1002A77F8, &stru_100248270);
    v23 = (void *)qword_1002A7800;
    if (os_log_type_enabled((os_log_t)qword_1002A7800, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData deviceID](self, "deviceID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
      v27 = -[KTLoggableData ktCapable](self, "ktCapable");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableData clientData](self, "clientData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "kt_hexString"));
      *(_DWORD *)buf = 138412802;
      v45 = v26;
      v46 = 1024;
      v47 = v27;
      v48 = 2112;
      v49 = v29;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "no signature for deviceId %@, ktCapable %d, client data %@", buf, 0x1Cu);

    }
    if (a4 && v13)
      *a4 = objc_retainAutorelease(v13);

    v14 = 0;
  }

  return v14;
}

@end
