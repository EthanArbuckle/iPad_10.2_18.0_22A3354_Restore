@implementation AlohaPairingController

- (AlohaPairingController)initWithOptions:(const void *)a3 seController:(shared_ptr<SEUpdater::P73BaseSEController>)a4
{
  P73BaseSEController *ptr;
  AlohaPairingController *v6;
  AlohaPairingController *v7;
  AlohaPairingController *v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  SETransceiveHelper *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  SETransceiveHelper *transceiver;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  NSMutableArray *alohaPlistRecord;
  NSString *alohaServerIP;
  uint64_t v24;
  std::__shared_weak_count *v25;
  objc_super v26;

  ptr = a4.__ptr_;
  v26.receiver = self;
  v26.super_class = (Class)AlohaPairingController;
  v6 = -[AlohaPairingController init](&v26, sel_init, a3, a4.__ptr_, a4.__cntrl_);
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alohaHostname, *((id *)a3 + 2));
    v9 = (void *)*((_QWORD *)a3 + 3);
    v10 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    if (!v9)
      v10 = 0;
    if (v10)
      objc_storeStrong((id *)&v7->_debugRecordPath, v9);
    objc_storeStrong((id *)&v7->_alohaVersion, *((id *)a3 + 1));
    v11 = [SETransceiveHelper alloc];
    v12 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v24 = *(_QWORD *)ptr;
    v25 = v12;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v15 = -[SETransceiveHelper initWithSEController:](v11, "initWithSEController:", &v24);
    transceiver = v8->_transceiver;
    v8->_transceiver = (SETransceiveHelper *)v15;

    v17 = v25;
    if (v25)
    {
      v18 = (unint64_t *)&v25->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v8->_useReverseProxy = *((_BYTE *)a3 + 32);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array", v24);
    v20 = objc_claimAutoreleasedReturnValue();
    alohaPlistRecord = v8->_alohaPlistRecord;
    v8->_alohaPlistRecord = (NSMutableArray *)v20;

    v8->_state = 1;
    alohaServerIP = v8->_alohaServerIP;
    v8->_alohaServerIP = 0;

    v8->_restoreEnvironment = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController dealloc]", CFSTR("AlohaPairingController deallocating\n"));
  v3.receiver = self;
  v3.super_class = (Class)AlohaPairingController;
  -[AlohaPairingController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  SETransceiveHelper *transceiver;

  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController invalidate]", CFSTR("AlohaPairingController invalidating\n"));
  -[SETransceiveHelper invalidate](self->_transceiver, "invalidate");
  transceiver = self->_transceiver;
  self->_transceiver = 0;

}

