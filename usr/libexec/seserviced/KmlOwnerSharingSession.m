@implementation KmlOwnerSharingSession

- (void)dealloc
{
  OS_dispatch_queue *sessionQueue;
  KmlSharingTransport *ksTransport;
  objc_super v5;

  objc_storeWeak((id *)&self->_sessionDelegate, 0);
  sessionQueue = self->_sessionQueue;
  self->_sessionQueue = 0;

  ksTransport = self->_ksTransport;
  self->_ksTransport = 0;

  objc_storeWeak((id *)&self->_reporterDelegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)KmlOwnerSharingSession;
  -[KmlOwnerSharingSession dealloc](&v5, "dealloc");
}

- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *sessionQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  sessionQueue = self->_sessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020D640;
  block[3] = &unk_10030ED68;
  block[4] = self;
  v27 = v15;
  v31 = v16;
  v32 = a8;
  v28 = v18;
  v29 = v19;
  v30 = v17;
  v21 = v16;
  v22 = v17;
  v23 = v19;
  v24 = v18;
  v25 = v15;
  dispatch_async(sessionQueue, block);

}

- (void)handleTransportSetupResult:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020DED8;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

- (void)handleSendMessageResult:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020E04C;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sessionQueue = self->_sessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020E284;
  block[3] = &unk_100304490;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sessionQueue, block);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_sharingInvitation, 0);
  objc_storeStrong((id *)&self->_sharingInvitationId, 0);
  objc_destroyWeak((id *)&self->_cancelDelegate);
  objc_destroyWeak((id *)&self->_reporterDelegate);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_friendKeyIdStr, 0);
  objc_storeStrong((id *)&self->_friendKeyId, 0);
  objc_storeStrong((id *)&self->_sharingResult, 0);
  objc_storeStrong((id *)&self->_ksTransport, 0);
  objc_storeStrong((id *)&self->_epAuthResponse, 0);
  objc_storeStrong((id *)&self->_ownerEndPoint, 0);
  objc_storeStrong((id *)&self->_ourBindingAttestation, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_keyConfigInTLV, 0);
  objc_storeStrong((id *)&self->_entitlementsInTLV, 0);
  objc_storeStrong((id *)&self->_keyConfigInASN1, 0);
  objc_storeStrong((id *)&self->_entitlementsInASN1, 0);
  objc_storeStrong((id *)&self->_signedResponse, 0);
  objc_storeStrong((id *)&self->_signingRequest, 0);
  objc_storeStrong((id *)&self->_sharingConfig, 0);
}

@end
