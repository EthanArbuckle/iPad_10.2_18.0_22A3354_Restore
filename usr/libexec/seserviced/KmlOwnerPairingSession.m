@implementation KmlOwnerPairingSession

- (void)preWarmForManufacturer:(id)a3 callback:(id)a4
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
  block[2] = sub_100235F6C;
  block[3] = &unk_100303730;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)startKeyPairingWithPassword:(id)a3 keyName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = sub_100232A94((id *)&self->super.super.isa);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100236240;
  v22[3] = &unk_10030F328;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a5;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_async(v17, v22);

}

- (void)startProbingWithCallback:(id)a3
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
  v8[2] = sub_1002364F0;
  v8[3] = &unk_100303078;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

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
  v8[2] = sub_1002366D8;
  v8[3] = &unk_100303078;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

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
  _QWORD block[4];
  id v21;
  KmlOwnerPairingSession *v22;
  id v23;
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
  block[2] = sub_100236998;
  block[3] = &unk_10030F350;
  v21 = v11;
  v22 = self;
  v24 = v10;
  v25 = v13;
  v23 = v12;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(v15, block);

}

- (void)handleKmlOwnerPairingCompletionWithResult:(id)a3 keyInformation:(id)a4 keyTrackingRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingCompletionWithResult:keyInformation:keyTrackingRequest:]", 185, CFSTR("result = %@"), v11, v12, v13, v14, (uint64_t)v8);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingCompletionWithResult:keyInformation:keyTrackingRequest:]", 186, CFSTR("%@"), v15, v16, v17, v18, (uint64_t)v9);
  v19 = sub_100232A94((id *)&self->super.super.isa);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100236CB4;
  block[3] = &unk_10030EED8;
  block[4] = self;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v8;
  dispatch_async(v20, block);

}

- (void)handleKmlOwnerPairingStartResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingStartResult:]", 201, CFSTR("result = %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100236DFC;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleKmlOwnerPairingCancellationResult:(BOOL)a3
{
  id *v4;
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  v4 = sub_100232A94((id *)&self->super.super.isa);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100236E80;
  block[3] = &unk_10030F370;
  v7 = a3;
  dispatch_async(v5, block);

}

- (void)handleKmlOwnerPairingFirstTransactionCompletionResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingFirstTransactionCompletionResult:]", 220, CFSTR("result = %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100236F78;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleKmlOwnerPairingTrackingReceiptSaveResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingTrackingReceiptSaveResult:]", 233, CFSTR("result = %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002370BC;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleKmlOwnerPairingPreWarmCompletionResult:(id)a3
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingPreWarmCompletionResult:]", 242, CFSTR("result = %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = sub_100232A94((id *)&self->super.super.isa);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002371A4;
  block[3] = &unk_100304370;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, block);

}

- (void)handleKmlOwnerPairingProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  unint64_t v16;

  v13 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingProbingCompletionWithBrandCode:error:]", 250, CFSTR("Brand code : %ld, error : %@"), v6, v7, v8, v9, a3);
  v10 = sub_100232A94((id *)&self->super.super.isa);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002372A4;
  block[3] = &unk_100304B20;
  v15 = v13;
  v16 = a3;
  block[4] = self;
  v12 = v13;
  dispatch_async(v11, block);

}

- (void)handleKmlOwnerPairingDidStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingDidStart]", 258, &stru_100316BD0, v2, v3, v4, v5, v9);
  v7 = sub_100232A94((id *)&self->super.super.isa);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100237370;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(v8, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endSessionCallback, 0);
  objc_storeStrong(&self->_updateTrackingCallback, 0);
  objc_storeStrong(&self->_startPairingCallback, 0);
  objc_storeStrong((id *)&self->_opManager, 0);
}

@end