- (int)performAlohaPairing
{
  NSString *alohaHostname;
  NSDictionary *v4;
  id v5;
  NSDictionary *reverseProxySettings;
  int v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  if (self->_useReverseProxy)
  {
    alohaHostname = self->_alohaHostname;
    v36 = 0;
    -[AlohaPairingController getReverseProxySettings:outError:](self, "getReverseProxySettings:outError:", alohaHostname, &v36);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = v36;
    reverseProxySettings = self->_reverseProxySettings;
    self->_reverseProxySettings = v4;

    v7 = 26;
    if (!self->_reverseProxySettings || v5)
      goto LABEL_45;
  }
  v8 = 0;
  while (2)
  {
    for (i = self->_state; ; i = 4)
    {
      if (i != 3)
      {
        switch(i)
        {
          case 4uLL:
            -[AlohaPairingController processEndPair:](self, "processEndPair:", v8);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            if (v28)
            {
              v15 = 0;
              _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error encountered when processing end pair:%@\n"), v28);
              v7 = 37;
              v5 = v29;
              goto LABEL_44;
            }
            v5 = 0;
            _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController performAlohaPairing]", CFSTR("Pairing ended without error\n"));
            v7 = 0;
            goto LABEL_43;
          case 2uLL:
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v18, "isEqualToString:", CFSTR("AUTHREQ"))
              || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SessionId")),
                  (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {

              goto LABEL_42;
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DATA"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
LABEL_42:
              v5 = 0;
              _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Malformed reply dictionary received %@\n"), v8);
              v7 = 37;
              goto LABEL_43;
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DATA"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            -[AlohaPairingController processAuthReqPayload:outError:](self, "processAuthReqPayload:outError:", v21, &v34);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = v34;

            if (!v5 && v15)
            {
              v17 = 3;
              goto LABEL_24;
            }
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error encountered when building auth resp dictionary: %@\n"), v5);
            break;
          case 1uLL:
            v35 = 0;
            -[AlohaPairingController beginPair:](self, "beginPair:", &v35);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v35;
            v5 = v16;
            if (!v16 && v15)
            {
              v17 = 2;
LABEL_24:
              self->_state = v17;
              v22 = v15;
              goto LABEL_28;
            }
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error encountered when building begin pair dictionary: %@\n"), v16);
            break;
          default:
            v5 = 0;
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Unexpected state encountered %lu\n"), i);
            v7 = 39;
LABEL_43:
            v15 = 0;
            goto LABEL_44;
        }
        v7 = 39;
        goto LABEL_44;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("APDUREQ")))
      {

      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("EndPair"));

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Unexpected command received %@\n"), v30);

          v5 = 0;
          v15 = 0;
          v7 = 37;
          goto LABEL_44;
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Command"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("EndPair"));

      if (!v14)
        break;
      self->_state = 4;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DATA"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_42;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DATA"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    -[AlohaPairingController processApduReqPayload:outError:](self, "processApduReqPayload:outError:", v24, &v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v33;

    if (v5 || !v22)
    {
      _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error encountered when building apdu resp dictionary: %@\n"), v5);
      v7 = 39;
      v15 = v22;
    }
    else
    {
LABEL_28:

      v32 = 0;
      -[AlohaPairingController performHTTPRequestWithRequestDict:outError:](self, "performHTTPRequestWithRequestDict:outError:", v22, &v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v32;
      v5 = v26;
      if (v26 || !v25)
      {
        _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error encountered when performing HTTP request %@, got reply %@, with error %@\n"), v22, v25, v26);
      }
      else
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SessionId"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AlohaPairingController verifyAndRetrieveServerSessionId:](self, "verifyAndRetrieveServerSessionId:", v27);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (!v5 && self->_serverSessionID)
        {

          v8 = v25;
          continue;
        }
        _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", CFSTR("Error when verifying session ID %@\n"), v5);
      }
      v7 = 37;
      v15 = v22;
      v8 = v25;
    }
    break;
  }
LABEL_44:

LABEL_45:
  return v7;
}

- (id)beginPair:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  SETransceiveHelper *transceiver;
  NSData *v12;
  NSData *seid;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SETransceiveHelper *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SETransceiveHelper *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  SETransceiveHelper *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSNumber *v38;
  NSNumber *ecid;
  NSNumber *v40;
  NSNumber *apChipId;
  NSNumber *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSData *v47;
  void *v48;
  void *v49;
  NSNumber *alohaVersion;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[16];
  _QWORD v60[18];

  v60[16] = *MEMORY[0x24BDAC8D0];
  -[SETransceiveHelper selectWithAID:](self->_transceiver, "selectWithAID:", CFSTR("A00000015153504341534400"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    _ObjCLogWrapOutError(a3, v5, 0, "-[AlohaPairingController beginPair:]", CFSTR("Error encountered when selecting CASD %@\n"), v6, v7, v8, (uint64_t)v5);
    v10 = 0;
  }
  else
  {
    transceiver = self->_transceiver;
    v58 = 0;
    v12 = -[SETransceiveHelper copySeid:](transceiver, "copySeid:", &v58);
    v9 = v58;
    seid = self->_seid;
    self->_seid = v12;

    if (v9 || !self->_seid)
    {
      _ObjCLogWrapOutError(a3, v9, 0, "-[AlohaPairingController beginPair:]", CFSTR("Error encountered when copying SEID %@\n"), v14, v15, v16, (uint64_t)v9);
      v10 = 0;
    }
    else
    {
      v17 = self->_transceiver;
      v57 = 0;
      v18 = -[SETransceiveHelper copyCasdCert:](v17, "copyCasdCert:", &v57);
      v19 = v57;
      v9 = v19;
      if (v19 || !v18)
      {
        v10 = 0;
        _ObjCLogWrapOutError(a3, v19, 0, "-[AlohaPairingController beginPair:]", CFSTR("Error encountered when retrieving casdCertificate %@\n"), v20, v21, v22, (uint64_t)v19);
      }
      else
      {
        v23 = self->_transceiver;
        v56 = 0;
        v24 = -[SETransceiveHelper copyDeviceType:](v23, "copyDeviceType:", &v56);
        v25 = v56;
        v30 = v25;
        if (v25 || v24 == 255)
        {
          _ObjCLogWrapOutError(a3, v25, 0, "-[AlohaPairingController beginPair:]", CFSTR("Unable to retrieve seDeviceType with error %@\n"), v27, v28, v29, (uint64_t)v25);
          v10 = 0;
          v9 = v30;
        }
        else if (v24 == 32 || v24 == 115 || v24 == 100)
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingController beginPair:]", CFSTR("seDeviceType does not support A9\n"), v26, v27, v28, v29, v51);
          v9 = 0;
          v10 = 0;
        }
        else
        {
          v32 = self->_transceiver;
          v55 = 0;
          v33 = -[SETransceiveHelper copyA9Parameters:](v32, "copyA9Parameters:", &v55);
          v9 = v55;
          if (!v9 && v33 && objc_msgSend(v33, "count") == 2)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", MGGetSInt64Answer());
            v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            ecid = self->_ecid;
            self->_ecid = v38;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", MGGetSInt64Answer());
            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            apChipId = self->_apChipId;
            self->_apChipId = v40;

            v59[0] = CFSTR("Command");
            v59[1] = CFSTR("ECID");
            v42 = self->_ecid;
            v60[0] = CFSTR("BeginPair");
            v60[1] = v42;
            v60[2] = self->_apChipId;
            v59[2] = CFSTR("ApChipId");
            v59[3] = CFSTR("ApBoardId");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", MGGetSInt64Answer());
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v60[3] = v54;
            v60[4] = _MergedGlobals_4;
            v59[4] = CFSTR("ApSecurityDomain");
            v59[5] = CFSTR("SOCProductionMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v60[5] = v53;
            v59[6] = CFSTR("SOCSecurityMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v60[6] = v52;
            v59[7] = CFSTR("ApEffectiveProductionMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v60[7] = v43;
            v59[8] = CFSTR("ApEffectiveSecurityMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v60[8] = v44;
            v59[9] = CFSTR("SEPEffectiveProductionMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v60[9] = v45;
            v59[10] = CFSTR("SEPEffectiveSecurityMode");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = self->_seid;
            v60[10] = v46;
            v60[11] = v47;
            v59[11] = CFSTR("SEID");
            v59[12] = CFSTR("CASDCert");
            v60[12] = v18;
            v59[13] = CFSTR("OBKG");
            objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v60[13] = v48;
            v59[14] = CFSTR("ServerA9CertSN");
            objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v59[15] = CFSTR("AlohaVersion");
            alohaVersion = self->_alohaVersion;
            v60[14] = v49;
            v60[15] = alohaVersion;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 16);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingController beginPair:]", CFSTR("Error when copying a9 params %@\n"), v34, v35, v36, v37, (uint64_t)v9);
            v10 = 0;
          }

        }
      }

    }
  }

  return v10;
}

- (id)processAuthReqPayload:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  unint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  SETransceiveHelper *transceiver;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  CFDataRef v65;
  id v66;
  _OWORD v67[3];
  __int128 v68;
  _QWORD v69[2];
  __int128 v70;
  _OWORD v71[2];
  uint64_t v72;
  CFDataRef v73;
  _QWORD v74[3];
  _QWORD v75[5];

  v75[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setValue:forKey:", CFSTR("AUTHRESP"), CFSTR("Command"));
  objc_msgSend(v7, "setValue:forKey:", qword_255323778, CFSTR("ErrorCode"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("Failure"), CFSTR("ErrorMessage"));
  objc_msgSend(v7, "setValue:forKey:", self->_fullServerSessionID, CFSTR("SessionId"));
  objc_msgSend(v7, "setValue:forKey:", *MEMORY[0x24BDBD1B0], CFSTR("DATA"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HSMChallengeSE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HSMChallengeSEP"));
  v9 = objc_claimAutoreleasedReturnValue();
  v14 = (const __CFData *)v9;
  if (!v8 || !v9)
  {
    _ObjCLogOutError((uint64_t *)a4, 1, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Payload dictionary is wrong %@\n"), v10, v11, v12, v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v15 = SSEIsFeatureSupported(45);
  if (!(_DWORD)v15)
  {
    v73 = 0;
    v22 = SSEGetAttV2AuthKey((const __CFData *)self->_seid, v14, &v73);
    v65 = v73;
    -[__CFData asHexString](v14, "asHexString");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Called SSGetAttV2AuthKey with nonce (hsmChallengeSEP) : %@"));

    if ((_DWORD)v22 || !v65)
    {
      _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Bad status received when getting Auth Key V2 %d or nil for AuthKey %d\n"), v23, v24, v25, v26, v22);
      v43 = v7;
LABEL_20:

      goto LABEL_7;
    }
    v63 = (void *)objc_opt_new();
    objc_msgSend(v63, "setValue:forKey:", v65, CFSTR("attV2AuthKey"));
    v72 = 0;
    v74[0] = CFSTR("VerifyData");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v27;
    v74[1] = CFSTR("StripImg4");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v28;
    v74[2] = CFSTR("GetCombined");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v30, "mutableCopy");

    v31 = (void *)AMFDRSealingMapCopyLocalDataForClass();
    v35 = v31;
    v36 = 0;
    if (v31)
    {
      memset(v71, 0, sizeof(v71));
      v70 = 0u;
      v69[0] = objc_msgSend(v31, "DERItem");
      v69[1] = v37;
      v38 = DERParseSequence((uint64_t)v69, (uint64_t)&img4BlobSpec, 0x2000000000000010, &v70, 0x30uLL);
      if ((_DWORD)v38)
      {
        _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Error encountered when parsing IMG4Blob %d\n"), v39, v40, v41, v42, v38);
      }
      else
      {
        v68 = 0u;
        memset(v67, 0, sizeof(v67));
        v45 = DERParseSequenceContent((unint64_t *)v71, 4u, (uint64_t)&scrtBlobSpecItems, (unint64_t)v67, 0x40uLL);
        if (!(_DWORD)v45)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v68);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            objc_msgSend(v63, "setValue:forKey:", v55, CFSTR("SCRT"));
            transceiver = self->_transceiver;
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HSMChallengeSE"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", MGGetSInt64Answer());
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 0;
            v59 = -[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:](transceiver, "copySESignature:hsmChallengeSE:ecid:outError:", v65, v57, v58, &v66);
            v36 = v66;

            objc_msgSend(v63, "setValue:forKey:", v59, CFSTR("SESignature"));
            objc_msgSend(v7, "setValue:forKey:", v63, CFSTR("DATA"));
            objc_msgSend(v7, "setValue:forKey:", qword_255323780, CFSTR("ErrorCode"));
            objc_msgSend(v7, "setValue:forKey:", CFSTR("Success"), CFSTR("ErrorMessage"));
            v60 = v7;

          }
          else
          {
            _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("SCRT is nil\n"), v51, v52, v53, v54, (uint64_t)v62);
            v61 = v7;
            v36 = 0;
          }

          goto LABEL_19;
        }
        _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Error encountered when parsing SCRTBlob %d\n"), v46, v47, v48, v49, (uint64_t)v45);
      }
      v50 = v7;
      v36 = 0;
    }
    else
    {
      _ObjCLogWrapOutError(a4, 0, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Error encountered when geting scrt %@ or scrt absent %d\n"), v32, v33, v34, v72);
      v44 = v7;
    }
LABEL_19:

    goto LABEL_20;
  }
  _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", CFSTR("Get Attestation V2 Auth Key feature is not supported on this device with status %d\n"), v16, v17, v18, v19, v15);
LABEL_6:
  v20 = v7;
LABEL_7:

  return v7;
}

- (id)processApduReqPayload:(id)a3 outError:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD **v19;
  id v20;
  id v21;
  id obj;
  void *v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  _QWORD v26[2];
  std::__shared_weak_count *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v21 = (id)objc_opt_new();
  objc_msgSend(v21, "setValue:forKey:", CFSTR("APDURESP"), CFSTR("Command"));
  objc_msgSend(v21, "setValue:forKey:", qword_255323780, CFSTR("ErrorCode"));
  objc_msgSend(v21, "setValue:forKey:", CFSTR("Success"), CFSTR("ErrorMessage"));
  objc_msgSend(v21, "setValue:forKey:", self->_fullServerSessionID, CFSTR("SessionId"));
  objc_msgSend(v21, "setValue:forKey:", *MEMORY[0x24BDBD1A0], CFSTR("DATA"));
  v5 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v20;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v29;
    v19 = &v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8));
        SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)v26, (const unsigned __int8 *)objc_msgSend(v9, "bytes", v19), objc_msgSend(v9, "length"), 0);
        SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v23, 0x2037uLL);
        v23 = &unk_24E0BF828;
        v10 = -[SETransceiveHelper transceiveAndRecordCapdu:rapdu:](self->_transceiver, "transceiveAndRecordCapdu:rapdu:", v26, &v23);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v24, v24[1] - *v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        v23 = &unk_24E0BF880;
        v12 = v25;
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v14 = __ldaxr(p_shared_owners);
          while (__stlxr(v14 - 1, p_shared_owners));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
        v26[0] = &unk_24E0BF880;
        v15 = v27;
        if (v27)
        {
          v16 = (unint64_t *)&v27->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  objc_msgSend(v21, "setValue:forKey:", v5, CFSTR("DATA"));
  return v21;
}

