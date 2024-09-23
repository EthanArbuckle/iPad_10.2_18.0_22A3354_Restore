@implementation SEEndPoint

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[SEEndPoint encodeWithError:](self, "encodeWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SEEndPoint decodeWithData:error:](SEEndPoint, "decodeWithData:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicKeyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToData:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)endPointWithType:(int64_t)a3 appletIdentifier:(id)a4 identifier:(id)a5 certificateData:(id)a6 error:(id *)a7
{
  id v13;
  __CFString *v14;
  const __CFData *v15;
  __SecCertificate *v16;
  __SecCertificate *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  _UNKNOWN **v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SecKeyRef v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  SecKeyRef v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  CFStringRef commonName;

  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = (const __CFData *)a6;
  if (v15)
  {
    v16 = SecCertificateCreateWithData(0, v15);
    v17 = v16;
    if (!v16)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData base64](v15, "base64");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = 0;
      goto LABEL_61;
    }
    commonName = 0;
    SecCertificateCopyCommonName(v16, &commonName);
    v18 = (__CFString *)commonName;
    v19 = (void *)SecCertificateCopyIssuerSummary();
    if ((unint64_t)(a3 - 1) >= 5)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = 0;
      goto LABEL_60;
    }
    v20 = off_24C2BCEA8[a3 - 1];
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v85 = 0u;
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
      v21 = &PTALyonEndPointExtensionSpec;
    else
      v21 = &PTAEndPointExtensionSpec;
    v82 = __Block_byref_object_copy__1;
    v83 = __Block_byref_object_dispose__1;
    objc_msgSend(a1, "parsePTAExtension:certificate:specification:output:", v20, v17, v21, &v85);
    v84 = (id)objc_claimAutoreleasedReturnValue();
    if (v80[5])
    {
      if (!a7)
      {
        v23 = 0;
LABEL_59:
        _Block_object_dispose(&v79, 8);

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      SESDefaultLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v23 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
LABEL_58:

      goto LABEL_59;
    }
    v28 = SecCertificateCopyKey(v17);
    v24 = v28;
    if (!v28)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = 0;
      goto LABEL_58;
    }
    v78 = 0;
    v70 = v28;
    SecKeyCopyPublicBytes();
    v29 = objc_opt_new();
    *(_QWORD *)(v29 + 8) = a3;
    objc_storeStrong((id *)(v29 + 16), a4);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(v29 + 136);
    *(_QWORD *)(v29 + 136) = v30;

    if (v14)
      v32 = v14;
    else
      v32 = v18;
    objc_storeStrong((id *)(v29 + 24), v32);
    objc_storeStrong((id *)(v29 + 32), v18);
    objc_storeStrong((id *)(v29 + 40), 0);
    objc_msgSend(0, "sha1");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(v29 + 48);
    *(_QWORD *)(v29 + 48) = v33;

    objc_storeStrong((id *)(v29 + 440), v19);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v86);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(void **)(v29 + 80);
    *(_QWORD *)(v29 + 80) = v35;

    getPublicKeyBytes();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(void **)(v29 + 88);
    *(_QWORD *)(v29 + 88) = v37;

    if (*(_QWORD *)(v29 + 88))
    {
      +[SEEndPointConfiguration configurationWithOpt1:opt2:](SEEndPointConfiguration, "configurationWithOpt1:opt2:", *(unsigned __int8 *)v87, *(unsigned __int8 *)v88);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(void **)(v29 + 72);
      *(_QWORD *)(v29 + 72) = v39;

      if (*(_QWORD *)(v29 + 72))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v91);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = *(void **)(v29 + 456);
        *(_QWORD *)(v29 + 456) = v41;

        v77 = 0;
        if (*((_QWORD *)&v94 + 1))
        {
          if (*((_QWORD *)&v94 + 1) == 1 || *(_BYTE *)v94 != 2 || *(unsigned __int8 *)(v94 + 1) >= 5u)
          {
            if (a7)
            {
              SESDefaultLogObject();
              v69 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v94);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "asHexString");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              SESCreateAndLogError();
              *a7 = (id)objc_claimAutoreleasedReturnValue();

              v44 = (id)v69;
LABEL_55:

            }
LABEL_56:
            v23 = 0;
LABEL_57:

            v24 = v70;
            goto LABEL_58;
          }
          *(_QWORD *)&v94 = v94 + 2;
          *((_QWORD *)&v94 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7)
              goto LABEL_56;
            SESDefaultLogObject();
            v68 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v94);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_54;
          }
          v48 = v77;
        }
        else
        {
          v48 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = *(void **)(v29 + 120);
        *(_QWORD *)(v29 + 120) = v49;

        if (*((_QWORD *)&v93 + 1))
        {
          if (*((_QWORD *)&v93 + 1) == 1 || *(_BYTE *)v93 != 2 || *(unsigned __int8 *)(v93 + 1) >= 5u)
          {
            if (!a7)
              goto LABEL_56;
            goto LABEL_53;
          }
          *(_QWORD *)&v93 = v93 + 2;
          *((_QWORD *)&v93 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7)
              goto LABEL_56;
LABEL_80:
            SESDefaultLogObject();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v94);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_56;
          }
          v51 = v77;
        }
        else
        {
          v51 = 0;
          v77 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v51);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = *(void **)(v29 + 112);
        *(_QWORD *)(v29 + 112) = v52;

        if (*((_QWORD *)&v95 + 1))
        {
          if (*((_QWORD *)&v95 + 1) == 1 || *(_BYTE *)v95 != 2 || *(unsigned __int8 *)(v95 + 1) >= 5u)
          {
            if (!a7)
              goto LABEL_56;
LABEL_53:
            SESDefaultLogObject();
            v68 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v94);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "asHexString");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            SESCreateAndLogError();
            *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_54:
            v44 = (id)v68;
            goto LABEL_55;
          }
          *(_QWORD *)&v95 = v95 + 2;
          *((_QWORD *)&v95 + 1) -= 2;
          if (DERParseInteger())
          {
            if (!a7)
              goto LABEL_56;
            goto LABEL_80;
          }
          v57 = v77;
        }
        else
        {
          v57 = 0;
          v77 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v57);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = *(void **)(v29 + 128);
        *(_QWORD *)(v29 + 128) = v58;

        if (*((_QWORD *)&v92 + 1))
        {
          v71 = 0;
          v72 = &v71;
          v73 = 0x3032000000;
          v74 = __Block_byref_object_copy__1;
          v75 = __Block_byref_object_dispose__1;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v76 = (id)objc_claimAutoreleasedReturnValue();
          if (DERDecodeSequenceWithBlock() || v80[5])
          {
            if (a7)
            {
              SESDefaultLogObject();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              SESCreateAndLogError();
              *a7 = (id)objc_claimAutoreleasedReturnValue();

            }
            _Block_object_dispose(&v71, 8);
            v44 = v76;
            goto LABEL_55;
          }
          objc_storeStrong((id *)(v29 + 104), (id)v72[5]);
          _Block_object_dispose(&v71, 8);

        }
        objc_msgSend((id)v29, "generateEndPointPrivacyLongTermPrivacyKey");
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v80[5];
        v80[5] = v63;

        if (!v80[5])
        {
          v23 = (id)v29;
          goto LABEL_57;
        }
        if (!a7)
          goto LABEL_56;
        SESDefaultLogObject();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v80[5], "code");
        SESCreateAndLogError();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
        *a7 = v47;

        goto LABEL_56;
      }
      if (!a7)
        goto LABEL_56;
    }
    else if (!a7)
    {
      goto LABEL_56;
    }
    SESDefaultLogObject();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (a7)
  {
    SESDefaultLogObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
LABEL_62:

  return v23;
}

uint64_t __81__SEEndPoint_endPointWithType_appletIdentifier_identifier_certificateData_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v5 = a2 + 8;
  getPublicKeyBytes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
    v7 = 0;
  }
  else
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a3 = 1;
    v7 = 6;
  }

  return v7;
}

