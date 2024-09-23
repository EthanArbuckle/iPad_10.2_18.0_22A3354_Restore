id getSecKeyPublicBytes(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 && a2)
  {
    *a2 = 0;
    v3 = SecKeyCopyPublicBytes();
    v4 = 0;
    *a2 = v4;
    if ((_DWORD)v3 || (v5 = 0, !v4))
    {
      SESDefaultLogObject();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v6, SESErrorDomain, 0, CFSTR("Could not retrieve public key bytes : %d"), v7, v8, v9, v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v12, SESErrorDomain, 1, CFSTR("Nil parameter to getSecKeyPublicBytes"), v13, v14, v15, v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id ECIES_V1(__SecKey *a1, __SecKey *a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6, _QWORD *a7)
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFDictionary *v37;
  CFDataRef v38;
  CFDataRef v39;
  void *v40;
  const __CFData *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  const __CFData *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  CFErrorRef error;
  id v63;
  id v64;
  _QWORD v65[2];
  _QWORD v66[3];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = v13;
  if (!a1 || !a2 || !a3 || !a4 || !v13 || !a7)
  {
    SESDefaultLogObject();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v15, SESErrorDomain, 1, CFSTR("Nil parameter to ECIES_V1"), v19, v20, v21, v61);
    goto LABEL_10;
  }
  if (a5 >= 2)
  {
    SESDefaultLogObject();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v15, SESErrorDomain, 1, CFSTR("Invalid ECIESOperationKind %d"), v16, v17, v18, a5);
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v64 = 0;
  getSecKeyPublicBytes(a3, &v64);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v64;
  if (v23)
  {
    SESDefaultLogObject();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = SESErrorDomain;
    v26 = objc_msgSend(v23, "code");
    SESCreateAndLogError(0, v24, v25, v26, CFSTR("Failed to get sender public key data"), v27, v28, v29, v61);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = 0;
    getSecKeyPublicBytes(a4, &v63);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v63;
    if (v23)
    {
      SESDefaultLogObject();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = SESErrorDomain;
      v32 = objc_msgSend(v23, "code");
      SESCreateAndLogError(0, v30, v31, v32, CFSTR("Failed to get receiver public key data"), v33, v34, v35, v61);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(v30, "appendData:", v24);
      v36 = *MEMORY[0x24BDE9390];
      v65[0] = *MEMORY[0x24BDE9388];
      v65[1] = v36;
      v66[0] = &unk_251CC8B20;
      v66[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      error = 0;
      v38 = SecKeyCopyKeyExchangeResult(a1, (SecKeyAlgorithm)*MEMORY[0x24BDE9290], a2, v37, &error);
      v39 = v38;
      v23 = error;
      if (error || -[__CFData length](v38, "length") != 32)
      {
        SESDefaultLogObject();
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v46 = SESErrorDomain;
        v47 = objc_msgSend(v23, "code");
        SESCreateAndLogError(0, v44, v46, v47, CFSTR("Failed to SecKeyCopyKeyExchangeResult"), v48, v49, v50, v61);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v14, "length") + 16);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_retainAutorelease(v39);
          -[__CFData bytes](v41, "bytes");
          -[__CFData bytes](objc_retainAutorelease(v41), "bytes");
          v42 = objc_retainAutorelease(v14);
          objc_msgSend(v42, "bytes");
          objc_msgSend(v42, "length");
          v43 = objc_retainAutorelease(v40);
          objc_msgSend(v43, "mutableBytes");
          v44 = objc_retainAutorelease(v43);
          objc_msgSend(v44, "bytes");
          objc_msgSend(v42, "length");
          v45 = CCCryptorGCMOneshotEncrypt();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v14, "length") - 16);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_retainAutorelease(v39);
          -[__CFData bytes](v53, "bytes");
          -[__CFData bytes](objc_retainAutorelease(v53), "bytes");
          v54 = objc_retainAutorelease(v14);
          objc_msgSend(v54, "bytes");
          objc_msgSend(v54, "length");
          v44 = objc_retainAutorelease(v52);
          objc_msgSend(v44, "mutableBytes");
          v55 = objc_retainAutorelease(v54);
          objc_msgSend(v55, "bytes");
          objc_msgSend(v55, "length");
          v45 = CCCryptorGCMOneshotDecrypt();
        }
        v56 = v45;
        if ((_DWORD)v45)
        {
          SESDefaultLogObject();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          SESCreateAndLogError(0, v57, SESErrorDomain, 0, CFSTR("Could not perform privacy operation: %d"), v58, v59, v60, v56);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v44 = objc_retainAutorelease(v44);
          v22 = 0;
          *a7 = v44;
        }
      }

    }
  }