- (id)processEndPair:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController processEndPair:]", CFSTR("endpair payload %@\n"), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ECID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSNumber isEqualToNumber:](self->_ecid, "isEqualToNumber:", v5))
  {
    v6 = 0;
  }
  else
  {
    _ObjCLogNSError(0, 0, "-[AlohaPairingController processEndPair:]", CFSTR("ECID from endPair %@ _ecid %@"), v5, self->_ecid);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)performHTTPRequestWithRequestDict:(id)a3 outError:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *alohaServerIP;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  uint64_t v39;
  _QWORD v40[5];
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  id obj;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__5;
  v55 = __Block_byref_object_dispose__5;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  obj = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v50, obj);
  v10 = (void *)v46[5];
  if (!v10 && v6)
  {
    -[NSMutableArray addObject:](self->_alohaPlistRecord, "addObject:", v6);
    v11 = (void *)MEMORY[0x24BDD16B0];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_alohaHostname);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestWithURL:cachePolicy:timeoutInterval:", v12, 1, 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (self->_useReverseProxy)
      objc_msgSend(v14, "setConnectionProxyDictionary:", self->_reverseProxySettings);
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
    alohaServerIP = self->_alohaServerIP;
    if (alohaServerIP)
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", CFSTR("Adding header %@ = %@\n"), CFSTR("X-Apple-Aloha-IP"), alohaServerIP);
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", self->_alohaServerIP, CFSTR("X-Apple-Aloha-IP"));
    }
    objc_msgSend(v13, "setHTTPBody:", v6);
    v17 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __69__AlohaPairingController_performHTTPRequestWithRequestDict_outError___block_invoke;
    v40[3] = &unk_24E0C1A40;
    v42 = &v51;
    v40[4] = self;
    v43 = &v45;
    v19 = v17;
    v41 = v19;
    objc_msgSend(v18, "dataTaskWithRequest:completionHandler:", v13, v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "resume");
    if (v20)
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v25 = (id *)(v46 + 5);
    v24 = (void *)v46[5];
    if (v24)
    {
      _ObjCLogWrapOutError(a4, v24, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", CFSTR("Encountered error when talking to server %@\n"), v21, v22, v23, v46[5]);
      v26 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v38 = 0;
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v52[5], 0, &v39, &v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25, v38);
    if (v39 == 100)
    {
      if (v27)
      {
        v26 = v27;
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend((id)v52[5], "asHexString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", CFSTR("Unable to form plist from data %@\n"), v33, v34, v35, v36, (uint64_t)v32);

    }
    else
    {
      _ObjCLogOutError((uint64_t *)a4, 1, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", CFSTR("Was expecting XML format but received %lu\n"), v28, v29, v30, v31, v39);
    }
    v26 = 0;
    goto LABEL_18;
  }
  _ObjCLogWrapOutError(a4, v10, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", CFSTR("Error encountered when forming request body %@\n"), v7, v8, v9, v46[5]);
  v26 = 0;
LABEL_20:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v26;
}

void __69__AlohaPairingController_performHTTPRequestWithRequestDict_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "statusCode");
  if (objc_msgSend(v16, "length"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "alohaPlistRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  if (v11 == 200)
  {
    v13 = objc_msgSend(v9, "copy");
  }
  else
  {
    _ObjCLogNSError(0, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]_block_invoke", CFSTR("Bad HTTP Status Code received %ld\n"), v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getReverseProxySettings:(id)a3 outError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  std::chrono::steady_clock::time_point v18;
  unsigned int v19;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v20;
  std::chrono::steady_clock::time_point v21;
  std::chrono::system_clock::time_point v22;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v23;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v24;
  unsigned int v25;
  uint64_t v26;
  std::mutex *m;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  id result;
  uint64_t v35;
  std::exception_ptr *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  std::exception_ptr v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t *(*v55)(uint64_t);
  const char *v56;
  uint64_t v57;
  std::exception_ptr v58;
  std::unique_lock<std::mutex> __lk;

  v5 = a3;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3812000000;
  v54 = __Block_byref_object_copy__131;
  v55 = __Block_byref_object_dispose__132;
  v56 = "";
  v6 = operator new();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 850045863;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_QWORD *)(v6 + 80) = 0;
  *(_QWORD *)(v6 + 88) = 1018212795;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(_QWORD *)v6 = &off_24E0C1A98;
  *(_QWORD *)(v6 + 8) = 0;
  v57 = v6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  v7 = v52[6];
  if (!v7)
    std::__throw_future_error[abi:ne180100](3u);
  std::mutex::lock((std::mutex *)(v7 + 24));
  v8 = *(_DWORD *)(v7 + 136);
  if ((v8 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v9 = (unint64_t *)(v7 + 8);
  do
    v10 = __ldxr(v9);
  while (__stxr(v10 + 1, v9));
  *(_DWORD *)(v7 + 136) = v8 | 2;
  std::mutex::unlock((std::mutex *)(v7 + 24));
  v11 = RPRegisterForAvailability();
  v16 = (const void *)v11;
  v17 = (void *)v46[5];
  if (v17)
  {
    _ObjCLogWrapOutError(a4, v17, 0, "-[AlohaPairingController getReverseProxySettings:outError:]", CFSTR("Failed to register for proxy\n"), v13, v14, v15, v44);
    if (v16)
      CFRelease(v16);
    goto LABEL_38;
  }
  if (!v11)
  {
    _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController getReverseProxySettings:outError:]", CFSTR("Failed to register for proxy\n"), v12, v13, v14, v15, v44);
    goto LABEL_38;
  }
  RPRegistrationResume();
  v18.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v7 + 24);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v7 + 24));
  v19 = *(_DWORD *)(v7 + 136);
  if ((v19 & 8) != 0)
  {
    v26 = 2;
LABEL_33:
    m = (std::mutex *)(v7 + 24);
    goto LABEL_34;
  }
  if ((v19 & 4) != 0)
  {
    v26 = ((v19 >> 2) & 1) == 0;
    goto LABEL_33;
  }
  v20 = v18.__d_.__rep_ + 5000000000;
  while (std::chrono::steady_clock::now().__d_.__rep_ < v20)
  {
    if (std::chrono::steady_clock::now().__d_.__rep_ < v20)
    {
      v21.__d_.__rep_ = v20 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v21.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v22.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v22.__d_.__rep_)
        {
          v23 = 0;
          goto LABEL_23;
        }
        if (v22.__d_.__rep_ < 1)
        {
          if ((unint64_t)v22.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
            goto LABEL_22;
          v23 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v22.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            v23 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_23;
          }
LABEL_22:
          v23 = 1000 * v22.__d_.__rep_;
LABEL_23:
          if (v23 > (v21.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v24.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_26;
          }
        }
        v24.__d_.__rep_ = v23 + v21.__d_.__rep_;
LABEL_26:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(v7 + 88), &__lk, v24);
        std::chrono::steady_clock::now();
      }
      std::chrono::steady_clock::now();
    }
    v25 = *(_DWORD *)(v7 + 136);
    if ((v25 & 4) != 0)
      goto LABEL_54;
  }
  v25 = *(_DWORD *)(v7 + 136);
