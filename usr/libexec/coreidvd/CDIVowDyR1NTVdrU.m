@implementation CDIVowDyR1NTVdrU

+ (id)sharedInstance
{
  if (qword_100670058 != -1)
    dispatch_once(&qword_100670058, &stru_10061A580);
  return (id)qword_100670050;
}

- (CDIVowDyR1NTVdrU)initWithServiceName:(id)a3
{
  id v4;
  CDIVowDyR1NTVdrU *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *disconnectionCallbacks;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  NSXPCConnection *v10;
  NSXPCConnection *connection;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDIVowDyR1NTVdrU;
  v5 = -[CDIVowDyR1NTVdrU init](&v20, "init");
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    v10 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", v4, 4096);
    connection = v5->_connection;
    v5->_connection = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NNHzG8lq6aMxZpXq));
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, v5);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1004FFBD8;
    v17 = &unk_10061A5A8;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", &v14);
    -[NSXPCConnection resume](v5->_connection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A5E8));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1004FFDB0;
  v21[3] = &unk_10061A610;
  v9 = v7;
  v22 = v9;
  v10 = objc_retainBlock(v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v10));
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004FFDC8;
  v16[3] = &unk_10061A638;
  objc_copyWeak(&v19, &location);
  v12 = v11;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v14 = objc_retainBlock(v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toDictionary"));
  objc_msgSend(v8, "k0p7Rchr49btq6wB:HY6FXG20397zwmVg:", v15, v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;
  _QWORD v32[4];
  id v33;

  v14 = a3;
  v26 = a4;
  v15 = a5;
  v25 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A658));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100500060;
  v32[3] = &unk_10061A610;
  v19 = v17;
  v33 = v19;
  v20 = objc_retainBlock(v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v20));
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100500074;
  v27[3] = &unk_10061A680;
  objc_copyWeak(&v30, &location);
  v22 = v21;
  v28 = v22;
  v23 = v19;
  v29 = v23;
  v24 = objc_retainBlock(v27);
  objc_msgSend(v18, "VE7BAlWGDSKrO5xc:hostChallenge:challengeResponse:seid:nonce:HY6FXG20397zwmVg:", v14, v26, v15, v25, v16, v24);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A6A0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100500284;
  v20[3] = &unk_10061A610;
  v9 = v7;
  v21 = v9;
  v10 = objc_retainBlock(v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v10));
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10050029C;
  v15[3] = &unk_10061A6C8;
  objc_copyWeak(&v18, &location);
  v12 = v11;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = objc_retainBlock(v15);
  objc_msgSend(v8, "f9MGfLOgnHPuKTrU:HY6FXG20397zwmVg:", v6, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A6E8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100500498;
  v17[3] = &unk_10061A610;
  v6 = v4;
  v18 = v6;
  v7 = objc_retainBlock(v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v7));
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005004AC;
  v12[3] = &unk_10061A680;
  objc_copyWeak(&v15, &location);
  v9 = v8;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  v11 = objc_retainBlock(v12);
  objc_msgSend(v5, "xs00laTiKIpDUzDP:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id location;
  _QWORD v42[4];
  id v43;

  v36 = a3;
  v20 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A708));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100500798;
  v42[3] = &unk_10061A610;
  v26 = v24;
  v43 = v26;
  v27 = objc_retainBlock(v42);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v27));
  objc_initWeak(&location, self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1005007B8;
  v37[3] = &unk_10061A730;
  objc_copyWeak(&v40, &location);
  v29 = v28;
  v38 = v29;
  v30 = v26;
  v39 = v30;
  v31 = objc_retainBlock(v37);
  objc_msgSend(v25, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v36, v20, v35, a9, a10, v21, v22, v23, v31);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_10061A750));
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005009DC;
  v15[3] = &unk_10061A610;
  v6 = v4;
  v16 = v6;
  v7 = objc_retainBlock(v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDIVowDyR1NTVdrU BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v7));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005009E8;
  v11[3] = &unk_10061A778;
  objc_copyWeak(&v14, &location);
  v9 = v8;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v5, "k4eQYhyzyebbQqys:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6
{
  char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v7 = kCoreASErrorDomainCA[0];
  v8 = a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  v12 = NSLocalizedDescriptionKey;
  v13 = CFSTR("Not implemented");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, -27006, v10));
  (*((void (**)(id, void *))a6 + 2))(v8, v11);

}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  char *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v5 = kCoreASErrorDomainCA[0];
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  v10 = NSLocalizedDescriptionKey;
  v11 = CFSTR("Not implemented");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, -27006, v8));
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v6, 0, v9);

}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v6 = kCoreASErrorDomainCA[0];
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
  v11 = NSLocalizedDescriptionKey;
  v12 = CFSTR("Not implemented");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, -27006, v9));
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v10);

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v8 = kCoreASErrorDomainCA[0];
  v9 = a7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  v13 = NSLocalizedDescriptionKey;
  v14 = CFSTR("Not implemented");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -27006, v11));
  (*((void (**)(id, void *))a7 + 2))(v9, v12);

}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *syncQueue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100500F58;
  block[3] = &unk_10061A7A0;
  block[4] = self;
  v15 = v4;
  v8 = v6;
  v14 = v8;
  v9 = v4;
  dispatch_sync(syncQueue, block);
  v10 = v14;
  v11 = v8;

  return v11;
}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100501054;
  block[3] = &unk_10061A7C8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (void)uTtwJoGUgL3N0GVz
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005010F8;
  block[3] = &unk_10061A7F0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
