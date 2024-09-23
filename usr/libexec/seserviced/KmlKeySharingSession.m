@implementation KmlKeySharingSession

- (void)sendSharingInviteForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
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
  _QWORD v24[5];
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
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10023A108;
  v24[3] = &unk_10030F918;
  v24[4] = self;
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
  dispatch_async(v18, v24);

}

- (void)sendSilentSharingInviteForKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = sub_100232A94((id *)&self->super.super.isa);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10023A3C4;
  v17[3] = &unk_100302B80;
  v17[4] = self;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v14 = v11;
  v15 = v9;
  v16 = v10;
  dispatch_async(v13, v17);

}

- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5
{
  id v6;
  id *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a5;
  v7 = sub_100232A94((id *)&self->super.super.isa);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A624;
  block[3] = &unk_100303300;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)cancelSharingInvitation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  KmlKeySharingSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A724;
  block[3] = &unk_1003030E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
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
  _QWORD block[5];
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023AA2C;
  block[3] = &unk_10030F940;
  v23 = v12;
  v24 = v13;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  dispatch_async(v15, block);

}

- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4
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
  block[2] = sub_10023AB88;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = sub_100232A94((id *)&self->super.super.isa);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023AD90;
  block[3] = &unk_10030F968;
  block[4] = self;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  dispatch_async(v21, block);

}

- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4
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
  block[2] = sub_10023B024;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6
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
  _QWORD block[4];
  id v21;
  id v22;
  KmlKeySharingSession *v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100232A94((id *)&self->super.super.isa);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B394;
  block[3] = &unk_10030F9B8;
  v21 = v12;
  v22 = v10;
  v23 = self;
  v24 = v11;
  v25 = v13;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  dispatch_async(v15, block);

}

- (void)acceptSharingInvitation:(id)a3 withIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 passcode:(id)a6 productPlanIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  KmlKeySharingSession *v32;
  id v33;
  id v34;
  id v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = sub_100232A94((id *)&self->super.super.isa);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023B6A0;
  block[3] = &unk_10030F9E0;
  v29 = v15;
  v30 = v16;
  v31 = v14;
  v32 = self;
  v34 = v18;
  v35 = v19;
  v33 = v17;
  v22 = v18;
  v23 = v17;
  v24 = v19;
  v25 = v14;
  v26 = v16;
  v27 = v15;
  dispatch_async(v21, block);

}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
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
  KmlKeySharingSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023B9D4;
  v16[3] = &unk_100304530;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
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
  KmlKeySharingSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023BB64;
  v16[3] = &unk_100304530;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
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
  KmlKeySharingSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023BE4C;
  v16[3] = &unk_100304530;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  KmlKeySharingSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C110;
  block[3] = &unk_1003030E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
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
  KmlKeySharingSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023C394;
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
  KmlKeySharingSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C5D4;
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
  KmlKeySharingSession *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100232A94((id *)&self->super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C834;
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
  KmlKeySharingSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023CAB8;
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
  KmlKeySharingSession *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023CD60;
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
  KmlKeySharingSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023CFCC;
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

- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
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
  KmlKeySharingSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023D264;
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

- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5
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
  KmlKeySharingSession *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023D528;
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

- (void)handleOwnerKeySharingCancelStatus:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingCancelStatus:]", 481, CFSTR("We don't cancel invitation on owner side from sharing session"), v3, v4, v5, v6, v11);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingCancelStatus:]", 482, CFSTR("Ignoring this callback with status : %@"), v7, v8, v9, v10, (uint64_t)v12);

}

- (void)handleOwnerKeySharingInvitations:(id)a3 withError:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v15 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerKeySharingInvitations:withError:]", 487, CFSTR("invitations: %@, error %@"), v7, v8, v9, v10, (uint64_t)v6);
  v11 = sub_100232A94((id *)&self->super.super.isa);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023D7FC;
  block[3] = &unk_100304490;
  block[4] = self;
  v17 = v6;
  v18 = v15;
  v13 = v15;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)handleOwnerCrossPlatformInvitations:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleOwnerCrossPlatformInvitations:withError:]", 506, CFSTR("error - %@"), v8, v9, v10, v11, (uint64_t)v7);
  v12 = sub_100232A94((id *)&self->super.super.isa);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023D998;
  block[3] = &unk_100304490;
  block[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(v13, block);

}

- (void)handleExchangeStartedWithFriendKey:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleExchangeStartedWithFriendKey:status:]", 519, CFSTR("%@"), v8, v9, v10, v11, (uint64_t)v7);
  v12 = sub_100232A94((id *)&self->super.super.isa);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DA9C;
  block[3] = &unk_100304490;
  block[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(v13, block);

}

- (void)handleFriendSideKeySharingCancelStatus:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleFriendSideKeySharingCancelStatus:]", 529, CFSTR("%@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DB7C;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleCrossPlatformSigningRequest:(id)a3 status:(id)a4 keyInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleCrossPlatformSigningRequest:status:keyInformation:]", 539, CFSTR("%@"), v11, v12, v13, v14, (uint64_t)v9);
  v15 = sub_100232A94((id *)&self->super.super.isa);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DC98;
  block[3] = &unk_10030EED8;
  block[4] = self;
  v21 = v8;
  v22 = v10;
  v23 = v9;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  dispatch_async(v16, block);

}

- (void)handleCrossPlatformParseInvitationStatus:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleCrossPlatformParseInvitationStatus:]", 549, CFSTR("%@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DD7C;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleRecipientMessageResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleRecipientMessageResult:]", 559, CFSTR("%@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DE5C;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleInitiatorMessageResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeySharingSession handleInitiatorMessageResult:]", 571, CFSTR("%@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DF3C;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ownerSideSilentSharingCallback, 0);
  objc_storeStrong(&self->_sharingCancelCallback, 0);
  objc_storeStrong(&self->_ownerSideSharingInitCallback, 0);
  objc_storeStrong(&self->_initiatorSideHandleMessageCallback, 0);
  objc_storeStrong(&self->_recipientSideHandleMessageCallback, 0);
  objc_storeStrong(&self->_friendSideParseXPInvitationCallback, 0);
  objc_storeStrong(&self->_friendSideSendSigningRequestCallback, 0);
  objc_storeStrong(&self->_friendSideAcceptIDSCallback, 0);
  objc_storeStrong((id *)&self->_fsManager, 0);
  objc_storeStrong((id *)&self->_oksSession, 0);
  objc_storeStrong((id *)&self->_oksManager, 0);
  objc_storeStrong(&self->_cancelOwnerPairingHandler, 0);
}

@end
