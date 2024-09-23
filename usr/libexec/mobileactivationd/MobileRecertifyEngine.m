@implementation MobileRecertifyEngine

- (MobileRecertifyEngine)initWithQueue:(id)a3 dark:(id)a4
{
  id v7;
  id v8;
  MobileRecertifyEngine *v9;
  id *p_isa;
  MobileRecertifyEngine *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MobileRecertifyEngine;
  v9 = -[MobileRecertifyEngine init](&v13, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!v7 || !v8)
    {
      maLog((uint64_t)"-[MobileRecertifyEngine initWithQueue:dark:]", 0, CFSTR("Invalid input"));
      v11 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 1, a4);
  }
  v11 = p_isa;
LABEL_7:

  return v11;
}

- (id)createRecertInfoWithDataArk:(id)a3 alcoholBlob:(NACContextOpaque_ *)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSError *v13;
  NSData *v14;
  NSData *v15;
  void *v16;
  NSDictionary *v17;
  id v18;
  char *v19;
  id v20;
  char *v21;
  void *v22;
  NSUUID *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSDictionary *v31;
  void *v33;
  id v34;
  uint64_t v35;
  NSError *MobileActivationError;
  id v37;
  id v38;
  id v39;
  NSDictionary *v40;
  NSError *v41;
  int v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSError *v47;
  id v48;
  NSUUID *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  char *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  unsigned int v62;
  uint64_t v63;
  SecKeyRef privateKeyRef;
  SecIdentityRef identityRef;
  unsigned int v66;
  unsigned int v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE v70[4096];
  _OWORD v71[16];
  _OWORD v72[3];
  __int128 v73;
  int v74;

  v8 = a3;
  v9 = a5;
  v73 = 0uLL;
  v74 = 0;
  memset(v72, 0, 35);
  memset(v71, 0, sizeof(v71));
  v67 = 256;
  bzero(v70, 0x1000uLL);
  v66 = 4096;
  privateKeyRef = 0;
  identityRef = 0;
  v63 = 0;
  v62 = 0;
  v53 = v9;
  v54 = v8;
  if (v8 && a4)
  {
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    if (v10)
    {
      v11 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
      v61 = 0;
      objc_msgSend(v11, "updateRecertInfo:errors:", v10, &v61);
      v12 = v61;
      v51 = v12;
      v52 = v11;
      if (objc_msgSend(v12, "count"))
      {
        v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 118, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve gestalt values: %@"), v12);
        v55 = 0;
        v48 = 0;
        v49 = 0;
        v14 = 0;
        v50 = 0;
LABEL_23:
        v15 = 0;
        v16 = 0;
        v17 = 0;
        goto LABEL_24;
      }
      v18 = copy_device_certificate(0);
      if (v18)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("DeviceCertificate"));
      v60 = 0;
      v19 = create_cert_request(v8, &v60);
      v20 = v60;
      v21 = v19;
      v22 = v20;
      v50 = v18;
      if (v21)
      {
        v55 = v21;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("DeviceCertRequest"));
        v23 = +[NSUUID UUID](NSUUID, "UUID");
        if (v23)
        {
          v46 = v22;
          v49 = v23;
          v24 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReCertRandomness"));
          v25 = isNSString(v24);

          v48 = v24;
          if (!v25)
          {
            v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 147, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid nonce."));
            v33 = v46;
            goto LABEL_38;
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("ActivationRandomness"));
          if (!load_identity((CFTypeRef *)&identityRef, CFSTR("lockdown-identities"), CFSTR("com.apple.lockdown.identity.activation"), 0, 0))
          {
            v25 = 0;
            v27 = v46;
LABEL_40:
            v58 = 0;
            v14 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v10, 100, 0, &v58);
            v34 = v58;

            if (!v14)
            {
              MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 177, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v34, CFSTR("Could not convert dictionary to xml data."));
              goto LABEL_45;
            }
            v14 = objc_retainAutorelease(v14);
            t1BoNctgaUu66((uint64_t)a4, (uint64_t)-[NSData bytes](v14, "bytes"), -[NSData length](v14, "length"), (uint64_t)&v63);
            if ((_DWORD)v35)
            {
              MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 187, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to sign data: %d"), v35);
LABEL_45:
              v13 = MobileActivationError;

              goto LABEL_46;
            }
            v37 = objc_alloc((Class)NSData);
            v38 = objc_msgSend(v37, "initWithBytes:length:", v63, v62);
            v29 = v38;
            if (!v38)
            {
              v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 194, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to convert signed data."));

              v15 = 0;
              v16 = 0;
              v17 = 0;
              v28 = 0;
              goto LABEL_26;
            }
            v30 = objc_msgSend(v38, "base64EncodedStringWithOptions:", 0);
            if (!v30)
            {
              v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 200, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as base64."));

              v15 = 0;
              v16 = 0;
              v17 = 0;
              v28 = 0;
              goto LABEL_27;
            }
            v39 = objc_alloc_init((Class)NSMutableDictionary);
            v28 = v39;
            if (!v39)
            {
              v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 206, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create dictionary."));

              v15 = 0;
              v16 = 0;
              v17 = 0;
              goto LABEL_27;
            }
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v30, CFSTR("ValidationData"));
            v40 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v10);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, CFSTR("payload"));

            v57 = 0;
            v15 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v28, 100, 0, &v57);
            v13 = (NSError *)v57;

            if (v15)
            {
              v14 = objc_retainAutorelease(v15);
              if (CCDigest(8, -[NSData bytes](v14, "bytes"), -[NSData length](v14, "length"), &v73))
              {
                v41 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 224, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to digest data."));
LABEL_60:
                v47 = v41;

                v15 = 0;
                goto LABEL_61;
              }
              *(_QWORD *)&v72[0] = 0xE2B050609302130;
              DWORD2(v72[0]) = 85590531;
              WORD6(v72[0]) = 1024;
              BYTE14(v72[0]) = 20;
              *(_OWORD *)((char *)v72 + 15) = v73;
              *(_DWORD *)((char *)&v72[1] + 15) = v74;
              wyjYwk((uint64_t)v72, 35, (uint64_t)v71, (uint64_t)&v67, (uint64_t)v70, (uint64_t)&v66);
              if (v42)
              {
                v41 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 258, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to compute fairplay activation signature: %ld"), v42);
                goto LABEL_60;
              }
              v43 = objc_alloc((Class)NSData);
              v15 = (NSData *)objc_msgSend(v43, "initWithBytes:length:", v71, v67);
              if (v15)
              {
                v44 = objc_alloc((Class)NSData);
                v45 = objc_msgSend(v44, "initWithBytes:length:", v70, v66);
                v16 = v45;
                if (v45)
                {
                  v68[0] = CFSTR("CertificateInfoXML");
                  v68[1] = CFSTR("FairPlaySignature");
                  v69[0] = v14;
                  v69[1] = v15;
                  v68[2] = CFSTR("FairPlayCertChain");
                  v69[2] = v45;
                  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
                  goto LABEL_27;
                }
                v47 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 270, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to serialize cert chain."));

                goto LABEL_62;
              }
              v47 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 264, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to serialize signature data."));

            }
            else
            {
              v47 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 215, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v13, CFSTR("Failed to convert dictionary to xml data."));

              v14 = 0;
            }
