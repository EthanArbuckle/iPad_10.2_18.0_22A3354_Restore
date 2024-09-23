@implementation PTClassicMicro

+ (id)sign:(id)a3 designatedKey:(id)a4 extAuth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v15, "aid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "slotNumber");
  objc_msgSend(v15, "assetACL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetACLAttestation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v15, "operationApprovalVersion");

  +[PTClassicMicro sign:aid:slotNumber:assetACL:assetACLAttesetation:operationApprovalVersion:extAuth:seHandle:seid:error:]((uint64_t)PTClassicMicro, v16, v17, v18, v19, v20, v21, v14, v13, v12, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)sign:(void *)a3 aid:(unsigned int)a4 slotNumber:(void *)a5 assetACL:(void *)a6 assetACLAttesetation:(unsigned __int8)a7 operationApprovalVersion:(void *)a8 extAuth:(void *)a9 seHandle:(void *)a10 seid:(_QWORD *)a11 error:
{
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[12];
  __int16 v46;
  char v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52[2];

  v40 = a2;
  v17 = a3;
  v43 = a5;
  v42 = a6;
  v41 = a8;
  v18 = a9;
  v19 = a10;
  objc_opt_self();
  v52[0] = 0;
  v20 = +[PTClassicMicro select:seHandle:error:]((uint64_t)PTClassicMicro, v17, v18, (uint64_t)v52);
  v21 = v52[0];
  if (!v20)
  {
    if (!a11)
      goto LABEL_29;
    SESDefaultLogObject();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "asHexString");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v51 = v21;
  +[PTClassicMicro getNonce:error:]((uint64_t)PTClassicMicro, v18, &v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v51;

  if (v22 && !v23)
  {
    v49 = 0;
    v50 = 0;
    v48 = 0;
    v24 = +[PTClassicMicro evaluateSecureElementACL:assetACLAttesetation:extAuth:seid:operation:nonce:operationApprovalVersion:outOperationApproval:outOperationApprovalAttestation:error:]((uint64_t)PTClassicMicro, v43, v42, v41, v19, CFSTR("osgn"), v22, a7, &v50, &v49, &v48);
    v25 = v50;
    v39 = v49;
    v26 = v48;
    v21 = v26;
    if (!v24 || !v25 || !v39 || v26)
    {
      if (a11)
      {
        SESDefaultLogObject();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a11 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_26;
    }
    v47 = 1;
    v46 = bswap32(a4) >> 16;
    objc_msgSend(CFSTR("0001"), "hexStringAsData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = &v47;
    v45[1] = 1;
    v45[2] = &v46;
    v45[3] = 2;
    v45[4] = objc_msgSend(v40, "DERItem");
    v45[5] = v28;
    v45[6] = objc_msgSend(v27, "DERItem");
    v45[7] = v29;
    v45[8] = objc_msgSend(v25, "DERItem");
    v45[9] = v30;
    v45[10] = objc_msgSend(v39, "DERItem");
    v45[11] = v31;
    v44 = 0;
    +[PTClassicMicro executeCommand:itemData:spec:seHandle:error:]((uint64_t)PTClassicMicro, 0xC000u, (uint64_t)v45, (uint64_t)&PTSignInputSpec, v18, &v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v44;
    v21 = v33;
    if (!v32 || v33)
    {
      if (!a11)
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      SESDefaultLogObject();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v32, "DERItem");
      DERParseSequenceSpec();
      if (!a11)
        goto LABEL_25;
      SESDefaultLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "asHexString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v38;
      SESCreateAndLogError();
      *a11 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  if (a11)
  {
    SESDefaultLogObject();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v23;
LABEL_27:

    goto LABEL_28;
  }
  v21 = v23;
LABEL_28:

LABEL_29:
  return 0;
}

+ (BOOL)select:(void *)a3 seHandle:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &select_seHandle_error__selectHdr, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendU8:", objc_msgSend(v7, "length"));
  objc_msgSend(v8, "appendData:", v7);

  objc_msgSend(v6, "transceive:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = !+[PTClassicMicro isError:]((uint64_t)PTClassicMicro, v9);
  return v10;
}

+ (id)getNonce:(_QWORD *)a3 error:
{
  id v4;
  void *v5;

  v4 = a2;
  objc_opt_self();
  +[PTClassicMicro executeCommand:itemData:spec:seHandle:error:]((uint64_t)PTClassicMicro, 0x2000u, 0, 0, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)evaluateSecureElementACL:(void *)a3 assetACLAttesetation:(void *)a4 extAuth:(void *)a5 seid:(void *)a6 operation:(void *)a7 nonce:(unsigned __int8)a8 operationApprovalVersion:(_QWORD *)a9 outOperationApproval:(_QWORD *)a10 outOperationApprovalAttestation:(_QWORD *)a11 error:
{
  const __CFData *v17;
  __CFString *v18;
  const __CFData *v19;
  const __CFData *v20;
  const __CFData *v21;
  const __CFData *v22;
  int v23;
  id v24;
  void *v25;
  id v27;
  id v28;

  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = a2;
  objc_opt_self();
  v27 = 0;
  v28 = 0;
  v23 = SSEEvaluateSecureElementACL(v20, -1, v19, v22, v21, v18, v17, a8, (const __CFData **)&v28, (const __CFData **)&v27);

  *a9 = v28;
  v24 = v27;
  *a10 = v24;
  if (!v23 && *a9 && v24)
    return 1;
  if (a11)
  {
    SESDefaultLogObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (_QWORD)executeCommand:(uint64_t)a3 itemData:(uint64_t)a4 spec:(void *)a5 seHandle:(_QWORD *)a6 error:
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  int v23;
  char v24;
  char *v25;
  uint64_t v26;
  __int16 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  __int16 v32;

  v32 = a2;
  v10 = a5;
  objc_opt_self();
  v11 = 0;
  if (a3 && a4 && (encodeSequenceSpec(), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    a6 = 0;
  }
  else
  {
    v31 = 1;
    v32 = __rev16(a2);
    v25 = &v31;
    v26 = 1;
    v27 = &v32;
    v28 = 2;
    v29 = objc_msgSend(v11, "DERItem");
    v30 = v12;
    encodeSequenceSpec();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v23 = 8429696;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v23, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendU16BE:", (unsigned __int16)objc_msgSend(v13, "length"));
    objc_msgSend(v14, "appendData:", v13);
    objc_msgSend(v14, "appendU16BE:", 0);
    v22 = 0;
    objc_msgSend(v10, "transceive:error:", v14, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
    v17 = v16;
    if (!v15 || v16 || +[PTClassicMicro isError:]((uint64_t)PTClassicMicro, v15))
    {
      if (a6)
      {
        SESDefaultLogObject();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "asHexString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "asHexString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
    else
    {
      objc_msgSend(v15, "subdataWithRange:", 0, objc_msgSend(v15, "length") - 2);
      a6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a6;
}

+ (BOOL)isError:(uint64_t)a1
{
  id v2;
  _BOOL8 v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  if ((unint64_t)objc_msgSend(v2, "length") >= 2)
  {
    v4 = objc_retainAutorelease(v2);
    v5 = objc_msgSend(v4, "bytes");
    v3 = *(unsigned __int16 *)(objc_msgSend(v4, "length") + v5 - 2) != 144;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

+ (id)getACLfromAssetACL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v8;
  _OWORD v9[2];

  v5 = a3;
  memset(v9, 0, sizeof(v9));
  if (DERParseSequenceSpec())
  {
    if (a4)
    {
      SESDefaultLogObject();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "base64");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v9);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

@end
