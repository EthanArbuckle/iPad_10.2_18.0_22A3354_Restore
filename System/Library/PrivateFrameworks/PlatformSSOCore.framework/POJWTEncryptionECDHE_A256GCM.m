@implementation POJWTEncryptionECDHE_A256GCM

- (POJWTEncryptionECDHE_A256GCM)init
{
  POJWTEncryptionECDHE_A256GCM *v2;
  POJWTEncryptionECDHE_A256GCM *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)POJWTEncryptionECDHE_A256GCM;
  v2 = -[POJWTEncryptionECDHE_A256GCM init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_encryptionAlgorithm, &unk_251520F48);
  return v3;
}

- (void)addValuesToHeader:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setAlg:", CFSTR("ECDH-ES"));
  objc_msgSend(v3, "setEnc:", CFSTR("A256GCM"));

}

- (id)encValueForPsk:(BOOL)a3 auth:(BOOL)a4
{
  return CFSTR("ECDH-ES");
}

- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  __SecKey *v26;
  uint64_t v27;
  const __CFDictionary *v28;
  __SecKey *v29;
  __SecKey *v30;
  id v31;
  const __CFDictionary *v32;
  CFDataRef v33;
  void *v34;
  const __SecRandom *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  int v53;
  id v54;
  id v55;
  id *v56;
  void *v57;
  const __CFAllocator *Default;
  const __CFAllocator *v59;
  void *v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  const __CFDictionary *v68;
  void *v69;
  void *v70;
  void *v71;
  CFDataRef v72;
  id v73;
  _QWORD v74[4];
  int v75;
  _QWORD v76[5];
  CFErrorRef error;
  uint64_t v78;
  void *v79;
  _QWORD v80[3];
  _QWORD v81[5];

  v81[3] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "rawHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v11, "rawIV");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "psso_initWithBase64URLEncodedString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_54();
      LOBYTE(v23) = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v18 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v11, "rawCipherText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "psso_initWithBase64URLEncodedString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_58();
      LOBYTE(v23) = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

      goto LABEL_29;
    }
    v21 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v11, "rawAuthenticationTag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "psso_initWithBase64URLEncodedString:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v73 = v23;
    if (v23)
    {
      objc_msgSend(v11, "decodedHeader");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "epk");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v71 = v20;
        error = 0;
        v26 = (__SecKey *)objc_msgSend(v11, "decodeEphemeralPublicKey");
        if (!v26)
        {
          v27 = *MEMORY[0x24BDE9048];
          v80[0] = *MEMORY[0x24BDE9050];
          v80[1] = v27;
          v81[0] = *MEMORY[0x24BDE9060];
          v81[1] = &unk_251520FC0;
          v80[2] = *MEMORY[0x24BDE9018];
          v81[2] = MEMORY[0x24BDBD1C0];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
          v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v29 = SecKeyCreateRandomKey(v28, &error);
          if (v29)
          {
            v30 = v29;
            v26 = SecKeyCopyPublicKey(v29);
            CFRelease(v30);
          }
          else
          {
            v26 = 0;
          }

        }
        v78 = *MEMORY[0x24BDE9388];
        v79 = &unk_251520FC0;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (!v26
          || (v33 = SecKeyCopyKeyExchangeResult(a4, (SecKeyAlgorithm)*MEMORY[0x24BDE9288], v26, v32, &error),
              CFRelease(v26),
              (v72 = v33) == 0))
        {
          v76[0] = MEMORY[0x24BDAC760];
          v76[1] = 3221225472;
          v76[2] = __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_72;
          v76[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v76[4] = error;
          __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_72((uint64_t)v76);
          *a9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
          v72 = objc_retainAutorelease(v34);
          SecRandomCopyBytes(v35, 0x20uLL, (void *)-[__CFData mutableBytes](v72, "mutableBytes"));
        }
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v20, "length"));
        v65 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "decodedHeader");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "enc");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "dataUsingEncoding:", 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_alloc(MEMORY[0x24BDBCE50]);
        objc_msgSend(v11, "decodedHeader");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "apu");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "psso_initWithBase64URLEncodedString:", v40);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_alloc(MEMORY[0x24BDBCE50]);
        v42 = v41;
        v68 = v32;
        if (v12)
        {
          objc_msgSend(v41, "psso_initWithBase64URLEncodedString:", v12);
          v43 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v11, "decodedHeader");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "apv");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v45);
          v43 = objc_claimAutoreleasedReturnValue();

        }
        v67 = (void *)v43;
        +[POConcatKDF concatKDFWithKey:algorithm:partyUInfo:partyVInfo:](POConcatKDF, "concatKDFWithKey:algorithm:partyUInfo:partyVInfo:", v72, v70, v69, v43);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v23, "bytes");
        objc_msgSend(v23, "length");
        v46 = objc_retainAutorelease(v17);
        objc_msgSend(v46, "bytes");
        objc_msgSend(v46, "length");
        v47 = objc_retainAutorelease(v14);
        objc_msgSend(v47, "bytes");
        objc_msgSend(v47, "length");
        v48 = objc_retainAutorelease(v20);
        objc_msgSend(v48, "bytes");
        v49 = objc_msgSend(v48, "length");
        v66 = objc_retainAutorelease(v65);
        v50 = objc_msgSend(v66, "mutableBytes");
        v51 = objc_retainAutorelease(v73);
        v52 = objc_msgSend(v51, "bytes");
        v64 = objc_msgSend(v51, "length");
        v62 = v49;
        v63 = v50;
        v53 = CCCryptorGCMOneshotDecrypt();
        v54 = objc_retainAutorelease(v23);
        memset_s((void *)objc_msgSend(v54, "mutableBytes", v62, v63, v52, v64), objc_msgSend(v54, "length"), 0, objc_msgSend(v54, "length"));
        LOBYTE(v23) = v53 == 0;
        if (v53)
        {
          v74[0] = MEMORY[0x24BDAC760];
          v74[1] = 3221225472;
          v74[2] = __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_78;
          v74[3] = &__block_descriptor_36_e14___NSError_8__0l;
          v75 = v53;
          __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_78((uint64_t)v74);
          v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = a9;
          v57 = v66;
        }
        else
        {
          Default = CFAllocatorGetDefault();
          v59 = (const __CFAllocator *)SecCFAllocatorZeroize();
          CFAllocatorSetDefault(v59);
          v57 = v66;
          objc_msgSend(v66, "psso_base64URLEncodedString");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setRawBody:", v60);

          CFAllocatorSetDefault(Default);
          objc_msgSend(v11, "updateDecodedBody");
          v55 = 0;
          v56 = a9;
        }
        *v56 = v55;

        v20 = v71;
        goto LABEL_27;
      }
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_66();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = 0;
    }
    else
    {
      __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke_62();
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a9 = v31;
LABEL_27:

    goto LABEL_28;
  }
  __104__POJWTEncryptionECDHE_A256GCM_decodeAndDecryptJWT_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke();
  LOBYTE(v23) = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return (char)v23;
}

- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CFDataRef v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  __SecKey *v27;
  __SecKey *v28;
  SecKeyRef v29;
  __SecKey *v30;
  void *v31;
  CFDataRef v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  const __CFDictionary *v37;
  CFDataRef v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  int v73;
  id v74;
  rsize_t v75;
  rsize_t v76;
  void *v77;
  rsize_t v78;
  rsize_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  rsize_t v84;
  rsize_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _BYTE v92[24];
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  _QWORD *v115;
  _QWORD v116[4];
  int v117;
  _QWORD v118[5];
  unsigned int v119;
  unsigned int v120;
  _QWORD v121[5];
  _QWORD v122[5];
  CFErrorRef error;
  uint64_t v124;
  void *v125;
  _QWORD v126[3];
  _QWORD v127[4];

  v127[3] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  objc_msgSend(v13, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v115 = a10;
    objc_msgSend(v13, "header");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[POJWTEncryptionECDHE_A256GCM addValuesToHeader:](self, "addValuesToHeader:", v16);

    objc_msgSend(v13, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "kid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (!v19)
    {
      v20 = SecKeyCopyExternalRepresentation(a4, 0);
      -[__CFData psso_sha256Hash](v20, "psso_sha256Hash");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "header");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setKid:", v22);

    }
    error = 0;
    v24 = *MEMORY[0x24BDE9060];
    v25 = *MEMORY[0x24BDE9048];
    v126[0] = *MEMORY[0x24BDE9050];
    v126[1] = v25;
    v127[0] = v24;
    v127[1] = &unk_251520FC0;
    v126[2] = *MEMORY[0x24BDE9018];
    v127[2] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v127, v126, 3);
    v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v27 = SecKeyCreateRandomKey(v26, &error);
    if (v27)
    {
      v28 = v27;
      v29 = SecKeyCopyPublicKey(v27);
      if (v29)
      {
        v30 = v29;
        objc_msgSend(v13, "header");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addEphemeralPublicKey:", v30);

        v32 = SecKeyCopyExternalRepresentation(v30, &error);
        CFRelease(v30);
        if (!v32)
        {
          CFRelease(v28);
          v121[0] = MEMORY[0x24BDAC760];
          v121[1] = 3221225472;
          v121[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_93;
          v121[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v121[4] = error;
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_93((uint64_t)v121);
          v41 = 0;
          *v115 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

          goto LABEL_41;
        }
        v114 = v14;
        objc_msgSend(CFSTR("APPLE"), "dataUsingEncoding:", 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        v120 = bswap32(objc_msgSend(v33, "length"));
        objc_msgSend(v34, "appendBytes:length:", &v120, 4);
        v113 = v33;
        objc_msgSend(v34, "appendData:", v33);
        v119 = bswap32(-[__CFData length](v32, "length"));
        objc_msgSend(v34, "appendBytes:length:", &v119, 4);
        objc_msgSend(v34, "appendData:", v32);
        objc_msgSend(v34, "psso_base64URLEncodedString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "header");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setApu:", v35);

        v124 = *MEMORY[0x24BDE9388];
        v125 = &unk_251520FC0;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
        v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v38 = SecKeyCopyKeyExchangeResult(v28, (SecKeyAlgorithm)*MEMORY[0x24BDE9288], a4, v37, &error);
        CFRelease(v28);
        if (!v38)
        {
          v118[0] = MEMORY[0x24BDAC760];
          v118[1] = 3221225472;
          v118[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_98;
          v118[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v118[4] = error;
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_98((uint64_t)v118);
          v41 = 0;
          *v115 = (id)objc_claimAutoreleasedReturnValue();
          v42 = v113;
          goto LABEL_39;
        }
        v39 = objc_msgSend(v13, "setRawEncryptedKey:", &stru_251503878);
        MEMORY[0x24BDAC7A8](v39);
        if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0xCuLL, v92))
        {
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_103();
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          *v115 = v40;
          v42 = v113;
LABEL_39:

          v14 = v114;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v92, 12);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "psso_base64URLEncodedString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setRawIV:", v45);

        objc_msgSend(v13, "rawIV");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_107();
          v53 = (id)objc_claimAutoreleasedReturnValue();
          *v115 = v53;
          v42 = v113;
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v13, "header");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "dataRepresentation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "psso_base64URLEncodedString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setRawHeader:", v48);

        objc_msgSend(v13, "rawHeader");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = v47;
        if (!v41)
        {
          __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_111();
          v54 = (id)objc_claimAutoreleasedReturnValue();
          *v115 = v54;
          v42 = v113;
LABEL_37:

          goto LABEL_38;
        }
        v111 = v44;
        objc_msgSend(v13, "body");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          objc_msgSend(v13, "body");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "dataRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v51, "mutableCopy");

        }
        else
        {
          objc_msgSend(v13, "bodyData");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v55)
            goto LABEL_27;
          objc_msgSend(v13, "bodyData");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v50, "mutableCopy");
        }

        if (v52)
        {
          objc_msgSend(v13, "rawHeader");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "dataUsingEncoding:", 1);
          v108 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
          v107 = (id)objc_claimAutoreleasedReturnValue();
          v105 = v52;
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v52, "length"));
          v106 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "header");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "enc");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "dataUsingEncoding:", 1);
          v110 = (id)objc_claimAutoreleasedReturnValue();

          v59 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend(v13, "header");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "apu");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "psso_initWithBase64URLEncodedString:", v61);
          v109 = (id)objc_claimAutoreleasedReturnValue();

          v62 = objc_alloc(MEMORY[0x24BDBCE50]);
          v63 = v62;
          if (v114)
          {
            objc_msgSend(v62, "psso_initWithBase64URLEncodedString:");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v13, "header");
            v104 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "apv");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "psso_initWithBase64URLEncodedString:", v66);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v104 = v64;
          +[POConcatKDF concatKDFWithKey:algorithm:partyUInfo:partyVInfo:](POConcatKDF, "concatKDFWithKey:algorithm:partyUInfo:partyVInfo:", v38, v110, v109, v64);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v111;
          v103 = v67;
          if (v67)
          {
            v69 = objc_retainAutorelease(v67);
            v102 = v69;
            v101 = (void *)objc_msgSend(v69, "bytes");
            v100 = (id)objc_msgSend(v69, "length");
            v70 = objc_retainAutorelease(v68);
            objc_msgSend(v70, "bytes");
            v99 = objc_msgSend(v70, "length");
            v71 = objc_retainAutorelease(v108);
            v98 = objc_msgSend(v71, "bytes");
            v97 = objc_msgSend(v71, "length");
            v72 = objc_retainAutorelease(v105);
            v96 = objc_msgSend(v72, "bytes");
            v95 = objc_msgSend(v72, "length");
            v94 = objc_retainAutorelease(v106);
            objc_msgSend(v94, "mutableBytes");
            v93 = objc_retainAutorelease(v107);
            objc_msgSend(v93, "mutableBytes");
            v73 = CCCryptorGCMOneshotEncrypt();
            v74 = objc_retainAutorelease(v72);
            v101 = (void *)objc_msgSend(v74, "mutableBytes");
            v75 = objc_msgSend(v74, "length");
            v76 = objc_msgSend(v74, "length");
            memset_s(v101, v75, 0, v76);
            v77 = objc_retainAutorelease(v102);
            v102 = (void *)objc_msgSend(v77, "mutableBytes");
            v78 = objc_msgSend(v77, "length");
            v79 = objc_msgSend(v77, "length");
            memset_s(v102, v78, 0, v79);
            if (v73)
            {
              v116[0] = MEMORY[0x24BDAC760];
              v116[1] = 3221225472;
              v116[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_123;
              v116[3] = &__block_descriptor_36_e14___NSError_8__0l;
              v117 = v73;
              __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_123((uint64_t)v116);
              v80 = (id)objc_claimAutoreleasedReturnValue();
              v41 = 0;
              *v115 = v80;
            }
            else
            {
              objc_msgSend(v94, "psso_base64URLEncodedString");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setRawCipherText:", v86);

              objc_msgSend(v93, "psso_base64URLEncodedString");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setRawAuthenticationTag:", v87);

              *v115 = 0;
              v101 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v13, "rawHeader");
              v115 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "rawEncryptedKey");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "rawIV");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "rawCipherText");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v89;
              objc_msgSend(v13, "rawAuthenticationTag");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "stringWithFormat:", CFSTR("%@.%@.%@.%@.%@"), v115, v102, v88, v89, v90);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v82 = v105;
          }
          else
          {
            __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_119();
            v81 = (id)objc_claimAutoreleasedReturnValue();
            *v115 = v81;
            v82 = v105;
            v83 = objc_retainAutorelease(v105);
            v115 = (_QWORD *)objc_msgSend(v83, "mutableBytes");
            v84 = objc_msgSend(v83, "length");
            v85 = objc_msgSend(v83, "length");
            memset_s(v115, v84, 0, v85);
            v41 = 0;
          }

          goto LABEL_36;
        }
LABEL_27:
        __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_115();
        v65 = (id)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        *v115 = v65;
LABEL_36:
        v42 = v113;
        v44 = v111;
        goto LABEL_37;
      }
      CFRelease(v28);
      __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_89();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v122[0] = MEMORY[0x24BDAC760];
      v122[1] = 3221225472;
      v122[2] = __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_86;
      v122[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v122[4] = error;
      __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke_86((uint64_t)v122);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = 0;
    *v115 = v43;
LABEL_41:

    goto LABEL_42;
  }
  __113__POJWTEncryptionECDHE_A256GCM_encodeAndEncryptJWT_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke();
  v41 = 0;
  *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v41;
}

- (NSNumber)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
}

@end