LABEL_54:
  v26 = ((v25 >> 2) & 1) == 0;
  if (__lk.__owns_)
  {
    m = __lk.__m_;
LABEL_34:
    std::mutex::unlock(m);
  }
  MEMORY[0x22078A3DC](v16);
  if ((_DWORD)v26)
  {
    _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController getReverseProxySettings:outError:]", CFSTR("PRP timed out %d\n"), v28, v29, v30, v31, v26);
    goto LABEL_37;
  }
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v7 + 24);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v7 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)v7, &__lk);
  v35 = *(_QWORD *)(v7 + 16);
  v58.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v58);
  if (v35)
  {
    v43.__ptr_ = std::exception_ptr::exception_ptr(v36, (const std::exception_ptr *)(v7 + 16));
    std::rethrow_exception(v43);
    __break(1u);
  }
  else
  {
    v41 = *(unsigned __int8 *)(v7 + 140);
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
    do
      v42 = __ldaxr(v9);
    while (__stlxr(v42 - 1, v9));
    if (!v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
    if (v41)
    {
      CFRelease(v16);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v7 = RPCopyProxyDictionary();
      goto LABEL_43;
    }
    _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController getReverseProxySettings:outError:]", CFSTR("Failed to get PRP\n"), v37, v38, v39, v40, v44);
    v7 = 0;
LABEL_37:
    CFRelease(v16);
    if (v7)
    {
LABEL_38:
      v32 = (unint64_t *)(v7 + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
      v7 = 0;
    }
LABEL_43:
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
    std::promise<BOOL>::~promise(&v57);

    return (id)v7;
  }
  return result;
}

