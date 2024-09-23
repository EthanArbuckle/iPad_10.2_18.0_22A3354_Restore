@implementation ISPurchaseReceipt

+ (ISPurchaseReceipt)receiptWithContentsOfFile:(id)a3
{
  id v3;
  ISPurchaseReceipt *v4;

  v3 = a3;
  v4 = -[ISPurchaseReceipt initWithContentsOfFile:]([ISPurchaseReceipt alloc], "initWithContentsOfFile:", v3);

  return v4;
}

- (ISPurchaseReceipt)initWithContentsOfFile:(id)a3
{
  id v4;
  ISPurchaseReceipt *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  objc_super v25;
  _BYTE v26[12];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ISPurchaseReceipt;
  v5 = -[ISPurchaseReceipt init](&v25, sel_init);
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
      {
        *(_QWORD *)v26 = 0;
        v8 = -[ISPurchaseReceipt _decodeReceiptData:toDecodedMessage:](v5, "_decodeReceiptData:toDecodedMessage:", v7, v26)&& -[ISPurchaseReceipt _parseReceiptFromMessage:](v5, "_parseReceiptFromMessage:", *(_QWORD *)v26)&& -[ISPurchaseReceipt _verifySignatureForSignedData:onDate:](v5, "_verifySignatureForSignedData:onDate:", -[ISPurchaseReceipt _extractSignedDataFromMessage:](v5, "_extractSignedDataFromMessage:", *(_QWORD *)v26), v5->_receiptCreationDate) != 0xFFFF;
        if (*(_QWORD *)v26)
          SecCmsMessageDestroy();
        if (v8)
          goto LABEL_22;
      }
    }
    else
    {
      v7 = 0;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      v15 = objc_msgSend(v7, "length");
      *(_DWORD *)v26 = 138412802;
      *(_QWORD *)&v26[4] = v13;
      v27 = 2048;
      v28 = v15;
      v29 = 2112;
      v30 = v4;
      LODWORD(v24) = 32;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_21:

        v5 = 0;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, v26, v24);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v9, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v12);
    }

    goto LABEL_21;
  }
LABEL_23:

  return v5;
}

- (BOOL)isRevoked
{
  return -[NSString length](self->_cancellationReason, "length") != 0;
}

- (BOOL)isVPPLicensed
{
  return self->_renewalDate != 0;
}

- (BOOL)_anchorTrust:(__SecTrust *)a3 toRootCertificateIn:(__CFArray *)a4
{
  CFDataRef v6;
  CFDataRef v7;
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  char v12;
  const void *ValueAtIndex;
  const void *v14;
  const void *v15;
  BOOL v17;
  OSStatus v18;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20[0] = xmmword_1A27A0F60;
  v20[1] = unk_1A27A0F70;
  v6 = CFDataCreate(0, (const UInt8 *)v20, 32);
  if (!v6)
    return 0;
  v7 = v6;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B378]);
  Count = CFArrayGetCount(a4);
  v10 = Count - 1;
  if (Count < 1)
    goto LABEL_12;
  v11 = 0;
  v12 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, v11);
    v14 = (const void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (v14)
    {
      v15 = v14;
      if (CFEqual(v7, v14))
      {
        CFArrayAppendValue(Mutable, ValueAtIndex);
        v12 = 1;
      }
      CFRelease(v15);
    }
    if ((v12 & 1) != 0)
      break;
  }
  while (v10 != v11++);
  if ((v12 & 1) != 0)
  {
    v18 = SecTrustSetAnchorCertificates(a3, Mutable);
    if (!v18)
      v18 = SecTrustSetAnchorCertificatesOnly(a3, 1u);
    v17 = v18 == 0;
  }
  else
  {
LABEL_12:
    v17 = 0;
  }
  CFRelease(Mutable);
  CFRelease(v7);
  return v17;
}

