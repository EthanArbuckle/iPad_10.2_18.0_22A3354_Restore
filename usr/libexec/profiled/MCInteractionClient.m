@implementation MCInteractionClient

- (MCInteractionClient)initWithXPCClientConnection:(id)a3
{
  id v4;
  MCInteractionClient *v5;
  MCInteractionClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCInteractionClient;
  v5 = -[MCInteractionClient init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MCInteractionClient setXpcConnection:](v5, "setXpcConnection:", v4);

  return v6;
}

- (BOOL)requestUserInput:(id)a3 delegate:(id)a4 outResult:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  dispatch_time_t v18;
  void **v20;
  uint64_t v21;
  void (*v22)(_QWORD *, void *, uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  NSObject *v30;

  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009ACD4();
  v10 = objc_alloc_init((Class)NSMutableArray);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000192F8;
  v29[3] = &unk_1000E3500;
  v11 = dispatch_semaphore_create(0);
  v30 = v11;
  v12 = objc_retainBlock(v29);
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v12));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_1000193D8;
  v23 = &unk_1000E3528;
  objc_copyWeak(&v27, &location);
  v15 = v9;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  v17 = v10;
  v26 = v17;
  objc_msgSend(v14, "doMCICDidRequestUserInput:completion:", v8, &v20);

  v18 = dispatch_time(0, 900000000000);
  dispatch_semaphore_wait(v16, v18);
  *a5 = objc_msgSend(v17, "copy", v20, v21, v22, v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)requestMAIDSignIn:(id)a3 personaID:(id)a4 outError:(id *)a5 isCancelled:(BOOL *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  char v19;
  uint8_t v21[8];
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v10 = a3;
  v11 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009AD54();
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100019750;
  v42 = sub_100019760;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100019768;
  v28[3] = &unk_1000E3500;
  v12 = dispatch_semaphore_create(0);
  v29 = v12;
  v13 = objc_retainBlock(v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v13));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100019848;
  v22[3] = &unk_1000E3550;
  v24 = &v44;
  v25 = &v38;
  v26 = &v34;
  v27 = &v30;
  v16 = v12;
  v23 = v16;
  objc_msgSend(v15, "doMCICDidRequestMAIDSignIn:personaID:completion:", v10, v11, v22);

  v17 = dispatch_time(0, 900000000000);
  dispatch_semaphore_wait(v16, v17);
  if (*((_BYTE *)v31 + 24))
  {
    v18 = _MCLogObjects[8];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "MAID sign in request timed out after 15 mins", v21, 2u);
    }
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v39[5]);
  *a6 = *((_BYTE *)v35 + 24);
  v19 = *((_BYTE *)v45 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

- (void)requestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[3];
  char v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[3];
  char v16;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009ADD4();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100019750;
  v13[4] = sub_100019760;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &stru_1000E3570));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019B38;
  v10[3] = &unk_1000E3598;
  v10[4] = v15;
  v10[5] = v13;
  v10[6] = v11;
  objc_msgSend(v9, "doMCICDidRequestManagedRestoreWithManagedAppleID:personaID:completion:", v6, v7, v10);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
}

- (void)_receivedUserInput:(id)a3 preflight:(BOOL)a4 payloadIndex:(unint64_t)a5 delegate:(id)a6 semaphore:(id)a7 error:(id)a8 outResponses:(id)a9
{
  _BOOL4 v13;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id location;
  _QWORD v32[4];
  NSObject *v33;
  id v34;

  v13 = a4;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
  {
    sub_10009AE54();
    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v19, "addObjectsFromArray:", v15);
    dispatch_semaphore_signal(v17);
    goto LABEL_6;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v34 = 0;
  objc_msgSend(v16, "interactionClient:didRequestPreflightUserInputResponses:forPayloadIndex:outError:", self, v15, a5, &v34, v18);
  v20 = v34;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100019E84;
  v32[3] = &unk_1000E3500;
  v21 = v17;
  v33 = v21;
  v22 = objc_retainBlock(v32);
  objc_initWeak(&location, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v22));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100019F64;
  v26[3] = &unk_1000E3528;
  objc_copyWeak(&v30, &location);
  v27 = v16;
  v28 = v21;
  v29 = v19;
  objc_msgSend(v24, "doMCICDidFinishPreflightWithError:completion:", v20, v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  v18 = v25;
LABEL_6:

}