+ (id)parsePTAExtension:(__CFString *)a3 certificate:(__SecCertificate *)a4 specification:(id *)a5 output:(PTAEndPointExtensionContent *)a6
{
  void *v6;
  void *v7;
  void *v8;

  if (a3 && a4 && a5 && a6)
  {
    v6 = (void *)SecCertificateCopyExtensionValue();
    if (v6 && !DERParseSequenceSpec())
    {
      v7 = 0;
    }
    else
    {
      SESDefaultLogObject();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    SESDefaultLogObject();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)revokedEndpointWithPublicKeyIdentifier:(id)a3 appletIdentifier:(id)a4 revocationAttestation:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10 && v12)
  {
    v14 = objc_opt_new();
    objc_storeStrong((id *)(v14 + 16), a4);
    objc_storeStrong((id *)(v14 + 48), a3);
    objc_storeStrong((id *)(v14 + 384), a5);
    objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToData:", v11);

    if ((v16 & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(CFSTR("A00000085801010100000001"), "hexStringAsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToData:", v11);

      if ((v20 & 1) != 0)
      {
        v17 = 3;
      }
      else
      {
        objc_msgSend(CFSTR("A00000085802010100000001"), "hexStringAsData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToData:", v11);

        if ((v22 & 1) != 0)
        {
          v17 = 2;
        }
        else
        {
          objc_msgSend(CFSTR("A000000909ACCE5501"), "hexStringAsData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToData:", v11);

          if ((v24 & 1) == 0)
          {
            if (a6)
            {
              SESDefaultLogObject();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              SESCreateAndLogError();
              *a6 = (id)objc_claimAutoreleasedReturnValue();

            }
            v18 = 0;
            goto LABEL_15;
          }
          v17 = 5;
        }
      }
    }
    *(_QWORD *)(v14 + 8) = v17;
    v18 = (id)v14;
LABEL_15:

    goto LABEL_16;
  }
  if (a6)
  {
    SESDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (id)validateAuthorizedEndpointConfig:(id)a3
{
  const __CFData *v4;
  void *v5;
  char v6;
  void *v7;
  SecCertificateRef v8;
  SecCertificateRef v9;
  void *v10;
  void *v12;

  v4 = (const __CFData *)a3;
  if (!v4)
    goto LABEL_8;
  -[SEEndPoint configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authorizeEndPointWithAuthorizeAllowed");

  if ((v6 & 1) == 0)
  {
    v8 = SecCertificateCreateWithData(0, v4);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)SecCertificateCopyExtensionValue();
      CFRelease(v9);
      if (v10)
      {
        objc_msgSend(v10, "DERItem");
        DERParseSequenceSpec();
        SESDefaultLogObject();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
    }
LABEL_8:
    SESDefaultLogObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (void)prependCertificateChain:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *certificates;
  id v7;

  v4 = a3;
  -[SEEndPoint certificates](self, "certificates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  certificates = self->_certificates;
  self->_certificates = v5;

}

- (void)configurePrivateDataOffset:(unsigned __int16)a3 privateDataLength:(unsigned __int16)a4 confidentialDataOffset:(unsigned __int16)a5 confidentialDataLength:(unsigned __int16)a6 contactlessVisibility:(BOOL)a7 wiredVisibility:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[SEEndPoint configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOffsetPrivateMailBox:", v13);

  -[SEEndPoint configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLengthPrivateMailBox:", v12);

  -[SEEndPoint configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOffsetConfidentialMailBox:", v11);

  -[SEEndPoint configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLengthConfidentialMailBox:", v10);

  -[SEEndPoint configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEnabledOnContactless:", v9);

  -[SEEndPoint configuration](self, "configuration");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEnabledOnWire:", v8);

}

- (id)configurePrivateData:(id)a3 confidentialData:(id)a4 contactlessPersistentVisibility:(id)a5 wiredPersistentVisibility:(id)a6 nfcExpressOnlyInLPM:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unsigned __int16 *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int16 *v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    if (objc_msgSend(v12, "length") != 3)
      goto LABEL_12;
    v43 = v14;
    v17 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v18 = *v17;
    v19 = __rev16(v18);
    v20 = bswap32(v18);
    v21 = *((unsigned __int8 *)v17 + 2);
    -[SEEndPoint privateMailBoxSize](self, "privateMailBoxSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    if (v23 < v21 + HIWORD(v20))
    {
      SESDefaultLogObject();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SEEndPoint privateMailBoxSize](self, "privateMailBoxSize");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unsignedIntValue");
      SESCreateAndLogError();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      v14 = v43;
      goto LABEL_20;
    }
    -[SEEndPoint configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setOffsetPrivateMailBox:", v19);

    -[SEEndPoint configuration](self, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLengthPrivateMailBox:", v21);

    v14 = v43;
  }
  if (!v13)
    goto LABEL_14;
  if (objc_msgSend(v13, "length") != 3)
  {
LABEL_12:
    SESDefaultLogObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "length");
    SESCreateAndLogError();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v43 = v14;
  v29 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
  v30 = *v29;
  v31 = __rev16(v30);
  v32 = bswap32(v30);
  v33 = *((unsigned __int8 *)v29 + 2);
  -[SEEndPoint confidentialMailBoxSize](self, "confidentialMailBoxSize");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedIntegerValue");

  if (v35 < v33 + HIWORD(v32))
  {
    SESDefaultLogObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SEEndPoint privateMailBoxSize](self, "privateMailBoxSize");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "unsignedIntValue");
    SESCreateAndLogError();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  -[SEEndPoint configuration](self, "configuration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setOffsetConfidentialMailBox:", v31);

  -[SEEndPoint configuration](self, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLengthConfidentialMailBox:", v33);

  v14 = v43;
LABEL_14:
  if (v14)
  {
    -[SEEndPoint configuration](self, "configuration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEnabledOnContactless:", objc_msgSend(v14, "BOOLValue"));

  }
  if (v15)
  {
    -[SEEndPoint configuration](self, "configuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEnabledOnWire:", objc_msgSend(v15, "BOOLValue"));

  }
  if (!v16)
  {
    v26 = 0;
    goto LABEL_21;
  }
  v41 = objc_msgSend(v16, "BOOLValue");
  -[SEEndPoint configuration](self, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNfcExpressOnlyInLPM:", v41);
  v26 = 0;
LABEL_20:

LABEL_21:
  return v26;
}

- (id)generateEndPointPrivacyLongTermPrivacyKey
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  SecAccessControlRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;
  SecKeyRef v16;
  SecKeyRef v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  CFErrorRef error;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[3];
  _QWORD v28[4];

  v2 = (uint64_t)self;
  v28[3] = *MEMORY[0x24BDAC8D0];
  -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)v2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@::LTPrivacyKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFTypeRef)*MEMORY[0x24BDE8F68], 0, 0);
  SecAccessControlSetConstraints();
  v10 = *MEMORY[0x24BDE9060];
  v11 = *MEMORY[0x24BDE9048];
  v27[0] = *MEMORY[0x24BDE9050];
  v27[1] = v11;
  v28[0] = v10;
  v28[1] = &unk_24C2CB728;
  v27[2] = *MEMORY[0x24BDE9468];
  v12 = *MEMORY[0x24BDE9018];
  v25[0] = *MEMORY[0x24BDE9528];
  v25[1] = v12;
  v26[0] = MEMORY[0x24BDBD1C8];
  v26[1] = MEMORY[0x24BDBD1C8];
  v13 = *MEMORY[0x24BDE8F48];
  v25[2] = *MEMORY[0x24BDE8FB8];
  v25[3] = v13;
  v26[2] = v8;
  v26[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v16 = SecKeyCreateRandomKey(v15, &error);
  v17 = v16;
  v18 = error;
  if (error || !v16)
  {
    SESDefaultLogObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v2 = objc_claimAutoreleasedReturnValue();
    v22 = 1;
  }
  else
  {
    objc_storeStrong((id *)(v2 + 448), v8);
    getSecKeyPublicBytes();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = v19;
    if (v18 || !v19)
    {
      SESDefaultLogObject();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v2 = objc_claimAutoreleasedReturnValue();
      v22 = 1;
    }
    else
    {
      objc_storeStrong((id *)(v2 + 56), 0);
      objc_msgSend(v20, "sha1");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = *(void **)(v2 + 64);
      *(_QWORD *)(v2 + 64) = v21;
    }

  }
  if (!v22)
    return 0;
  else
    return (id)v2;
}

- (id)deleteEndPointLongTermPrivacyKey
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  void *privacyKeyIdentifier;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "length");

  if (v4)
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "Deleting long term privacy key %@", buf, 0xCu);

    }
    v7 = *MEMORY[0x24BDE9220];
    v14[0] = *MEMORY[0x24BDE9248];
    v8 = *MEMORY[0x24BDE8FB8];
    v13[0] = v7;
    v13[1] = v8;
    -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = *MEMORY[0x24BDE9528];
    v14[1] = v9;
    v14[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (SecItemDelete(v10))
    {
      SESDefaultLogObject();
      privacyKeyIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
      privacyKeyIdentifier = self->_privacyKeyIdentifier;
      self->_privacyKeyIdentifier = 0;
    }

  }
  return v4;
}

- (unint64_t)getEndpointUser
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  int v9;

  if (-[SEEndPoint endPointType](self, "endPointType") != 1)
    return 2;
  -[SEEndPoint identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("OWNR"));

    if ((v7 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("FRND"));

      if (v9)
        v5 = 1;
      else
        v5 = 2;
    }
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *sharingRecords;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t j;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _QWORD v177[5];
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t (*v181)(uint64_t, uint64_t);
  void (*v182)(uint64_t);
  id v183;
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x24BDAC8D0];
  v178 = 0;
  v179 = &v178;
  v180 = 0x3032000000;
  v181 = __Block_byref_object_copy__1;
  v182 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v183 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)v179[5];
  -[SEEndPoint identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Identifier : %@ : {\n"), v4);

  v5 = (void *)v179[5];
  -[SEEndPoint appletIdentifier](self, "appletIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tAppletIdentifier : %@\n"), v7);

  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\tsharingRecords : {\n"));
  sharingRecords = self->_sharingRecords;
  v177[0] = MEMORY[0x24BDAC760];
  v177[1] = 3221225472;
  v177[2] = __25__SEEndPoint_description__block_invoke;
  v177[3] = &unk_24C2BCE60;
  v177[4] = &v178;
  -[NSArray enumerateObjectsUsingBlock:](sharingRecords, "enumerateObjectsUsingBlock:", v177);
  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\t}\n"));
  v9 = (void *)v179[5];
  -[SEEndPoint revocationAttestation](self, "revocationAttestation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("REVOKED");
  if (!v10)
    v11 = CFSTR("ACTIVE");
  objc_msgSend(v9, "appendFormat:", CFSTR("\tstate : %@\n"), v11);

  v12 = (void *)v179[5];
  -[SEEndPoint issuerIdentifier](self, "issuerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendFormat:", CFSTR("\tissuerIdentifier : %@\n"), v13);

  v14 = (void *)v179[5];
  -[SEEndPoint subjectIdentifier](self, "subjectIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR("\tsubjectIdentifier : %@\n"), v15);

  v16 = (void *)v179[5];
  -[SEEndPoint publicKey](self, "publicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asHexString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("\tpublicKey : %@\n"), v18);

  v19 = (void *)v179[5];
  -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "asHexString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendFormat:", CFSTR("\tpublicKeyIdentifier : %@\n"), v21);

  v22 = (void *)v179[5];
  -[SEEndPoint privacyPublicKey](self, "privacyPublicKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "asHexString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", CFSTR("\tprivacyPublicKey : %@\n"), v24);

  v25 = (void *)v179[5];
  -[SEEndPoint privacyPublicKeyIdentifier](self, "privacyPublicKeyIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "asHexString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("\tprivacyPublicKeyIdentifier : %@\n"), v27);

  v28 = (void *)v179[5];
  -[SEEndPoint configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "appendFormat:", CFSTR("\tconfiguration : %@,\n"), v29);

  v30 = (void *)v179[5];
  -[SEEndPoint readerIdentifier](self, "readerIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "asHexString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR("\treaderIdentifier : %@,\n"), v32);

  v33 = (void *)v179[5];
  -[SEEndPoint readerPublicKey](self, "readerPublicKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "asHexString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "appendFormat:", CFSTR("\treaderPublicKey : %@,\n"), v35);

  v36 = (void *)v179[5];
  -[SEEndPoint keyIdentifier](self, "keyIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "asHexString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendFormat:", CFSTR("\tkeyIdentifier : %@,\n"), v38);

  v39 = (void *)v179[5];
  -[SEEndPoint confidentialMailBoxSize](self, "confidentialMailBoxSize");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appendFormat:", CFSTR("\tconfidentialMailBoxSize : %@,\n"), v40);

  v41 = (void *)v179[5];
  -[SEEndPoint privateMailBoxSize](self, "privateMailBoxSize");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendFormat:", CFSTR("\tprivateMailBoxSize : %@,\n"), v42);

  v43 = (void *)v179[5];
  -[SEEndPoint counter](self, "counter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "appendFormat:", CFSTR("\tcounter : %@,\n"), v44);

  v45 = (void *)v179[5];
  -[SEEndPoint authorizedKeys](self, "authorizedKeys");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendFormat:", CFSTR("\tauthorizedKeys (%lu) : {\n"), objc_msgSend(v46, "count"));

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  -[SEEndPoint authorizedKeys](self, "authorizedKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v174;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v174 != v49)
          objc_enumerationMutation(v47);
        v51 = (void *)v179[5];
        objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * i), "asHexString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendFormat:", CFSTR("\t\t%@,\n"), v52);

      }
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
    }
    while (v48);
  }

  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\t}\n"));
  v53 = (void *)v179[5];
  -[SEEndPoint friendlyName](self, "friendlyName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "appendFormat:", CFSTR("\tfriendlyName : %@,\n"), v54);

  v55 = (void *)v179[5];
  -[SEEndPoint readerInfo](self, "readerInfo");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "appendFormat:", CFSTR("\treaderInfo : %@,\n"), v56);

  v57 = (void *)v179[5];
  -[SEEndPoint invitationIdentifier](self, "invitationIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "appendFormat:", CFSTR("\tinvitationIdentifier : %@,\n"), v58);

  v59 = (void *)v179[5];
  -[SEEndPoint sharingSessionUUID](self, "sharingSessionUUID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "appendFormat:", CFSTR("\tsharingSessionUUID : %@,\n"), v60);

  v61 = (void *)v179[5];
  -[SEEndPoint ownerIDSIdentifier](self, "ownerIDSIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "appendFormat:", CFSTR("\townerIDSIdentifier : %@,\n"), v62);

  v63 = (void *)v179[5];
  -[SEEndPoint mailboxMapping](self, "mailboxMapping");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "asHexString");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "appendFormat:", CFSTR("\tmailboxMapping : %@,\n"), v65);

  v66 = (void *)v179[5];
  -[SEEndPoint trackingRequest](self, "trackingRequest");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "asHexString");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "appendFormat:", CFSTR("\ttrackingRequest : %@,\n"), v68);

  v69 = (void *)v179[5];
  -[SEEndPoint trackingReceipt](self, "trackingReceipt");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "asHexString");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("\ttrackingReceipt : %@,\n"), v71);

  v72 = (void *)v179[5];
  -[SEEndPoint deviceConfiguration](self, "deviceConfiguration");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "asHexString");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "appendFormat:", CFSTR("\tdeviceConfiguration : %@,\n"), v74);

  v75 = (void *)v179[5];
  -[SEEndPoint sharingAttestationData](self, "sharingAttestationData");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "asHexString");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "appendFormat:", CFSTR("\tsharingAttestationData : %@\n"), v77);

  v78 = (void *)v179[5];
  -[SEEndPoint ownerEphemeralKey](self, "ownerEphemeralKey");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "asHexString");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "appendFormat:", CFSTR("\townerEphemeralKey : %@\n"), v80);

  v81 = (void *)v179[5];
  -[SEEndPoint additionalAttestationsDict](self, "additionalAttestationsDict");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "appendFormat:", CFSTR("\tadditionalAttestationsDict : %lu\n"), objc_msgSend(v82, "count"));

  v83 = (void *)v179[5];
  -[SEEndPoint sharingEncryptedData](self, "sharingEncryptedData");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "asHexString");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "appendFormat:", CFSTR("\tsharingEncryptedData : %@\n"), v85);

  v86 = (void *)v179[5];
  -[SEEndPoint revocationAttestation](self, "revocationAttestation");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "asHexString");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "appendFormat:", CFSTR("\trevocationAttestation : %@\n"), v88);

  v89 = (void *)v179[5];
  -[SEEndPoint terminatedByTaskID](self, "terminatedByTaskID");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "appendFormat:", CFSTR("\tterminatedByTaskID : %@\n"), v90);

  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\tcarOEMProprietaryData : {\n"));
  -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    v92 = (void *)v179[5];
    -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "version");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "appendFormat:", CFSTR("\t\tversion : %@,\n"), v94);

    v95 = (void *)v179[5];
    -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "cipherText");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "asHexString");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "appendFormat:", CFSTR("\t\tcipherText : %@,\n"), v98);

    v99 = (void *)v179[5];
    -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "ephemeralPublicKeydata");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "asHexString");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "appendFormat:", CFSTR("\t\tephemeralPublicKeydata : %@,\n"), v102);

    v103 = (void *)v179[5];
    -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "receiverPublicKeyHash");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "asHexString");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "appendFormat:", CFSTR("\t\treceiverPublicKeyHash : %@,\n"), v106);

  }
  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\t},\n"));
  v107 = (void *)v179[5];
  -[SEEndPoint environment](self, "environment");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "appendFormat:", CFSTR("\tenvironment : %@,\n"), v108);

  v109 = (void *)v179[5];
  -[SEEndPoint sharingTokenAvailabilityBitmap](self, "sharingTokenAvailabilityBitmap");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "appendFormat:", CFSTR("\tsharingTokenAvailabilityBitmap : %@,\n"), v110);

  v111 = (void *)v179[5];
  -[SEEndPoint homeUUIDString](self, "homeUUIDString");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "appendFormat:", CFSTR("\thomeUUID : %@,\n"), v112);

  v113 = (void *)v179[5];
  -[SEEndPoint certificates](self, "certificates");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "appendFormat:", CFSTR("\tcertificates (%lu) : {\n"), objc_msgSend(v114, "count"));

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  -[SEEndPoint certificates](self, "certificates");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
  if (v116)
  {
    v117 = *(_QWORD *)v170;
    do
    {
      for (j = 0; j != v116; ++j)
      {
        if (*(_QWORD *)v170 != v117)
          objc_enumerationMutation(v115);
        v119 = (void *)v179[5];
        objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * j), "asHexString");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "appendFormat:", CFSTR("\t\t%@,\n"), v120);

      }
      v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
    }
    while (v116);
  }

  objc_msgSend((id)v179[5], "appendFormat:", CFSTR("\t}\n}\n"));
  v121 = (void *)v179[5];
  -[SEEndPoint readerLongTermPublicKeyCertificate](self, "readerLongTermPublicKeyCertificate");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "asHexString");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "appendFormat:", CFSTR("\treaderLongTermPublicKeyCertificate : %@,\n"), v123);

  v124 = (void *)v179[5];
  -[SEEndPoint bleUUID](self, "bleUUID");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "appendFormat:", CFSTR("\tbleUUID : %@\n"), v125);

  v126 = (void *)v179[5];
  -[SEEndPoint bleIntroKey](self, "bleIntroKey");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "asHexString");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "appendFormat:", CFSTR("\tbleIntroKey : %@\n"), v128);

  v129 = (void *)v179[5];
  -[SEEndPoint bleOOBKey](self, "bleOOBKey");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "asHexString");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "appendFormat:", CFSTR("\tbleOOBKey : %@\n"), v131);

  v132 = (void *)v179[5];
  -[SEEndPoint bleOOBMasterKey](self, "bleOOBMasterKey");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "asHexString");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "appendFormat:", CFSTR("\tbleOOBMasterKey : %@\n"), v134);

  v135 = (void *)v179[5];
  -[SEEndPoint bleDCKIdentifier](self, "bleDCKIdentifier");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "asHexString");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "appendFormat:", CFSTR("\tbleDCKIdentifier : %@\n"), v137);

  v138 = (void *)v179[5];
  -[SEEndPoint bleAddress](self, "bleAddress");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "asHexString");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "appendFormat:", CFSTR("\tbleAddress : %@\n"), v140);

  v141 = (void *)v179[5];
  -[SEEndPoint blePairingRequest](self, "blePairingRequest");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "appendFormat:", CFSTR("\tblePairingRequest : %@\n"), v142);

  v143 = (void *)v179[5];
  -[SEEndPoint supportedRKEFunctions](self, "supportedRKEFunctions");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "appendFormat:", CFSTR("\tsupportedRKEFunctions : %@\n"), v144);

  v145 = (void *)v179[5];
  -[SEEndPoint longTermSharedSecret](self, "longTermSharedSecret");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "appendFormat:", CFSTR("\tlongTermSharedSecret length : %lu\n"), objc_msgSend(v146, "length"));

  v147 = (void *)v179[5];
  -[SEEndPoint readerConfigID](self, "readerConfigID");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "asHexString");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "appendFormat:", CFSTR("\treaderConfigID : %@,\n"), v149);

  v150 = (void *)v179[5];
  -[SEEndPoint hupData](self, "hupData");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "asHexString");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "appendFormat:", CFSTR("\thupData : %@,\n"), v152);

  v153 = (void *)v179[5];
  -[SEEndPoint hupDone](self, "hupDone");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "appendFormat:", CFSTR("\thupDone : %d,\n"), objc_msgSend(v154, "BOOLValue"));

  v155 = (void *)v179[5];
  -[SEEndPoint vehicleSupportedVersionsData](self, "vehicleSupportedVersionsData");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "asHexString");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "appendFormat:", CFSTR("\tvehicleSupportedVersionsData : %@,\n"), v157);

  v158 = (void *)v179[5];
  -[SEEndPoint mailboxSizesPlusAdditionalData](self, "mailboxSizesPlusAdditionalData");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "asHexString");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "appendFormat:", CFSTR("\tmailboxSizesPlusAdditionalData : %@,\n"), v160);

  v161 = (void *)v179[5];
  -[SEEndPoint slotIdentifier](self, "slotIdentifier");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "appendFormat:", CFSTR("\tslotIdentifier length : %ld,\n"), objc_msgSend(v162, "length"));

  v163 = (void *)v179[5];
  -[SEEndPoint upgradeEndpointJSONData](self, "upgradeEndpointJSONData");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "appendFormat:", CFSTR("\tupgradeEndpointJSONData length : %ld,\n"), objc_msgSend(v164, "length"));

  v165 = (void *)v179[5];
  -[SEEndPoint anonymizedDsid](self, "anonymizedDsid");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "appendFormat:", CFSTR("\tanonymizedDsid length : %ld,\n"), objc_msgSend(v166, "length"));

  v167 = (id)v179[5];
  _Block_object_dispose(&v178, 8);

  return v167;
}

