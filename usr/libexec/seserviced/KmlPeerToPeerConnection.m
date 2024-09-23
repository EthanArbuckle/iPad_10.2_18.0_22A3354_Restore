@implementation KmlPeerToPeerConnection

- (void)dealloc
{
  IDSService *idsService;
  objc_super v4;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  idsService = self->_idsService;
  self->_idsService = 0;

  -[NWPathEvaluator removeObserver:forKeyPath:](self->_pathEvaluator, "removeObserver:forKeyPath:", self, CFSTR("path"));
  v4.receiver = self;
  v4.super_class = (Class)KmlPeerToPeerConnection;
  -[KmlPeerToPeerConnection dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *p2pConnectionQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  KmlPeerToPeerConnection *v12;

  v7 = a3;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10026AD28;
  v10[3] = &unk_100304370;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_async(p2pConnectionQueue, v10);

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *p2pConnectionQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  KmlPeerToPeerConnection *v21;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10026C164;
  v17[3] = &unk_10030EED8;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v21 = self;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(p2pConnectionQueue, v17);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *p2pConnectionQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10026C2C0;
  v17[3] = &unk_10030EED8;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(p2pConnectionQueue, v17);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  id v11;
  NSObject *p2pConnectionQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  KmlPeerToPeerConnection *v17;
  id v18;
  BOOL v19;

  v10 = a5;
  v11 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10026C508;
  v15[3] = &unk_10030EE10;
  v19 = a6;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(p2pConnectionQueue, v15);

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  NSObject *p2pConnectionQueue;
  _QWORD block[5];

  p2pConnectionQueue = self->_p2pConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026C634;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(p2pConnectionQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIDSId, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_remoteIdentifiersSet, 0);
  objc_storeStrong((id *)&self->_remoteAndOurIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sendUuidStringToIdentifiersMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_p2pConnectionQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