void __59__AlohaPairingController_getReverseProxySettings_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  std::exception_ptr v8;

  if ((_DWORD)a2 == 2)
  {
    _ObjCLogNSError(0, 8, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", CFSTR("Proxy Unavailable\n"));
LABEL_9:
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    return;
  }
  if ((_DWORD)a2 != 1)
  {
    _ObjCLogNSError(0, 0, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", CFSTR("Proxy aborted? %d\n"), a2);
    goto LABEL_9;
  }
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", CFSTR("Proxy Available\n"));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (!v3)
    std::__throw_future_error[abi:ne180100](3u);
  std::mutex::lock((std::mutex *)(v3 + 24));
  if ((*(_BYTE *)(v3 + 136) & 1) != 0
    || (v8.__ptr_ = 0, v4 = *(_QWORD *)(v3 + 16), std::exception_ptr::~exception_ptr(&v8), v4))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_BYTE *)(v3 + 140) = 1;
  *(_DWORD *)(v3 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(v3 + 88));
  std::mutex::unlock((std::mutex *)(v3 + 24));
}

- (id)verifyAndRetrieveServerSessionId:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *alohaServerIP;
  NSString *serverSessionID;
  void *v10;
  BOOL v11;
  void *v12;
  NSString *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 3)
  {
    _ObjCLogNSError(0, 1, "-[AlohaPairingController verifyAndRetrieveServerSessionId:]", CFSTR("Malformed sessionId received %@\n"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_fullServerSessionID, a3);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  alohaServerIP = self->_alohaServerIP;
  self->_alohaServerIP = v7;

  serverSessionID = self->_serverSessionID;
  if (!serverSessionID)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v14 = self->_serverSessionID;
    self->_serverSessionID = v13;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSString isEqualToString:](serverSessionID, "isEqualToString:", v10);

  if (!v11)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ObjCLogNSError(0, 1, "-[AlohaPairingController verifyAndRetrieveServerSessionId:]", CFSTR("wrong sessionID received %@, expected %@\n"), v14, self->_serverSessionID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)writeRecord:(id)a3 fileExtension:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  for (i = 0; objc_msgSend(v15, "count") > i; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("AlohaV2Pairing-"), "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathExtension:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString stringByAppendingPathComponent:](self->_debugRecordPath, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createFileAtPath:contents:attributes:", v12, v14, 0);

  }
}

