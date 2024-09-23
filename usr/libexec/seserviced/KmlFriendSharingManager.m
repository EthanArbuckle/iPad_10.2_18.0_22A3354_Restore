@implementation KmlFriendSharingManager

- (void)dealloc
{
  KmlSharingTransport *ksTransport;
  OS_dispatch_queue *fsQueue;
  objc_super v5;

  objc_storeWeak((id *)&self->_delegate, 0);
  ksTransport = self->_ksTransport;
  self->_ksTransport = 0;

  fsQueue = self->_fsQueue;
  self->_fsQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)KmlFriendSharingManager;
  -[KmlFriendSharingManager dealloc](&v5, "dealloc");
}

- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *fsQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  KmlFriendSharingManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  int64_t v34;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  fsQueue = self->_fsQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100244364;
  v26[3] = &unk_10030FB30;
  v27 = v19;
  v28 = self;
  v29 = v15;
  v30 = v16;
  v33 = a8;
  v34 = a9;
  v31 = v18;
  v32 = v17;
  v21 = v17;
  v22 = v18;
  v23 = v16;
  v24 = v15;
  v25 = v19;
  dispatch_async(fsQueue, v26);

}

- (void)handleTransportSetupResult:(id)a3
{
  id v4;
  NSObject *fsQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fsQueue = self->_fsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100244EA0;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fsQueue, v7);

}

- (void)handleSendMessageResult:(id)a3
{
  id v4;
  NSObject *fsQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fsQueue = self->_fsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002457AC;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fsQueue, v7);

}

- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4
{
  id v5;
  NSObject *fsQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  KmlFriendSharingManager *v10;

  v5 = a3;
  fsQueue = self->_fsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002459E0;
  v8[3] = &unk_100304370;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(fsQueue, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_crossPlatformMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_friendKeyIdStr, 0);
  objc_storeStrong((id *)&self->_sharingInvitationId, 0);
  objc_storeStrong((id *)&self->_keyInformation, 0);
  objc_storeStrong((id *)&self->_readerInformation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fsQueue, 0);
  objc_storeStrong((id *)&self->_preTrackError, 0);
  objc_storeStrong((id *)&self->_sharingResult, 0);
  objc_storeStrong((id *)&self->_sharingInvitationRecord, 0);
  objc_storeStrong((id *)&self->_ksTransport, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_bindingAttestationData, 0);
  objc_storeStrong((id *)&self->_encryptedPPIDRequest, 0);
  objc_storeStrong((id *)&self->_encryptedPreTrackRequest, 0);
  objc_storeStrong((id *)&self->_encryptedTrackingRequest, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralSecretKey, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_ppidDataFromServer, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_trackingRequestData, 0);
  objc_storeStrong((id *)&self->_attestationPackage, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_routingInformation, 0);
  objc_storeStrong((id *)&self->_friendKeyId, 0);
  objc_storeStrong((id *)&self->_friendKeyName, 0);
  objc_storeStrong((id *)&self->_friendEndPoint, 0);
  objc_storeStrong((id *)&self->_ownerIdsId, 0);
  objc_storeStrong((id *)&self->_encryptionAttestation, 0);
  objc_storeStrong((id *)&self->_signedResponse, 0);
  objc_storeStrong((id *)&self->_signingRequest, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_sharingInvitation, 0);
}

@end
