@implementation NearFieldManager

- (id)secureElementInfo
{
  SecureElementInfo *secureElementInfo;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SecureElementInfo *v29;
  SecureElementInfo *v30;
  uint64_t v31;
  _BOOL4 v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  id v39;

  secureElementInfo = self->_secureElementInfo;
  if (secureElementInfo)
    return secureElementInfo;
  v37 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", &v37));
  v5 = v37;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sequenceCounter"));
    v12 = objc_msgSend(v11, "unsignedIntValue");

    v13 = (uint64_t)objc_msgSend(v6, "deviceType");
    v36 = v12;
    if (v13 <= 114)
    {
      switch(v13)
      {
        case ',':
          v32 = 1;
          v16 = 4;
          break;
        case '7':
          v32 = 1;
          v16 = 5;
          break;
        case 'd':
          goto LABEL_18;
        default:
          goto LABEL_22;
      }
      v31 = v16;
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 != 210 && v13 != 200)
    {
      if (v13 != 115)
      {
LABEL_22:
        v14 = 0;
        v32 = 1;
        v15 = 6;
        goto LABEL_23;
      }
      v32 = v12 > 0x90B;
      v14 = 1;
      v15 = 2;
LABEL_23:
      v31 = v15;
LABEL_24:
      v17 = objc_msgSend(v6, "signingKeyType");
      v18 = v17 == (id)2;
      if ((v14 & 1) == 0 && v17 == (id)2)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentConfigID"));
        v20 = objc_msgSend(v19, "unsignedIntValue");

        v18 = HIBYTE(v20) != 80;
      }
      v33 = v18;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "hexStringAsData"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ecdsaCertificate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "hexStringAsData"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", 32545, v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "asData"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rsaCertificate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hexStringAsData"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SESTLV TLVWithTag:value:](SESTLV, "TLVWithTag:value:", 32545, v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "asData"));
      v29 = (SecureElementInfo *)objc_claimAutoreleasedReturnValue(+[SecureElementInfo withSEID:casdCertificate:casdCertificateRSA:isProd:isSkyOrLater:secureElementType:csn:chipID:](SecureElementInfo, "withSEID:casdCertificate:casdCertificateRSA:isProd:isSkyOrLater:secureElementType:csn:chipID:", v21, v24, v28, v33, v32, v31, v36, objc_msgSend(v6, "deviceType")));
      v30 = self->_secureElementInfo;
      self->_secureElementInfo = v29;

      secureElementInfo = self->_secureElementInfo;
      return secureElementInfo;
    }
LABEL_18:
    v32 = v12 > 0xA17;
    v14 = 1;
    v15 = 3;
    goto LABEL_23;
  }
  v8 = sub_100051908();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to retrieve eSE info %@", buf, 0xCu);
  }

  return 0;
}

- (void)getSecureElementWithReason:(id)a3 callback:(id)a4
{
  id v7;
  void (**v8)(id, id *, _QWORD);
  id v9;
  NSObject *v10;
  unint64_t internalState;
  unsigned int v12;
  NSMutableArray *queuedWaiters;
  id v14;
  id v15;
  NSObject *v16;
  NSString *reasonForInUseSession;
  NSMutableArray *v18;
  id v19;
  id v20;
  NSObject *v21;
  id *v22;
  int v23;
  _QWORD v24[2];

  v7 = a3;
  v8 = (void (**)(id, id *, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sub_100051908();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    internalState = self->_internalState;
    v12 = -[NSMutableArray count](self->_queuedWaiters, "count");
    v23 = 67240448;
    LODWORD(v24[0]) = internalState;
    WORD2(v24[0]) = 1026;
    *(_DWORD *)((char *)v24 + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Client request %{public}u queue (before) %{public}u", (uint8_t *)&v23, 0xEu);
  }

  switch(self->_internalState)
  {
    case 1uLL:
      queuedWaiters = self->_queuedWaiters;
      v14 = +[SERequest newSERequestWithReason:callback:](SERequest, "newSERequestWithReason:callback:", v7, v8);
      -[NSMutableArray pushLast:](queuedWaiters, "pushLast:", v14);

      sub_100052C64((uint64_t)self);
      break;
    case 2uLL:
    case 5uLL:
    case 6uLL:
      goto LABEL_8;
    case 3uLL:
      v15 = sub_100051908();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        reasonForInUseSession = self->_reasonForInUseSession;
        v23 = 138543362;
        v24[0] = reasonForInUseSession;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Currently in use for %{public}@", (uint8_t *)&v23, 0xCu);
      }

LABEL_8:
      v18 = self->_queuedWaiters;
      v19 = +[SERequest newSERequestWithReason:callback:](SERequest, "newSERequestWithReason:callback:", v7, v8);
      -[NSMutableArray pushLast:](v18, "pushLast:", v19);

      break;
    case 4uLL:
      self->_internalState = 3;
      objc_storeStrong((id *)&self->_reasonForInUseSession, a3);
      v20 = sub_100051908();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138543362;
        v24[0] = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Free session claimed for reason %{public}@", (uint8_t *)&v23, 0xCu);
      }

      sub_10004C548((uint64_t)self->_timer);
      v22 = sub_100052D6C((id *)[NearFieldSessionShim alloc], self);
      v8[2](v8, v22, 0);

      break;
    default:
      break;
  }

}

- (void)setHandoffToken:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052E7C;
  v7[3] = &unk_100304370;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForInUseSession, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_openingSession, 0);
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_queuedWaiters, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_SEMSession, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_secureElementInfo, 0);
}

@end