- (BOOL)_checkArray:(__CFArray *)a3 containsCertificateWithOID:(__CFString *)a4
{
  CFIndex Count;
  CFIndex v8;
  CFIndex v10;
  CFIndex v11;
  _BOOL4 v12;

  Count = CFArrayGetCount(a3);
  if (Count < 1)
    return 0;
  v8 = Count;
  if (-[ISPurchaseReceipt _checkIfCertificate:containsOID:](self, "_checkIfCertificate:containsOID:", CFArrayGetValueAtIndex(a3, 0), a4))
  {
    return 1;
  }
  v10 = 1;
  do
  {
    v11 = v10;
    if (v8 == v10)
      break;
    v12 = -[ISPurchaseReceipt _checkIfCertificate:containsOID:](self, "_checkIfCertificate:containsOID:", CFArrayGetValueAtIndex(a3, v10), a4);
    v10 = v11 + 1;
  }
  while (!v12);
  return v11 < v8;
}

- (BOOL)_checkIfCertificate:(__SecCertificate *)a3 containsOID:(__CFString *)a4
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex v6;
  char v7;
  const void *v8;
  const void *v9;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex v14;
  CFIndex v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const void *v18;
  const void *v19;
  BOOL v20;
  CFIndex Count;
  CFDataRef cf;

  cf = CFDataCreate(0, byte_1A27A0F80, 2);
  v4 = (const __CFArray *)SecCertificateCopyProperties();
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      v20 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = (const void *)*MEMORY[0x1E0CD6FC8];
      v9 = (const void *)*MEMORY[0x1E0CD6FE0];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v6);
        Value = CFDictionaryGetValue(ValueAtIndex, v8);
        if (Value)
        {
          if (CFEqual(Value, a4))
          {
            v12 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, v9);
            if (v12)
            {
              v13 = v12;
              v14 = CFArrayGetCount(v12);
              if (v14 >= 1 && (v7 & 1) == 0)
              {
                v15 = v14;
                v16 = 1;
                do
                {
                  v17 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16 - 1);
                  v18 = CFDictionaryGetValue(v17, v8);
                  if (v18)
                  {
                    if (CFEqual(v18, CFSTR("Unparsed Data")))
                    {
                      v19 = CFDictionaryGetValue(v17, v9);
                      if (v19)
                      {
                        if (CFEqual(v19, cf))
                          v7 = 1;
                      }
                    }
                  }
                  if (v16 >= v15)
                    break;
                  ++v16;
                }
                while ((v7 & 1) == 0);
              }
            }
          }
        }
        ++v6;
        v20 = v7 & 1;
      }
      while (v6 < Count && (v7 & 1) == 0);
    }
    CFRelease(v5);
  }
  else
  {
    v20 = 0;
  }
  CFRelease(cf);
  return v20;
}

- (__CFArray)_copyCertificatesFromSignedData:(SecCmsSignedDataStr *)a3
{
  uint64_t CertificateList;
  uint64_t *v4;
  __CFArray *Mutable;
  uint64_t v6;
  uint64_t *v7;
  const __CFData *v8;
  const __CFData *v9;
  SecCertificateRef v10;
  SecCertificateRef v11;
  uint64_t v12;

  CertificateList = SecCmsSignedDataGetCertificateList();
  if (!CertificateList)
    return 0;
  v4 = (uint64_t *)CertificateList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v6 = *v4;
  if (*v4)
  {
    v7 = v4 + 1;
    do
    {
      v8 = CFDataCreate(0, *(const UInt8 **)(v6 + 8), *(_QWORD *)v6);
      if (v8)
      {
        v9 = v8;
        v10 = SecCertificateCreateWithData(0, v8);
        if (v10)
        {
          v11 = v10;
          CFArrayAppendValue(Mutable, v10);
          CFRelease(v11);
        }
        CFRelease(v9);
      }
      v12 = *v7++;
      v6 = v12;
    }
    while (v12);
  }
  return Mutable;
}