void __25__SEEndPoint_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "asHexString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t%lu : %@,\n"), a3, v5);

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  unsigned int v75;
  void *v76;
  unsigned int v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, void *, uint64_t);
  void *v87;
  id v88;

  v3 = (void *)objc_opt_new();
  -[SEEndPoint identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SEEndPoint identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  -[SEEndPoint appletIdentifier](self, "appletIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SEEndPoint appletIdentifier](self, "appletIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appletIdentifier"));

  }
  -[SEEndPoint subjectIdentifier](self, "subjectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SEEndPoint subjectIdentifier](self, "subjectIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subjectIdentifier"));

  }
  -[SEEndPoint issuerIdentifier](self, "issuerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SEEndPoint issuerIdentifier](self, "issuerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("issuerIdentifier"));

  }
  -[SEEndPoint publicKey](self, "publicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SEEndPoint publicKey](self, "publicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asHexString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("publicKey"));

  }
  -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "asHexString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("publicKeyIdentifier"));

  }
  -[SEEndPoint readerIdentifier](self, "readerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SEEndPoint readerIdentifier](self, "readerIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "asHexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("readerIdentifier"));

  }
  -[SEEndPoint readerPublicKey](self, "readerPublicKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SEEndPoint readerPublicKey](self, "readerPublicKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "asHexString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("readerPublicKey"));

  }
  -[SEEndPoint readerInfo](self, "readerInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SEEndPoint readerInfo](self, "readerInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("readerInfo"));

  }
  -[SEEndPoint authorizedKeys](self, "authorizedKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SEEndPoint authorizedKeys](self, "authorizedKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("authorizedKeys"));

  }
  -[SEEndPoint friendlyName](self, "friendlyName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SEEndPoint friendlyName](self, "friendlyName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("friendlyName"));

  }
  -[SEEndPoint invitationIdentifier](self, "invitationIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SEEndPoint invitationIdentifier](self, "invitationIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("invitationIdentifier"));

  }
  -[SEEndPoint sharingSessionUUID](self, "sharingSessionUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SEEndPoint sharingSessionUUID](self, "sharingSessionUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("sharingSessionUUID"));

  }
  -[SEEndPoint ownerIDSIdentifier](self, "ownerIDSIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SEEndPoint ownerIDSIdentifier](self, "ownerIDSIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("ownerIDSIdentifier"));

  }
  -[SEEndPoint trackingRequest](self, "trackingRequest");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SEEndPoint trackingRequest](self, "trackingRequest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "asHexString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("trackingRequest"));

  }
  -[SEEndPoint trackingReceipt](self, "trackingReceipt");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[SEEndPoint trackingReceipt](self, "trackingReceipt");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "asHexString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("trackingReceipt"));

  }
  -[SEEndPoint privacyPublicKey](self, "privacyPublicKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[SEEndPoint privacyPublicKey](self, "privacyPublicKey");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "asHexString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("privacyPublicKey"));

  }
  -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("privacyKeyIdentifier"));

  }
  -[SEEndPoint sharingTokenAvailabilityBitmap](self, "sharingTokenAvailabilityBitmap");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[SEEndPoint sharingTokenAvailabilityBitmap](self, "sharingTokenAvailabilityBitmap");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("sharingTokenAvailabilityBitmap"));

  }
  -[SEEndPoint bleUUID](self, "bleUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[SEEndPoint bleUUID](self, "bleUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("bleUUID"));

  }
  -[SEEndPoint readerConfigID](self, "readerConfigID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "asHexString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[SEEndPoint readerConfigID](self, "readerConfigID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "asHexString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("readerConfigID.asHexString"));

  }
  -[SEEndPoint hupData](self, "hupData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "asHexString");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[SEEndPoint hupData](self, "hupData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "asHexString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("hupData.asHexString"));

  }
  -[SEEndPoint hupDone](self, "hupDone");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[SEEndPoint hupDone](self, "hupDone");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("hupDone"));

  }
  -[SEEndPoint vehicleSupportedVersionsData](self, "vehicleSupportedVersionsData");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "asHexString");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[SEEndPoint vehicleSupportedVersionsData](self, "vehicleSupportedVersionsData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "asHexString");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("vehicleSupportedVersionsData.asHexString"));

  }
  -[SEEndPoint mailboxSizesPlusAdditionalData](self, "mailboxSizesPlusAdditionalData");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "asHexString");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[SEEndPoint mailboxSizesPlusAdditionalData](self, "mailboxSizesPlusAdditionalData");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "asHexString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("mailboxSizesPlusAdditionalData.asHexString"));

  }
  -[SEEndPoint sharingRecords](self, "sharingRecords");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = MEMORY[0x24BDAC760];
  v85 = 3221225472;
  v86 = __23__SEEndPoint_dumpState__block_invoke;
  v87 = &unk_24C2BCE88;
  v70 = v3;
  v88 = v70;
  objc_msgSend(v69, "enumerateObjectsUsingBlock:", &v84);

  v71 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPoint configuration](self, "configuration");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "opt1");
  -[SEEndPoint configuration](self, "configuration");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "opt2");
  -[SEEndPoint configuration](self, "configuration");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "optA");
  objc_msgSend(v71, "stringWithFormat:", CFSTR("Opt1 0x%X Opt2 0x%X OptA 0x%X"), v73, v75, v77, v84, v85, v86, v87);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v78, CFSTR("configuration"));

  -[SEEndPoint revocationAttestation](self, "revocationAttestation");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    v80 = CFSTR("REVOKED");
  else
    v80 = CFSTR("ACTIVE");
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v80, CFSTR("lifecycle"));

  -[SEEndPoint terminatedByTaskID](self, "terminatedByTaskID");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    -[SEEndPoint terminatedByTaskID](self, "terminatedByTaskID");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:forKeyedSubscript:", v82, CFSTR("terminatedByTaskID"));

  }
  return v70;
}