LABEL_61:
            v16 = 0;
LABEL_62:
            v17 = 0;
            v13 = v47;
            goto LABEL_27;
          }
          v26 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
          if (!(_DWORD)v26 && privateKeyRef)
          {
            v59 = v46;
            v25 = lockcrypto_sign(privateKeyRef, v55, (NSError **)&v59);
            v27 = v59;

            if (v25)
            {
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("IdentitySignature"));
              goto LABEL_40;
            }
            v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 166, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v27, CFSTR("Failed to sign data."));
            v33 = v27;
LABEL_38:

            v14 = 0;
LABEL_46:
            v15 = 0;
            v16 = 0;
            v17 = 0;
            goto LABEL_25;
          }
          v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 160, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy private key: %d"), v26);

LABEL_22:
          v14 = 0;
          goto LABEL_23;
        }
        v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 141, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Could not create UUID."));

      }
      else
      {
        v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 131, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to create certificate request."));

        v55 = 0;
      }
      v48 = 0;
      v49 = 0;
      goto LABEL_22;
    }
    v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 109, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Could not create dictionary."));
  }
  else
  {
    v13 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]", 103, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."));
    v10 = 0;
  }
  v55 = 0;
  v48 = 0;
  v49 = 0;
  v14 = 0;
  v50 = 0;
  v51 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v52 = 0;