- (BOOL)_decodeReceiptData:(id)a3 toDecodedMessage:(SecCmsMessageStr *)a4
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SecCmsDecoderCreate())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (!v7)
      goto LABEL_32;
  }
  else
  {
    v9 = objc_retainAutorelease(v4);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (SecCmsDecoderUpdate())
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v5, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        v11 &= 2u;
      if (!v11)
        goto LABEL_32;
    }
    else
    {
      if (!SecCmsDecoderFinish())
      {
        v22 = 1;
        goto LABEL_34;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      objc_msgSend(v5, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        v13 &= 2u;
      if (!v13)
        goto LABEL_32;
    }
  }
  v25 = 138412290;
  v26 = (id)objc_opt_class();
  v14 = v26;
  LODWORD(v24) = 12;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v25, v24);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog(v5, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v8);
LABEL_32:

  }
  SecCmsDecoderDestroy();
  v22 = 0;
LABEL_34:

  return v22;
}

- (SecCmsSignedDataStr)_extractSignedDataFromMessage:(SecCmsMessageStr *)a3
{
  int v3;
  int v4;
  int v5;
  SecCmsSignedDataStr *result;

  v3 = SecCmsMessageContentLevelCount();
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  while (1)
  {
    SecCmsMessageContentLevel();
    if (SecCmsContentInfoGetContentTypeTag() == 26)
    {
      result = (SecCmsSignedDataStr *)SecCmsContentInfoGetContent();
      if (result)
        break;
    }
    if (v4 == ++v5)
      return 0;
  }
  return result;
}

- (BOOL)_parseReceiptFromMessage:(SecCmsMessageStr *)a3
{
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1A85856E8](a3, a2);
  if (v4 && *(_QWORD *)v4)
  {
    v5 = CFDataCreate(0, *(const UInt8 **)(v4 + 8), *(_QWORD *)v4);
    if (v5)
    {
      v6 = v5;
      +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", CFDataGetBytePtr(v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "identifier");
      v9 = v8 == 17;
      if (v8 == 17)
      {
        -[ISPurchaseReceipt _parseTokens:](self, "_parseTokens:", v7);
LABEL_40:
        CFRelease(v6);
        goto LABEL_41;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (!v23)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = objc_msgSend(v24, "shouldLog");
      if (objc_msgSend(v24, "shouldLogToDisk"))
        v26 = v25 | 2;
      else
        v26 = v25;
      objc_msgSend(v24, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        v26 &= 2u;
      if (v26)
      {
        LODWORD(v38) = 138412290;
        *(_QWORD *)((char *)&v38 + 4) = objc_opt_class();
        v28 = *(id *)((char *)&v38 + 4);
        LODWORD(v37) = 12;
        v29 = (void *)_os_log_send_and_compose_impl();

        if (!v29)
        {
LABEL_39:

          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v38, v37, v38);
        v27 = objc_claimAutoreleasedReturnValue();
        free(v29);
        SSFileLog(v24, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v27);
      }

      goto LABEL_39;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v22 &= 2u;
    if (!v22)
      goto LABEL_17;
  }
  else
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (!v11)
      goto LABEL_17;
  }
  LODWORD(v38) = 138412290;
  *(_QWORD *)((char *)&v38 + 4) = objc_opt_class();
  v13 = *(id *)((char *)&v38 + 4);
  LODWORD(v37) = 12;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v38, v37, v38);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v7, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v12);
LABEL_17:

  }
  v9 = 0;
LABEL_41:

  return v9;
}

- (void)_parseTokens:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  NSDate *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  NSString *v68;
  NSString *cancellationReason;
  int v70;
  int v71;
  void *v72;
  NSString *v73;
  id v74;
  int v75;
  int v76;
  int v77;
  void *v78;
  id v79;
  void *v80;
  int v81;
  int v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  NSDate *v108;
  void *v109;
  void *v110;
  id v111;
  NSDate *v112;
  int v113;
  int v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSDate *receiptCreationDate;
  int v127;
  int v128;
  void *v129;
  NSDate *v130;
  NSDate *expirationDate;
  int v132;
  int v133;
  void *v134;
  NSDate *v135;
  NSDate *renewalDate;
  int v137;
  int v138;
  void *v139;
  NSDate *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int *v149;
  uint64_t v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  int v156;
  id v157;
  __int16 v158;
  uint64_t v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = &off_1E47B6000;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (v9)
  {
    v156 = 138412290;
    v157 = (id)objc_opt_class();
    v10 = v157;
    LODWORD(v150) = 12;
    v149 = &v156;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v156, v150);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  }

