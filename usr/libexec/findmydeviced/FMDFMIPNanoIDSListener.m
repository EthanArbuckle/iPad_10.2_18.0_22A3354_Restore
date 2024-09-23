@implementation FMDFMIPNanoIDSListener

- (FMDFMIPNanoIDSListener)initWithManager:(id)a3
{
  id v5;
  FMDFMIPNanoIDSListener *v6;
  FMDFMIPNanoIDSListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDFMIPNanoIDSListener;
  v6 = -[FMDFMIPNanoIDSListener init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsManager, a3);
    -[FMDFMIPNanoIDSListener _registerIDSHandlers](v7, "_registerIDSHandlers");
    -[FMNanoIDSManager start](v7->_idsManager, "start");
  }

  return v7;
}

- (void)_registerIDSHandlers
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPNanoIDSListener idsManager](self, "idsManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004050C;
  v7[3] = &unk_1002C2EB8;
  v7[4] = self;
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 1, v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100040718;
  v6[3] = &unk_1002C2EB8;
  v6[4] = self;
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 3, v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000408F0;
  v5[3] = &unk_1002C2EB8;
  v5[4] = self;
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 7, v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040AC8;
  v4[3] = &unk_1002C2EB8;
  v4[4] = self;
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 9, v4);
  objc_msgSend(v3, "handleRequestsOfType:withHandler:", 5, &stru_1002C2EF8);

}

- (id)_v5SignedResponseForRequestBody:(id)a3 activationLockRequestUUID:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  FMDNanoSupportProtoSignedDataV5 *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  _BYTE *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  id v79;
  id v80;
  id v81;
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  unsigned __int8 md[32];

  v57 = a3;
  v58 = a4;
  v61 = objc_msgSend(v57, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serialNumber"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imei"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("imei"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "meid"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("meid"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ecid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v12, "longLongValue")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("ecid"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chipId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v15, "longLongValue")));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("chipId"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiMacAddress"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("wifiMac"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "btMacAddress"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("btMac"), v18);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("timeStampMillis"), v59);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
  v81 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "inFieldCollectionReceipt:", &v81));
  v60 = v81;
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("ifcReceipt"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "fm_commaSeparatedString"));
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("collectionError"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  LODWORD(v20) = objc_msgSend(v22, "isInternalBuild");

  if ((_DWORD)v20)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "description"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("collectionErrorDetail"), v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productType"));
  objc_msgSend(v24, "fm_safelyMapKey:toObject:", CFSTR("productType"), v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceUDID"));
  objc_msgSend(v24, "fm_safelyMapKey:toObject:", CFSTR("udid"), v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "alCapability")));
  objc_msgSend(v24, "fm_safelyMapKey:toObject:", CFSTR("alCapability"), v28);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("deviceInfo"), v24);
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v5, CFSTR("otherDevice"));
  v29 = objc_alloc_init(FMDNanoSupportProtoSignedDataV5);
  v80 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v61, 0, &v80));
  v31 = v80;
  v32 = sub_1000031B8();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = v33;
  if (v31)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Error serializing the data to sign : %@", buf, 0xCu);
    }

    -[FMDNanoSupportProtoSignedDataV5 setErrorOccurred:](v29, "setErrorOccurred:", 1);
  }
  else
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      sub_1002285E0(v30, v34);

    v35 = objc_retainAutorelease(v30);
    CC_SHA256(objc_msgSend(v35, "bytes"), (CC_LONG)objc_msgSend(v35, "length"), md);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 32));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
    v79 = 0;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "signatureForData:requestUUID:mode:error:", v55, v58, 0, &v79));
    v53 = v79;

    if (objc_msgSend(v56, "count") == (id)2)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", 0));
      -[FMDNanoSupportProtoSignedDataV5 setSignedData:](v29, "setSignedData:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", 1));
      -[FMDNanoSupportProtoSignedDataV5 setSkAuth:](v29, "setSkAuth:", v38);

      -[FMDNanoSupportProtoSignedDataV5 setFinalRequestJsonData:](v29, "setFinalRequestJsonData:", v35);
      v39 = sub_1000031B8();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoSignedDataV5 signedData](v29, "signedData"));
        v42 = objc_msgSend(v41, "length");
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoSignedDataV5 skAuth](v29, "skAuth"));
        v44 = objc_msgSend(v43, "length");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v44;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Signed data length : %ld, sk auth length : %ld", buf, 0x16u);

      }
    }
    else
    {
      -[FMDNanoSupportProtoSignedDataV5 setErrorOccurred:](v29, "setErrorOccurred:", 1);
    }
    v54 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v83 = sub_100041A64;
    v84 = sub_100041A74;
    v85 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = sub_100041A64;
    v77 = sub_100041A74;
    v78 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = sub_100041A64;
    v71 = sub_100041A74;
    v72 = 0;
    v45 = objc_msgSend(objc_alloc((Class)FMDIdentitySigningRequest), "initWithData:", v55);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100041A7C;
    v62[3] = &unk_1002C2F20;
    v64 = &v67;
    v65 = buf;
    v66 = &v73;
    v46 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("FMDRequestIdentityV5.BAASigning"), 60.0);
    v63 = v46;
    objc_msgSend(v54, "baaIdentityAttestationForSigningRequest:completion:", v45, v62);
    objc_msgSend(v46, "wait");
    if (objc_msgSend(v46, "timeoutOccurred"))
    {
      v47 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 4, 0));
      v48 = (void *)v68[5];
      v68[5] = v47;

    }
    -[FMDNanoSupportProtoSignedDataV5 setBaaSignature:](v29, "setBaaSignature:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    -[FMDNanoSupportProtoSignedDataV5 setBaaAttestation:](v29, "setBaaAttestation:", v74[5]);
    v49 = (void *)v68[5];
    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "domain"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%ld"), v50, objc_msgSend((id)v68[5], "code"), v53));
      -[FMDNanoSupportProtoSignedDataV5 setBaaError:](v29, "setBaaError:", v51);

    }
    _Block_object_dispose(&v67, 8);

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(buf, 8);

  }
  return v29;
}

- (FMNanoIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
  objc_storeStrong((id *)&self->_idsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsManager, 0);
}

@end
