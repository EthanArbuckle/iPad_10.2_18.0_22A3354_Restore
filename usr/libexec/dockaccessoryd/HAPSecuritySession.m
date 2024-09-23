@implementation HAPSecuritySession

- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 enhancedEncryption:(BOOL)a5 delegate:(id)a6
{
  id v10;
  HAPSecuritySession *v11;
  HAPSecuritySession *v12;
  const char *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  HAPSecuritySessionEncryption *v18;
  HAPSecuritySessionEncryption *encryption;
  HAPSecuritySession *v20;
  HAPSecuritySession *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;

  v10 = a6;
  if (v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)HAPSecuritySession;
    v11 = -[HAPSecuritySession init](&v28, "init");
    v12 = v11;
    if (v11)
    {
      v13 = (const char *)sub_100015E90(v11, 0);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = dispatch_queue_create(v13, v15);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v16;

      objc_storeWeak((id *)&v12->_delegate, v10);
      v12->_role = a3;
      v18 = objc_alloc_init(HAPSecuritySessionEncryption);
      encryption = v12->_encryption;
      v12->_encryption = v18;

      v12->_enhancedEncryption = a5;
      -[HAPSecuritySession _initializeSetupSession:](v12, "_initializeSetupSession:", a4);
      v12->_state = 0;
    }
    v20 = v12;
    v21 = v20;
  }
  else
  {
    v20 = self;
    v23 = sub_10007CCE4((uint64_t)v20, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = sub_10007CD2C(v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);

    }
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  HAPSecuritySession *v2;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v4;
  objc_super v5;

  v2 = self;
  pairingSession = v2->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    v2->_pairingSession = 0;
  }
  v4 = objc_alloc_init(HAPSecuritySessionEncryption);
  -[HAPSecuritySession setEncryption:](v2, "setEncryption:", v4);

  v2->_resumeSessionID = 0;
  v5.receiver = v2;
  v5.super_class = (Class)HAPSecuritySession;
  -[HAPSecuritySession dealloc](&v5, "dealloc");
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSData)broadcastKey
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_broadcastKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBroadcastKey:(id)a3
{
  NSData *v4;
  NSData *broadcastKey;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  broadcastKey = self->_broadcastKey;
  self->_broadcastKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)additionalDerivedKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_additionalDerivedKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAdditionalDerivedKeys:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalDerivedKeys;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  additionalDerivedKeys = self->_additionalDerivedKeys;
  self->_additionalDerivedKeys = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)resumeSessionID
{
  os_unfair_lock_s *p_lock;
  unint64_t resumeSessionID;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  resumeSessionID = self->_resumeSessionID;
  os_unfair_lock_unlock(p_lock);
  return resumeSessionID;
}

- (void)setResumeSessionID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_resumeSessionID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isOpen
{
  return (id)-[HAPSecuritySession state](self, "state") == (id)2;
}

- (BOOL)isOpening
{
  return (id)-[HAPSecuritySession state](self, "state") == (id)1;
}

- (NSString)debugDescription
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;
  void *v9;

  v3 = objc_opt_class(self, a2);
  v4 = -[HAPSecuritySession role](self, "role");
  v5 = CFSTR("unknown");
  v6 = CFSTR("server");
  if (v4 != 1)
    v6 = CFSTR("unknown");
  if (!v4)
    v6 = CFSTR("client");
  v7 = v6;
  v8 = -[HAPSecuritySession state](self, "state");
  if (v8 <= 3)
    v5 = off_100237120[v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, Role = %@, State = %@>"), v3, self, v7, v5));

  return (NSString *)v9;
}

- (NSString)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;
  void *v9;

  v3 = objc_opt_class(self, a2);
  v4 = -[HAPSecuritySession role](self, "role");
  v5 = CFSTR("unknown");
  v6 = CFSTR("server");
  if (v4 != 1)
    v6 = CFSTR("unknown");
  if (!v4)
    v6 = CFSTR("client");
  v7 = v6;
  v8 = -[HAPSecuritySession state](self, "state");
  if (v8 <= 3)
    v5 = off_100237120[v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@, Role = %@, State = %@>"), v3, v7, v5));

  return (NSString *)v9;
}

