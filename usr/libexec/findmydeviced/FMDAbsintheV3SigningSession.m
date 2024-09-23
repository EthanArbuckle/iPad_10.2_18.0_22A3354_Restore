@implementation FMDAbsintheV3SigningSession

- (FMDAbsintheV3SigningSession)init
{
  FMDAbsintheV3SigningSession *v2;
  FMDAbsintheV3SigningSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDAbsintheV3SigningSession;
  v2 = -[FMDAbsintheV3SigningSession init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMDAbsintheV3SigningSession setMode:](v2, "setMode:", 0);
  return v3;
}

- (void)establishSessionWithServerInteractionController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _BOOL8 v19;
  FMDRequestIdentityV3Session *v20;
  void *v21;
  FMDRequestIdentityV3Session *v22;
  void *v23;
  id v24;
  unsigned int v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  FMDAbsintheV3SigningSession *v30;
  id v31;
  unsigned int v32;
  uint64_t v33;
  uint8_t buf[8];
  const __CFString *v35;
  void *v36;

  v4 = a3;
  -[FMDAbsintheV3SigningSession _destroySession](self, "_destroySession");
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initializing session...", buf, 2u);
  }

  v7 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("createSessionForSignature"), -1.0);
  v33 = 0;
  *(_QWORD *)buf = 0;
  v32 = 0;
  -[FMDAbsintheV3SigningSession setPscError:](self, "setPscError:", 0);
  v8 = sub_100218414((uint64_t)buf, (uint64_t)&v33, (uint64_t)&v32);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_100227D64(v9, v11);

    v35 = CFSTR("kFMDUnderlyingErrorCodeKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
    v36 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDAbsintheV3SigningSessionErrorDomain"), 1, v13));
    -[FMDAbsintheV3SigningSession setPscError:](self, "setPscError:", v14);

    v15 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v33, v32));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 0));
    -[FMDAbsintheV3SigningSession setPscSessionRef:](self, "setPscSessionRef:", *(_QWORD *)buf);
    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100227CF4(self);

    sub_1000E9BBC(v33);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v19 = -[FMDAbsintheV3SigningSession mode](self, "mode") == 0;
  v20 = [FMDRequestIdentityV3Session alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningSession activationLockRequestUUID](self, "activationLockRequestUUID"));
  v22 = -[FMDRequestIdentityV3Session initWithProvider:activationLockRequestUUID:pscHelloMsg:](v20, "initWithProvider:activationLockRequestUUID:pscHelloMsg:", v18, v21, v15);

  -[FMDRequestIdentityV3Session setRequiresAuthentication:](v22, "setRequiresAuthentication:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningSession cause](self, "cause"));
  -[FMDRequestIdentityV3Session setCause:](v22, "setCause:", v23);

  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10003C600;
  v29 = &unk_1002C2D30;
  v30 = self;
  v24 = v7;
  v31 = v24;
  -[FMDRequest setCompletionHandler:](v22, "setCompletionHandler:", &v26);
  v25 = objc_msgSend(v4, "enqueueRequest:", v22, v26, v27, v28, v29, v30);

  if (v25)
    objc_msgSend(v24, "wait");

}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  PSCSessionInternal_ *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  _QWORD v35[2];
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;

  v6 = a3;
  if (!-[FMDAbsintheV3SigningSession pscSessionRef](self, "pscSessionRef"))
  {
    v24 = 0;
    v25 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_12;
  }
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64EncodedStringWithOptions:", 4));
    *(_DWORD *)buf = 138412290;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAbsintheV3SigningSession digest to sign : %@", buf, 0xCu);

  }
  v10 = -[FMDAbsintheV3SigningSession pscSessionRef](self, "pscSessionRef");
  v11 = objc_retainAutorelease(v6);
  v12 = sub_1001F9FDC((uint64_t)v10, (uint64_t)objc_msgSend(v11, "bytes"), (int)objc_msgSend(v11, "length"), (uint64_t)&v34, (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31);
  if ((_DWORD)v12)
  {
    v13 = v12;
    v14 = sub_1000031B8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_100228128(v13, v15, v16, v17, v18, v19, v20, v21);

    v36 = CFSTR("kFMDUnderlyingErrorCodeKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
    v37 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDAbsintheV3SigningSessionErrorDomain"), 3, v23));
    v25 = 0;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v34, v33));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32, v31));
    v35[0] = v22;
    v35[1] = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
    v24 = 0;
  }

  -[FMDAbsintheV3SigningSession _destroySession](self, "_destroySession");
  if (a4)
  {
LABEL_12:
    v26 = objc_claimAutoreleasedReturnValue(-[FMDAbsintheV3SigningSession pscError](self, "pscError"));
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v24;
    v29 = v28;

    v24 = objc_retainAutorelease(v29);
    *a4 = v24;
  }
LABEL_16:

  return v25;
}

- (void)_destroySession
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022818C();

  if (-[FMDAbsintheV3SigningSession pscSessionRef](self, "pscSessionRef"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AbsinthV3 invalidting psc session", v7, 2u);
    }

    sub_1001F9F28((uint64_t)-[FMDAbsintheV3SigningSession pscSessionRef](self, "pscSessionRef"));
    -[FMDAbsintheV3SigningSession setPscSessionRef:](self, "setPscSessionRef:", 0);
  }
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockRequestUUID, a3);
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_storeStrong((id *)&self->_cause, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PSCSessionInternal_)pscSessionRef
{
  return self->_pscSessionRef;
}

- (void)setPscSessionRef:(PSCSessionInternal_ *)a3
{
  self->_pscSessionRef = a3;
}

- (NSError)pscError
{
  return self->_pscError;
}

- (void)setPscError:(id)a3
{
  objc_storeStrong((id *)&self->_pscError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pscError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
}

@end