- (NSString)alohaHostname
{
  return self->_alohaHostname;
}

- (void)setAlohaHostname:(id)a3
{
  objc_storeStrong((id *)&self->_alohaHostname, a3);
}

- (SETransceiveHelper)transceiver
{
  return self->_transceiver;
}

- (void)setTransceiver:(id)a3
{
  objc_storeStrong((id *)&self->_transceiver, a3);
}

- (BOOL)useReverseProxy
{
  return self->_useReverseProxy;
}

- (void)setUseReverseProxy:(BOOL)a3
{
  self->_useReverseProxy = a3;
}

- (NSDictionary)reverseProxySettings
{
  return self->_reverseProxySettings;
}

- (void)setReverseProxySettings:(id)a3
{
  objc_storeStrong((id *)&self->_reverseProxySettings, a3);
}

- (NSData)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (NSString)fullServerSessionID
{
  return self->_fullServerSessionID;
}

- (void)setFullServerSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_fullServerSessionID, a3);
}

- (NSString)serverSessionID
{
  return self->_serverSessionID;
}

- (void)setServerSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_serverSessionID, a3);
}

- (NSNumber)alohaVersion
{
  return self->_alohaVersion;
}

- (void)setAlohaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_alohaVersion, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_storeStrong((id *)&self->_ecid, a3);
}

