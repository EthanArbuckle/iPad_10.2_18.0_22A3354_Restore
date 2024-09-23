@implementation OTJoinWithVoucherOperation

- (OTJoinWithVoucherOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTJoinWithVoucherOperation *v15;
  OTJoinWithVoucherOperation *v16;
  NSString *peerID;
  NSData *voucherData;
  NSData *voucherSig;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OTJoinWithVoucherOperation;
  v15 = -[CKKSGroupOperation init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_ckksConflictState, a5);
    peerID = v16->_peerID;
    v16->_peerID = 0;

    voucherData = v16->_voucherData;
    v16->_voucherData = 0;

    voucherSig = v16->_voucherSig;
    v16->_voucherSig = 0;

  }
  return v16;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateHolder"));
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadOrCreateAccountMetadata:", &v18));
  v6 = v18;

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voucher"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voucherSignature")),
        v9,
        v8,
        v9)
    && !v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voucher"));
    -[OTJoinWithVoucherOperation setVoucherData:](self, "setVoucherData:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "voucherSignature"));
    -[OTJoinWithVoucherOperation setVoucherSig:](self, "setVoucherSig:", v11);

    v12 = sub_10000EF14("octagon");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherData](self, "voucherData"));
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "joining with a voucher: %@", buf, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getTLKSharesPairedWithVoucher"));
    -[OTJoinWithVoucherOperation proceedWithPendingTLKShares:](self, "proceedWithPendingTLKShares:", v15);

  }
  else
  {
    v16 = sub_10000EF14("octagon");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No voucher available: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v6);
  }

}

- (void)proceedWithPendingTLKShares:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  const void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  NSObject *v35;

  v26 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sosAdapter"));
  v6 = objc_msgSend(v5, "sosEnabled");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sosAdapter"));
    v32 = 0;
    v29 = objc_claimAutoreleasedReturnValue(+[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:](OTSOSAdapterHelpers, "peerPublicSigningKeySPKIsForCircle:error:", v8, &v32));
    v9 = v32;

    v10 = sub_10000EF14("octagon-sos");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v29;
        v13 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      v13 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v14 = sub_10000EF14("octagon-sos");
  v9 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }
  v29 = 0;
LABEL_12:

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "cuttlefishXPCWrapper"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "activeAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherData](self, "voucherData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation voucherSig](self, "voucherSig"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flowID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceSessionID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinWithVoucherOperation deps](self, "deps"));
  v22 = objc_msgSend(v21, "permittedToSendMetrics");
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000BC520;
  v30[3] = &unk_1002DEC88;
  objc_copyWeak(&v31, &location);
  LOBYTE(v23) = v22;
  objc_msgSend(v25, "joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:", v24, v15, v16, &__NSArray0__struct, v26, v29, v18, v20, v23, v30);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSData)voucherData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setVoucherData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSData)voucherSig
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setVoucherSig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCkksConflictState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucherData, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