LABEL_13:
  objc_msgSend(v3, "nextToken");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    v154 = v3;
    while (2)
    {
      v20 = (void *)MEMORY[0x1A8585BF8]();
      +[asn1ReceiptToken readFromBuffer:](asn1ReceiptToken, "readFromBuffer:", objc_msgSend(v19, "content"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v21, "type"))
      {
        case 0:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v23 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v24 = v23 | 2;
          else
            v24 = v23;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v26 = v24;
          else
            v26 = v24 & 2;
          if (!v26)
            goto LABEL_180;
          goto LABEL_114;
        case 1:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v27 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v28 = v27 | 2;
          else
            v28 = v27;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v29 = v28;
          else
            v29 = v28 & 2;
          if (v29)
            goto LABEL_55;
          goto LABEL_180;
        case 2:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v75 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v76 = v75 | 2;
          else
            v76 = v75;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v77 = v76;
          else
            v77 = v76 & 2;
          if (v77)
            goto LABEL_114;
          goto LABEL_180;
        case 3:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v30 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v31 = v30 | 2;
          else
            v31 = v30;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v32 = v31;
          else
            v32 = v31 & 2;
          if (!v32)
            goto LABEL_180;
LABEL_114:
          v78 = (void *)objc_opt_class();
          v79 = v78;
          objc_msgSend(v21, "stringValue");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = 138412546;
          v157 = v78;
          v158 = 2112;
          v159 = (uint64_t)v80;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_161;
        case 4:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v33 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v34 = v33 | 2;
          else
            v34 = v33;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v35 = v34;
          else
            v35 = v34 & 2;
          if (!v35)
            goto LABEL_180;
LABEL_55:
          v36 = (void *)objc_opt_class();
          v37 = (void *)MEMORY[0x1E0CB37E8];
          v38 = v36;
          objc_msgSend(v37, "numberWithUnsignedLongLong:", objc_msgSend(v21, "integerValue"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = 138412546;
          v157 = v36;
          v158 = 2112;
          v159 = (uint64_t)v39;
          LODWORD(v150) = 22;
          v149 = &v156;
          v40 = _os_log_send_and_compose_impl();

          goto LABEL_162;
        case 5:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v41 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v42 = v41 | 2;
          else
            v42 = v41;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v43 = v42;
          else
            v43 = v42 & 2;
          if (!v43)
            goto LABEL_179;
          v153 = v20;
          v44 = (void *)objc_opt_class();
          v151 = (void *)MEMORY[0x1E0C99D50];
          v45 = v21;
          v152 = v44;
          objc_msgSend(v45, "contentToken");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "content");
          objc_msgSend(v45, "contentToken");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v151, "dataWithBytes:length:", v47, objc_msgSend(v48, "length"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = objc_msgSend(v49, "length");
          v156 = 138412546;
          v157 = v44;
          v158 = 2048;
          v159 = v50;
          LODWORD(v150) = 22;
          v149 = &v156;
          v51 = (void *)_os_log_send_and_compose_impl();

          if (v51)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, &v156, v150);
            v25 = objc_claimAutoreleasedReturnValue();
            free(v51);
            SSFileLog(v22, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v25);
            v20 = v153;
            v3 = v154;
            goto LABEL_179;
          }
          v20 = v153;
          v3 = v154;
          goto LABEL_221;
        case 8:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v81 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v81 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v82 = v81;
          else
            v82 = v81 & 2;
          if (!v82)
            goto LABEL_179;
          v83 = (id)objc_opt_class();
          objc_msgSend(v21, "stringValue");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v84;
          if (v84)
          {
            v86 = objc_retainAutorelease(v84);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v86, "UTF8String"), objc_msgSend(v86, "length")));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v87 = 0;
          }

          v156 = 138412546;
          v157 = v83;
          v158 = 2112;
          v159 = (uint64_t)v87;
          LODWORD(v150) = 22;
          v149 = &v156;
          v148 = _os_log_send_and_compose_impl();

          if (!v148)
            goto LABEL_220;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v148, 4, &v156, v150);
          v25 = objc_claimAutoreleasedReturnValue();
          v98 = (void *)v148;
          goto LABEL_164;
        case 9:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v88 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v88 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v89 = v88;
          else
            v89 = v88 & 2;
          if (v89)
            goto LABEL_160;
          goto LABEL_180;
        case 10:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v90 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v90 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v91 = v90;
          else
            v91 = v90 & 2;
          if (v91)
            goto LABEL_177;
          goto LABEL_180;
        case 11:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v92 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v92 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v93 = v92;
          else
            v93 = v92 & 2;
          if (v93)
            goto LABEL_160;
          goto LABEL_180;
        case 12:
          objc_msgSend(v21, "stringValue");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v58)
          {
            v60 = objc_retainAutorelease(v58);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v60, "UTF8String"), objc_msgSend(v60, "length")));
            v61 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v61 = 0;
          }

          receiptCreationDate = self->_receiptCreationDate;
          self->_receiptCreationDate = v61;

          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v127 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v127 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v128 = v127;
          else
            v128 = v127 & 2;
          if (!v128)
            goto LABEL_180;
          v129 = (void *)objc_opt_class();
          v130 = self->_receiptCreationDate;
          v156 = 138412546;
          v157 = v129;
          v158 = 2112;
          v159 = (uint64_t)v130;
          v74 = v129;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 13:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v62 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v62 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v63 = v62;
          else
            v63 = v62 & 2;
          if (v63)
            goto LABEL_177;
          goto LABEL_180;
        case 14:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v64 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v64 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v65 = v64;
          else
            v65 = v64 & 2;
          if (v65)
            goto LABEL_160;
          goto LABEL_180;
        case 15:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v66 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v66 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v67 = v66;
          else
            v67 = v66 & 2;
          if (v67)
            goto LABEL_160;
          goto LABEL_180;
        case 16:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v94 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v94 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v95 = v94;
          else
            v95 = v94 & 2;
          if (!v95)
            goto LABEL_180;