LABEL_24:
  v25 = 0;
LABEL_25:
  v28 = 0;
  v29 = 0;
LABEL_26:
  v30 = 0;
LABEL_27:
  if (a6 && !v17)
    *a6 = objc_retainAutorelease(v13);
  if (privateKeyRef)
    CFRelease(privateKeyRef);
  privateKeyRef = 0;
  if (identityRef)
    CFRelease(identityRef);
  identityRef = 0;
  if (v63)
    Be81a395Bf0(v63);
  v31 = v17;

  return v31;
}

- (void)recertifyDevice:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  NSError *v11;
  NSString *v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  id v21;
  void *v22;
  id v23;
  BOOL v24;
  id v25;
  unint64_t v26;
  double v27;
  NSData *v28;
  NSData *v29;
  id v30;
  NSDictionary *v31;
  id v32;
  NSData *v33;
  id v34;
  NSDictionary *v35;
  NSString *v36;
  uint64_t v37;
  NSError *MobileActivationError;
  NSString *v39;
  NSError *v40;
  uint64_t v41;
  NSString *v42;
  id v43;
  id v44;
  id v45;
  NSDictionary *v46;
  NSArray *v47;
  NSDictionary *v48;
  NSDictionary *v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  NSString *v65;
  NSError *v66;
  uint64_t v67;
  NSString *v68;
  NSUUID *v69;
  DataArk *v70;
  id v71;
  char v72;
  id v73;
  NSMutableString *v74;
  id v75;
  id v76;
  NSMutableString *v77;
  id v78;
  id v79;
  uint64_t v80;
  __CFString *v81;
  uint64_t v82;
  NSDictionary *v83;
  OS_dispatch_queue *v84;
  id v85;
  NSString *v86;
  NSError *v87;
  uint64_t v88;
  NSString *v89;
  void *v90;
  NSData *v91;
  NSString *v92;
  id v93;
  id v94;
  NSError *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  NSDictionary *v101;
  NSDictionary *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  NSData *v108;
  id v109;
  _QWORD block[5];
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125[2];
  NSDictionary *v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  const __CFString *v130;
  NSString *v131;
  NSDictionary *v132;
  const __CFString *v133;
  NSArray *v134;
  const __CFString *v135;
  NSDictionary *v136;
  _QWORD v137[2];
  _QWORD v138[2];

  v4 = a3;
  v128 = 0;
  v129 = 0;
  v127 = 0;
  v126 = 0;
  v5 = -[MobileRecertifyEngine queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v5);

  v6 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://albert.apple.com/deviceservices/certifySB"));
  v7 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://static.ips.apple.com/absinthe-cert/certificate.cer"));
  v8 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", CFSTR("https://albert.apple.com/deviceservices/session"));
  v104 = v7;
  v105 = v6;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  v107 = v8;
  if (v9 || v8 == 0)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 345, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate URL."));
    v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v106 = 0;
    v103 = 0;
LABEL_24:
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v36 = 0;
    v109 = 0;
LABEL_25:
    v29 = 0;
    goto LABEL_37;
  }
  if (is_internal_build())
  {
    v14 = objc_alloc((Class)NSUserDefaults);
    v15 = objc_msgSend(v14, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));

    v16 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UseReverseProxy"));
    v17 = isNSNumber(v16);
    v103 = v15;
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UseReverseProxy"));
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
      {
        v21 = copyReverseProxyDictionary(0, 0, 0);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          goto LABEL_19;
        }
      }
    }
    else
    {

    }
  }
  else
  {
    v103 = 0;
  }
  v125[1] = 0;
  v24 = networkReachable();
  v23 = 0;
  if (!v24)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 360, CFSTR("com.apple.MobileActivation.ErrorDomain"), -17, v23, CFSTR("Network is unavailable."));

    v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v106 = 0;
    goto LABEL_24;
  }
  v22 = 0;
