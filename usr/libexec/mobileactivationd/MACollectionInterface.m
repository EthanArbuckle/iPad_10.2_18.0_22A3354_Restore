@implementation MACollectionInterface

- (MACollectionInterface)initWithContext:(id)a3
{
  MACollectionInterface *v4;
  MACollectionInterface *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MACollectionInterface;
  v4 = -[MACollectionInterface init](&v7, "init");
  v5 = v4;
  if (!v4)
  {
LABEL_5:
    a3 = v5;
    goto LABEL_6;
  }
  if (a3)
  {
    v4->_dark = (DataArk *)a3;
    if (libInFieldCollectionLibraryCore(0))
      v5->_collectionLibraryLoaded = 1;
    goto LABEL_5;
  }
LABEL_6:

  return (MACollectionInterface *)a3;
}

- (void)dealloc
{
  __SecKey *signingKey;
  objc_super v4;

  signingKey = self->_signingKey;
  if (signingKey)
    CFRelease(signingKey);
  self->_signingKey = 0;
  v4.receiver = self;
  v4.super_class = (Class)MACollectionInterface;
  -[MACollectionInterface dealloc](&v4, "dealloc");
}

+ (id)copyIngestURL
{
  __CFString *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  NSURL *v8;

  v2 = CFSTR("https://tbsc.apple.com/ingest/register");
  if (is_internal_build())
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));

    v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InFieldCollectionOverrideURL"));
    v6 = isNSString(v5);

    if (v6)
    {
      v7 = (__CFString *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InFieldCollectionOverrideURL"));

      v2 = v7;
    }
  }
  else
  {
    v4 = 0;
  }
  v8 = +[NSURL URLWithString:](NSURL, "URLWithString:", v2);

  return v8;
}

- (__SecKey)signingKey
{
  __CFString *v3;
  id v4;
  NSDictionary *v5;
  id v6;
  __CFString *v7;
  SecAccessControlRef v8;
  SecAccessControlRef v9;
  __SecKey *v10;
  __SecKey *signingKey;
  CFErrorRef error;
  _QWORD v14[4];
  _QWORD v15[4];

  v3 = (id)kSecAttrKeyTypeECSECPrimeRandom;
  error = 0;
  if (self->_signingKey)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v6 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
    v4 = objc_msgSend(v6, "copyAnswer:", CFSTR("HasPKA"));

    v5 = (NSDictionary *)isNSNumber(v4);
    if (v5)
    {
      if (objc_msgSend(v4, "BOOLValue"))
      {
        v7 = (__CFString *)kSecAttrKeyTypeECSECPrimeRandomPKA;

        v3 = v7;
      }
      v8 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
      if (v8)
      {
        v9 = v8;
        v14[0] = kSecAttrIsPermanent;
        v14[1] = kSecAttrTokenID;
        v15[0] = &__kCFBooleanFalse;
        v15[1] = kSecAttrTokenIDAppleKeyStore;
        v14[2] = kSecAttrKeyType;
        v14[3] = kSecAttrAccessControl;
        v15[2] = v3;
        v15[3] = v8;
        v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
        v10 = SecKeyCreateRandomKey((CFDictionaryRef)v5, &error);
        self->_signingKey = v10;
        if (!v10)
          maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, CFSTR("Failed to create ref key: %@"), error);
        CFRelease(v9);
      }
      else
      {
        maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, CFSTR("Failed to create access control: %@"), error);
        v5 = 0;
      }
    }
    else
    {
      maLog((uint64_t)"-[MACollectionInterface signingKey]", 0, CFSTR("Failed to retrieve PKA state."));
    }
    if (error)
      CFRelease(error);
  }
  signingKey = self->_signingKey;

  return signingKey;
}

