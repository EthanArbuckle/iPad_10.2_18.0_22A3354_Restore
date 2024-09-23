@implementation KmlOwnerSharingManager

- (void)dealloc
{
  OS_dispatch_queue *oksQueue;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  oksQueue = self->_oksQueue;
  self->_oksQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)KmlOwnerSharingManager;
  -[KmlOwnerSharingManager dealloc](&v4, "dealloc");
}

- (void)handleSentInvitationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *oksQueue;
  NSUUID *sharingManagerId;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13[5];
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    oksQueue = self->_oksQueue;
    v13[0] = (uint64_t)_NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = (uint64_t)sub_100266628;
    v13[3] = (uint64_t)&unk_100304370;
    v13[4] = (uint64_t)self;
    v14 = v4;
    dispatch_async(oksQueue, v13);

  }
  else
  {
    if (self)
      sharingManagerId = self->_sharingManagerId;
    else
      sharingManagerId = 0;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](sharingManagerId, "UUIDString")));
    v9 = objc_msgSend(v8, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1571, (uint64_t)v9, CFSTR("Invitation ID is nil"), v10, v11, v12, v13[0]);

  }
}

- (void)handlePasscodeRetryRequestedForInvitation:(id)a3
{
  id v4;
  void *v5;
  NSObject *oksQueue;
  NSUUID *sharingManagerId;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13[5];
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    oksQueue = self->_oksQueue;
    v13[0] = (uint64_t)_NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = (uint64_t)sub_1002668AC;
    v13[3] = (uint64_t)&unk_100304370;
    v13[4] = (uint64_t)self;
    v14 = v4;
    dispatch_async(oksQueue, v13);

  }
  else
  {
    if (self)
      sharingManagerId = self->_sharingManagerId;
    else
      sharingManagerId = 0;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](sharingManagerId, "UUIDString")));
    v9 = objc_msgSend(v8, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1597, (uint64_t)v9, CFSTR("Invitation ID is nil"), v10, v11, v12, v13[0]);

  }
}

- (int64_t)getTotalNumberOfSharedKeys
{
  return self->_totalSharedKeys;
}

- (void)handleOwnerKeySharingCancelledWithStatus:(id)a3
{
  id v4;
  NSUUID *sharingManagerId;
  NSUUID *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUUID *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *oksQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;

  v4 = a3;
  if (v4)
  {
    if (self)
      sharingManagerId = self->_sharingManagerId;
    else
      sharingManagerId = 0;
    v6 = sharingManagerId;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString")));
    v8 = objc_msgSend(v7, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_DEBUG, (uint64_t)"KmlOwnerSharingManager.m", 1631, (uint64_t)v8, CFSTR("Failed to cancel sharing due to %@"), v9, v10, v11, (uint64_t)v4);

  }
  else
  {
    if (self)
      v12 = self->_sharingManagerId;
    else
      v12 = 0;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v12, "UUIDString")));
    v13 = objc_msgSend(v7, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_DEBUG, (uint64_t)"KmlOwnerSharingManager.m", 1629, (uint64_t)v13, CFSTR("Sharing cancelled successfully."), v14, v15, v16, v19);
  }

  oksQueue = self->_oksQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100266BD8;
  block[3] = &unk_100304370;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(oksQueue, block);

}

- (void)handleSharingCompleteForInvitationIdentifier:(id)a3 localShare:(BOOL)a4 bindingAttestationUsed:(BOOL)a5 status:(id)a6
{
  id v10;
  id v11;
  NSObject *oksQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  oksQueue = self->_oksQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100266CD8;
  v15[3] = &unk_10030FD70;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(oksQueue, v15);

}

- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10
{
  id v12;
  id v13;
  NSObject *oksQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;

  v12 = a7;
  v13 = a10;
  oksQueue = self->_oksQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002671C0;
  block[3] = &unk_10030FD98;
  block[4] = self;
  v18 = v13;
  v20 = a8;
  v21 = a9;
  v19 = v12;
  v15 = v12;
  v16 = v13;
  dispatch_async(oksQueue, block);

}

- (void)handleSendMessageResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (self)
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[KmlOwnerSharingManager UUIDString](self, "UUIDString", a3)));
  v3 = objc_msgSend(v8, "UTF8String");
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1792, (uint64_t)v3, CFSTR("We should not be sending any messages. So don't expect a result either."), v4, v5, v6, v7);

}

- (void)handleTransportSetupResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (self)
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[KmlOwnerSharingManager UUIDString](self, "UUIDString", a3)));
  v3 = objc_msgSend(v8, "UTF8String");
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1798, (uint64_t)v3, CFSTR("We should not be setting up transport. So don't expect a result either."), v4, v5, v6, v7);

}

- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (self)
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[KmlOwnerSharingManager UUIDString](self, "UUIDString", a3, a4)));
  v4 = objc_msgSend(v9, "UTF8String");
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1805, (uint64_t)v4, CFSTR("We don't handle cross platform sharing messages here."), v5, v6, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessions, 0);
  objc_storeStrong((id *)&self->_friendCrossPlatformIdentifier, 0);
  objc_storeStrong((id *)&self->_friendIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerkeyIdStr, 0);
  objc_storeStrong((id *)&self->_sharingManagerId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_sharingRecordsUpdater, 0);
  objc_storeStrong((id *)&self->_sharingInvitationsCrossPlatform, 0);
  objc_storeStrong((id *)&self->_sharingInvitationsForIds, 0);
  objc_storeStrong((id *)&self->_sharingConfigs, 0);
  objc_storeStrong((id *)&self->_oksQueue, 0);
  objc_storeStrong((id *)&self->_sharingResult, 0);
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeSeed, 0);
  objc_storeStrong((id *)&self->_ourBindingAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationId, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_ownerId, 0);
  objc_storeStrong((id *)&self->_ownerEndPoint, 0);
}

@end