LABEL_19:
  v25 = objc_alloc((Class)NSMutableURLRequest);
  LODWORD(v26) = NETWORK_TIMEOUT_SECONDS;
  v27 = (double)v26;
  v28 = (NSData *)objc_msgSend(v25, "initWithURL:cachePolicy:timeoutInterval:", v7, 1, (double)v26);
  v29 = v28;
  v106 = v22;
  if (!v28)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 368, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate request."));

    v12 = 0;
    v101 = 0;
    v102 = 0;
    v108 = 0;
    v109 = 0;
LABEL_34:
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v32 = 0;
    v33 = 0;
LABEL_35:
    v34 = 0;
    v35 = 0;
    v31 = 0;
    goto LABEL_36;
  }
  -[NSData setValue:forHTTPHeaderField:](v28, "setValue:forHTTPHeaderField:", CFSTR("Absinthe/2.0 iOS Device Activator (MobileActivation-1006 built on Aug  7 2024 at 23:59:22)"), CFSTR("User-Agent"));
  v124 = v23;
  v125[0] = 0;
  v12 = (NSString *)talkToServerWithError(v29, 0, 0, v22, v125, &v126, &v124);
  v109 = v125[0];
  v30 = v124;

  v31 = v126;
  if (v126 != (NSDictionary *)200)
  {
    if (!v126)
    {
      v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 377, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v30, CFSTR("Network communication error."));

      v101 = 0;
      v102 = 0;
      v108 = 0;
      v99 = 0;
      v100 = 0;
      v97 = 0;
      v98 = 0;
      v96 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
LABEL_36:
      v36 = 0;
      goto LABEL_37;
    }
    v39 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
    v40 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 382, CFSTR("com.apple.MobileActivation.ServerErrorDomain"), (uint64_t)v31, v30, CFSTR("Server error: %ld (%@)"), v31, v39);

    v41 = (uint64_t)v126;
    v42 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 382, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v40, CFSTR("Server error: %ld (%@)"), v41, v42);

    goto LABEL_33;
  }
  if (!v12)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 387, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v30, CFSTR("Failed to get a response from the server."));
    goto LABEL_32;
  }
  v12 = objc_retainAutorelease(v12);
  KxmB0CKvgWt((uint64_t)-[NSString bytes](v12, "bytes"), (int)-[NSString length](v12, "length"));
  if ((_DWORD)v37)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 393, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to initialize NAC: %d"), v37);
LABEL_32:
    v11 = MobileActivationError;