- (BOOL)_initializeSetupSession:(unint64_t)a3
{
  HAPSecuritySession *v3;
  PairingSessionPrivate **p_pairingSession;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  HAPSecuritySession *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  HAPSecuritySession *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, void *, void *);
  uint64_t v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  unint64_t v34;

  v3 = self;
  v26 = 0;
  v29 = 0;
  v30 = 0u;
  v25 = 0u;
  v24 = self;
  v27 = 0x10003E000;
  v28 = sub_10003E268;
  if (a3)
  {
    p_pairingSession = &self->_pairingSession;
    v6 = -[HAPSecuritySession role](self, "role");
    v7 = v6 ? 4 * (v6 == 1) : 5;
    if (!PairingSessionCreate(&v3->_pairingSession, &v24, v7))
    {
      v3 = v3;
      v20 = sub_10007CCE4((uint64_t)v3, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = sub_10007CD2C(v3);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2048;
        v34 = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@Created pairing session with resumeSessionID: %llu", buf, 0x16u);

      }
      PairingSessionSetResumeInfo(*p_pairingSession, a3, 0, 0);
      goto LABEL_16;
    }
  }
  v8 = -[HAPSecuritySession role](v3, "role");
  if (v8)
    v9 = 4 * (v8 == (id)1);
  else
    v9 = 3;
  v10 = PairingSessionCreate(&v3->_pairingSession, &v24, v9);
  if (!v10)
  {
LABEL_16:
    PairingSessionSetFlags(-[HAPSecuritySession pairingSession](v3, "pairingSession"), 2);
    return 1;
  }
  v11 = v10;
  v12 = v3;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_10007CD2C(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    v33 = 2048;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);

  }
  return 0;
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  HAPSecuritySession *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  HAPSecuritySession *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  HAPSecuritySession *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;

  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = sub_10007CD2C(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Received request for local pairing identity", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v4, "delegate"));
  v11 = v10;
  if (v10)
  {
    v27 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "securitySession:didReceiveLocalPairingIdentityRequestWithError:", v4, &v27));
    v13 = v27;
    if (!v12)
    {
      v14 = v4;
      v16 = sub_10007CCE4((uint64_t)v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = sub_10007CD2C(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2112;
        v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retreive the lcoal pairing identity with error: %@", buf, 0x16u);

      }
      if (a3)
        *a3 = -6727;
      -[HAPSecuritySession closeWithError:](v14, "closeWithError:", v13);
    }
  }
  else
  {
    v20 = v4;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local pairing identity, the delegate is missing", buf, 0xCu);

    }
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to get local pairing identity."), CFSTR("The delegate is mising."), 0, 0));
    -[HAPSecuritySession closeWithError:](v20, "closeWithError:", v13);
    v12 = 0;
    if (a3)
      *a3 = -6705;
  }

  return v12;
}

- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4
{
  id v6;
  HAPSecuritySession *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  HAPSecuritySession *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  HAPSecuritySession *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    v33 = 2112;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Received request for peer pairing identity with identifier: %@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v7, "delegate"));
  v14 = v13;
  if (v13)
  {
    v30 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "securitySession:didReceiveRequestForPeerPairingIdentityWithIdentifier:error:", v7, v6, &v30));
    v16 = v30;
    if (!v15)
    {
      v17 = v7;
      v19 = sub_10007CCE4((uint64_t)v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_10007CD2C(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2112;
        v34 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retreive the peer pairing identity with error: %@", buf, 0x16u);

      }
      if (a4)
        *a4 = -6727;
      -[HAPSecuritySession closeWithError:](v17, "closeWithError:", v16);
    }
  }
  else
  {
    v23 = v7;
    v25 = sub_10007CCE4((uint64_t)v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = sub_10007CD2C(v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138543362;
      v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer pairing identity, the delegate is missing", buf, 0xCu);

    }
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to get peer pairing identity."), CFSTR("The delegate is mising."), 0, 0));
    -[HAPSecuritySession closeWithError:](v23, "closeWithError:", v16);
    v15 = 0;
    if (a4)
      *a4 = -6705;
  }

  return v15;
}

- (void)_initiateClientSessionSetupExchange
{
  HAPSecuritySession *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Sending initial client exchange", (uint8_t *)&v8, 0xCu);

  }
  -[HAPSecuritySession _notifyOpening](v2, "_notifyOpening");
  -[HAPSecuritySession _processSetupExchangeData:error:](v2, "_processSetupExchangeData:error:", 0, 0);
}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HAPSecuritySession *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EAC4;
  block[3] = &unk_100236EA8;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003ED28;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)_inputInfo
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = -[HAPSecuritySession role](self, "role");
  if (v2 == (void *)1)
  {
    v3 = "Control-Write-Encryption-Key";
    v4 = 28;
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = "Control-Read-Encryption-Key";
    v4 = 27;
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, v4));
  }
  return v2;
}

- (id)_outputInfo
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = -[HAPSecuritySession role](self, "role");
  if (v2 == (void *)1)
  {
    v3 = "Control-Read-Encryption-Key";
    v4 = 27;
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = "Control-Write-Encryption-Key";
    v4 = 28;
LABEL_5:
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, v4));
  }
  return v2;
}

- (id)_broadcastInfo
{
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "Broadcast-Encryption-Key", 24);
}