LABEL_160:
          v96 = (void *)objc_opt_class();
          v97 = (void *)MEMORY[0x1E0CB37E8];
          v79 = v96;
          objc_msgSend(v97, "numberWithUnsignedLongLong:", objc_msgSend(v21, "integerValue"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = 138412546;
          v157 = v96;
          v158 = 2112;
          v159 = (uint64_t)v80;
          LODWORD(v150) = 22;
          v149 = &v156;
LABEL_161:
          v40 = _os_log_send_and_compose_impl();

LABEL_162:
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v156, v150);
            v25 = objc_claimAutoreleasedReturnValue();
            v98 = (void *)v40;
LABEL_164:
            free(v98);
            SSFileLog(v22, CFSTR("%@"), v99, v100, v101, v102, v103, v104, (uint64_t)v25);
            v3 = v154;
LABEL_179:
            v4 = &off_1E47B6000;
LABEL_180:

          }
          else
          {
LABEL_220:
            v3 = v154;
LABEL_221:
            v4 = &off_1E47B6000;
          }
LABEL_181:

LABEL_182:
          objc_autoreleasePoolPop(v20);
          objc_msgSend(v3, "nextToken");
          v125 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v125;
          if (!v125)
            break;
          continue;
        case 21:
          objc_msgSend(v21, "stringValue");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v105;
          if (v105)
          {
            v107 = objc_retainAutorelease(v105);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v107, "UTF8String"), objc_msgSend(v107, "length")));
            v108 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v108 = 0;
          }

          expirationDate = self->_expirationDate;
          self->_expirationDate = v108;

          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v132 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v132 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v133 = v132;
          else
            v133 = v132 & 2;
          if (!v133)
            goto LABEL_180;
          v134 = (void *)objc_opt_class();
          v135 = self->_expirationDate;
          v156 = 138412546;
          v157 = v134;
          v158 = 2112;
          v159 = (uint64_t)v135;
          v74 = v134;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 22:
          objc_msgSend(v21, "stringValue");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v109;
          if (v109)
          {
            v111 = objc_retainAutorelease(v109);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v111, "UTF8String"), objc_msgSend(v111, "length")));
            v112 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v112 = 0;
          }

          renewalDate = self->_renewalDate;
          self->_renewalDate = v112;

          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v137 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v137 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v138 = v137;
          else
            v138 = v137 & 2;
          if (!v138)
            goto LABEL_180;
          v139 = (void *)objc_opt_class();
          v140 = self->_renewalDate;
          v156 = 138412546;
          v157 = v139;
          v158 = 2112;
          v159 = (uint64_t)v140;
          v74 = v139;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 23:
          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v113 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v113 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v114 = v113;
          else
            v114 = v113 & 2;
          if (!v114)
            goto LABEL_180;
