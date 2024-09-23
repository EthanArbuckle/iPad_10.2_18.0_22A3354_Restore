@implementation KmlBluetoothPairingTransport

- (KmlBluetoothPairingTransport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KmlBluetoothPairingTransport;
  return -[KmlBluetoothPairingTransport init](&v3, "init");
}

- (KmlBluetoothPairingTransport)initWithDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  KmlBluetoothPairingTransport *v9;
  BluetoothHCEAndTransactionSession *btSession;
  NFSession *activeSession;
  NFSecureElementManagerSession *activeSeSession;
  NSError *errorToReport;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *btTransportQueue;
  NSTimer *endTransactionTimer;
  NSTimer *hceSessionTimer;
  NSString *transactionKeyId;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)KmlBluetoothPairingTransport;
  v9 = -[KmlBluetoothPairingTransport init](&v26, "init");
  if (v9)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlBluetoothPairingTransport initWithDelegate:]", 88, CFSTR("let's init"), v5, v6, v7, v8, (uint64_t)v26.receiver);
    -[KmlBluetoothPairingTransport setDelegate:](v9, "setDelegate:", v4);
    btSession = v9->_btSession;
    v9->_btSession = 0;

    activeSession = v9->_activeSession;
    v9->_activeSession = 0;

    activeSeSession = v9->_activeSeSession;
    v9->_activeSeSession = 0;

    errorToReport = v9->_errorToReport;
    v9->_errorToReport = 0;

    v9->_currentState = 0;
    v9->_lastState = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.sesd.kml.btTransport", v15);
    btTransportQueue = v9->_btTransportQueue;
    v9->_btTransportQueue = (OS_dispatch_queue *)v16;

    endTransactionTimer = v9->_endTransactionTimer;
    v9->_endTransactionTimer = 0;

    hceSessionTimer = v9->_hceSessionTimer;
    v9->_hceSessionTimer = 0;

    v9->_hceTimeoutRequested = 0;
    transactionKeyId = v9->_transactionKeyId;
    v9->_transactionKeyId = 0;

    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlBluetoothPairingTransport initWithDelegate:]", 106, CFSTR("ready to roll"), v21, v22, v23, v24, (uint64_t)v26.receiver);
  }

  return v9;
}

- (void)startSession
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025C654;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)startSessionWithTimeout
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025C834;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)endSession
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025C8A0;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)pauseSession
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025CAD0;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)resumeSessionWithTimeout
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025CD24;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)startTransactionForKeyWithIdentifier:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025CF38;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (void)endTransaction
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025D198;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)readApdu
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025D234;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)sendApdu:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025D2D4;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (void)reset
{
  NSObject *btTransportQueue;
  _QWORD block[5];

  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025D378;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)pairingEndedWithResult:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlBluetoothPairingTransport *v9;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025D4D0;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (id)getSecureElementSession
{
  return self->_activeSeSession;
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlBluetoothPairingTransport *v9;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025E288;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (void)btHceSessionHandleApdu:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025E4A4;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (void)btTxnSessionDidStartTransaction:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *btTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlBluetoothPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E590;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(btTransportQueue, block);

}

- (void)btTxnSessionDidEndTransaction:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *btTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlBluetoothPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E750;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(btTransportQueue, block);

}

- (void)btHceTxnSessionDidStartEmulation:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *btTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlBluetoothPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E91C;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(btTransportQueue, block);

}

- (void)btHceTxnSessionDidStopEmulation:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *btTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlBluetoothPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025EB60;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(btTransportQueue, block);

}

- (void)btHceTxnSessionDidEndUnexpectedly:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *btTransportQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  KmlBluetoothPairingTransport *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025ED58;
  block[3] = &unk_100304490;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(btTransportQueue, block);

}

- (void)btHceTxnSessionRadioIsDisabled:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlBluetoothPairingTransport *v9;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025EEE0;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

}

- (void)btHceTxnSessionUwbUnavailable:(id)a3
{
  id v4;
  NSObject *btTransportQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlBluetoothPairingTransport *v9;

  v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025F0FC;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(btTransportQueue, v7);

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
  objc_storeStrong((id *)&self->_btTransportQueue, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_activeSeSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_btSession, 0);
}

@end
