@implementation BatchQueryResponse

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, CFSTR("dataStore"));
}

- (void)setDataStore:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("dataStore"), a3, (void *)1);
}

- (TransparencyMapInclusionProofVerifier)verifier
{
  return (TransparencyMapInclusionProofVerifier *)objc_getAssociatedObject(self, CFSTR("verifier"));
}

- (void)setVerifier:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("verifier"), a3, (void *)1);
}

- (SignedMapHead)verifiableSmh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, CFSTR("smh"));
}

- (void)setVerifiableSmh:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("smh"), a3, (void *)1);
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, CFSTR("optInServerKey"));
}

- (void)setOptInServer:(id)a3
{
  if (a3)
    objc_setAssociatedObject(self, CFSTR("optInServerKey"), a3, (void *)1);
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, CFSTR("followUpKey"));
}

- (void)setFollowUp:(id)a3
{
  if (a3)
    objc_setAssociatedObject(self, CFSTR("followUpKey"), a3, (void *)1);
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[BatchQueryResponse status](self, "status")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("status"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse queryInfoArray](self, "queryInfoArray", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), "diagnosticsJsonDictionary"));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("queryInfos"));
  if (-[BatchQueryResponse hasSmh](self, "hasSmh"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](SignedMapHead, "signedTypeWithObject:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("smh"));

  }
  if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("patEntry"));

  }
  if (-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tltEntry"));

  }
  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v5;
  TransparencyLogEntryVerifier *v6;
  void *v7;
  void *v8;
  void *v9;
  TransparencyLogEntryVerifier *v10;
  TransparencyLogEntryVerifier *v11;
  void *v12;
  void *v13;
  void *v14;
  TransparencyLogEntryVerifier *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  TransparencyLogEntryVerifier *v40;
  id v41;
  uint8_t buf[16];

  if (!-[BatchQueryResponse hasSmh](self, "hasSmh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh")), v5, !v5))
  {
    v23 = -12;
    if (!a3)
      goto LABEL_9;
LABEL_8:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v23, CFSTR("KT Inclusion proof data required for verification")));
    goto LABEL_9;
  }
  if (!-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
    || (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry") & 1) != 0)
  {
    v6 = [TransparencyLogEntryVerifier alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyBag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appSthKeyStore"));
    v10 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v6, "initWithTrustedKeyStore:", v9);

    v11 = [TransparencyLogEntryVerifier alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyBag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tltKeyStore"));
    v15 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v11, "initWithTrustedKeyStore:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse dataStore](self, "dataStore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogEntryVerifier trustedKeyStore](v10, "trustedKeyStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "signatureVerifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse dataStore](self, "dataStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:verifier:dataStore:](SignedMapHead, "signedTypeWithObject:verifier:dataStore:", v17, v19, v20));

    if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      objc_msgSend(v21, "setOverrideBeginTimeFromLogEntry:", v22);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyBag"));
      objc_msgSend(v21, "setOverrideBeginTime:", objc_msgSend(v26, "patLogBeginningMs"));

    }
    -[BatchQueryResponse setVerifiableSmh:](self, "setVerifiableSmh:", v21);
    v41 = 0;
    v25 = objc_msgSend(v21, "verifyWithError:", &v41);
    v27 = v41;
    +[TransparencyMapEntryVerifier storeSMHSignatureResult:smh:error:](TransparencyMapEntryVerifier, "storeSMHSignatureResult:smh:error:", v25, v21, v27);
    if (v25 != (id)1)
    {
      if (a3 && v27)
        *a3 = objc_retainAutorelease(v27);
      goto LABEL_31;
    }
    if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));

      if (v28)
      {
        v40 = v15;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        objc_msgSend(v28, "setVerifier:", v10);
        objc_msgSend(v28, "setDataStore:", v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
        v30 = kTransparencyResponseMetadataKeyServerHint;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
        objc_msgSend(v28, "setMetadataValue:key:", v31, v30);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse optInServer](self, "optInServer"));
        objc_msgSend(v28, "setOptInServer:", v32);

        if (-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
          && (v33 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry")),
              v33,
              v33))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry"));
          objc_msgSend(v34, "setVerifier:", v40);
          objc_msgSend(v34, "setDataStore:", v16);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v30));
          objc_msgSend(v34, "setMetadataValue:key:", v35, v30);

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse optInServer](self, "optInServer"));
          objc_msgSend(v34, "setOptInServer:", v36);

        }
        else
        {
          v34 = 0;
        }
        v15 = v40;
        goto LABEL_30;
      }
    }
    else
    {
      v28 = 0;
    }
    v34 = 0;
LABEL_30:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    v25 = objc_msgSend(v37, "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:", v28, v21, v34, a3);

LABEL_31:
    return (unint64_t)v25;
  }
  v23 = -11;
  if (a3)
    goto LABEL_8;
LABEL_9:
  if (qword_1002A7638 != -1)
    dispatch_once(&qword_1002A7638, &stru_100246108);
  v24 = qword_1002A7640;
  if (os_log_type_enabled((os_log_t)qword_1002A7640, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "KT Inclusion proof data required for verification", buf, 2u);
  }
  return 0;
}

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A76D0;
  if (!qword_1002A76D0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", BatchQueryResponse, CFSTR("BatchQueryResponse"), &unk_1002A3550, &off_1002A3648, 5, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1002172C3);
    qword_1002A76D0 = (uint64_t)v2;
  }
  return v2;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("metadata"), a3, (void *)1);
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[BatchQueryResponse setMetadata:](self, "setMetadata:", v8);

  }
}

@end