- (BOOL)showUserWarnings:(id)a3 outResult:(BOOL *)a4
{
  id v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009AED4();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100019750;
  v26 = sub_100019760;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001A218;
  v19[3] = &unk_1000E35C0;
  v21 = &v22;
  v7 = dispatch_semaphore_create(0);
  v20 = v7;
  v8 = objc_retainBlock(v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A318;
  v15[3] = &unk_1000E35E8;
  v17 = &v22;
  v18 = &v28;
  v11 = v7;
  v16 = v11;
  objc_msgSend(v10, "doMCICDidRequestShowUserWarnings:completion:", v6, v15);

  v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) || v23[5])
  {
    v13 = 0;
  }
  else
  {
    *a4 = *((_BYTE *)v29 + 24);
    v13 = 1;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (BOOL)didFinishInstallationWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009AF54();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A4EC;
  v17[3] = &unk_1000E3500;
  v8 = dispatch_semaphore_create(0);
  v18 = v8;
  v9 = objc_retainBlock(v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A5CC;
  v15[3] = &unk_1000E3500;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v11, "doMCICDidFinishInstallationWithIdentifier:error:completion:", v6, v7, v15);

  v13 = dispatch_time(0, 10000000);
  dispatch_semaphore_wait(v12, v13);

  return 1;
}

- (BOOL)didUpdateStatus:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;

  v5 = (NSString *)a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009AFD4();
  objc_storeStrong((id *)&self->_lastStatus, a3);
  if (!v5)
    v5 = self->_defaultStatus;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &stru_1000E3608));
  objc_msgSend(v7, "doMCICDidUpdateStatus:completion:", v5, &stru_1000E3608);

  return 1;
}

- (BOOL)didBeginInstallingNextProfileData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009B054();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_1000E3628));
  objc_msgSend(v6, "doMCICDidBeginInstallingNextProfileData:completion:", v4, &stru_1000E3628);

  return 1;
}

- (BOOL)requestCurrentPasscodeOutPasscode:(id *)a3
{
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  int v11;
  BOOL v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
    sub_10009B0D4();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100019750;
  v24 = sub_100019760;
  v25 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001AAE4;
  v18[3] = &unk_1000E3500;
  v5 = dispatch_semaphore_create(0);
  v19 = v5;
  v6 = objc_retainBlock(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001ABC4;
  v14[3] = &unk_1000E3650;
  v16 = &v26;
  v17 = &v20;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v8, "doMCICDidRequestCurrentPasscodeWithCompletion:", v14);

  v10 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = *((unsigned __int8 *)v27 + 24);
  if (a3 && *((_BYTE *)v27 + 24))
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v11 = *((unsigned __int8 *)v27 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v12;
}

- (void)waitForEnrollmentToFinishWithPersonaID:(id)a3
{
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001AD2C;
  v11[3] = &unk_1000E3500;
  v4 = dispatch_semaphore_create(0);
  v12 = v4;
  v5 = objc_retainBlock(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInteractionClient xpcConnection](self, "xpcConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AE2C;
  v9[3] = &unk_1000E2C50;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "doMCICWaitForEnrollmentToFinishWithCompletion:", v9);

  dispatch_semaphore_wait(v8, 0x4E94914F0000uLL);
}

- (NSString)defaultStatus
{
  return self->_defaultStatus;
}

- (void)setDefaultStatus:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_defaultStatus, a3);
  if (!self->_lastStatus)
    -[MCInteractionClient didUpdateStatus:](self, "didUpdateStatus:", self->_defaultStatus);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_lastStatus, 0);
  objc_storeStrong((id *)&self->_defaultStatus, 0);
}

@end
