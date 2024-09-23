@implementation KmlSharingTransport

- (KmlSharingTransport)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  KmlSharingTransport *v6;
  uint64_t v7;
  NSMutableDictionary *sharingIdToDelegateMap;
  uint64_t v9;
  NSMutableSet *checkConnectionClientSet;
  id v11;
  uint64_t v12;
  KmlPeerToPeerConnection *connection;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *keyTransportQueue;
  id v18;
  uint64_t v19;
  KmlSharingManager *sharingManager;
  id crossPlatformTestMessageHandler;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)KmlSharingTransport;
  v6 = -[KmlSharingTransport init](&v27, "init");
  if (v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSharingTransport init]", 78, CFSTR("KSTransport: let's init"), v2, v3, v4, v5, (uint64_t)v27.receiver);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sharingIdToDelegateMap = v6->_sharingIdToDelegateMap;
    v6->_sharingIdToDelegateMap = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    checkConnectionClientSet = v6->_checkConnectionClientSet;
    v6->_checkConnectionClientSet = (NSMutableSet *)v9;

    v11 = sub_10026A980((uint64_t)KmlPeerToPeerConnection, v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    connection = v6->_connection;
    v6->_connection = (KmlPeerToPeerConnection *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.sesd.kml.keyShareTransport", v15);
    keyTransportQueue = v6->_keyTransportQueue;
    v6->_keyTransportQueue = (OS_dispatch_queue *)v16;

    v18 = sub_10023E06C((uint64_t)KmlSharingManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    sharingManager = v6->_sharingManager;
    v6->_sharingManager = (KmlSharingManager *)v19;

    crossPlatformTestMessageHandler = v6->_crossPlatformTestMessageHandler;
    v6->_crossPlatformTestMessageHandler = 0;

    sub_100234474((uint64_t)v6);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSharingTransport init]", 87, CFSTR("KSTransport: ready to roll"), v22, v23, v24, v25, (uint64_t)v27.receiver);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary removeAllObjects](self->_sharingIdToDelegateMap, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)KmlSharingTransport;
  -[KmlSharingTransport dealloc](&v3, "dealloc");
}

- (void)handleConnectionSetupResult:(id)a3
{
  id v4;
  NSObject *keyTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  keyTransportQueue = self->_keyTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100235270;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(keyTransportQueue, v7);

}

- (void)handleSendMessageResult:(id)a3 forMessageIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *keyTransportQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100235450;
  block[3] = &unk_100304490;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(keyTransportQueue, block);

}

- (void)handleIncomingTestData:(id)a3 fromRemoteIdsIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *keyTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlSharingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100235540;
  block[3] = &unk_100304490;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(keyTransportQueue, block);

}

- (void)handleIncomingMessage:(id)a3 fromRemoteIdsIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *keyTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  KmlSharingTransport *v14;

  v6 = a3;
  v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100235674;
  block[3] = &unk_100304490;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(keyTransportQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_crossPlatformTestMessageHandler, 0);
  objc_storeStrong((id *)&self->_keyTransportQueue, 0);
  objc_storeStrong((id *)&self->_checkConnectionClientSet, 0);
  objc_storeStrong((id *)&self->_sharingIdToDelegateMap, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
