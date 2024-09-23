@implementation SDAirDropListener

- (SDAirDropListener)init
{
  SDAirDropListener *v2;
  SDAirDropListener *v3;
  SDNetworkOperation *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropListener;
  v2 = -[SDAirDropListener init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;

  }
  return v3;
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  SDNetworkOperation *v17;
  SDNetworkOperation *v18;
  SDNetworkOperation *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  __int16 v27[8];

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "listener:informationDidChange:", self, v10);
LABEL_9:

    goto LABEL_16;
  }
  if (a4 == 10)
  {
    v21 = airdrop_log(v9);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "kSFOperationEventErrorOccurred", (uint8_t *)v27, 2u);
    }

    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationErrorKey));
    objc_msgSend(v23, "listener:didReceiveError:", self, v24);

    goto LABEL_13;
  }
  if (a4 != 1)
  {
LABEL_13:
    v25 = airdrop_log(v9);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000B8558(a4, (uint64_t)v10, v26);

    goto LABEL_16;
  }
  v11 = kSFOperationHTTPServerConnectionKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSFOperationHTTPServerConnectionKey));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));

    v15 = kSFOperationContactsOnlyKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationContactsOnlyKey));
    v17 = [SDNetworkOperation alloc];
    v18 = -[SDNetworkOperation initWithKind:](v17, "initWithKind:", kSFOperationKindReceiver);
    v19 = v18;
    if (v16)
      -[SDNetworkOperation setProperty:forKey:](v18, "setProperty:forKey:", v16, v15);
    -[SDNetworkOperation setProperty:forKey:](v19, "setProperty:forKey:", v12, v11);
    -[SDNetworkOperation setProperty:forKey:](v19, "setProperty:forKey:", WeakRetained, kSFOperationSessionIDKey);
    -[SDNetworkOperation setObjectKey:](v19, "setObjectKey:", WeakRetained);
    -[SDNetworkOperation resume](v19, "resume");
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "listener:didReceiveNewRequest:", self, v19);

    goto LABEL_9;
  }
LABEL_16:

}

- (void)start
{
  SDNetworkOperation *v3;
  SDNetworkOperation *v4;
  SDNetworkOperation *listener;

  if (!self->_listener)
  {
    v3 = [SDNetworkOperation alloc];
    v4 = -[SDNetworkOperation initWithKind:](v3, "initWithKind:", kSFOperationKindListener);
    listener = self->_listener;
    self->_listener = v4;

    -[SDNetworkOperation setDelegate:](self->_listener, "setDelegate:", self);
    -[SDNetworkOperation resume](self->_listener, "resume");
  }
}

- (void)stop
{
  SDNetworkOperation *listener;
  SDNetworkOperation *v4;

  listener = self->_listener;
  if (listener)
  {
    -[SDNetworkOperation setDelegate:](listener, "setDelegate:", 0);
    -[SDNetworkOperation invalidate](self->_listener, "invalidate");
    v4 = self->_listener;
    self->_listener = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SDAirDropListener stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropListener;
  -[SDAirDropListener dealloc](&v3, "dealloc");
}

- (NSString)description
{
  SDNetworkOperation *listener;
  void *v3;
  id v4;
  id v6;

  listener = self->_listener;
  if (!listener)
    return (NSString *)0;
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNetworkOperation description](listener, "description"));
  NSAppendPrintF(&v6, "%@\n", v3);
  v4 = v6;

  return (NSString *)v4;
}

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (SDAirDropListenerDelegate)delegate
{
  return (SDAirDropListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
