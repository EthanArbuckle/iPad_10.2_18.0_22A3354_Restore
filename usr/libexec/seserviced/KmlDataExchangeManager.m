@implementation KmlDataExchangeManager

- (KmlDataExchangeManager)init
{
  return (KmlDataExchangeManager *)sub_100214568((void **)&self->super.isa, 0, 0, (void *)1, 0);
}

- (void)handleSessionStartResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dxManagerQueue;
  id v10;
  uint64_t v11[5];
  id v12;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionStartResult:]", 624, CFSTR("Received session start result"), v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_10021644C;
  v11[3] = (uint64_t)&unk_100304370;
  v11[4] = (uint64_t)self;
  v12 = v4;
  v10 = v4;
  dispatch_async(dxManagerQueue, v11);

}

- (void)handleSessionResumeResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dxManagerQueue;
  id v10;
  uint64_t v11[5];
  id v12;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionResumeResult:]", 646, CFSTR("Received session resume result."), v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_1002166C8;
  v11[3] = (uint64_t)&unk_100304370;
  v11[4] = (uint64_t)self;
  v12 = v4;
  v10 = v4;
  dispatch_async(dxManagerQueue, v11);

}

- (void)handleSessionPauseResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dxManagerQueue;
  id v10;
  uint64_t v11[4];
  id v12;
  KmlDataExchangeManager *v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionPauseResult:]", 671, CFSTR("Received session pause result."), v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_100216970;
  v11[3] = (uint64_t)&unk_100304370;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(dxManagerQueue, v11);

}

- (void)handleSessionEndResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dxManagerQueue;
  id v10;
  uint64_t v11[4];
  id v12;
  KmlDataExchangeManager *v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionEndResult:]", 694, CFSTR("Received session end result."), v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_100216BF4;
  v11[3] = (uint64_t)&unk_100304370;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(dxManagerQueue, v11);

}

- (void)handleTransactionStartResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dxManagerQueue;
  id v10;
  _QWORD block[4];
  id v12;
  KmlDataExchangeManager *v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleTransactionStartResult:]", 717, CFSTR("Received transaction session start result: %@"), v5, v6, v7, v8, (uint64_t)v4);
  dxManagerQueue = self->_dxManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100216E50;
  block[3] = &unk_100304370;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(dxManagerQueue, block);

}

- (void)handleTransactionEndResult:(id)a3
{
  id v4;
  NSObject *dxManagerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dxManagerQueue = self->_dxManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100216F24;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dxManagerQueue, v7);

}

- (void)handleIncomingApdu:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *dxManagerQueue;
  id v12;
  uint64_t v13[5];
  id v14;

  v10 = a3;
  if (a4)
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleIncomingApdu:error:]", 758, CFSTR("Currently we don't do anything on error while reading APDU's."), v6, v7, v8, v9, v13[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = (uint64_t)sub_100217258;
  v13[3] = (uint64_t)&unk_100304370;
  v13[4] = (uint64_t)self;
  v14 = v10;
  v12 = v10;
  dispatch_async(dxManagerQueue, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermSharedSecret, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pairingTransport, 0);
  objc_storeStrong((id *)&self->_dxVersionInformation, 0);
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_dxManagerQueue, 0);
  objc_storeStrong((id *)&self->_opaqueAttestation, 0);
  objc_storeStrong((id *)&self->_dxmError, 0);
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_storeStrong((id *)&self->_secureChannel, 0);
}

@end
