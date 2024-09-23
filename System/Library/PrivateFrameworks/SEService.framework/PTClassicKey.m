@implementation PTClassicKey

+ (id)withData:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  id *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "u8:", 0);
    if (v6 == 230)
    {
      +[PTClassicKey _withExportedBlob:error:](PTClassicKey, "_withExportedBlob:error:", v5, a4);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (v6 == 48)
    {
      +[PTClassicKey _withNativePTData:error:](PTClassicKey, "_withNativePTData:error:", v5, a4);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      a4 = v7;
      goto LABEL_9;
    }
  }
  if (a4)
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

+ (id)_withNativePTData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v6 = a3;
  if (v6)
  {
    v7 = objc_opt_new();
    objc_storeStrong((id *)(v7 + 128), a3);
    *(_BYTE *)(v7 + 120) = 0;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceSpec())
    {
      if (a4)
      {
        SESDefaultLogObject();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "base64");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        a4 = 0;
      }
    }
    else if (DERParseSequenceSpec())
    {
      if (a4)
      {
        SESDefaultLogObject();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "base64");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      if (!DERParseSequenceSpec())
      {
        *(_OWORD *)(v7 + 168) = v19;
        v15 = v22;
        *(_OWORD *)(v7 + 184) = v20;
        *(_OWORD *)(v7 + 136) = v21;
        *(_OWORD *)(v7 + 152) = v15;
        *(_OWORD *)(v7 + 200) = 0u;
        a4 = (id *)(id)v7;
        goto LABEL_14;
      }
      if (a4)
      {
        SESDefaultLogObject();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "base64");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (a4)
  {
    SESDefaultLogObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_15:

  return a4;
}

+ (id)_withExportedBlob:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v27 = objc_msgSend(v6, "DERItem");
  v28 = v7;
  if (!DERDecodeItem())
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3010000000;
    v25 = 0;
    v26 = 0;
    v24 = &unk_20A10106D;
    if (DERDecodeSequenceContentWithBlock() || !v22[5])
    {
      if (!a4)
      {
LABEL_10:
        _Block_object_dispose(&v21, 8);
        goto LABEL_11;
      }
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "base64");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_opt_new();
      objc_storeStrong((id *)(v9 + 128), a3);
      *(_BYTE *)(v9 + 120) = 1;
      if (DERParseSequenceSpec())
      {
        if (!a4)
          goto LABEL_9;
        SESDefaultLogObject();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", v22 + 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "base64");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      v14 = DERLengthOfEncodedSequence() + 32;
      v15 = v22[5];
      v16 = v15 >= v14;
      v17 = v15 - v14;
      if (v16)
      {
        v18 = v22 + 4;
        v22[4] += v14;
        v18[1] = v17;
        DERParseSequenceSpec();
        *(_OWORD *)(v9 + 200) = 0u;
        a4 = (id *)(id)v9;
        goto LABEL_9;
      }
      if (!a4)
      {
LABEL_9:

        goto LABEL_10;
      }
      SESDefaultLogObject();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v11;
LABEL_8:

    a4 = 0;
    goto LABEL_9;
  }
  if (a4)
  {
    SESDefaultLogObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_11:

  return a4;
}

uint64_t __40__PTClassicKey__withExportedBlob_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)a2 == 0xC00000000000001CLL)
  {
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *(_OWORD *)(a2 + 8);
    *a3 = 1;
  }
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[PTClassicKey keyNumber](self, "keyNumber");
  -[PTClassicKey keyIdentifier](self, "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Key: keyNumber 0x%X keyIdentifier %@ isExported %d"), v4, v6, self->_isExportedData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSData)publicKey
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &self->_ptKeyBlob.publicKey);
}

- (NSData)keyIdentifier
{
  void *v3;
  char *data;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  data = self->_ptKeyBlob.publicKey.data;
  LODWORD(self) = self->_ptKeyBlob.publicKey.length;
  v5 = objc_retainAutorelease(v3);
  CC_SHA256(data, (CC_LONG)self, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
  objc_msgSend(v5, "setLength:", 16);
  return (NSData *)v5;
}

- (unsigned)keyNumber
{
  return bswap32(*(_DWORD *)self->_ptKeyBlob.keyNumber.data);
}

- (NSData)assetACL
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &self->_assetACLItem);
}

- (NSData)assetACLAttestation
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &self->_assetACLAttestationItem);
}

- (NSData)accessControlConstraints
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithDERItem:", &self->_accessControlConstraintsItem);
}

- (BOOL)isExportedData
{
  return self->_isExportedData;
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- ($BE749665CD263385F3F5ED554982D87D)keyBlobItem
{
  char *v2;
  unint64_t v3;
  _QWORD v4[2];
  $BE749665CD263385F3F5ED554982D87D result;

  objc_copyStruct(v4, &self->_keyBlobItem, 16, 1, 0);
  v2 = (char *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)encryptedWrappedKeyBlobItem
{
  char *v2;
  unint64_t v3;
  _QWORD v4[2];
  $BE749665CD263385F3F5ED554982D87D result;

  objc_copyStruct(v4, &self->_encryptedWrappedKeyBlobItem, 16, 1, 0);
  v2 = (char *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)assetACLItem
{
  char *v2;
  unint64_t v3;
  _QWORD v4[2];
  $BE749665CD263385F3F5ED554982D87D result;

  objc_copyStruct(v4, &self->_assetACLItem, 16, 1, 0);
  v2 = (char *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)assetACLAttestationItem
{
  char *v2;
  unint64_t v3;
  _QWORD v4[2];
  $BE749665CD263385F3F5ED554982D87D result;

  objc_copyStruct(v4, &self->_assetACLAttestationItem, 16, 1, 0);
  v2 = (char *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)accessControlConstraintsItem
{
  char *v2;
  unint64_t v3;
  _QWORD v4[2];
  $BE749665CD263385F3F5ED554982D87D result;

  objc_copyStruct(v4, &self->_accessControlConstraintsItem, 16, 1, 0);
  v2 = (char *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