- (id)collectSigningAttestation:(id *)a3
{
  id v5;
  NSError *v6;
  id v7;
  NSError *v8;
  id v10;

  if (!-[MACollectionInterface signingKey](self, "signingKey"))
  {
    v6 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSigningAttestation:]", 154, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input"));
    if (!a3)
    {
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
LABEL_5:
    v6 = objc_retainAutorelease(v6);
    v7 = 0;
    *a3 = v6;
    goto LABEL_8;
  }
  v10 = 0;
  v5 = security_create_system_key_attestation((uint64_t)-[MACollectionInterface signingKey](self, "signingKey"), 0, 0, &v10);
  v6 = (NSError *)v10;
  if (!v5)
  {
    v8 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSigningAttestation:]", 160, CFSTR("com.apple.MobileActivation.ErrorDomain"), -11, v6, CFSTR("Failed to attest RK to SIK."));

    v6 = v8;
    if (!a3)
      goto LABEL_7;
    goto LABEL_5;
  }
  v7 = v5;
LABEL_8:

  return v7;
}

- (id)collectSIK:(id *)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSError *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSError *v16;
  id v17;
  NSError *v18;
  uint64_t v20;
  id v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v4 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v5 = objc_msgSend(v4, "copyAnswer:", CFSTR("HasPKA"));

  v6 = isNSNumber(v5);
  if (!v6)
  {
    v10 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", 190, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve PKA state."));
    v9 = 0;
    v14 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v21 = 0;
    v9 = copyPersonalizedFirmwareData(2, (NSError **)&v21);
    v10 = (NSError *)v21;
    if (!v9)
    {
      v12 = CFSTR("Failed to load boot manifest.");
      v13 = 197;
      v16 = v10;
      goto LABEL_14;
    }
    v9 = objc_retainAutorelease(v9);
    v15 = aks_sik_optional_params(0, 0, (uint64_t)objc_msgSend(v9, "bytes"), (uint64_t)objc_msgSend(v9, "length"), &v25, &v24);
    if ((_DWORD)v15)
    {
      v20 = v15;
      v12 = CFSTR("Failed to decode SIK data: 0x%08x");
      v13 = 203;
      goto LABEL_10;
    }
    v7 = v24;
    v8 = v25;
  }
  v11 = aks_sik_collection((uint64_t)v8, v7, &v23, &v22);
  if ((_DWORD)v11)
  {
    v20 = v11;
    v12 = CFSTR("Failed to perform SIK collection: 0x%08x");
    v13 = 210;
LABEL_10:
    v16 = 0;
LABEL_14:
    v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", v13, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v16, v12, v20);

    v14 = 0;
    goto LABEL_15;
  }
  v17 = objc_alloc((Class)NSData);
  v14 = objc_msgSend(v17, "initWithBytesNoCopy:length:", v23, v22);
  if (v14)
  {
    v23 = 0;
    goto LABEL_16;
  }
  v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface collectSIK:]", 216, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to convert data."));

LABEL_15:
  v10 = v18;
LABEL_16:
  if (v25)
    free(v25);
  v25 = 0;
  if (v23)
    free(v23);
  v23 = 0;
  if (a3 && !v14)
    *a3 = objc_retainAutorelease(v10);

  return v14;
}