LABEL_23:
  return v22;
}

id encryptPrivacyData(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  const __CFData *v8;
  const __CFData *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SecKeyRef v13;
  __SecKey *v14;
  CFErrorRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __SecKey *v29;
  __SecKey *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFDictionary *v36;
  CFErrorRef error;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = v8;
  if (v7 && a3 && v8 && a4)
  {
    error = 0;
    v10 = *MEMORY[0x24BDE9050];
    v11 = *MEMORY[0x24BDE9060];
    v12 = *MEMORY[0x24BDE9048];
    v40[0] = *MEMORY[0x24BDE9050];
    v40[1] = v12;
    v41[0] = v11;
    v41[1] = &unk_251CC8B38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = SecKeyCreateRandomKey(v36, &error);
    v14 = v13;
    v15 = error;
    if (error || !v13)
    {
      SESDefaultLogObject();
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v21 = SESErrorDomain;
      v22 = CFSTR("While calling SecKeyCreateRandomKey");
    }
    else
    {
      getSecKeyPublicBytes((uint64_t)v13, a3);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v38[0] = v10;
        v38[1] = v12;
        v39[0] = v11;
        v39[1] = &unk_251CC8B38;
        v38[2] = *MEMORY[0x24BDE9028];
        v39[2] = *MEMORY[0x24BDE9038];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
        v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v29 = SecKeyCreateWithData(v9, v20, &error);
        v30 = v29;
        v15 = error;
        if (error || !v29)
        {
          SESDefaultLogObject();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          SESCreateAndLogError(0, v31, SESErrorDomain, 0, CFSTR("Could not create server privacy encryption key"), v32, v33, v34, v35);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          ECIES_V1(v14, v29, (uint64_t)v14, (uint64_t)v29, 1u, v7, a4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_12;
      }
      v15 = (CFErrorRef)v16;
      SESDefaultLogObject();
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v21 = SESErrorDomain;
      v22 = CFSTR("While calling getSecKeyPublicBytes");
    }
    SESCreateAndLogError(0, v20, v21, 0, v22, v17, v18, v19, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  SESDefaultLogObject();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SESCreateAndLogError(0, v23, SESErrorDomain, 1, CFSTR("Nil input to encryptPrivacy"), v24, v25, v26, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v27;
}

id decryptPrivacyData(void *a1, void *a2, void *a3, _QWORD *a4)
{
  __SecKey *v7;
  id v8;
  const __CFData *v9;
  const __CFData *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __SecKey *v14;
  __SecKey *v15;
  CFErrorRef v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v9;
  if (v7 && v8 && v9 && a4)
  {
    v11 = *MEMORY[0x24BDE9060];
    v12 = *MEMORY[0x24BDE9048];
    v27[0] = *MEMORY[0x24BDE9050];
    v27[1] = v12;
    v28[0] = v11;
    v28[1] = &unk_251CC8B38;
    v27[2] = *MEMORY[0x24BDE9028];
    v28[2] = *MEMORY[0x24BDE9038];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v14 = SecKeyCreateWithData(v10, v13, (CFErrorRef *)&v26);
    v15 = v14;
    v16 = (CFErrorRef)v26;
    if (v26 || !v14)
    {
      SESDefaultLogObject();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v21, SESErrorDomain, 0, CFSTR("Calling SecKeyCreateWithData"), v22, v23, v24, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ECIES_V1(v7, v14, (uint64_t)v14, (uint64_t)v7, 0, v8, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    SESDefaultLogObject();
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v13, SESErrorDomain, 1, CFSTR("Nil input to decryptPrivacyData"), v18, v19, v20, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id getCertificateSubjectCN(void *a1)
{
  const __CFData *v1;
  __SecCertificate *v2;
  __SecCertificate *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = SecCertificateCreateWithData(0, v1);
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)v8 = 0;
    SecCertificateCopyCommonName(v2, (CFStringRef *)v8);
    CFRelease(v3);
    v4 = *(void **)v8;
  }
  else
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[__CFData asHexString](v1, "asHexString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)&v8[4] = v6;
      _os_log_impl(&dword_24B9C8000, v5, OS_LOG_TYPE_ERROR, "Could not create certificate with data %@", v8, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

id getCertificatePublicKey(void *a1)
{
  id v1;
  uint64_t v2;
  BOOL v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  const char *v10;
  uint8_t *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19[2];
  char v20;
  _OWORD v21[3];
  _QWORD v22[2];
  uint8_t v23[4];
  unsigned int v24;
  __int16 v25;
  void *v26;
  _DWORD v27[8];
  _OWORD buf[6];
  unint64_t v29[10];

  v29[9] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v22[0] = objc_msgSend(v1, "DERItem");
  v22[1] = v2;
  memset(v21, 0, sizeof(v21));
  if (DERParseSequence((uint64_t)v22, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, (unint64_t)v21, 0x30uLL))v3 = 1;
  else
    v3 = *((_QWORD *)&v21[0] + 1) == 0;
  if (v3)
  {
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "asHexString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v5;
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Could not parse certificate with data %@", (uint8_t *)buf, 0xCu);

    }
    goto LABEL_16;
  }
  memset(v29, 0, 64);
  memset(buf, 0, sizeof(buf));
  v6 = DERParseSequence((uint64_t)v21, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, (unint64_t)buf, 0xA0uLL);
  if (v6)
  {
    v7 = v6;
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asHexString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = 67109378;
      v27[1] = v7;
      LOWORD(v27[2]) = 2112;
      *(_QWORD *)((char *)&v27[2] + 2) = v9;
      v10 = "Failed (%d) to parse TBS with data %@";
      v11 = (uint8_t *)v27;
LABEL_11:
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, v10, v11, 0x12u);

LABEL_15:
    }
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    v12 = DERParseSequenceContent(v29, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)v27, 0x20uLL);
    if (v12)
    {
      v13 = v12;
      SESDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "asHexString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 67109378;
        v24 = v13;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, "Failed (%d) to parse SubjPubKey with data %@", v23, 0x12u);

        goto LABEL_15;
      }
    }
    else
    {
      v20 = 0;
      v19[0] = 0;
      v19[1] = 0;
      v17 = DERParseBitString((uint64_t)&v27[4], v19, &v20);
      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v18 = v17;
      SESDefaultLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v27[4]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asHexString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 67109378;
        v24 = v18;
        v25 = 2112;
        v26 = v9;
        v10 = "Failed (%d) to parse BITSTRING with data %@";
        v11 = v23;
        goto LABEL_11;
      }
    }
  }
LABEL_16:

  v15 = 0;
LABEL_17:

  return v15;
}

void sub_24B9CB4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t Any(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t All(void *a1, void *a2)
{
  id v3;
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

id Find(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

id Filter(void *a1, void *a2)
{
  id v3;
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

id Transform(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

id TransformIf(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

id getSBUserNotificationDismissOnLock()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getSBUserNotificationDismissOnLockSymbolLoc_ptr;
  v6 = getSBUserNotificationDismissOnLockSymbolLoc_ptr;
  if (!getSBUserNotificationDismissOnLockSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getSBUserNotificationDismissOnLockSymbolLoc_block_invoke;
    v2[3] = &unk_251CC6220;
    v2[4] = &v3;
    __getSBUserNotificationDismissOnLockSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getSBUserNotificationDismissOnLock_cold_1();
  return *v0;
}

void sub_24B9CCBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NFTTRUserNotificationCallback(uint64_t a1, uint64_t a2)
{
  return +[SESTapToRadar handleCallback:](SESTapToRadar, "handleCallback:", a2);
}

void *__getSBUserNotificationDismissOnLockSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBUserNotificationDismissOnLock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDismissOnLockSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPublicKeyBytes(unint64_t a1, unint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  int v8;
  void *v9;
  char v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14[2];
  uint8_t buf[4];
  int v16;
  unint64_t v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = a1;
  v14[1] = a2;
  v12 = 0u;
  v13 = 0u;
  v2 = DERParseSequenceContent(v14, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v12, 0);
  if (v2)
  {
    v3 = v2;
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v17[0]) = 67109120;
      HIDWORD(v17[0]) = v3;
      v5 = "Could not extract pubKeyInfo : %d\n";
      v6 = (uint8_t *)v17;
LABEL_7:
      _os_log_impl(&dword_24B9C8000, v4, OS_LOG_TYPE_ERROR, v5, v6, 8u);
    }
  }
  else
  {
    v17[0] = 0;
    v17[1] = 0;
    v11 = 0;
    v7 = DERParseBitString((uint64_t)&v13, v17, &v11);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v8 = v7;
    SESDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v8;
      v5 = "Could not extract publicKey bytes : %d\n";
      v6 = buf;
      goto LABEL_7;
    }
  }

  v9 = 0;
  return v9;
}

id encodeSequenceSpec(unint64_t a1, uint64_t a2)
{
  return encodeSequence(0x2000000000000010, a1, *(unsigned __int16 *)(a2 + 8), *(_QWORD *)a2);
}

id encodeSequence(uint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = DERLengthOfEncodedSequence(a1, a2, a3, a4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v14);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = DEREncodeSequence(a1, a2, a3, a4, objc_msgSend(v8, "mutableBytes"), (unint64_t *)&v14);
  if (v9)
  {
    v10 = v9;
    SESDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v10;
      _os_log_impl(&dword_24B9C8000, v11, OS_LOG_TYPE_ERROR, "while encoding extensions : %d", buf, 8u);
    }

    v12 = 0;
  }
  else
  {
    v12 = v8;
  }

  return v12;
}

id encodeSequenceSpec(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return encodeSequence(a1, a2, *(unsigned __int16 *)(a3 + 8), *(_QWORD *)a3);
}

id encodeSequence(unint64_t a1, unsigned int a2, uint64_t a3)
{
  return encodeSequence(0x2000000000000010, a1, a2, a3);
}

id encodeSequenceContentSpec(unint64_t a1, uint64_t a2)
{
  NSData *v2;
  void *v3;

  encodeSequence(0x2000000000000010, a1, *(unsigned __int16 *)(a2 + 8), *(_QWORD *)a2);
  v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  DERDecodeData(v2, -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DERDecodeData(NSData *a1)
{
  return DERDecodeData(a1, -1);
}

id encodeItem(unint64_t a1, unint64_t a2, const void *a3)
{
  id v6;
  int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  unint64_t v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = DERLengthOfItem(a1, a2);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = DEREncodeItem(a1, a2, a3, objc_msgSend(v6, "mutableBytes"), &v12);
  if (v7 || (v8 = objc_msgSend(v6, "length"), v8 != v12))
  {
    SESDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v7;
      _os_log_impl(&dword_24B9C8000, v10, OS_LOG_TYPE_ERROR, "while encoding item : %d\n", buf, 8u);
    }

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

id encodeNSData(unint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  const void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "bytes");

  return encodeItem(a1, v4, v6);
}

id encodeDERItem(unint64_t a1, const void *a2, unint64_t a3)
{
  return encodeItem(a1, a3, a2);
}

id DERDecodeData(const DERItem *a1)
{
  return DERDecodeData(a1, -1);
}

id DERDecodeData(const DERItem *a1, uint64_t a2)
{
  int v3;
  void *v4;
  unint64_t v6;
  _QWORD v7[2];

  v6 = 0;
  v7[0] = 0;
  v7[1] = 0;
  v3 = DERDecodeItem((uint64_t)a1, &v6);
  v4 = 0;
  if (!v3)
  {
    if (a2 != -1 && v6 != a2)
      return 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

id DERDecodeData(NSData *a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  _QWORD v7[2];
  unint64_t v8;
  _QWORD v9[2];

  v8 = 0;
  v9[0] = 0;
  v9[1] = 0;
  v7[0] = -[NSData DERItem](a1, "DERItem");
  v7[1] = v3;
  v4 = DERDecodeItem((uint64_t)v7, &v8);
  v5 = 0;
  if (!v4)
  {
    if (a2 != -1 && v8 != a2)
      return 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t DERDecodeData(void *a1, unint64_t *a2)
{
  uint64_t v3;
  _QWORD v5[2];

  v5[0] = objc_msgSend(a1, "DERItem");
  v5[1] = v3;
  return DERDecodeItem((uint64_t)v5, a2);
}

id DERDecodeAdvance(uint64_t *a1, uint64_t a2, char a3)
{
  int v6;
  void *v7;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v13 = 0;
  v14 = 0;
  v15 = 0;
  v6 = DERDecodeItem((uint64_t)a1, &v13);
  v7 = 0;
  if (!v6)
  {
    if (a2 != -1 && v13 != a2)
      return 0;
    v9 = DERLengthOfItem(v13, v15);
    if ((a3 & 1) != 0)
    {
      v10 = *a1;
      v11 = v9;
    }
    else
    {
      v10 = v14;
      v11 = v15;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[1] - v9;
    *a1 += v9;
    a1[1] = v12;
  }
  return v7;
}

uint64_t DERParseSequenceSpec(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12[2];

  bzero(a4, a5);
  v11 = 0;
  v12[0] = 0;
  v12[1] = 0;
  result = DERDecodeItem(a2, &v11);
  if (!(_DWORD)result)
  {
    if (v11 == a1)
      return (uint64_t)DERParseSequenceContent(v12, *(unsigned __int16 *)(a3 + 8), *(_QWORD *)a3, (unint64_t)a4, a5);
    else
      return 2;
  }
  return result;
}

unint64_t *DERParseSequenceSpecContent(unint64_t *a1, uint64_t a2, unint64_t a3, size_t a4)
{
  return DERParseSequenceContent(a1, *(unsigned __int16 *)(a2 + 8), *(_QWORD *)a2, a3, a4);
}

uint64_t DERParseSequenceSpec(uint64_t a1, void *a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t v9;
  _QWORD v11[2];

  v11[0] = objc_msgSend(a2, "DERItem");
  v11[1] = v9;
  return DERParseSequenceSpec(a1, (uint64_t)v11, a3, a4, a5);
}

uint64_t DERParseSequenceSpec(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  return DERParseSequenceSpec(0x2000000000000010, a1, a2, a3, a4);
}

uint64_t DERParseSequenceSpec(void *a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v7;
  _QWORD v9[2];

  v9[0] = objc_msgSend(a1, "DERItem");
  v9[1] = v7;
  return DERParseSequenceSpec(0x2000000000000010, (uint64_t)v9, a2, a3, a4);
}

unint64_t *DERParseSequenceSpecContent(void *a1, uint64_t a2, unint64_t a3, size_t a4)
{
  unint64_t v7;
  unint64_t v9[2];

  v9[0] = objc_msgSend(a1, "DERItem");
  v9[1] = v7;
  return DERParseSequenceContent(v9, *(unsigned __int16 *)(a2 + 8), *(_QWORD *)a2, a3, a4);
}

void sub_24B9D0E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_24B9D2F8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D30BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D3480(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D34E4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D3548(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D3590(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_24B9D3600(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id SESDefaultLogObject()
{
  if (SESDefaultLogObject_once != -1)
    dispatch_once(&SESDefaultLogObject_once, &__block_literal_global_3);
  return (id)SESDefaultLogObject_log;
}

id SESCreateAndLogError(void *a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v14 = a2;
  v15 = (objc_class *)MEMORY[0x24BDD17C8];
  v16 = a5;
  v17 = a3;
  v18 = (void *)objc_msgSend([v15 alloc], "initWithFormat:arguments:", v16, &a9);

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_impl(&dword_24B9C8000, v14, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }
  if (v13)
  {
    v19 = *MEMORY[0x24BDD1398];
    v29[0] = *MEMORY[0x24BDD0FC8];
    v29[1] = v19;
    v30[0] = v18;
    v30[1] = v13;
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = (void **)v30;
    v22 = v29;
    v23 = 2;
  }
  else
  {
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = v18;
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = &v28;
    v22 = &v27;
    v23 = 1;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v17, a4, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id SESEnsureError(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = SESErrorDomain;
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = CFSTR("No Valid Error Set");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -1, v6);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t SESInternalVariant()
{
  if (SESInternalVariant_onceToken != -1)
    dispatch_once(&SESInternalVariant_onceToken, &__block_literal_global_4);
  return SESInternalVariant_ret;
}

uint64_t ReadS32BE(const unsigned __int8 *a1)
{
  return bswap32(*(_DWORD *)a1);
}

uint64_t ReadS32BE(const DERItem *a1)
{
  return bswap32(*(_DWORD *)a1->data);
}

uint64_t ReadU16BE(const unsigned __int8 *a1)
{
  return bswap32(*(unsigned __int16 *)a1) >> 16;
}

uint64_t ReadU16BE(const DERItem *a1)
{
  return bswap32(*(unsigned __int16 *)a1->data) >> 16;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

uint64_t DERLengthOfLength(unint64_t a1)
{
  uint64_t result;
  unint64_t v2;
  BOOL v3;

  if (a1 < 0x80)
    return 1;
  v2 = a1;
  result = 1;
  do
  {
    ++result;
    v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

unint64_t DEREncodeLength(unint64_t a1, unint64_t a2, unint64_t *a3)
{
  return DEREncodeLengthSized(a1, a2, *a3, (uint64_t *)a3);
}

unint64_t DEREncodeLengthSized(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  if (result >= 0x80)
  {
    v5 = 0;
    v6 = result;
    do
    {
      --v5;
      v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    v8 = -v5;
    v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        v4 = 1 - v5;
        *(_BYTE *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          v10 = (_BYTE *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            v11 = (_BYTE *)(a2 + *a4);
            while (v10 != (_BYTE *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2)
                goto LABEL_23;
              *v10-- = result;
              v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4)
                  goto LABEL_23;
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3)
    return 7;
  if (*a4)
  {
    *(_BYTE *)a2 = result;
    if (*a4)
    {
      v4 = 1;
LABEL_19:
      v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfItem(unint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;

  v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  v5 = 1;
  if (a2 >= 0x80)
  {
    v6 = a2;
    do
    {
      ++v5;
      v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  v7 = __CFADD__(v3, v5);
  v8 = v3 + v5;
  if (v7 || (result = v8 + a2, __CFADD__(v8, a2)))
    __break(0x5500u);
  return result;
}

uint64_t DEREncodeItem(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return DEREncodeItemSized(a1, a2, a3, a4, *a5, a5);
}

uint64_t DEREncodeItemSized(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  unint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v12 = *a6;
  v13 = DERLengthOfItem(a1, a2);
  if (v13 > a5)
    return 7;
  v15 = v13;
  if (v13 > *a6)
    goto LABEL_20;
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12)
    goto LABEL_20;
  result = DEREncodeTag(a1, a4, (unint64_t *)v22);
  if ((_DWORD)result)
    return result;
  v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  v17 = v15 >= v22[0];
  v18 = v15 - v22[0];
  if (!v17)
    goto LABEL_22;
  v19 = a4 + v12;
  v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20)
LABEL_20:
    __break(0x5519u);
  result = DEREncodeLengthSized(a2, v20, v18, v22);
  if ((_DWORD)result)
    return result;
  if (__CFADD__(v20, v22[0]))
    goto LABEL_21;
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2)
    goto LABEL_20;
  memmove(v21, a3, a2);
  return 0;
}

uint64_t DEREncodeTag(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;

  v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(_BYTE *)a2 = HIBYTE(result) & 0xE0 | result;
      v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  v4 = 0;
  v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  v7 = *a3;
  if (v4 >= *a3)
    return 7;
  if (v4 >= ~a2 || (*(_BYTE *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    v8 = v4 + 1;
    *(_BYTE *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      v9 = (_BYTE *)(a2 + v4 - 1);
      v10 = (_BYTE *)(a2 + v7);
      while (v9 != (_BYTE *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2)
          goto LABEL_21;
        v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11)
          goto LABEL_17;
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  unint64_t v8;
  unint64_t v11;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  const void **v27;
  __int16 v28;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  unint64_t v37;
  size_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v44;
  unint64_t v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = ~a6;
  if (~a6 < a7)
    goto LABEL_73;
  v11 = *a8;
  v44 = a7;
  v45[0] = 0;
  if (v11 < a7)
    goto LABEL_74;
  result = DEREncodeTag(a1, a6, &v44);
  if ((_DWORD)result)
    return result;
  if (v44 > v8)
    goto LABEL_73;
  v17 = a7 - v44;
  if (a7 < v44)
    goto LABEL_75;
  v18 = a6 + a7;
  v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v45);
    if ((_DWORD)result)
      return result;
    v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19)
      goto LABEL_74;
    v42 = a6 + v11;
    v20 = v45[0];
    result = DEREncodeLengthSized(v45[0], v19, v17, (uint64_t *)&v44);
    if ((_DWORD)result)
      return result;
    v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    v22 = v17 - v44;
    if (v17 >= v44)
    {
      v23 = (_BYTE *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18)
          return 7;
        if (a4)
        {
          v24 = 0;
          v25 = a2 + a3;
          v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5)
              goto LABEL_73;
            v26 = *(_QWORD *)(a5 + v24);
            if (v26 > ~a2)
              goto LABEL_73;
            v27 = (const void **)(a2 + v26);
            v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0)
              break;
            if ((v28 & 1) == 0)
              goto LABEL_29;
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
              goto LABEL_74;
            if (v27[1])
            {
LABEL_29:
              v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23)
                goto LABEL_74;
              result = DEREncodeTag(*(_QWORD *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if ((_DWORD)result)
                return result;
              if (__CFADD__(v23, v44))
                goto LABEL_73;
              v30 = v22 - v44;
              if (v22 < v44)
                goto LABEL_75;
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
                goto LABEL_74;
              v31 = (unint64_t)v27[1];
              v45[0] = v31;
              v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                v32 = 0;
                v45[0] = ++v31;
              }
              v33 = (unint64_t)&v23[v44];
              v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33)
                goto LABEL_74;
              result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if ((_DWORD)result)
                return result;
              v34 = v44;
              if (__CFADD__(v33, v44))
                goto LABEL_73;
              v35 = v30 - v44;
              if (v30 < v44)
                goto LABEL_75;
              v23 = (_BYTE *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (_BYTE *)-1)
                  goto LABEL_73;
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6)
                  goto LABEL_74;
                *v23 = 0;
                --v35;
                if (v30 == v34)
                  goto LABEL_75;
                ++v23;
              }
              if ((unint64_t)v23 > v42)
                goto LABEL_74;
              if ((unint64_t)v23 < a6)
                goto LABEL_74;
              v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23)
                goto LABEL_74;
              result = (uint64_t)memmove(v23, *v27, v36);
              v21 = v42;
              v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37))
                goto LABEL_73;
              v22 = v35 - v37;
              if (v35 < v37)
                goto LABEL_75;
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24)
              goto LABEL_71;
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
            goto LABEL_74;
          if ((unint64_t)v23 > v21)
            goto LABEL_74;
          if ((unint64_t)v23 < a6)
            goto LABEL_74;
          v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23)
            goto LABEL_74;
          result = (uint64_t)memmove(v23, *v27, v39);
          v21 = v42;
          v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37))
            goto LABEL_73;
          v40 = v22 >= v37;
          v22 -= v37;
          if (!v40)
            goto LABEL_75;
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t DERContentLengthOfEncodedSequence(unint64_t result, unint64_t a2, int a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unsigned __int8 **v10;
  __int16 v11;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;

  v5 = 0;
  if (!a3)
  {
LABEL_38:
    result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  v6 = 0;
  v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    v8 = *(_QWORD *)(a4 + 24 * v6);
    v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      v5 = 0;
      result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result)
      break;
    v10 = (unsigned __int8 **)(result + v8);
    v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if ((v11 & 1) != 0)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
          goto LABEL_43;
        if (!v10[1])
          goto LABEL_37;
      }
      v13 = *(_QWORD *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      v15 = __CFADD__(v5, v14);
      v16 = v5 + v14;
      if (v15)
        goto LABEL_42;
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
        goto LABEL_43;
      v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80)
          goto LABEL_25;
        v18 = 1;
        v21 = v17;
        do
        {
          ++v18;
          v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      v15 = __CFADD__(v16, v18);
      v22 = v16 + v18;
      if (v15)
        goto LABEL_42;
      v15 = __CFADD__(v22, v17);
      v5 = v22 + v17;
      if (v15)
        goto LABEL_42;
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
      goto LABEL_43;
    v20 = v10[1];
    v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15)
      goto LABEL_42;
LABEL_37:
    if (++v6 == a3)
      goto LABEL_38;
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequence(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2)
    return DEREncodeSequenceFromObject(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v17[0] = 0;
  result = DERContentLengthOfEncodedSequence(a2, a3, a4, a5, v17);
  if (!(_DWORD)result)
  {
    v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      v13 = v17[0];
      do
      {
        ++v12;
        v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    v14 = __CFADD__(v10, v12);
    v15 = v10 + v12;
    if (v14 || (v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t DERLengthOfEncodedSequence(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2)
    __break(0x5519u);
  if (DERLengthOfEncodedSequenceFromObject(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5))
    return 0;
  else
    return v5[0];
}

void getSBUserNotificationDismissOnLock_cold_1()
{
  dlerror();
  abort_report_np();
  AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC378](data, *(_QWORD *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x24BDE8828](certificate, commonName);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AB0](privateKey, algorithm, publicKey, parameters, error);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x24BDE8AC0]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x24BDB0840]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