- (void)_handleSetupExchangeComplete
{
  HAPSecuritySession *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  PairingSessionPrivate *v9;
  id v10;
  int v11;
  id v12;
  HAPSecuritySession *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  PairingSessionPrivate *v20;
  int v21;
  void *v22;
  HAPSecuritySession *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  HAPSecuritySession *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  _UNKNOWN **v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v54;
  void *v55;
  void *v56;
  HAPSecuritySessionEncryption *v57;
  void *v58;
  id v59;
  id v60;
  PairingSessionPrivate *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  void *v65;
  int v66;
  uint8_t v67[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint8_t v71[4];
  void *v72;
  __int16 v73;
  id v74;
  uint8_t buf[4];
  void *v76;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    v76 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Deriving session keys", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession _inputInfo](v2, "_inputInfo"));
  v9 = -[HAPSecuritySession pairingSession](v2, "pairingSession");
  v10 = objc_retainAutorelease(v8);
  v11 = PairingSessionDeriveKey(v9, "Control-Salt", 12, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 32, buf);
  v66 = v11;
  if (v11)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v11, 0));
    v13 = v2;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)v71 = 138543618;
      v72 = v18;
      v73 = 2112;
      v74 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input key with error: %@", v71, 0x16u);

    }
    -[HAPSecuritySession _closeWithError:](v13, "_closeWithError:", v12);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession _outputInfo](v2, "_outputInfo"));
    v20 = -[HAPSecuritySession pairingSession](v2, "pairingSession");
    v12 = objc_retainAutorelease(v19);
    v21 = PairingSessionDeriveKey(v20, "Control-Salt", 12, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 32, v71);
    v66 = v21;
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v21, 0));
      v23 = v2;
      v25 = sub_10007CCE4((uint64_t)v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = sub_10007CD2C(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)v67 = 138543618;
        v68 = v28;
        v69 = 2112;
        v70 = v22;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create output key with error: %@", v67, 0x16u);

      }
      -[HAPSecuritySession _closeWithError:](v23, "_closeWithError:", v22);

    }
    else
    {
      v65 = 0;
      if (!PairingSessionGetResumeInfo(-[HAPSecuritySession pairingSession](v2, "pairingSession"), &v65))
      {
        v29 = v2;
        v31 = sub_10007CCE4((uint64_t)v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = sub_10007CD2C(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)v67 = 138543618;
          v68 = v34;
          v69 = 2048;
          v70 = v65;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%{public}@Got resumeSessionID: %llu", v67, 0x16u);

        }
        -[HAPSecuritySession setResumeSessionID:](v29, "setResumeSessionID:", v65);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession _broadcastInfo](v2, "_broadcastInfo"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession _handleLocalPairingIdentityRequestWithStatus:](v2, "_handleLocalPairingIdentityRequestWithStatus:", &v66));
      v37 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
      if (v66)
        goto LABEL_19;
      if (-[HAPSecuritySession pairingSession](v2, "pairingSession"))
      {
        v61 = -[HAPSecuritySession pairingSession](v2, "pairingSession");
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "publicKey"));
        v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "data")));
        v59 = objc_msgSend(v60, "bytes");
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "publicKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "data"));
        v40 = objc_msgSend(v39, "length");
        v41 = objc_retainAutorelease(v35);
        v42 = v36;
        v43 = v35;
        v44 = objc_msgSend(v41, "bytes");
        v45 = objc_msgSend(v41, "length");
        v46 = v44;
        v35 = v43;
        v36 = v42;
        v37 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
        v66 = PairingSessionDeriveKey(v61, v59, v40, v46, v45, 32, v67);

      }
      if (v66)
      {
LABEL_19:
        -[HAPSecuritySession setBroadcastKey:](v2, "setBroadcastKey:", 0);
      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[480], "dataWithBytes:length:", v67, 32));
        -[HAPSecuritySession setBroadcastKey:](v2, "setBroadcastKey:", v58);

      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v2, "delegate"));
      v48 = objc_opt_respondsToSelector(v47, "securitySessionDidRequestAdditionalDerivedKeyTuples:");

      if ((v48 & 1) != 0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v2, "delegate"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "securitySessionDidRequestAdditionalDerivedKeyTuples:", v2));

        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10003F83C;
        v63[3] = &unk_1002370B8;
        v63[4] = v2;
        v64 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v50, "count"));
        v51 = v64;
        objc_msgSend(v50, "enumerateObjectsUsingBlock:", v63);
        v52 = objc_msgSend(v51, "copy");
        -[HAPSecuritySession setAdditionalDerivedKeys:](v2, "setAdditionalDerivedKeys:", v52);

      }
      pairingSession = v2->_pairingSession;
      if (pairingSession)
        CFRelease(pairingSession);
      v2->_pairingSession = 0;
      v54 = [HAPSecuritySessionEncryption alloc];
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[480], "dataWithBytes:length:", buf, 32));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[480], "dataWithBytes:length:", v71, 32));
      v57 = -[HAPSecuritySessionEncryption initWithInputKey:outputKey:enhancedEncryption:](v54, "initWithInputKey:outputKey:enhancedEncryption:", v55, v56, v2->_enhancedEncryption);
      -[HAPSecuritySession setEncryption:](v2, "setEncryption:", v57);

      -[HAPSecuritySession setState:](v2, "setState:", 2);
      -[HAPSecuritySession _notifyOpened](v2, "_notifyOpened");

    }
  }

}