- (NSNumber)apChipId
{
  return self->_apChipId;
}

- (void)setApChipId:(id)a3
{
  objc_storeStrong((id *)&self->_apChipId, a3);
}

- (NSString)debugRecordPath
{
  return self->_debugRecordPath;
}

- (void)setDebugRecordPath:(id)a3
{
  objc_storeStrong((id *)&self->_debugRecordPath, a3);
}

- (NSMutableArray)alohaPlistRecord
{
  return self->_alohaPlistRecord;
}

- (void)setAlohaPlistRecord:(id)a3
{
  objc_storeStrong((id *)&self->_alohaPlistRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alohaPlistRecord, 0);
  objc_storeStrong((id *)&self->_debugRecordPath, 0);
  objc_storeStrong((id *)&self->_apChipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_alohaVersion, 0);
  objc_storeStrong((id *)&self->_serverSessionID, 0);
  objc_storeStrong((id *)&self->_fullServerSessionID, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_reverseProxySettings, 0);
  objc_storeStrong((id *)&self->_transceiver, 0);
  objc_storeStrong((id *)&self->_alohaHostname, 0);
  objc_storeStrong((id *)&self->_alohaServerIP, 0);
}

- (BOOL)submitPairingRecord:(id *)a3
{
  SETransceiveHelper *transceiver;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v25;
  id v26;

  transceiver = self->_transceiver;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v5 = -[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:](transceiver, "getSEPK:andSEID:deleteExisting:error:", &v26, &v25, 1, &v24);
  v6 = v26;
  v7 = v25;
  v8 = v24;
  if (v5 && v6 != 0 && v7 != 0 && v8 == 0)
  {
    objc_msgSend(v7, "asHexString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uppercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("Submitting sePk data to FDR\n"));
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("  SEID: %@\n"), v18);
    objc_msgSend(v6, "base64Encoding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("  sePk: %@\n"), v19);

    v16 = AMFDRDataPutForRestore();
    v15 = 0;
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("Response from AMFDRDataPutForRestore %d (%@)\n"), v16, 0);
    if ((v16 & 1) == 0)
      _ObjCLogWrapOutError(a3, 0, 0, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("Failed to AMFDRDataPutForRestore : %@"), v20, v21, v22, 0);

  }
  else
  {
    v15 = v8;
    _ObjCLogWrapOutError(a3, v8, 0, "-[AlohaPairingController(FDR) submitPairingRecord:]", CFSTR("Failed to get SEPK+SEID: %@"), v9, v10, v11, (uint64_t)v8);
    LOBYTE(v16) = 0;
  }

  return v16;
}

@end