LABEL_177:
          v115 = (void *)objc_opt_class();
          v116 = v115;
          objc_msgSend(v21, "stringValue");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = 138412546;
          v157 = v115;
          v158 = 2112;
          v159 = (uint64_t)v117;
          LODWORD(v150) = 22;
          v149 = &v156;
          v118 = (void *)_os_log_send_and_compose_impl();

          if (!v118)
            goto LABEL_221;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v118, 4, &v156, v150);
          v25 = objc_claimAutoreleasedReturnValue();
          free(v118);
          SSFileLog(v22, CFSTR("%@"), v119, v120, v121, v122, v123, v124, (uint64_t)v25);
          goto LABEL_179;
        case 24:
          objc_msgSend(v21, "stringValue");
          v68 = (NSString *)objc_claimAutoreleasedReturnValue();
          cancellationReason = self->_cancellationReason;
          self->_cancellationReason = v68;

          objc_msgSend(v4[387], "sharedStoreServicesConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(v4[387], "sharedConfig");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v70 = objc_msgSend(v22, "shouldLog", v149);
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v70 |= 2u;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            v71 = v70;
          else
            v71 = v70 & 2;
          if (!v71)
            goto LABEL_180;
          v72 = (void *)objc_opt_class();
          v73 = self->_cancellationReason;
          v156 = 138412546;
          v157 = v72;
          v158 = 2112;
          v159 = (uint64_t)v73;
          v74 = v72;
          LODWORD(v150) = 22;
          v149 = &v156;
LABEL_214:
          v141 = (void *)_os_log_send_and_compose_impl();

          if (!v141)
            goto LABEL_181;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v141, 4, &v156, v150);
          v25 = objc_claimAutoreleasedReturnValue();
          free(v141);
          SSFileLog(v22, CFSTR("%@"), v142, v143, v144, v145, v146, v147, (uint64_t)v25);
          goto LABEL_180;
        default:
          goto LABEL_182;
      }
      break;
    }
  }

}

- (BOOL)_setPoliciesForTrust:(__SecTrust *)a3
{
  __CFArray *Mutable;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  SecPolicyRef v9;
  __CFDictionary *v10;
  void *v11;
  SecPolicyRef v12;
  SecPolicyRef v13;
  BOOL v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9B378]);
  v5 = 0;
  v6 = *MEMORY[0x1E0CD6F80];
  v16[0] = *MEMORY[0x1E0CD6F78];
  v16[1] = v6;
  v7 = 1;
  while (1)
  {
    v8 = v7;
    v9 = SecPolicyCreateWithProperties((CFTypeRef)v16[v5], 0);
    if (!v9)
      break;
    CFArrayAppendValue(Mutable, v9);
    CFRelease(v9);
    v7 = 0;
    v5 = 1;
    if ((v8 & 1) == 0)
    {
      v10 = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!v10)
        goto LABEL_9;
      goto LABEL_7;
    }
  }
  v10 = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v10)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x1E0CD6FB8], v11);
  v12 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x1E0CD6F70], v10);
  if (v12)
  {
    v13 = v12;
    CFArrayAppendValue(Mutable, v12);
    CFRelease(v13);
    CFRelease(v10);

    if (v9)
    {
LABEL_9:
      v14 = SecTrustSetPolicies(a3, Mutable) == 0;
      goto LABEL_12;
    }
  }
  else
  {
    CFRelease(v10);

  }
LABEL_11:
  v14 = 0;
