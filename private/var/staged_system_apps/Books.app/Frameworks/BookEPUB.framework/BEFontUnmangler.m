@implementation BEFontUnmangler

- (id)unmangleFontWithAssetInfo:(id)a3 fileData:(id)a4 URL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _BYTE *v15;
  id v16;
  _BYTE *v17;
  id v18;
  _BYTE *v19;
  unint64_t v20;
  unint64_t i;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encryptionAlgorithm"));
  if (objc_msgSend(CFSTR("http://www.idpf.org/2008/embedding"), "compare:options:", v9, 1))
  {
    v10 = v8;
    if (objc_msgSend(CFSTR("http://ns.adobe.com/pdf/enc#RC"), "compare:options:", v9, 1))
      goto LABEL_15;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookEpubIdWithUUIDScheme"));
    if (objc_msgSend(v11, "length"))
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEFontUnmangler _adobeXORMaskWithEPubID:](self, "_adobeXORMaskWithEPubID:", v11));
    else
      v12 = 0;
    v13 = &stru_3D8 + 40;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookEpubId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEFontUnmangler _idpfXORMaskWithEPubID:](self, "_idpfXORMaskWithEPubID:", v11));
    v13 = &stru_3D8 + 56;
  }

  v10 = v8;
  if (v12)
  {
    v14 = objc_retainAutorelease(objc_msgSend(v8, "mutableCopy"));
    v15 = objc_msgSend(v14, "mutableBytes");
    v10 = v14;

    v16 = objc_retainAutorelease(v8);
    v17 = objc_msgSend(v16, "bytes");
    if (objc_msgSend(v16, "length") < v13)
      v13 = objc_msgSend(v16, "length");
    v18 = objc_retainAutorelease(v12);
    v19 = objc_msgSend(v18, "bytes");
    v20 = (unint64_t)objc_msgSend(v18, "length");
    if (v13)
    {
      for (i = 0; (id)i != v13; ++i)
        v15[i] = v19[i % v20] ^ v17[i];
    }

  }
LABEL_15:

  return v10;
}

- (id)_idpfXORMaskWithEPubID:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  CC_LONG v6;
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && (v4 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String")) != 0
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 20))) != 0)
  {
    v6 = strlen(v4);
    v7 = objc_retainAutorelease(v5);
    CC_SHA1(v4, v6, (unsigned __int8 *)objc_msgSend(v7, "mutableBytes"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_adobeXORMaskWithEPubID:(id)a3
{
  id v3;
  unsigned __int8 v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = atomic_load((unsigned __int8 *)&qword_3C1AE8);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_3C1AE8))
  {
    qword_3C1AE0 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("-:")));
    __cxa_guard_release(&qword_3C1AE8);
  }
  v5 = (char *)objc_msgSend(v3, "rangeOfString:options:", CFSTR("urn:uuid:"), 2);
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", &v5[v6]));

    v3 = (id)v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", qword_3C1AE0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", &stru_38FF08));

  if (objc_msgSend(v9, "length"))
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData bu_dataFromHexString:](NSData, "bu_dataFromHexString:", v9));
  else
    v10 = 0;

  return v10;
}

@end