- (id)collectPCRT:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  NSError *MobileActivationError;
  NSError *v8;
  NSError *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v18 = 0;
  v17 = 0;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v4 = getvsPHbdGfSymbolLoc_ptr;
    v22 = getvsPHbdGfSymbolLoc_ptr;
    if (!getvsPHbdGfSymbolLoc_ptr)
    {
      v5 = (void *)libInFieldCollectionLibrary();
      v4 = dlsym(v5, "vsPHbdGf");
      v20[3] = (uint64_t)v4;
      getvsPHbdGfSymbolLoc_ptr = v4;
    }
    _Block_object_dispose(&v19, 8);
    if (!v4)
      -[MACollectionInterface collectPCRT:].cold.1();
    v6 = ((uint64_t (*)(uint64_t *, unsigned int *))v4)(&v18, &v17);
    if (v6)
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 249, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to collect PCRT: %ld"), v6);
    }
    else
    {
      v11 = objc_alloc((Class)NSData);
      v12 = objc_msgSend(v11, "initWithBytes:length:", v18, v17);
      if (v12)
      {
        v10 = v12;
        v9 = 0;
        goto LABEL_13;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 255, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to convert data."));
    }
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface collectPCRT:]", 243, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Collection library not loaded."));
  }
  v8 = MobileActivationError;
  v9 = v8;
  if (a3)
  {
    v9 = objc_retainAutorelease(v8);
    v10 = 0;
    *a3 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_13:
  v13 = v18;
  if (v18)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v14 = getZshgJnRaSlwnSymbolLoc_ptr;
    v22 = getZshgJnRaSlwnSymbolLoc_ptr;
    if (!getZshgJnRaSlwnSymbolLoc_ptr)
    {
      v15 = (void *)libInFieldCollectionLibrary();
      v14 = dlsym(v15, "ZshgJnRaSlwn");
      v20[3] = (uint64_t)v14;
      getZshgJnRaSlwnSymbolLoc_ptr = v14;
    }
    _Block_object_dispose(&v19, 8);
    if (!v14)
      -[MACollectionInterface collectPCRT:].cold.2();
    ((void (*)(uint64_t))v14)(v13);
  }

  return v10;
}

- (id)signingKeyPublicKeyWithError:(id *)a3
{
  __SecKey *v4;
  __SecKey *v5;
  CFDataRef v6;
  const __CFData *v7;
  NSError *v8;
  NSError *MobileActivationError;
  NSError *v10;
  CFErrorRef error;

  error = 0;
  v4 = SecKeyCopyPublicKey(-[MACollectionInterface signingKey](self, "signingKey"));
  v5 = v4;
  if (v4)
  {
    v6 = SecKeyCopyExternalRepresentation(v4, &error);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      goto LABEL_9;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]", 288, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to RK public key as data."));
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]", 282, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."));
  }
  v10 = MobileActivationError;
  v8 = v10;
  if (a3)
  {
    v8 = objc_retainAutorelease(v10);
    v7 = 0;
    *a3 = v8;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  if (error)
    CFRelease(error);
  error = 0;
  if (v5)
    CFRelease(v5);

  return v7;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  CFDataRef v7;
  const __CFData *v8;
  NSError *v9;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFData *)a3;
  v7 = SecKeyCreateSignature(-[MACollectionInterface signingKey](self, "signingKey"), kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v6, &error);

  if (v7)
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    v9 = createMobileActivationError((uint64_t)"-[MACollectionInterface signatureForData:error:]", 317, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to sign activation data with ref key."));
  }
  if (error)
    CFRelease(error);
  error = 0;
  if (a4 && !v7)
    *a4 = objc_retainAutorelease(v9);

  return v7;
}

- (id)copyIngestHeaders:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSError *v11;
  id v12;
  id v13;
  void *v14;
  NSUUID *v15;
  NSString *v16;
  NSDictionary *v17;
  NSError *v18;
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v6 = a3;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    v21 = 0;
    v7 = -[MACollectionInterface signatureForData:error:](self, "signatureForData:error:", v6, &v21);
    v8 = v21;
    v9 = v8;
    if (v7)
    {
      v20 = v8;
      v10 = -[MACollectionInterface signingKeyPublicKeyWithError:](self, "signingKeyPublicKeyWithError:", &v20);
      v11 = (NSError *)v20;

      if (v10)
      {
        v12 = objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
        v13 = objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
        v14 = v13;
        if (v12 && v13)
        {
          v22[0] = CFSTR("X-Apple-Signature");
          v22[1] = CFSTR("X-Apple-Sig-Key");
          v23[0] = v12;
          v23[1] = v13;
          v22[2] = CFSTR("Content-Type");
          v22[3] = CFSTR("User-Agent");
          v23[2] = CFSTR("application/octet-stream");
          v23[3] = CFSTR("iOS Device Activator (MobileActivation-1006)");
          v22[4] = CFSTR("X-Apple-AL-ID");
          v15 = +[NSUUID UUID](NSUUID, "UUID");
          v16 = -[NSUUID UUIDString](v15, "UUIDString");
          v23[4] = v16;
          v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 5);

          if (!a4)
            goto LABEL_17;
          goto LABEL_15;
        }
        v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 368, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as string."));

      }
      else
      {
        v18 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 358, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy signing key public key: %@"), v11);

        v12 = 0;
        v14 = 0;
      }
      v17 = 0;
      v11 = v18;
      if (!a4)
        goto LABEL_17;
      goto LABEL_15;
    }
    v11 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 352, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create signature for data: %@"), v8);

    v12 = 0;
    v14 = 0;
  }
  else
  {
    v11 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]", 344, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Collection library not loaded."));
    v12 = 0;
    v14 = 0;
    v7 = 0;
  }
  v10 = 0;
  v17 = 0;
  if (!a4)
    goto LABEL_17;
