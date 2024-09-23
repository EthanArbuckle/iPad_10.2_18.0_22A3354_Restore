@implementation KmlOwnerPairingManager

- (KmlOwnerPairingManager)init
{
  char *v2;
  KmlOwnerPairingManager *v3;
  uint64_t v4;
  KmlVersions *opVersionInformation;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *opManagerQueue;
  KmlOwnerPairingManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)KmlOwnerPairingManager;
  v2 = -[KmlOwnerPairingManager init](&v12, "init");
  v3 = (KmlOwnerPairingManager *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 26) = 0;
    v2[136] = 1;
    *((_WORD *)v2 + 92) = 0;
    *(_WORD *)(v2 + 137) = 0;
    *((_QWORD *)v2 + 20) = 0;
    *((_QWORD *)v2 + 21) = 0;
    v4 = sub_10021804C((uint64_t)[KmlVersions alloc], 0);
    opVersionInformation = v3->_opVersionInformation;
    v3->_opVersionInformation = (KmlVersions *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.sesd.kml.ownerPairing", v7);
    opManagerQueue = v3->_opManagerQueue;
    v3->_opManagerQueue = (OS_dispatch_queue *)v8;

    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  OS_dispatch_queue *opManagerQueue;
  KmlSeManager *seManager;
  KmlDataExchangeManager *dxManager;
  objc_super v6;

  objc_storeWeak((id *)&self->_opDelegate, 0);
  opManagerQueue = self->_opManagerQueue;
  self->_opManagerQueue = 0;

  sub_1002299C0((id *)&self->_seManager->super.isa, 0);
  seManager = self->_seManager;
  self->_seManager = 0;

  sub_100217264((id *)&self->_dxManager->super.isa, 0);
  dxManager = self->_dxManager;
  self->_dxManager = 0;

  v6.receiver = self;
  v6.super_class = (Class)KmlOwnerPairingManager;
  -[KmlOwnerPairingManager dealloc](&v6, "dealloc");
}

- (void)handleRemoteConfigurationReceived
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  uint64_t v9;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleRemoteConfigurationReceived]", 735, CFSTR("OPManager: Remote reader Configuration received"), v2, v3, v4, v5, v9);
  v7 = KmlSignpostLogger();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpCarConfigRx", "end success", (uint8_t *)&v9, 2u);
  }

  sub_100222DF4((uint64_t)self, 12);
}

- (void)handleKeysExchangeDoneWaitForMailboxes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  uint64_t v9;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleKeysExchangeDoneWaitForMailboxes]", 743, CFSTR("OPManager: Waiting to finalize Owner Pairing"), v2, v3, v4, v5, v9);
  v7 = KmlSignpostLogger();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpKeyExchange", "end success", (uint8_t *)&v9, 2u);
  }

  sub_100222DF4((uint64_t)self, 21);
}

- (void)handlePairingTransportSessionFailedWithError:(id)a3
{
  id v4;
  NSObject *opManagerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002259DC;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(opManagerQueue, v7);

}

- (void)handleMailboxConfigurationDone
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  uint64_t v9;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleMailboxConfigurationDone]", 764, CFSTR("OPManager: Mailboxes configured"), v2, v3, v4, v5, v9);
  v7 = KmlSignpostLogger();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpMailboxWriteTxn", "end success", (uint8_t *)&v9, 2u);
  }

  sub_100222DF4((uint64_t)self, 22);
}

- (void)handleOwnerPairingCancellationWithResult:(BOOL)a3
{
  NSObject *opManagerQueue;
  _QWORD v4[5];
  BOOL v5;

  opManagerQueue = self->_opManagerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100225B64;
  v4[3] = &unk_100304DB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(opManagerQueue, v4);
}

- (void)handleFirstPostPairingTransactionEndResult:(id)a3
{
  id v4;
  NSObject *opManagerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100225DD8;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(opManagerQueue, v7);

}

- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  NSObject *opManagerQueue;
  id v8;
  _QWORD block[4];
  id v10;
  KmlOwnerPairingManager *v11;
  unint64_t v12;

  v6 = a4;
  opManagerQueue = self->_opManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100226084;
  block[3] = &unk_100304B20;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(opManagerQueue, block);

}

- (void)handlePairingDidStart
{
  NSObject *opManagerQueue;
  _QWORD block[5];

  opManagerQueue = self->_opManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022615C;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(opManagerQueue, block);
}

- (void)handleKeyCreationCompletionResult:(id)a3
{
  id v4;
  NSObject *opManagerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  KmlOwnerPairingManager *v9;

  v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100226230;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(opManagerQueue, v7);

}

- (void)handleKeyCreationCancellationResult:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    v7 = CFSTR("OPManager: Key creation cancelled sucessfully");
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 880;
  }
  else
  {
    v7 = CFSTR("OPManager: Key creation couldn't be cancelled. Delete the key if required");
    v8 = OS_LOG_TYPE_INFO;
    v9 = 882;
  }
  KmlLogFunc2(v8, (uint64_t)"-[KmlOwnerPairingManager handleKeyCreationCancellationResult:]", v9, v7, v3, v4, v5, v6, v10);
}

- (void)handleEncryptionResult:(id)a3 trackingRequest:(id)a4 keyInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *opManagerQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  opManagerQueue = self->_opManagerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100226624;
  v15[3] = &unk_10030EED8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(opManagerQueue, v15);

}

- (void)handlePreWarmResult:(id)a3
{
  id v4;
  NSObject *opManagerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100226770;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(opManagerQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifierStr, 0);
  objc_destroyWeak((id *)&self->_opDelegate);
  objc_storeStrong((id *)&self->_dckConfig, 0);
  objc_storeStrong((id *)&self->_opVersionInformation, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_opManagerQueue, 0);
  objc_storeStrong((id *)&self->_ownerPairingError, 0);
  objc_storeStrong((id *)&self->_keyTrackingReceipt, 0);
  objc_storeStrong((id *)&self->_keyTrackingRequest, 0);
  objc_storeStrong((id *)&self->_keyInformation, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_localKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_instanceAttestation, 0);
  objc_storeStrong((id *)&self->_deviceCertificate, 0);
  objc_storeStrong((id *)&self->_ownerKeyConfig, 0);
  objc_storeStrong((id *)&self->_seManager, 0);
  objc_storeStrong((id *)&self->_dxManager, 0);
}

@end