LABEL_33:

    v101 = 0;
    v102 = 0;
    v108 = 0;
    goto LABEL_34;
  }
  v137[0] = CFSTR("id");
  v137[1] = CFSTR("request");
  v138[0] = &off_100271778;
  v43 = objc_alloc((Class)NSData);
  v44 = objc_msgSend(v43, "initWithBytesNoCopy:length:freeWhenDone:", v128, v127, 0);
  v45 = objc_msgSend(v44, "base64EncodedStringWithOptions:", 0);
  v138[1] = v45;
  v46 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v138, v137, 2);

  v135 = CFSTR("absinthe-operations");
  v132 = v46;
  v133 = CFSTR("create-session-info");
  v102 = v46;
  v47 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1);
  v134 = v47;
  v48 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
  v136 = v48;
  v49 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);

  v123 = v30;
  v33 = +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v49, 0, &v123);
  v50 = v123;

  v108 = v33;
  v101 = v49;
  if (!v33)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 406, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v50, CFSTR("Failed to serialize data."));

    v108 = 0;
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v32 = 0;
    goto LABEL_35;
  }
  v33 = (NSData *)objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v107, 1, v27);

  if (!v33)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 415, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate request."));

    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v32 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v36 = 0;
    goto LABEL_25;
  }
  -[NSData setHTTPBody:](v33, "setHTTPBody:", v108);
  -[NSData setValue:forHTTPHeaderField:](v33, "setValue:forHTTPHeaderField:", CFSTR("Absinthe/2.0 iOS Device Activator (MobileActivation-1006 built on Aug  7 2024 at 23:59:22)"), CFSTR("User-Agent"));
  -[NSData setValue:forHTTPHeaderField:](v33, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[NSData setHTTPMethod:](v33, "setHTTPMethod:", CFSTR("POST"));
  v121 = v50;
  v122 = v109;
  v36 = (NSString *)talkToServerWithError(v33, 0, 0, v106, &v122, &v126, &v121);
  v93 = v122;

  v51 = v121;
  v52 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    v91 = v33;
    v92 = v36;
    if (v126)
    {
      v65 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
      v66 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 433, CFSTR("com.apple.MobileActivation.ServerErrorDomain"), v52, v51, CFSTR("Server error: %ld (%@)"), v52, v65);

      v67 = (uint64_t)v126;
      v68 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
      v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 433, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v66, CFSTR("Server error: %ld (%@)"), v67, v68);

    }
    else
    {
      v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 428, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v51, CFSTR("Network communication error."));
    }

    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    goto LABEL_61;
  }
  if (!v36)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 438, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v51, CFSTR("Failed to get response from server."));

    v12 = 0;
    v99 = 0;
    v100 = 0;
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v32 = 0;
    v29 = v33;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
LABEL_72:
    v109 = v93;
    goto LABEL_37;
  }
  v120 = v51;
  v53 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v36, 1, &v120);
  v54 = v120;

  if (!v53)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 444, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v54, CFSTR("Failed to serialize json data."));

    v99 = 0;
    v100 = 0;
LABEL_68:
    v97 = 0;
    v98 = 0;
    v96 = 0;
    v32 = 0;
    v29 = v33;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v12 = v36;
    v36 = 0;
    goto LABEL_72;
  }
  v55 = objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("absinthe-results"));
  v56 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("create-session-info"));

  v57 = isNSArray(v56);
  v99 = v56;
  v100 = v53;
  if (!v57)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 481, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing one drink: %@"), v53);

    goto LABEL_68;
  }
  v92 = v36;
  v58 = objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
  v59 = isNSDictionary(v58);

  v98 = v58;
  if (!v59)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 487, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing two drinks: %@"), v53);

    v97 = 0;
LABEL_71:
    v96 = 0;
    v32 = 0;
    v29 = v33;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v36 = 0;
    v12 = v92;
    goto LABEL_72;
  }
  v60 = objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("session-info"));
  v61 = isNSString(v60);

  v97 = v60;
  if (!v61)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 493, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing three drinks: %@"), v53);

    goto LABEL_71;
  }
  v91 = v33;
  v62 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v60, 1);
  if (!v62)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 499, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing four drinks: %@"), v53);

LABEL_61:
    v96 = 0;
    goto LABEL_62;
  }
  v63 = v129;
  v96 = objc_retainAutorelease(v62);
  nDYmeMqvWb(v63, (uint64_t)objc_msgSend(v96, "bytes"), (int)objc_msgSend(v96, "length"));
  if ((_DWORD)v64)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 505, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("NACKeyEstablishment failed: %d"), v64);

LABEL_62:
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v36 = 0;
LABEL_63:
    v12 = v92;
    v109 = v93;
LABEL_64:
    v29 = v91;
    goto LABEL_37;
  }
  v69 = +[NSUUID UUID](NSUUID, "UUID");
  v36 = -[NSUUID UUIDString](v69, "UUIDString");

  if (!v36)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 511, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create nonce."));

    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    goto LABEL_63;
  }
  v130 = CFSTR("ReCertRandomness");
  v131 = v36;
  v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
  v70 = -[MobileRecertifyEngine dark](self, "dark");
  v119 = v54;
  v32 = -[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:](self, "createRecertInfoWithDataArk:alcoholBlob:options:error:", v70, v129, v31, &v119);
  v71 = v119;

  if (!v32)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 519, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v71, CFSTR("Failed to create recert info."));

    v33 = 0;