LABEL_15:
  if (!v17)
    *a4 = objc_retainAutorelease(v11);
LABEL_17:

  return v17;
}

- (id)copyIngestData:(id *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSError *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  NSObject *v31;
  id *v32;
  void *v33;
  NSMutableDictionary *v34;
  void *v35;
  NSData *v36;
  NSError *v38;
  NSError *v39;
  id v40;
  DataArk *v41;
  uint64_t v42;
  NSDictionary *v43;
  uint64_t v44;
  id *location;
  id v46;
  id v47;
  id v48;
  id v49;
  id v51;
  id v52;
  _QWORD block[5];
  id v54;
  uint64_t *v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t *v58;
  id obj;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[7];
  _QWORD v77[7];

  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__1;
  v74[4] = __Block_byref_object_dispose__1;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__1;
  v72 = __Block_byref_object_dispose__1;
  v73 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__1;
  v66[4] = __Block_byref_object_dispose__1;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__1;
  v64 = __Block_byref_object_dispose__1;
  v65 = 0;
  if (copyIngestData__onceToken != -1)
    dispatch_once(&copyIngestData__onceToken, &__block_literal_global_1);
  if (!copyIngestData__queue)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 419, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create queue."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v49 = 0;
    v47 = 0;
LABEL_26:
    v48 = 0;
LABEL_27:
    v46 = 0;
    goto LABEL_28;
  }
  if (!is_product_cellular())
  {
    v47 = 0;
    v48 = 0;
    goto LABEL_13;
  }
  v4 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v47 = objc_msgSend(v4, "copyAnswer:", CFSTR("InternationalMobileEquipmentIdentity"));

  v5 = isNSString(v47);
  LODWORD(v4) = v5 == 0;

  if ((_DWORD)v4)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 428, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve IMEI."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v49 = 0;
    goto LABEL_26;
  }
  v6 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v48 = objc_msgSend(v6, "copyAnswer:", CFSTR("xRyzf9zFE/ycr/wJPweZvQ"));

  if (v48)
  {
    v7 = isNSString(v48);
    v8 = v7 == 0;

    if (v8)
    {
      v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 434, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid IMEI2."));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v49 = 0;
      goto LABEL_27;
    }
  }
  v9 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v46 = objc_msgSend(v9, "copyAnswer:", CFSTR("MobileEquipmentIdentifier"));

  if (!v46)
  {
LABEL_13:
    v46 = 0;
    goto LABEL_14;
  }
  v10 = isNSString(v46);
  v11 = v10 == 0;

  if (v11)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 442, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid MEID."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v49 = 0;
LABEL_28:
    v19 = 0;
LABEL_29:
    v22 = 0;
LABEL_30:
    v27 = 0;
LABEL_31:
    v30 = 0;
LABEL_32:
    v33 = 0;
    v34 = 0;
LABEL_33:
    v35 = (void *)v61[5];
    v61[5] = (uint64_t)v12;