- (void)open
{
  HAPSecuritySession *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;

  if (-[HAPSecuritySession state](self, "state"))
  {
    v3 = self;
    v5 = sub_10007CCE4((uint64_t)v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_10007CD2C(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to open security session, a security session can only be opened once.", buf, 0xCu);

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));

    if (v9)
    {
      -[HAPSecuritySession setState:](self, "setState:", 1);
      -[HAPSecuritySession reallyOpen](self, "reallyOpen");
    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0));
      -[HAPSecuritySession closeWithError:](self, "closeWithError:");

    }
  }
}

- (void)reallyOpen
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FC3C;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyOpening
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "securitySessionIsOpening:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
    objc_msgSend(v5, "securitySessionIsOpening:", self);

  }
}

- (void)_notifyOpened
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "securitySessionDidOpen:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
    objc_msgSend(v5, "securitySessionDidOpen:", self);

  }
}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FE10;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FEB4;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_closeWithError:(id)a3
{
  BOOL v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  HAPSecuritySession *v7;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (id)-[HAPSecuritySession state](self, "state") == (id)3;
  v5 = v12;
  if (!v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0);
    v7 = self;
    pairingSession = v7->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      v7->_pairingSession = 0;
    }
    v9 = objc_alloc_init(HAPSecuritySessionEncryption);
    -[HAPSecuritySession setEncryption:](v7, "setEncryption:", v9);

    v7->_resumeSessionID = 0;
    os_unfair_lock_unlock(p_lock);
    -[HAPSecuritySession setState:](v7, "setState:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v7, "delegate"));
    LOBYTE(v9) = objc_opt_respondsToSelector(v10, "securitySession:didCloseWithError:");

    v5 = v12;
    if ((v9 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](v7, "delegate"));
      objc_msgSend(v11, "securitySession:didCloseWithError:", v7, v12);

      v5 = v12;
    }
  }

}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_100040164;
    v22 = sub_100040174;
    v23 = 0;
    v10 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004017C;
    block[3] = &unk_1002370E0;
    v16 = &v18;
    v17 = a5;
    block[4] = self;
    v14 = v8;
    v15 = v9;
    dispatch_sync(v10, block);

    v11 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v11 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0));
  }

  return v11;
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HAPSecuritySession *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v21;
  id v22;
  _BYTE *v23;
  id *v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0));
      goto LABEL_9;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v8, "length") > 0xF)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = sub_100040164;
    v27 = sub_100040174;
    v28 = 0;
    v18 = objc_claimAutoreleasedReturnValue(-[HAPSecuritySession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000404B0;
    block[3] = &unk_1002370E0;
    v23 = buf;
    v24 = a5;
    block[4] = self;
    v21 = v8;
    v22 = v9;
    dispatch_sync(v18, block);

    v17 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  v10 = self;
  v12 = sub_10007CCE4((uint64_t)v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = sub_10007CD2C(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v8, "length");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@The encrypted data has an invalid length of %tu bytes", buf, 0x16u);

  }
  if (!a5)
    goto LABEL_11;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6743, 0));
LABEL_9:
  v17 = 0;
  *a5 = v16;
LABEL_12:

  return v17;
}

+ (id)logCategory
{
  if (qword_100271698 != -1)
    dispatch_once(&qword_100271698, &stru_100237100);
  return (id)qword_1002716A0;
}

- (id)logIdentifier
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shortDescription");

  v6 = objc_opt_class(self, v5);
  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSecuritySession delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v8));

  }
  else
  {
    v10 = -[HAPSecuritySession state](self, "state");
    if (v10 > 3)
      v11 = CFSTR("unknown");
    else
      v11 = off_100237120[v10];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v11));
  }
  return v9;
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (HAPSecuritySessionDelegate)delegate
{
  return (HAPSecuritySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(PairingSessionPrivate *)a3
{
  self->_pairingSession = a3;
}

- (HAPSecuritySessionEncryption)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_encryption, a3);
}

- (BOOL)enhancedEncryption
{
  return self->_enhancedEncryption;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_enhancedEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDerivedKeys, 0);
  objc_storeStrong((id *)&self->_broadcastKey, 0);
}

@end
