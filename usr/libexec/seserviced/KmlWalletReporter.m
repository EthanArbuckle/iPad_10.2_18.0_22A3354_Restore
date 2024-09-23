@implementation KmlWalletReporter

- (KmlWalletReporter)init
{
  KmlWalletReporter *v2;
  PKPaymentService *v3;
  PKPaymentService *service;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *reporterQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KmlWalletReporter;
  v2 = -[KmlWalletReporter init](&v10, "init");
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    service = v2->_service;
    v2->_service = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.sesd.kml.reporter", v6);
    reporterQueue = v2->_reporterQueue;
    v2->_reporterQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)dealloc
{
  PKPaymentService *service;
  objc_super v4;

  service = self->_service;
  self->_service = 0;

  v4.receiver = self;
  v4.super_class = (Class)KmlWalletReporter;
  -[KmlWalletReporter dealloc](&v4, "dealloc");
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *reporterQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100217520;
  block[3] = &unk_100304790;
  block[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(reporterQueue, block);

}

- (void)finishedSharingForKey:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  NSObject *reporterQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)PKAppletSubcredential), "initWithKeyInformation:", v5);

  reporterQueue = self->_reporterQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100217640;
  v9[3] = &unk_100304370;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(reporterQueue, v9);

}

- (void)reportUnusableInvitation:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *reporterQueue;
  id v9;
  _QWORD block[5];
  id v11;
  _BOOL8 v12;

  v6 = a3;
  v7 = objc_msgSend(a4, "code");
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021774C;
  block[3] = &unk_100304B20;
  block[4] = self;
  v11 = v6;
  v12 = v7 == (id)110;
  v9 = v6;
  dispatch_async(reporterQueue, block);

}

- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlWalletReporter requestAuthorizationForSharingInvitationIdentifier:]", 89, CFSTR("Not implemented"), v3, v4, v5, v6, v7);
}

- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *reporterQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  KmlWalletReporter *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  reporterQueue = self->_reporterQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002178A4;
  v15[3] = &unk_10030EED8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(reporterQueue, v15);

}

- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *reporterQueue;
  id v15;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init((Class)PKAppletSubcredentialSharingInvitationRequest);
  objc_msgSend(v13, "setSharingSessionIdentifier:", v10);
  objc_msgSend(v13, "setCredentialIdentifier:", v11);
  objc_msgSend(v13, "setSharedCredentialIdentifier:", v12);
  objc_msgSend(v13, "setDeviceType:", a6 != 2);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_reporterQueue);
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100217AB0;
  block[3] = &unk_10030EF28;
  block[4] = self;
  v18 = v13;
  v19 = &v20;
  v15 = v13;
  dispatch_sync(reporterQueue, block);
  LOBYTE(v13) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v13;
}

- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  NSObject *reporterQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "genericData"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asDictionary"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "additionalData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asDictionary"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("carKey"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "genericData"));
  v13 = (char *)objc_msgSend(v12, "messageType");

  if ((unint64_t)(v13 - 1) >= 7)
    v13 = 0;
  v14 = objc_msgSend(objc_alloc((Class)PKSharingGenericMessage), "initWithFormat:type:genericSharingDict:appleSharingDict:", 2, v13, v18, v9);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_reporterQueue);
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100217D04;
  block[3] = &unk_100304490;
  block[4] = self;
  v20 = v6;
  v21 = v14;
  v16 = v14;
  v17 = v6;
  dispatch_sync(reporterQueue, block);

}

- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4
{
  id v6;
  NSObject *reporterQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100217E08;
  block[3] = &unk_100304B20;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(reporterQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_reporterQueue, 0);
}

@end