LABEL_34:
    v36 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v61[5]);
    goto LABEL_36;
  }
LABEL_14:
  v16 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v49 = objc_msgSend(v16, "copyAnswer:", CFSTR("SerialNumber"));

  v17 = isNSString(v49);
  LODWORD(v16) = v17 == 0;

  if ((_DWORD)v16)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 449, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve serial number."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_28;
  }
  v18 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v19 = objc_msgSend(v18, "copyAnswer:", CFSTR("ProductType"));

  v20 = isNSString(v19);
  LODWORD(v18) = v20 == 0;

  if ((_DWORD)v18)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 455, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve product type."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_29;
  }
  v21 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v22 = objc_msgSend(v21, "copyAnswer:", CFSTR("ProductVersion"));

  v23 = isNSString(v22);
  LODWORD(v21) = v23 == 0;

  if ((_DWORD)v21)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 461, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve product version."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_30;
  }
  v24 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v15 = objc_msgSend(v24, "copyAnswer:", CFSTR("UniqueDeviceID"));

  v25 = isNSString(v15);
  LODWORD(v24) = v25 == 0;

  if ((_DWORD)v24)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 467, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve UDID."));
    v13 = 0;
    v14 = 0;
    goto LABEL_30;
  }
  v26 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v27 = objc_msgSend(v26, "copyAnswer:", CFSTR("BuildVersion"));

  v28 = isNSString(v27);
  LODWORD(v26) = v28 == 0;

  if ((_DWORD)v26)
  {
    v38 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 473, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve OS build."));
LABEL_43:
    v12 = v38;
    v13 = 0;
LABEL_44:
    v14 = 0;
    goto LABEL_31;
  }
  v29 = (id *)(v61 + 5);
  obj = (id)v61[5];
  v13 = -[MACollectionInterface collectSIK:](self, "collectSIK:", &obj);
  objc_storeStrong(v29, obj);
  if (!v13)
  {
    v38 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 481, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v61[5], CFSTR("Failed to collect SIK."));
    goto LABEL_43;
  }
  v30 = objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  if (!v30)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 487, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as string."));
    goto LABEL_44;
  }
  if (!-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    v39 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 492, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to load collection library (verify this is a UI build)."));
LABEL_47:
    v12 = v39;
    v14 = 0;
    goto LABEL_32;
  }
  v31 = copyIngestData__queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __40__MACollectionInterface_copyIngestData___block_invoke_2;
  block[3] = &__block_descriptor_80_e8_32s40s48r56r64r72r_e5_v8__0l;
  v55 = &v68;
  block[4] = self;
  v56 = v66;
  v27 = v27;
  v54 = v27;
  v57 = v74;
  v58 = &v60;
  dispatch_sync(v31, block);

  v32 = (id *)(v61 + 5);
  if (v61[5])
  {
    v14 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_34;
  }
  v52 = 0;
  v14 = -[MACollectionInterface collectSigningAttestation:](self, "collectSigningAttestation:", &v52);
  objc_storeStrong(v32, v52);
  if (!v14)
  {
    v39 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 528, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v61[5], CFSTR("Failed to collect signing key attestation."));
    goto LABEL_47;
  }
  v40 = objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
  v33 = v40;
  if (!v40)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 534, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as string."));
    goto LABEL_32;
  }
  if ((unint64_t)objc_msgSend(v40, "length") > 0xFA0)
  {
    v41 = -[MACollectionInterface dark](self, "dark");
    objc_msgSend(v33, "length");
    writeSplunkLog(v41, 14, -1, (uint64_t)"-[MACollectionInterface copyIngestData:]", 539, 0, CFSTR("%@ is too long: %ld > 4000"), v42, (uint64_t)CFSTR("scrt-part2"));

  }
  v76[0] = CFSTR("scrt-part1");
  v76[1] = CFSTR("scrt-part2");
  v77[0] = v30;
  v77[1] = v33;
  v76[2] = CFSTR("serial-number");
  v76[3] = CFSTR("productType");
  v77[2] = v49;
  v77[3] = v19;
  v76[4] = CFSTR("os-version");
  v76[5] = CFSTR("udid");
  v77[4] = v22;
  v77[5] = v15;
  v76[6] = CFSTR("os-build");
  v77[6] = v27;
  v43 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 7);
  v34 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v43);

  if (v47)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v47, CFSTR("imei"));
  if (v48)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v48, CFSTR("ime2"));
  if (v46)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v46, CFSTR("meid"));
  v44 = v69[5];
  if (v44)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v44, CFSTR("pcrt"));
  location = (id *)(v61 + 5);
  v51 = (id)v61[5];
  v36 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v34, 0, &v51);
  objc_storeStrong(location, v51);
  if (!v36)
  {
    v12 = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]", 572, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v61[5], CFSTR("Failed to convert dictionary to JSON data."));
    goto LABEL_33;
  }