LABEL_12:
  CFRelease(Mutable);
  return v14;
}

- (int64_t)_verifySignatureForSignedData:(SecCmsSignedDataStr *)a3 onDate:(id)a4
{
  const __CFDate *v6;
  __CFArray *v7;
  __CFArray *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  void *v45;
  uint64_t v47;
  int v48;
  SecTrustRef trust;
  int v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDate *)a4;
  trust = 0;
  v7 = -[ISPurchaseReceipt _copyCertificatesFromSignedData:](self, "_copyCertificatesFromSignedData:", a3);
  if (!v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      v15 &= 2u;
    if (v15)
    {
      v50 = 138412290;
      v51 = (id)objc_opt_class();
      v17 = v51;
      LODWORD(v47) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_25:

        v25 = 0xFFFFLL;
        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v50, v47);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v13, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_25;
  }
  v8 = v7;
  if (CFArrayGetCount(v7) == 3)
  {
    if (-[ISPurchaseReceipt _checkArray:containsCertificateWithOID:](self, "_checkArray:containsCertificateWithOID:", v8, CFSTR("1.2.840.113635.100.6.2.1")))
    {
      if (SecTrustCreateWithCertificates(v8, 0, &trust))
      {
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v10 = objc_msgSend(v9, "shouldLog");
        if (objc_msgSend(v9, "shouldLogToDisk"))
          v11 = v10 | 2;
        else
          v11 = v10;
        objc_msgSend(v9, "OSLogObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          v11 &= 2u;
        if (!v11)
          goto LABEL_46;
      }
      else if (-[ISPurchaseReceipt _setPoliciesForTrust:](self, "_setPoliciesForTrust:", trust))
      {
        if (-[ISPurchaseReceipt _anchorTrust:toRootCertificateIn:](self, "_anchorTrust:toRootCertificateIn:", trust, v8))
        {
          if (!v6 || !SecTrustSetVerifyDate(trust, v6))
          {
            v48 = 0;
            MEMORY[0x1A858576C](trust, &v48);
            if (v48 == 1 || v48 == 4)
              v25 = 0;
            else
              v25 = 0xFFFFLL;
            goto LABEL_48;
          }
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v39 = objc_msgSend(v9, "shouldLog");
          if (objc_msgSend(v9, "shouldLogToDisk"))
            v40 = v39 | 2;
          else
            v40 = v39;
          objc_msgSend(v9, "OSLogObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            v40 &= 2u;
          if (!v40)
            goto LABEL_46;
        }
        else
        {
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v43 = objc_msgSend(v9, "shouldLog");
          if (objc_msgSend(v9, "shouldLogToDisk"))
            v44 = v43 | 2;
          else
            v44 = v43;
          objc_msgSend(v9, "OSLogObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            v44 &= 2u;
          if (!v44)
            goto LABEL_46;
        }
      }
      else
      {
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v41 = objc_msgSend(v9, "shouldLog");
        if (objc_msgSend(v9, "shouldLogToDisk"))
          v42 = v41 | 2;
        else
          v42 = v41;
        objc_msgSend(v9, "OSLogObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          v42 &= 2u;
        if (!v42)
          goto LABEL_46;
      }
      v45 = (void *)objc_opt_class();
      v50 = 138412290;
      v51 = v45;
      v30 = v45;
      LODWORD(v47) = 12;
      goto LABEL_44;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v29 = v28 | 2;
    else
      v29 = v28;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v29 &= 2u;
    if (!v29)
      goto LABEL_46;
  }
  else
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      v27 &= 2u;
    if (!v27)
      goto LABEL_46;
  }
  v50 = 138412290;
  v51 = (id)objc_opt_class();
  v30 = v51;
  LODWORD(v47) = 12;
LABEL_44:
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v31, 4, &v50, v47);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v31);
    SSFileLog(v9, CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v12);
LABEL_46:

  }
  v25 = 0xFFFFLL;
LABEL_48:
  CFRelease(v8);
LABEL_49:
  if (trust)
    CFRelease(trust);

  return v25;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_receiptCreationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
}

@end
