@implementation KmlKeyManagementSession

- (void)deleteKey:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002676FC;
  v12[3] = &unk_100303078;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)localDeleteKey:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100267860;
  v12[3] = &unk_100303078;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)remoteTerminateKeys:(id)a3 nodeGroupIdentifiers:(id)a4 treeGroupIdentifiers:(id)a5 adminKey:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = sub_100232A94((id *)&self->super.super.isa);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100267A10;
  block[3] = &unk_10030F9B8;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  dispatch_async(v18, block);

}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100267C84;
  v12[3] = &unk_100303078;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)listReceivedSharingInvitationsWithCallback:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  v5 = sub_100232A94((id *)&self->super.super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100267DC0;
  block[3] = &unk_100303300;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  v5 = sub_100232A94((id *)&self->super.super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100267EEC;
  block[3] = &unk_100303300;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10026801C;
  v12[3] = &unk_100303078;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  KmlKeyManagementSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10026817C;
  v16[3] = &unk_100304530;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5
{
  id v8;
  id v9;
  id *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  KmlKeyManagementSession *v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = sub_100232A94((id *)&self->super.super.isa);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002684CC;
  v14[3] = &unk_10030FDC0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002689F4;
  block[3] = &unk_1003030E0;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, block);

}

- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100268B38;
  v12[3] = &unk_100303078;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)consumeTrackingReceipt:(id)a3 otherJSONData:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100232A94((id *)&self->super.super.isa);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100268CC4;
  v20[3] = &unk_100302B80;
  v21 = v11;
  v22 = v12;
  v23 = v10;
  v24 = v13;
  v16 = v13;
  v17 = v10;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, v20);

}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100268E78;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  KmlKeyManagementSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002690F4;
  v16[3] = &unk_100302B80;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  KmlKeyManagementSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100269334;
  block[3] = &unk_1003030E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  KmlKeyManagementSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100269594;
  block[3] = &unk_1003030E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  KmlKeyManagementSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100269818;
  v16[3] = &unk_100302B80;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  KmlKeyManagementSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100269AC0;
  v16[3] = &unk_100302B80;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  KmlKeyManagementSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100269D2C;
  v16[3] = &unk_100302B80;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = sub_100232A94((id *)&self->super.super.isa);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100269FC8;
  v18[3] = &unk_100304808;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = a4;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, v18);

}

- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = sub_100232A94((id *)&self->super.super.isa);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A18C;
  block[3] = &unk_100305160;
  v24 = a4;
  v25 = a5;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  dispatch_async(v16, block);

}

- (void)finalizeUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 revert:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;

  v12 = a3;
  v13 = a7;
  v14 = sub_100232A94((id *)&self->super.super.isa);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A2E8;
  block[3] = &unk_10030FDE8;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  dispatch_async(v15, block);

}

- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A44C;
  block[3] = &unk_1003030E0;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, block);

}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  id *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = sub_100232A94((id *)&self->super.super.isa);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10026A568;
  v8[3] = &unk_100303078;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)handleOwnerKeySharingCancelStatus:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession handleOwnerKeySharingCancelStatus:]", 482, CFSTR("%@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026A6D8;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession handleOwnerKeySharingInvitations:withError:]", 490, CFSTR("Not applicable, Ignore"), v4, v5, v6, v7, v8);
}

- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession handleOwnerCrossPlatformInvitations:withError:]", 495, CFSTR("Not applicable, Ignore"), v4, v5, v6, v7, v8);
}

- (void)handleSharingCancelledMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  NSObject *v10;
  id v11;
  uint64_t v12[5];
  id v13;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession handleSharingCancelledMessage:]", 502, &stru_100316BD0, v5, v6, v7, v8, v12[0]);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v12[0] = (uint64_t)_NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = (uint64_t)sub_10026A7DC;
  v12[3] = (uint64_t)&unk_100304370;
  v12[4] = (uint64_t)self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sharingCancelWithMessageCallback, 0);
  objc_storeStrong(&self->_sharingCancelCallback, 0);
  objc_storeStrong(&self->_updateTrackingCallback, 0);
  objc_storeStrong((id *)&self->_fsManager, 0);
  objc_storeStrong((id *)&self->_osSession, 0);
  objc_storeStrong((id *)&self->_osManager, 0);
}

@end
