@implementation OTPairingSession

- (id)initAsInitiator:(BOOL)a3 deviceInfo:(id)a4 identifier:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  OTPairingSession *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id result;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)OTPairingSession;
  v10 = -[OTPairingSession init](&v25, "init");
  if (!v10)
    goto LABEL_8;
  v11 = objc_alloc_init((Class)KCPairingChannelContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
  objc_msgSend(v11, "setUniqueClientID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  objc_msgSend(v11, "setUniqueDeviceID:", v15);

  objc_msgSend(v11, "setIntent:", KCPairingIntent_Type_SilentRepair);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelID"));
  objc_msgSend(v11, "setModel:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "osVersion"));
  objc_msgSend(v11, "setOsVersion:", v17);

  if (v6)
  {
    if (!v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
      -[OTPairingSession setIdentifier:](v10, "setIdentifier:", v19);

      v20 = objc_claimAutoreleasedReturnValue(+[KCPairingChannel pairingChannelInitiator:](KCPairingChannel, "pairingChannelInitiator:", v11));
LABEL_7:
      v21 = (void *)v20;
      -[OTPairingSession setChannel:](v10, "setChannel:", v20);

LABEL_8:
      return v10;
    }
    v23 = _os_assert_log(0);
    _os_crash(v23);
    __break(1u);
  }
  else if (v9)
  {
    -[OTPairingSession setIdentifier:](v10, "setIdentifier:", v9);
    v20 = objc_claimAutoreleasedReturnValue(+[KCPairingChannel pairingChannelAcceptor:](KCPairingChannel, "pairingChannelAcceptor:", v11));
    goto LABEL_7;
  }
  v24 = _os_assert_log(0);
  result = (id)_os_crash(v24);
  __break(1u);
  return result;
}

- (void)dealloc
{
  __MKBAssertion *lockAssertion;
  objc_super v4;

  lockAssertion = self->_lockAssertion;
  if (lockAssertion)
  {
    CFRelease(lockAssertion);
    self->_lockAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OTPairingSession;
  -[OTPairingSession dealloc](&v4, "dealloc");
}

- (BOOL)acquireLockAssertion
{
  __MKBAssertion *lockAssertion;
  void *v4;
  __MKBAssertion *v5;
  const void *v6;
  BOOL v7;
  const void *v9;
  uint8_t buf[4];
  const void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  lockAssertion = self->_lockAssertion;
  if (!lockAssertion)
  {
    v9 = 0;
    v12[0] = CFSTR("MKBAssertionKey");
    v12[1] = CFSTR("MKBAssertionTimeout");
    v13[0] = CFSTR("Other");
    v13[1] = &off_10000C988;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
    v5 = (__MKBAssertion *)MKBDeviceLockAssertion(v4, &v9);
    self->_lockAssertion = v5;
    v6 = v9;
    if (v5)
      v7 = v9 == 0;
    else
      v7 = 0;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to obtain lock assertion: %@", buf, 0xCu);
        v6 = v9;
      }
      if (v6)
        CFRelease(v6);
    }

    lockAssertion = self->_lockAssertion;
  }
  return lockAssertion != 0;
}

- (void)addCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingSession completionHandlers](self, "completionHandlers"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    -[OTPairingSession setCompletionHandlers:](self, "setCompletionHandlers:", v6);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[OTPairingSession completionHandlers](self, "completionHandlers"));
  v7 = objc_retainBlock(v4);

  objc_msgSend(v8, "addObject:", v7);
}

- (void)didCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingSession completionHandlers](self, "completionHandlers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) + 16))();
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OTPairingPacketContext)packet
{
  return (OTPairingPacketContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPacket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KCPairingChannel)channel
{
  return (KCPairingChannel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)sentMessageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSentMessageIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (__MKBAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(__MKBAssertion *)a3
{
  self->_lockAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_sentMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_packet, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