void __23__SEEndPoint_dumpState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "asHexString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sharingrecord-%u"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SEEndPoint endPointType](self, "endPointType"), CFSTR("endPointType"));
  -[SEEndPoint identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SEEndPoint sharingRecords](self, "sharingRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sharingRecords"));

  -[SEEndPoint issuerIdentifier](self, "issuerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("issuerIdentifier"));

  -[SEEndPoint subjectIdentifier](self, "subjectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subjectIdentifier"));

  -[SEEndPoint publicKey](self, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("publicKey"));

  -[SEEndPoint publicKeyIdentifier](self, "publicKeyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("publicKeyIdentifier"));

  -[SEEndPoint privacyPublicKey](self, "privacyPublicKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("privacyPublicKey"));

  -[SEEndPoint privacyPublicKeyIdentifier](self, "privacyPublicKeyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("privacyPublicKeyIdentifier"));

  -[SEEndPoint configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("configuration"));

  -[SEEndPoint readerIdentifier](self, "readerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("readerIdentifier"));

  -[SEEndPoint readerPublicKey](self, "readerPublicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("readerPublicKey"));

  -[SEEndPoint keyIdentifier](self, "keyIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("keyIdentifier"));

  -[SEEndPoint invitationIdentifier](self, "invitationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("invitationIdentifier"));

  -[SEEndPoint certificates](self, "certificates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("certificates"));

  -[SEEndPoint revocationAttestation](self, "revocationAttestation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("revocationAttestation"));

  -[SEEndPoint authorizedKeys](self, "authorizedKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("authorizedKeys"));

  -[SEEndPoint confidentialMailBoxSize](self, "confidentialMailBoxSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("confidentialMailBoxSize"));

  -[SEEndPoint privateMailBoxSize](self, "privateMailBoxSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("privateMailBoxSize"));

  -[SEEndPoint counter](self, "counter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("counter"));

  -[SEEndPoint privacyKeyIdentifier](self, "privacyKeyIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("privacyKeyIdentifier"));

  -[SEEndPoint friendlyName](self, "friendlyName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("friendlyName"));

  -[SEEndPoint readerInfo](self, "readerInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("readerInfo"));

  -[SEEndPoint mailboxMapping](self, "mailboxMapping");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("mailboxMapping"));

  -[SEEndPoint trackingRequest](self, "trackingRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("trackingRequest"));

  -[SEEndPoint trackingReceipt](self, "trackingReceipt");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("trackingReceipt"));

  -[SEEndPoint deviceConfiguration](self, "deviceConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("deviceConfiguration"));

  -[SEEndPoint sharingAttestationData](self, "sharingAttestationData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("sharingAttestationData"));

  -[SEEndPoint ownerEphemeralKey](self, "ownerEphemeralKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("ownerEphemeralKey"));

  -[SEEndPoint sharingEncryptedData](self, "sharingEncryptedData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("sharingEncryptedData"));

  -[SEEndPoint additionalAttestationsDict](self, "additionalAttestationsDict");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("additionalAttestationsDict"));

  -[SEEndPoint environment](self, "environment");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("environment"));

  -[SEEndPoint sharingTokenAvailabilityBitmap](self, "sharingTokenAvailabilityBitmap");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("sharingTokenAvailabilityBitmap"));

  -[SEEndPoint bleUUID](self, "bleUUID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("bleUUID"));

  -[SEEndPoint readerLongTermPublicKeyCertificate](self, "readerLongTermPublicKeyCertificate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("readerLongTermPublicKeyCertificate"));

  -[SEEndPoint carOEMProprietaryData](self, "carOEMProprietaryData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("carOEMProprietaryData"));

  -[SEEndPoint bleIntroKey](self, "bleIntroKey");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("bleIntroKey"));

  -[SEEndPoint bleOOBKey](self, "bleOOBKey");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("bleOOBKey"));

  -[SEEndPoint bleOOBMasterKey](self, "bleOOBMasterKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("bleOOBMasterKey"));

  -[SEEndPoint bleDCKIdentifier](self, "bleDCKIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("bleDCKIdentifier"));

  -[SEEndPoint bleAddress](self, "bleAddress");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("bleAddress"));

  -[SEEndPoint blePairingRequest](self, "blePairingRequest");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("blePairingRequest"));

  -[SEEndPoint supportedRKEFunctions](self, "supportedRKEFunctions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("supportedRKEFunctions"));

  -[SEEndPoint appletIdentifier](self, "appletIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("appletIdentifier"));

  -[SEEndPoint terminatedByTaskID](self, "terminatedByTaskID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v48, CFSTR("terminatedByTaskID"));

  -[SEEndPoint longTermSharedSecret](self, "longTermSharedSecret");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("longTermSharedSecret"));

  -[SEEndPoint ownerIDSIdentifier](self, "ownerIDSIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("ownerIDSIdentifier"));

  -[SEEndPoint sharingSessionUUID](self, "sharingSessionUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, CFSTR("sharingSessionUUID"));

  -[SEEndPoint readerConfigID](self, "readerConfigID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v52, CFSTR("readerConfigID"));

  -[SEEndPoint hupData](self, "hupData");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v53, CFSTR("hupData"));

  -[SEEndPoint hupDone](self, "hupDone");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v54, CFSTR("hupDone"));

  -[SEEndPoint vehicleSupportedVersionsData](self, "vehicleSupportedVersionsData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v55, CFSTR("vehicleSupportedVersionsData"));

  -[SEEndPoint mailboxSizesPlusAdditionalData](self, "mailboxSizesPlusAdditionalData");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v56, CFSTR("mailboxSizesPlusAdditionalData"));

  -[SEEndPoint slotIdentifier](self, "slotIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v57, CFSTR("slotIdentifier"));

  -[SEEndPoint homeUUIDString](self, "homeUUIDString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v58, CFSTR("homeUUIDString"));

  -[SEEndPoint upgradeEndpointJSONData](self, "upgradeEndpointJSONData");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v59, CFSTR("upgradeEndpointJSONData"));

  -[SEEndPoint anonymizedDsid](self, "anonymizedDsid");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v60, CFSTR("anonymizedDsid"));

}

- (SEEndPoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SEEndPoint *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSArray *sharingRecords;
  uint64_t v18;
  NSString *issuerIdentifier;
  uint64_t v20;
  NSString *subjectIdentifier;
  uint64_t v22;
  NSData *publicKey;
  uint64_t v24;
  NSData *publicKeyIdentifier;
  uint64_t v26;
  NSData *privacyPublicKey;
  uint64_t v28;
  NSData *privacyPublicKeyIdentifier;
  uint64_t v30;
  SEEndPointConfiguration *configuration;
  uint64_t v32;
  NSData *readerIdentifier;
  uint64_t v34;
  NSData *readerPublicKey;
  uint64_t v36;
  NSData *keyIdentifier;
  uint64_t v38;
  NSString *invitationIdentifier;
  uint64_t v40;
  NSString *privacyKeyIdentifier;
  uint64_t v42;
  NSArray *certificates;
  uint64_t v44;
  NSData *revocationAttestation;
  uint64_t v46;
  NSArray *authorizedKeys;
  uint64_t v48;
  NSNumber *confidentialMailBoxSize;
  uint64_t v50;
  NSNumber *privateMailBoxSize;
  uint64_t v52;
  NSNumber *counter;
  uint64_t v54;
  NSString *friendlyName;
  uint64_t v56;
  NSString *readerInfo;
  uint64_t v58;
  NSData *mailboxMapping;
  uint64_t v60;
  NSData *trackingRequest;
  uint64_t v62;
  NSData *trackingReceipt;
  uint64_t v64;
  NSData *deviceConfiguration;
  uint64_t v66;
  NSData *sharingAttestationData;
  uint64_t v68;
  NSData *ownerEphemeralKey;
  uint64_t v70;
  NSData *sharingEncryptedData;
  uint64_t v72;
  NSDictionary *additionalAttestationsDict;
  uint64_t v74;
  NSString *environment;
  uint64_t v76;
  NSNumber *sharingTokenAvailabilityBitmap;
  uint64_t v78;
  NSString *bleUUID;
  uint64_t v80;
  NSData *readerLongTermPublicKeyCertificate;
  uint64_t v82;
  SEEndPointPrivacyEncryptResponse *carOEMProprietaryData;
  uint64_t v84;
  NSData *bleIntroKey;
  uint64_t v86;
  NSData *bleOOBKey;
  uint64_t v88;
  NSData *bleOOBMasterKey;
  uint64_t v90;
  NSData *bleDCKIdentifier;
  uint64_t v92;
  NSData *bleAddress;
  uint64_t v94;
  NSNumber *blePairingRequest;
  uint64_t v96;
  NSData *longTermSharedSecret;
  uint64_t v98;
  NSString *ownerIDSIdentifier;
  uint64_t v100;
  NSString *sharingSessionUUID;
  uint64_t v102;
  NSArray *supportedRKEFunctions;
  uint64_t v104;
  NSData *appletIdentifier;
  uint64_t v106;
  NSString *terminatedByTaskID;
  uint64_t v108;
  NSData *readerConfigID;
  uint64_t v110;
  NSData *hupData;
  uint64_t v112;
  NSNumber *hupDone;
  uint64_t v114;
  NSData *vehicleSupportedVersionsData;
  uint64_t v116;
  NSData *mailboxSizesPlusAdditionalData;
  uint64_t v118;
  NSData *slotIdentifier;
  uint64_t v120;
  NSString *homeUUIDString;
  uint64_t v122;
  NSData *upgradeEndpointJSONData;
  uint64_t v124;
  NSData *anonymizedDsid;
  NSObject *v126;
  void *v127;
  NSObject *v128;
  uint64_t v129;
  NSData *v130;
  objc_super v132;
  uint8_t buf[4];
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v132.receiver = self;
  v132.super_class = (Class)SEEndPoint;
  v13 = -[SEEndPoint init](&v132, sel_init);
  if (v13)
  {
    v13->_endPointType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("endPointType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sharingRecords"));
    v16 = objc_claimAutoreleasedReturnValue();
    sharingRecords = v13->_sharingRecords;
    v13->_sharingRecords = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    issuerIdentifier = v13->_issuerIdentifier;
    v13->_issuerIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    subjectIdentifier = v13->_subjectIdentifier;
    v13->_subjectIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    publicKey = v13->_publicKey;
    v13->_publicKey = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    publicKeyIdentifier = v13->_publicKeyIdentifier;
    v13->_publicKeyIdentifier = (NSData *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPublicKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    privacyPublicKey = v13->_privacyPublicKey;
    v13->_privacyPublicKey = (NSData *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPublicKeyIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    privacyPublicKeyIdentifier = v13->_privacyPublicKeyIdentifier;
    v13->_privacyPublicKeyIdentifier = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v30 = objc_claimAutoreleasedReturnValue();
    configuration = v13->_configuration;
    v13->_configuration = (SEEndPointConfiguration *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v13->_readerIdentifier;
    v13->_readerIdentifier = (NSData *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerPublicKey"));
    v34 = objc_claimAutoreleasedReturnValue();
    readerPublicKey = v13->_readerPublicKey;
    v13->_readerPublicKey = (NSData *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v13->_keyIdentifier;
    v13->_keyIdentifier = (NSData *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    invitationIdentifier = v13->_invitationIdentifier;
    v13->_invitationIdentifier = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyKeyIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    privacyKeyIdentifier = v13->_privacyKeyIdentifier;
    v13->_privacyKeyIdentifier = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("certificates"));
    v42 = objc_claimAutoreleasedReturnValue();
    certificates = v13->_certificates;
    v13->_certificates = (NSArray *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revocationAttestation"));
    v44 = objc_claimAutoreleasedReturnValue();
    revocationAttestation = v13->_revocationAttestation;
    v13->_revocationAttestation = (NSData *)v44;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("authorizedKeys"));
    v46 = objc_claimAutoreleasedReturnValue();
    authorizedKeys = v13->_authorizedKeys;
    v13->_authorizedKeys = (NSArray *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidentialMailBoxSize"));
    v48 = objc_claimAutoreleasedReturnValue();
    confidentialMailBoxSize = v13->_confidentialMailBoxSize;
    v13->_confidentialMailBoxSize = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMailBoxSize"));
    v50 = objc_claimAutoreleasedReturnValue();
    privateMailBoxSize = v13->_privateMailBoxSize;
    v13->_privateMailBoxSize = (NSNumber *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("counter"));
    v52 = objc_claimAutoreleasedReturnValue();
    counter = v13->_counter;
    v13->_counter = (NSNumber *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendlyName"));
    v54 = objc_claimAutoreleasedReturnValue();
    friendlyName = v13->_friendlyName;
    v13->_friendlyName = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerInfo"));
    v56 = objc_claimAutoreleasedReturnValue();
    readerInfo = v13->_readerInfo;
    v13->_readerInfo = (NSString *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mailboxMapping"));
    v58 = objc_claimAutoreleasedReturnValue();
    mailboxMapping = v13->_mailboxMapping;
    v13->_mailboxMapping = (NSData *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingRequest"));
    v60 = objc_claimAutoreleasedReturnValue();
    trackingRequest = v13->_trackingRequest;
    v13->_trackingRequest = (NSData *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingReceipt"));
    v62 = objc_claimAutoreleasedReturnValue();
    trackingReceipt = v13->_trackingReceipt;
    v13->_trackingReceipt = (NSData *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceConfiguration"));
    v64 = objc_claimAutoreleasedReturnValue();
    deviceConfiguration = v13->_deviceConfiguration;
    v13->_deviceConfiguration = (NSData *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingAttestationData"));
    v66 = objc_claimAutoreleasedReturnValue();
    sharingAttestationData = v13->_sharingAttestationData;
    v13->_sharingAttestationData = (NSData *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerEphemeralKey"));
    v68 = objc_claimAutoreleasedReturnValue();
    ownerEphemeralKey = v13->_ownerEphemeralKey;
    v13->_ownerEphemeralKey = (NSData *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingEncryptedData"));
    v70 = objc_claimAutoreleasedReturnValue();
    sharingEncryptedData = v13->_sharingEncryptedData;
    v13->_sharingEncryptedData = (NSData *)v70;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("additionalAttestationsDict"));
    v72 = objc_claimAutoreleasedReturnValue();
    additionalAttestationsDict = v13->_additionalAttestationsDict;
    v13->_additionalAttestationsDict = (NSDictionary *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v74 = objc_claimAutoreleasedReturnValue();
    environment = v13->_environment;
    v13->_environment = (NSString *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingTokenAvailabilityBitmap"));
    v76 = objc_claimAutoreleasedReturnValue();
    sharingTokenAvailabilityBitmap = v13->_sharingTokenAvailabilityBitmap;
    v13->_sharingTokenAvailabilityBitmap = (NSNumber *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleUUID"));
    v78 = objc_claimAutoreleasedReturnValue();
    bleUUID = v13->_bleUUID;
    v13->_bleUUID = (NSString *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerLongTermPublicKeyCertificate"));
    v80 = objc_claimAutoreleasedReturnValue();
    readerLongTermPublicKeyCertificate = v13->_readerLongTermPublicKeyCertificate;
    v13->_readerLongTermPublicKeyCertificate = (NSData *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carOEMProprietaryData"));
    v82 = objc_claimAutoreleasedReturnValue();
    carOEMProprietaryData = v13->_carOEMProprietaryData;
    v13->_carOEMProprietaryData = (SEEndPointPrivacyEncryptResponse *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleIntroKey"));
    v84 = objc_claimAutoreleasedReturnValue();
    bleIntroKey = v13->_bleIntroKey;
    v13->_bleIntroKey = (NSData *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleOOBKey"));
    v86 = objc_claimAutoreleasedReturnValue();
    bleOOBKey = v13->_bleOOBKey;
    v13->_bleOOBKey = (NSData *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleOOBMasterKey"));
    v88 = objc_claimAutoreleasedReturnValue();
    bleOOBMasterKey = v13->_bleOOBMasterKey;
    v13->_bleOOBMasterKey = (NSData *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleDCKIdentifier"));
    v90 = objc_claimAutoreleasedReturnValue();
    bleDCKIdentifier = v13->_bleDCKIdentifier;
    v13->_bleDCKIdentifier = (NSData *)v90;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleAddress"));
    v92 = objc_claimAutoreleasedReturnValue();
    bleAddress = v13->_bleAddress;
    v13->_bleAddress = (NSData *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blePairingRequest"));
    v94 = objc_claimAutoreleasedReturnValue();
    blePairingRequest = v13->_blePairingRequest;
    v13->_blePairingRequest = (NSNumber *)v94;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longTermSharedSecret"));
    v96 = objc_claimAutoreleasedReturnValue();
    longTermSharedSecret = v13->_longTermSharedSecret;
    v13->_longTermSharedSecret = (NSData *)v96;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerIDSIdentifier"));
    v98 = objc_claimAutoreleasedReturnValue();
    ownerIDSIdentifier = v13->_ownerIDSIdentifier;
    v13->_ownerIDSIdentifier = (NSString *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionUUID"));
    v100 = objc_claimAutoreleasedReturnValue();
    sharingSessionUUID = v13->_sharingSessionUUID;
    v13->_sharingSessionUUID = (NSString *)v100;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedRKEFunctions"));
    v102 = objc_claimAutoreleasedReturnValue();
    supportedRKEFunctions = v13->_supportedRKEFunctions;
    v13->_supportedRKEFunctions = (NSArray *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v104 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v13->_appletIdentifier;
    v13->_appletIdentifier = (NSData *)v104;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("terminatedByTaskID"));
    v106 = objc_claimAutoreleasedReturnValue();
    terminatedByTaskID = v13->_terminatedByTaskID;
    v13->_terminatedByTaskID = (NSString *)v106;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerConfigID"));
    v108 = objc_claimAutoreleasedReturnValue();
    readerConfigID = v13->_readerConfigID;
    v13->_readerConfigID = (NSData *)v108;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hupData"));
    v110 = objc_claimAutoreleasedReturnValue();
    hupData = v13->_hupData;
    v13->_hupData = (NSData *)v110;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hupDone"));
    v112 = objc_claimAutoreleasedReturnValue();
    hupDone = v13->_hupDone;
    v13->_hupDone = (NSNumber *)v112;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleSupportedVersionsData"));
    v114 = objc_claimAutoreleasedReturnValue();
    vehicleSupportedVersionsData = v13->_vehicleSupportedVersionsData;
    v13->_vehicleSupportedVersionsData = (NSData *)v114;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mailboxSizesPlusAdditionalData"));
    v116 = objc_claimAutoreleasedReturnValue();
    mailboxSizesPlusAdditionalData = v13->_mailboxSizesPlusAdditionalData;
    v13->_mailboxSizesPlusAdditionalData = (NSData *)v116;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slotIdentifier"));
    v118 = objc_claimAutoreleasedReturnValue();
    slotIdentifier = v13->_slotIdentifier;
    v13->_slotIdentifier = (NSData *)v118;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUUIDString"));
    v120 = objc_claimAutoreleasedReturnValue();
    homeUUIDString = v13->_homeUUIDString;
    v13->_homeUUIDString = (NSString *)v120;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("upgradeEndpointJSONData"));
    v122 = objc_claimAutoreleasedReturnValue();
    upgradeEndpointJSONData = v13->_upgradeEndpointJSONData;
    v13->_upgradeEndpointJSONData = (NSData *)v122;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anonymizedDsid"));
    v124 = objc_claimAutoreleasedReturnValue();
    anonymizedDsid = v13->_anonymizedDsid;
    v13->_anonymizedDsid = (NSData *)v124;

    if (!v13->_endPointType)
    {
      SESDefaultLogObject();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        -[NSData asHexString](v13->_publicKeyIdentifier, "asHexString");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v134 = v127;
        _os_log_impl(&dword_20A048000, v126, OS_LOG_TYPE_INFO, "Loading from pre15.X, inferring SEEndPointTypeAlisha with PKI %@", buf, 0xCu);

      }
      v13->_endPointType = 1;
    }
    if (!v13->_appletIdentifier)
    {
      SESDefaultLogObject();
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A048000, v128, OS_LOG_TYPE_INFO, "Loading from pre15.X, inferring appletIdentifier as CCC AID", buf, 2u);
      }

      objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData");
      v129 = objc_claimAutoreleasedReturnValue();
      v130 = v13->_appletIdentifier;
      v13->_appletIdentifier = (NSData *)v129;

    }
  }

  return v13;
}

- (int64_t)endPointType
{
  return self->_endPointType;
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)subjectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)publicKeyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)privacyPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)privacyPublicKeyIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (SEEndPointConfiguration)configuration
{
  return (SEEndPointConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)readerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)readerPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (NSData)readerLongTermPublicKeyCertificate
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setReaderLongTermPublicKeyCertificate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSArray)authorizedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)confidentialMailBoxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (NSNumber)privateMailBoxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)counter
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFriendlyName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)readerInfo
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReaderInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSString)invitationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInvitationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSData)mailboxMapping
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMailboxMapping:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSData)trackingRequest
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackingRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSData)trackingReceipt
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTrackingReceipt:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSData)deviceConfiguration
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDeviceConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSString)environment
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSNumber)sharingTokenAvailabilityBitmap
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSharingTokenAvailabilityBitmap:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSString)bleUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBleUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSData)bleIntroKey
{
  return (NSData *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBleIntroKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSData)bleOOBKey
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBleOOBKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSData)bleOOBMasterKey
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBleOOBMasterKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSData)bleDCKIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBleDCKIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (NSData)bleAddress
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBleAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSNumber)blePairingRequest
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBlePairingRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSArray)supportedRKEFunctions
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSupportedRKEFunctions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (NSData)longTermSharedSecret
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setLongTermSharedSecret:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (NSString)ownerIDSIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setOwnerIDSIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (NSString)sharingSessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSharingSessionUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (NSData)readerConfigID
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setReaderConfigID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (NSData)hupData
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setHupData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (NSNumber)hupDone
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setHupDone:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSData)vehicleSupportedVersionsData
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setVehicleSupportedVersionsData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (NSData)mailboxSizesPlusAdditionalData
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMailboxSizesPlusAdditionalData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSData)slotIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSlotIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (NSString)homeUUIDString
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setHomeUUIDString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSData)upgradeEndpointJSONData
{
  return (NSData *)objc_getProperty(self, a2, 360, 1);
}

- (void)setUpgradeEndpointJSONData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (NSData)anonymizedDsid
{
  return (NSData *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAnonymizedDsid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (NSArray)sharingRecords
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSharingRecords:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (NSData)revocationAttestation
{
  return self->_revocationAttestation;
}

- (void)setRevocationAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_revocationAttestation, a3);
}

- (SEEndPointPrivacyEncryptResponse)carOEMProprietaryData
{
  return self->_carOEMProprietaryData;
}

- (void)setCarOEMProprietaryData:(id)a3
{
  objc_storeStrong((id *)&self->_carOEMProprietaryData, a3);
}

- (NSData)sharingAttestationData
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setSharingAttestationData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (NSData)ownerEphemeralKey
{
  return (NSData *)objc_getProperty(self, a2, 408, 1);
}

- (void)setOwnerEphemeralKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (NSData)sharingEncryptedData
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSharingEncryptedData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 416);
}

- (NSDictionary)additionalAttestationsDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setAdditionalAttestationsDict:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (NSString)terminatedByTaskID
{
  return self->_terminatedByTaskID;
}

- (void)setTerminatedByTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_terminatedByTaskID, a3);
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSString)privacyKeyIdentifier
{
  return self->_privacyKeyIdentifier;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_terminatedByTaskID, 0);
  objc_storeStrong((id *)&self->_additionalAttestationsDict, 0);
  objc_storeStrong((id *)&self->_sharingEncryptedData, 0);
  objc_storeStrong((id *)&self->_ownerEphemeralKey, 0);
  objc_storeStrong((id *)&self->_sharingAttestationData, 0);
  objc_storeStrong((id *)&self->_carOEMProprietaryData, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
  objc_storeStrong((id *)&self->_sharingRecords, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_upgradeEndpointJSONData, 0);
  objc_storeStrong((id *)&self->_homeUUIDString, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxSizesPlusAdditionalData, 0);
  objc_storeStrong((id *)&self->_vehicleSupportedVersionsData, 0);
  objc_storeStrong((id *)&self->_hupDone, 0);
  objc_storeStrong((id *)&self->_hupData, 0);
  objc_storeStrong((id *)&self->_readerConfigID, 0);
  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
  objc_storeStrong((id *)&self->_ownerIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_longTermSharedSecret, 0);
  objc_storeStrong((id *)&self->_supportedRKEFunctions, 0);
  objc_storeStrong((id *)&self->_blePairingRequest, 0);
  objc_storeStrong((id *)&self->_bleAddress, 0);
  objc_storeStrong((id *)&self->_bleDCKIdentifier, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleOOBKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_storeStrong((id *)&self->_bleUUID, 0);
  objc_storeStrong((id *)&self->_sharingTokenAvailabilityBitmap, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_trackingReceipt, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_mailboxMapping, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_readerInfo, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_counter, 0);
  objc_storeStrong((id *)&self->_privateMailBoxSize, 0);
  objc_storeStrong((id *)&self->_confidentialMailBoxSize, 0);
  objc_storeStrong((id *)&self->_authorizedKeys, 0);
  objc_storeStrong((id *)&self->_readerLongTermPublicKeyCertificate, 0);
  objc_storeStrong((id *)&self->_readerPublicKey, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_privacyPublicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