LABEL_36:
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(v74, 8);
  return v36;
}

void __40__MACollectionInterface_copyIngestData___block_invoke(id a1)
{
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_create("com.apple.mobileactivationd.collection", v1);
  v3 = (void *)copyIngestData__queue;
  copyIngestData__queue = (uint64_t)v2;

}

void __40__MACollectionInterface_copyIngestData___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  NSError *MobileActivationError;
  NSError *v27;
  uint64_t v28;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = data_ark_copy(v2, 0, CFSTR("PCRTCollectionString"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v7 = data_ark_copy(v6, 0, CFSTR("PCRTCollectionStringBuild"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = isNSString(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (!v10)
  {
LABEL_6:
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v16 + 40);
    v17 = objc_msgSend(v15, "collectPCRT:", &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v20)
    {
      v21 = objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v24 = objc_msgSend(*(id *)(a1 + 32), "dark");
        data_ark_set(v24, 0, CFSTR("PCRTCollectionString"), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1);

        v25 = objc_msgSend(*(id *)(a1 + 32), "dark");
        data_ark_set(v25, 0, CFSTR("PCRTCollectionStringBuild"), *(void **)(a1 + 40), 1);
LABEL_12:

        return;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2", 510, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as string."));
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2", 504, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("Failed to collect PCRT."));
    }
    v27 = MobileActivationError;
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v25 = *(id *)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = isNSString(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (!v12)
  {

    goto LABEL_6;
  }
  v13 = v12;
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v14 & 1) == 0)
    goto LABEL_6;
}

- (BOOL)processSUInfo:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSError *MobileActivationError;
  NSError *v10;
  BOOL v11;

  v6 = a3;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    v7 = objc_retainAutorelease(v6);
    v8 = NAAB((uint64_t)objc_msgSend(v7, "bytes"), (int)objc_msgSend(v7, "length"));
    if (!(_DWORD)v8)
    {
      v10 = 0;
      v11 = 1;
      goto LABEL_9;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface processSUInfo:withError:]", 600, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to process SUInfo: %d"), v8);
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MACollectionInterface processSUInfo:withError:]", 592, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Collection library not loaded."));
  }
  v10 = MobileActivationError;
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a4 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_9:

  return v11;
}

- (BOOL)collectionLibraryLoaded
{
  return self->_collectionLibraryLoaded;
}

- (void)setCollectionLibraryLoaded:(BOOL)a3
{
  self->_collectionLibraryLoaded = a3;
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)collectPCRT:.cold.1()
{
  NSAssertionHandler *v0;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "OSStatus gCollectInFieldManifest(UInt8 **, UInt32 *)"), CFSTR("MACollectionInterface.m"), 43, CFSTR("%s"), dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

- (void)collectPCRT:.cold.2()
{
  NSAssertionHandler *v0;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void gFreeInFieldManifest(UInt8 *)"), CFSTR("MACollectionInterface.m"), 44, CFSTR("%s"), dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

@end
