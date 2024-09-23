@implementation KmlNfcPairingTransport

- (KmlNfcPairingTransport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KmlNfcPairingTransport;
  return -[KmlNfcPairingTransport init](&v3, "init");
}

- (void)startSession
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021A8A8;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)startSessionWithTimeout
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021AA88;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)endSession
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021AAF4;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)pauseSession
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021AD24;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)resumeSessionWithTimeout
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021AF78;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)startTransactionForKeyWithIdentifier:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021B18C;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (void)endTransaction
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021B3CC;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)readApdu
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021B464;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)sendApdu:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021B6A8;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (void)reset
{
  NSObject *nfcTransportQueue;
  _QWORD block[5];

  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021B74C;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)pairingEndedWithResult:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlNfcPairingTransport pairingEndedWithResult:]", 200, CFSTR("No op for NFC transport"), v3, v4, v5, v6, v7);
}

- (id)getSecureElementSession
{
  return self->_activeSeHceSession;
}

- (void)hceSessionDidConnect:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlNfcPairingTransport *v9;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021CD1C;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (void)hceSessionDidDisconnect:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlNfcPairingTransport *v9;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021CFBC;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (void)hceSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlNfcPairingTransport *v9;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021D0C4;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4
{
  id v6;
  id v7;
  NSObject *nfcTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlNfcPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D30C;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(nfcTransportQueue, block);

}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  NSObject *nfcTransportQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  KmlNfcPairingTransport *v10;

  v5 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021D400;
  v8[3] = &unk_100304370;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(nfcTransportQueue, v8);

}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *nfcTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlNfcPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D504;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(nfcTransportQueue, block);

}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  NSObject *nfcTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlNfcPairingTransport *v9;

  v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021D718;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(nfcTransportQueue, v7);

}

- (KmlPairingTransportDelegate)delegate
{
  return (KmlPairingTransportDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unsigned)stepForAnalytics
{
  return self->_lastState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_transactionKeyId, 0);
  objc_storeStrong((id *)&self->_hceSessionTimer, 0);
  objc_storeStrong((id *)&self->_endTransactionTimer, 0);
  objc_storeStrong((id *)&self->_nfcTransportQueue, 0);
  objc_storeStrong((id *)&self->_readApduQueue, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_activeLoyaltyPaymentSession, 0);
  objc_storeStrong((id *)&self->_activeSeHceSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_opNFManager, 0);
}

@end
