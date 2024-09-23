@implementation PTClassicKey

+ (id)withData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v6 = objc_msgSend(v5, "u8:", 0);
    if ((_DWORD)v6 == 230)
    {
      v8 = (id *)objc_claimAutoreleasedReturnValue(+[PTClassicKey _withExportedBlob:error:](PTClassicKey, "_withExportedBlob:error:", v5, a4));
      goto LABEL_8;
    }
    if ((_DWORD)v6 == 48)
    {
      v8 = (id *)objc_claimAutoreleasedReturnValue(+[PTClassicKey _withNativePTData:error:](PTClassicKey, "_withNativePTData:error:", v5, a4));
LABEL_8:
      a4 = v8;
      goto LABEL_9;
    }
  }
  if (a4)
  {
    v9 = SESDefaultLogObject(v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = SESCreateAndLogError(0, v10, SESErrorDomain, 1, CFSTR("Invalid keyData first byte 0x%X"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(v11);

    a4 = 0;
  }
LABEL_9:

  return a4;
}

+ (id)_withNativePTData:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  PTClassicKey *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  $42BBA44E35B2A9BDA8D9AD7546D3A63D v33;
  void *v34;
  void *v35;
  void *v36;
  _OWORD v37[2];
  __int128 v38;
  $42BBA44E35B2A9BDA8D9AD7546D3A63D v39;
  $42BBA44E35B2A9BDA8D9AD7546D3A63D v40;
  $42BBA44E35B2A9BDA8D9AD7546D3A63D v41;
  $42BBA44E35B2A9BDA8D9AD7546D3A63D v42;

  v7 = a3;
  if (v7)
  {
    v8 = objc_opt_new(PTClassicKey);
    objc_storeStrong((id *)&v8->_keyData, a3);
    v8->_isExportedData = 0;
    v41 = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)0;
    v42 = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)0;
    v39 = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)0;
    v40 = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)0;
    v38 = 0u;
    v9 = DERParseSequenceSpec(v7, &off_100303F50, &v38, 80);
    if ((_DWORD)v9)
    {
      if (a4)
      {
        v11 = SESDefaultLogObject(v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = SESErrorDomain;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64"));
        v14 = SESCreateAndLogError(0, v12, v13, 1, CFSTR("While parsing keyData : %d %@"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

LABEL_13:
        a4 = 0;
      }
    }
    else
    {
      v18 = DERParseSequenceSpec(&v41, &off_100303F60, &v8->_ptKeyBlob, 112);
      if ((_DWORD)v18)
      {
        if (a4)
        {
          v20 = SESDefaultLogObject(v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = SESErrorDomain;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &v41));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "base64"));
          v24 = SESCreateAndLogError(0, v21, v22, 1, CFSTR("While parsing keyblob : %d  %@"));
          *a4 = (id)objc_claimAutoreleasedReturnValue(v24);

          goto LABEL_13;
        }
      }
      else
      {
        memset(v37, 0, sizeof(v37));
        v25 = DERParseSequenceSpec(&v39, &off_100303F70, v37, 32);
        if (!(_DWORD)v25)
        {
          v8->_assetACLItem = v39;
          v33 = v42;
          v8->_assetACLAttestationItem = v40;
          v8->_keyBlobItem = v41;
          v8->_encryptedWrappedKeyBlobItem = v33;
          v8->_accessControlConstraintsItem = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)v37[0];
          a4 = v8;
          goto LABEL_14;
        }
        if (a4)
        {
          v27 = SESDefaultLogObject(v25, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          v29 = SESErrorDomain;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &v39));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "base64"));
          v31 = SESCreateAndLogError(0, v28, v29, 1, CFSTR("Unparseable (%d) assetACLItem %@"));
          *a4 = (id)objc_claimAutoreleasedReturnValue(v31);

          goto LABEL_13;
        }
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (a4)
  {
    v15 = SESDefaultLogObject(0, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = SESCreateAndLogError(0, v16, SESErrorDomain, 1, CFSTR("Nil keydata"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(v17);

    a4 = 0;
  }
LABEL_15:

  return a4;
}

+ (id)_withExportedBlob:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PTClassicKey *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  _OWORD v39[2];
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  unint64_t v48;
  unint64_t v49[2];

  v6 = a3;
  v48 = 0;
  v49[0] = 0;
  v49[1] = 0;
  v47[0] = objc_msgSend(v6, "DERItem");
  v47[1] = v7;
  v8 = DERDecodeItem((uint64_t)v47, &v48);
  if (!(_DWORD)v8)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3010000000;
    v45 = 0;
    v46 = 0;
    v44 = "";
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100055478;
    v40[3] = &unk_1003041E0;
    v40[4] = &v41;
    v14 = DERDecodeSequenceContentWithBlock(v49, (uint64_t)v40);
    if ((_DWORD)v14 || !v42[5])
    {
      if (!a4)
      {
LABEL_10:
        _Block_object_dispose(&v41, 8);
        goto LABEL_11;
      }
      v16 = SESDefaultLogObject(v14, v15);
      v17 = (PTClassicKey *)objc_claimAutoreleasedReturnValue(v16);
      v18 = SESErrorDomain;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64"));
      v20 = SESCreateAndLogError(0, v17, v18, 1, CFSTR("Failed to parse or find metadata %d %@"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }
    else
    {
      v17 = objc_opt_new(PTClassicKey);
      objc_storeStrong((id *)&v17->_keyData, a3);
      v17->_isExportedData = 1;
      v23 = DERParseSequenceSpec(v42 + 4, &off_100303F60, &v17->_ptKeyBlob, 112);
      if ((_DWORD)v23)
      {
        if (!a4)
          goto LABEL_9;
        v25 = SESDefaultLogObject(v23, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v26 = SESErrorDomain;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithDERItem:](NSData, "dataWithDERItem:", v42 + 4));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "base64"));
        v28 = SESCreateAndLogError(0, v19, v26, 1, CFSTR("While parsing keyblob from encryptedBlob: %d  %@"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(v28);

        goto LABEL_8;
      }
      v30 = DERLengthOfEncodedSequence(0x2000000000000010, (unint64_t)&v17->_ptKeyBlob, 7, (uint64_t)&unk_1002872B0)+ 32;
      v31 = v42[5];
      v32 = v31 >= v30;
      v33 = v31 - v30;
      if (v32)
      {
        v36 = v42 + 4;
        v42[4] += v30;
        v36[1] = v33;
        memset(v39, 0, sizeof(v39));
        DERParseSequenceSpec(v36, &off_100303F70, v39, 32);
        v17->_accessControlConstraintsItem = ($42BBA44E35B2A9BDA8D9AD7546D3A63D)v39[0];
        a4 = v17;
        goto LABEL_9;
      }
      if (!a4)
      {
LABEL_9:

        goto LABEL_10;
      }
      v34 = SESDefaultLogObject(v42, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v35 = SESCreateAndLogError(0, v19, SESErrorDomain, 1, CFSTR("PTKeyBlob is longer that enclosing metadata?"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v35);
    }
    *a4 = v21;
LABEL_8:

    a4 = 0;
    goto LABEL_9;
  }
  if (a4)
  {
    v10 = SESDefaultLogObject(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = SESErrorDomain;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64"));
    v13 = SESCreateAndLogError(0, v11, v12, 1, CFSTR("Failed to decode exported blob %d %@"));
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

    a4 = 0;
  }
LABEL_11:

  return a4;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PTClassicKey keyNumber](self, "keyNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTClassicKey keyIdentifier](self, "keyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asHexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Key: keyNumber 0x%X keyIdentifier %@ isExported %d"), v3, v5, self->_isExportedData));

  return v6;
}

- (NSData)publicKey
{
  return +[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &self->_ptKeyBlob.publicKey);
}

- (NSData)keyIdentifier
{
  void *v3;
  char *data;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
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
  return +[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &self->_assetACLItem);
}

- (NSData)assetACLAttestation
{
  return +[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &self->_assetACLAttestationItem);
}

- (NSData)accessControlConstraints
{
  return +[NSData dataWithDERItem:](NSData, "dataWithDERItem:", &self->_accessControlConstraintsItem);
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