LABEL_87:
    v34 = 0;
    v35 = 0;
    goto LABEL_63;
  }
  v117 = v71;
  v118 = 0;
  v72 = createActivationRequest(v32, &v118, 1, (NSError **)&v117);
  v33 = (NSData *)v118;
  v73 = v117;

  if ((v72 & 1) == 0)
  {
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 526, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v73, CFSTR("Failed to create recert request."));

    goto LABEL_87;
  }
  -[NSData setURL:](v33, "setURL:", v105);
  -[NSData setTimeoutInterval:](v33, "setTimeoutInterval:", v27);
  if (is_internal_build())
  {
    v74 = formatURLRequest(v33);
    v75 = copy_log_directory_path();
    v76 = objc_msgSend(v75, "stringByAppendingPathComponent:", CFSTR("recert_request.txt"));
    -[NSMutableString writeToFile:atomically:encoding:error:](v74, "writeToFile:atomically:encoding:error:", v76, 0, 4, 0);

  }
  v115 = v73;
  v116 = v93;
  v34 = talkToServerWithError(v33, 0, 0, v106, &v116, &v126, &v115);
  v109 = v116;

  v94 = v115;
  if (is_internal_build())
  {
    v77 = formatURLResponse(v34, (uint64_t)v126, v109);
    v78 = copy_log_directory_path();
    v79 = objc_msgSend(v78, "stringByAppendingPathComponent:", CFSTR("recert_response.txt"));
    -[NSMutableString writeToFile:atomically:encoding:error:](v77, "writeToFile:atomically:encoding:error:", v79, 0, 4, 0);

  }
  v80 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    if (v126)
    {
      v86 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
      v87 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 549, CFSTR("com.apple.MobileActivation.ServerErrorDomain"), v80, v94, CFSTR("Server error: %ld (%@)"), v80, v86);

      v88 = (uint64_t)v126;
      v89 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v126);
      v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 549, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v87, CFSTR("Server error: %ld (%@)"), v88, v89);

      v90 = v94;
LABEL_94:

      v35 = 0;
      goto LABEL_95;
    }
    v81 = CFSTR("Network communication error.");
    v82 = 544;
LABEL_93:
    v11 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", v82, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, v94, v81);
    v90 = v94;
    goto LABEL_94;
  }
  if (!v34)
  {
    v81 = CFSTR("Failed to get response from server.");
    v82 = 554;
    goto LABEL_93;
  }
  v114 = v94;
  v83 = getRecertInfoFromData(v34, &v114);
  v11 = (NSError *)v114;

  if (v83)
  {
    v84 = -[MobileRecertifyEngine queue](self, "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904;
    block[2] = __41__MobileRecertifyEngine_recertifyDevice___block_invoke;
    block[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
    block[4] = self;
    v35 = v83;
    v111 = v35;
    v31 = v31;
    v112 = v31;
    v113 = v4;
    v85 = v4;
    dispatch_async((dispatch_queue_t)v84, block);

    v4 = 0;
LABEL_95:
    v12 = v92;
    goto LABEL_64;
  }
  v95 = createMobileActivationError((uint64_t)"-[MobileRecertifyEngine recertifyDevice:]", 563, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v11, CFSTR("Failed to retrieve recert info from data."));

  v35 = 0;
  v29 = v91;
  v12 = v92;
  v11 = v95;
LABEL_37:
  if (v129)
    IW1PcFszqNK(v129);
  if (v128)
    Be81a395Bf0(v128);
  if (v4)
    (*((void (**)(id, NSError *))v4 + 2))(v4, v11);

}

void __41__MobileRecertifyEngine_recertifyDevice___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v7 = 0;
  handle_recert(v2, v3, v4, (uint64_t)&v7);
  v5 = v7;

  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (DataArk)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
  objc_storeStrong((id *)&self->_dark, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dark, 0);
}

@end
