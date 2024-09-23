@implementation AlohaPairingVerifier

- (AlohaPairingVerifier)initWithController:(shared_ptr<SEUpdater:(const AlohaVerificationOptions *)a4 :P73BaseSEController>)a3 options:
{
  __shared_weak_count *cntrl;
  P73BaseSEController *ptr;
  AlohaPairingVerifier *v6;
  SETransceiveHelper *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  SETransceiveHelper *transceiver;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSData *seid;
  uint64_t v18;
  std::__shared_weak_count *v19;
  objc_super v20;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v20.receiver = self;
  v20.super_class = (Class)AlohaPairingVerifier;
  v6 = -[AlohaPairingVerifier init](&v20, sel_init, a3.__ptr_, a3.__cntrl_, a4);
  if (v6)
  {
    v7 = [SETransceiveHelper alloc];
    v8 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v18 = *(_QWORD *)ptr;
    v19 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = -[SETransceiveHelper initWithSEController:](v7, "initWithSEController:", &v18);
    transceiver = v6->_transceiver;
    v6->_transceiver = (SETransceiveHelper *)v11;

    v13 = v19;
    if (v19)
    {
      v14 = (unint64_t *)&v19->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    seid = v6->_seid;
    v6->_seid = 0;

    v6->_options = (const AlohaVerificationOptions *)cntrl;
  }
  return v6;
}

- (void)invalidate
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier invalidate]", CFSTR("AlohaPairingVerified invalidated\n"));
  -[SETransceiveHelper invalidate](self->_transceiver, "invalidate");
}

