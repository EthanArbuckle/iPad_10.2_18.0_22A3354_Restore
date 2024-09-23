@implementation IDSServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  void *v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.transparency.kt")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070770);
    v8 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Accepting new connection", (uint8_t *)v15, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate xpcQueue](self, "xpcQueue"));
    objc_msgSend(v5, "_setQueue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyXPCIDSInterface interface](TransparencyXPCIDSInterface, "interface"));
    objc_msgSend(v5, "setExportedInterface:", v10);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier")));
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070750);
    v12 = (void *)qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v15[0] = 67109378;
      v15[1] = objc_msgSend(v5, "processIdentifier");
      v16 = 2114;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ids rejecting client %d/[%{public}@] due to lack of entitlement", (uint8_t *)v15, 0x12u);

    }
  }

  return v7;
}

- (id)staticKeyFeatureNotEnabled:(id)a3
{
  return +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -298, CFSTR("Feature not enabled: %@"), a3);
}

- (id)selfAccountKey:(id *)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v18;
  id v19;
  id v20;
  id obj;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;

  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = sub_100004978;
  v39 = sub_100004988;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100004978;
  v33 = sub_100004988;
  v34 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100004990;
  v25[3] = &unk_1000707C0;
  v27 = &v29;
  v28 = &v35;
  v26 = dispatch_semaphore_create(0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100004AAC;
  v22[3] = &unk_1000707E8;
  v24 = &v35;
  v4 = v26;
  v23 = v4;
  +[TransparencyXPCConnection invokeIDSSupportWithBlock:errorHandler:](TransparencyXPCConnection, "invokeIDSSupportWithBlock:errorHandler:", v25, v22);
  v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -321, CFSTR("timeout getting self public key")));
    v7 = v36[5];
    v36[5] = (id)v6;

    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070808);
    v8 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v9 = v36[5];
      *(_DWORD *)buf = 138543362;
      v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Timed out to get account public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      v10 = v36[5];
      if (v10)
      {
LABEL_8:
        v11 = 0;
        *a3 = objc_retainAutorelease(v10);
        goto LABEL_20;
      }
    }
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  v12 = v30[5];
  if (!v12)
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070828);
    v15 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v16 = v36[5];
      *(_DWORD *)buf = 138543362;
      v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to get account public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      v10 = v36[5];
      if (v10)
        goto LABEL_8;
    }
    goto LABEL_19;
  }
  v13 = v36;
  obj = v36[5];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v12, &obj));
  objc_storeStrong(v13 + 5, obj);
  if (v11)
  {
    v14 = v11;
  }
  else
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070848);
    v18 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v19 = v36[5];
      *(_DWORD *)buf = 138543362;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to convert public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      v20 = v36[5];
      if (v20)
        *a3 = objc_retainAutorelease(v20);
    }
  }

LABEL_20:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v11;
}

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (qword_10008AA40 != -1)
    dispatch_once(&qword_10008AA40, &stru_100070868);
  v8 = (void *)qword_10008AA48;
  if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastUsedAddressOfMe"));
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setupKTSession to peer: %{mark.hash}@ from: %{mark.hash}@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));

  if (v12)
  {
    v23 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate selfAccountKey:](self, "selfAccountKey:", &v23));
    v14 = v23;
    if (v13)
    {
      if (qword_10008AA40 != -1)
        dispatch_once(&qword_10008AA40, &stru_1000708A8);
      v15 = qword_10008AA48;
      if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setupKTSession got account key: %{public}@", buf, 0xCu);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "setupMailbox:publicInfo:", v6, v16));

      objc_msgSend(v18, "setStateUpdate:", &stru_1000708E8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
      objc_msgSend(v19, "startSession:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapMailbox"));
      if (qword_10008AA40 != -1)
        dispatch_once(&qword_10008AA40, &stru_100070948);
      v21 = qword_10008AA48;
      if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "setupKTSession setup complete: %{public}@", buf, 0xCu);
      }
      v7[2](v7, v20, 0);

    }
    else
    {
      if (qword_10008AA40 != -1)
        dispatch_once(&qword_10008AA40, &stru_100070888);
      v22 = qword_10008AA48;
      if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to convert public key: %{public}@", buf, 0xCu);
      }
      ((void (**)(id, void *, id))v7)[2](v7, 0, v14);
    }

  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate staticKeyFeatureNotEnabled:](self, "staticKeyFeatureNotEnabled:", CFSTR("IDS protocol")));
    ((void (**)(id, void *, id))v7)[2](v7, 0, v14);
  }

}

- (void)listKTSession:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "listSessions"));
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
  v9 = objc_msgSend(v10, "deleteSessionByID:", v8);

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "findSessionByHandle:", v8));

  v12 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  (*((void (**)(id, void *))a4 + 2))(v7, v11);

}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate idsTransport](self, "idsTransport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "findSessionByID:", v6));

  if (qword_10008AA40 != -1)
    dispatch_once(&qword_10008AA40, &stru_100070968);
  v10 = qword_10008AA48;
  if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "getKTSessionByID: %{public}@ found %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v7[2](v7, v9);

}

- (OS_dispatch_queue)xpcQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTIDSSessionHandler)idsTransport
{
  return (KTIDSSessionHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdsTransport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTransport, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end