- (id)performAlohaVerification
{
  SETransceiveHelper *transceiver;
  NSData *v4;
  NSError *v5;
  NSData *seid;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  NSError *v10;
  BOOL v11;
  void *v12;
  id v13;
  NSError *v14;
  NSData *v15;
  void *v16;
  id v17;
  NSError *v18;
  SETransceiveHelper *v19;
  BOOL v20;
  NSError *v21;
  BOOL v22;
  NSData *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t (*v29)(uint64_t);
  BOOL v31;
  NSError *v32;
  BOOL v33;
  const void *v34[2];
  const void *v35[2];
  const void *v36;
  const void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  transceiver = self->_transceiver;
  v44 = 0;
  v4 = -[SETransceiveHelper copySeid:](transceiver, "copySeid:", &v44);
  v5 = (NSError *)v44;
  seid = self->_seid;
  self->_seid = v4;

  if (self->_seid)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v43 = 0;
    v9 = -[AlohaPairingVerifier injectSEPKtoSSE:](self, "injectSEPKtoSSE:", &v43);
    v10 = (NSError *)v43;
    if (v10)
      v11 = 0;
    else
      v11 = v9;
    if (!v11)
    {
      v5 = v10;
      _ObjCLogNSError(v10, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("injectSEPKtoSSE"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    v42 = 0;
    v41 = 0;
    -[AlohaPairingVerifier getSharingRequestWithSignature:withError:](self, "getSharingRequestWithSignature:withError:", &v42, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v42;
    v14 = (NSError *)v41;
    v5 = v14;
    if (v14 || !v12 || !v13)
    {
      _ObjCLogNSError(v14, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("getSharingRequestWithSignature"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
    v15 = self->_seid;
    v39 = 0;
    v40 = 0;
    -[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:](self, "performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:", v15, v12, v13, &v40, &v39);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v40;
    v18 = (NSError *)v39;
    v5 = v18;
    if (!v18 && v16 && v17)
    {
      v19 = self->_transceiver;
      v38 = 0;
      v20 = -[SETransceiveHelper crsSetSharingResult:signature:error:](v19, "crsSetSharingResult:signature:error:", v16, v17, &v38);
      v21 = (NSError *)v38;
      if (v21)
        v22 = 0;
      else
        v22 = v20;
      if (v22)
      {
        v36 = 0;
        v37 = 0;
        v23 = self->_seid;
        v35[0] = 0;
        v35[1] = &v37;
        v34[0] = 0;
        v34[1] = &v36;
        v24 = SSEGetEntangledAuthorizationRandom(-1, (const __CFData *)v23, 0, (CFDataRef *)v35, (CFDataRef *)v34);
        ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy(v34);
        ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy(v35);
        if ((_DWORD)v24)
          goto LABEL_21;
        v29 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
        if (!(v37
             ? ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get
             : 0))
          goto LABEL_21;
        if (!v36)
          v29 = 0;
        if (v29)
        {
          v31 = -[SETransceiveHelper setAuthRandom:mac:error:](self->_transceiver, "setAuthRandom:mac:error:");
          v32 = (NSError *)0;
          if (v32)
            v33 = 0;
          else
            v33 = v31;
          if (v33)
          {
            v5 = 0;
            v26 = 0;
            goto LABEL_23;
          }
          v5 = v32;
          _ObjCLogNSError(v32, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("setAuthRandom"));
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_21:
          v5 = 0;
          _ObjCLogNSError(0, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("SSEGetAuthorizationRandom %d"), v24);
          v25 = objc_claimAutoreleasedReturnValue();
        }
        v26 = (void *)v25;
LABEL_23:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v37);
LABEL_30:

        goto LABEL_31;
      }
      v5 = v21;
      _ObjCLogNSError(v21, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("crsSetSharingResult"));
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _ObjCLogNSError(v18, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("performAuthKeySharingWithAppleSSE"));
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v27;
    goto LABEL_30;
  }
  _ObjCLogNSError(v5, 14, "-[AlohaPairingVerifier performAlohaVerification]", CFSTR("copySEID"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_25:
  v26 = (void *)v8;
LABEL_32:

  return v26;
}

- (BOOL)injectSEPKtoSSE:(id *)a3
{
  if (self->_options->var0)
    return -[AlohaPairingVerifier injectSEPKtoSSE_Debug:](self, "injectSEPKtoSSE_Debug:", a3);
  else
    return -[AlohaPairingVerifier injectSEPKtoSSE_FDR:](self, "injectSEPKtoSSE_FDR:", a3);
}

- (BOOL)injectSEPKtoSSE_Debug:(id *)a3
{
  SETransceiveHelper *transceiver;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  mach_port_t SSEIOConnect;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  mach_port_t v31;
  BOOL v32;
  id v34;
  id v35;
  id v36;
  _DWORD inputStruct[25];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  transceiver = self->_transceiver;
  v35 = 0;
  v36 = 0;
  v34 = 0;
  v5 = -[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:](transceiver, "getSEPK:andSEID:deleteExisting:error:", &v36, &v35, 0, &v34);
  v6 = v36;
  v7 = v35;
  v8 = v34;
  v13 = v8;
  if (!v5 || v8 != 0 || v6 == 0 || v7 == 0)
  {
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", CFSTR("Failed to getSEPK : %@"), v9, v10, v11, v12, (uint64_t)v8);
  }
  else
  {
    memset(&inputStruct[1], 0, 94);
    inputStruct[0] = 1397966179;
    LOBYTE(inputStruct[1]) = -10;
    LOWORD(inputStruct[2]) = 258;
    SSEIOConnect = getSSEIOConnect();
    v18 = IOConnectCallStructMethod(SSEIOConnect, 0, inputStruct, 0x62uLL, 0, 0);
    if ((_DWORD)v18)
    {
      v23 = CFSTR("Unable to EnableTestSEContext %d");
    }
    else
    {
      LOBYTE(inputStruct[2]) = 3;
      v24 = objc_retainAutorelease(v7);
      v25 = objc_msgSend(v24, "bytes");
      v26 = *(_OWORD *)v25;
      *(_QWORD *)((char *)&inputStruct[6] + 1) = *(_QWORD *)(v25 + 16);
      *(_OWORD *)((char *)&inputStruct[2] + 1) = v26;
      v27 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
      *(_OWORD *)((char *)&inputStruct[8] + 1) = *(_OWORD *)v27;
      v28 = *(_OWORD *)(v27 + 16);
      v29 = *(_OWORD *)(v27 + 32);
      v30 = *(_OWORD *)(v27 + 48);
      BYTE1(inputStruct[24]) = *(_BYTE *)(v27 + 64);
      *(_OWORD *)((char *)&inputStruct[20] + 1) = v30;
      *(_OWORD *)((char *)&inputStruct[16] + 1) = v29;
      *(_OWORD *)((char *)&inputStruct[12] + 1) = v28;
      v31 = getSSEIOConnect();
      v18 = IOConnectCallStructMethod(v31, 0, inputStruct, 0x62uLL, 0, 0);
      if (!(_DWORD)v18)
      {
        _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", CFSTR("Successfully debug-injected SE Public Key into SSE for SEID %@\n"), v24);
        v32 = 1;
        goto LABEL_19;
      }
      v23 = CFSTR("Error code %d received when setting SE PK in SSE");
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", v23, v19, v20, v21, v22, v18);
  }
  v32 = 0;
LABEL_19:

  return v32;
}

- (BOOL)injectSEPKtoSSE_FDR:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SETransceiveHelper *transceiver;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFData *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  void **v34;
  id v35;
  void *v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  v37[0] = CFSTR("VerifyData");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  v37[1] = CFSTR("StripImg4");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v6;
  v37[2] = CFSTR("GetCombined");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  transceiver = self->_transceiver;
  v35 = 0;
  v11 = -[SETransceiveHelper copySeid:](transceiver, "copySeid:", &v35);
  v12 = v35;
  v16 = v12;
  if (!v11 || v12)
  {
    _ObjCLogWrapOutError(a3, v12, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("Failed to copy SEID"), v13, v14, v15, v31);
    v24 = 0;
    goto LABEL_11;
  }
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("Passing fdrOptions %@"), v9);
  objc_msgSend(v11, "asHexString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uppercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = &v36;
  v19 = (const __CFData *)AMFDRSealingMapCopyLocalData();
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(&v33);
  if (!v19)
    goto LABEL_7;
  v20 = ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get;
  if (!v36)
    v20 = 0;
  if (!v20)
  {
    v26 = SSESetSEPubKey((const __CFData *)self->_seid, v19);
    if (!(_DWORD)v26)
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("Successfully FDR-injected SE Public Key into SSE for SEID %@\n"), self->_seid, v33, v34);
      v24 = 1;
      goto LABEL_9;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("SSESetSEPubKey returned %d\n"), v27, v28, v29, v30, v26);
  }
  else
  {
LABEL_7:
    _ObjCLog(0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("Error from AMFDRSealingMapCopyLocalData: %@"), v36, v33, v34);
    _ObjCLogWrapOutError(a3, v36, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", CFSTR("AMFDRSealingMapCopyLocalData"), v21, v22, v23, v32);
  }
  v24 = 0;
LABEL_9:

LABEL_11:
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v36);
  return v24;
}

- (id)getSharingRequestWithSignature:(id *)a3 withError:(id *)a4
{
  SETransceiveHelper *transceiver;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  id v22;

  transceiver = self->_transceiver;
  v22 = 0;
  -[SETransceiveHelper crsGetSharingRequestWithError:](transceiver, "crsGetSharingRequestWithError:", &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v12 = v8;
  if (v7)
    v13 = v8 == 0;
  else
    v13 = 0;
  if (v13)
  {
    if ((unint64_t)objc_msgSend(v7, "length") > 0x40)
    {
      objc_msgSend(v7, "subdataWithRange:", 65, objc_msgSend(v7, "length") - 65);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subdataWithRange:", 0, 65);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_msgSend(v7, "length");
      _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingVerifier getSharingRequestWithSignature:withError:]", CFSTR("Unexpected length for sharing request %u\n"), v16, v17, v18, v19, v15);
      v14 = 0;
    }
  }
  else
  {
    _ObjCLogWrapOutError(a4, v8, 0, "-[AlohaPairingVerifier getSharingRequestWithSignature:withError:]", CFSTR("Failed to get sharing request\n"), v9, v10, v11, v21);
    v14 = 0;
  }

  return v14;
}

- (id)performAuthKeySharingWithAppleSSE:(id)a3 sharingRequest:(id)a4 requestSignature:(id)a5 resultSignature:(id *)a6 withError:(id *)a7
{
  const __CFData *v11;
  const __CFData *v12;
  const __CFData *v13;
  uint64_t v14;
  CFDataRef v15;
  const __CFData *v16;
  const __CFData *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFDataRef v23;
  CFDataRef v24;

  v11 = (const __CFData *)a3;
  v12 = (const __CFData *)a4;
  v13 = (const __CFData *)a5;
  v23 = 0;
  v24 = 0;
  v14 = SSEPerformAuthKeySharing(v11, v12, v13, &v24, &v23);
  v15 = v24;
  v16 = v23;
  *a6 = v16;
  if (!(_DWORD)v14 && v15 && v16)
  {
    v17 = v15;
  }
  else
  {
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", CFSTR("Performed sharing with SEID %@\n"), v11);
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", CFSTR("  request    %@\n"), v12);
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", CFSTR("  requestSig %@\n"), v13);
    _ObjCLogOutError((uint64_t *)a7, 0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", CFSTR("Bad status received when sharing auth key %d or nil for sharing result %d or nil for sharing result signature %d\n"), v18, v19, v20, v21, v14);
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_transceiver, 0);
}

@end
