@implementation InclusionProof

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A75E8;
  if (!qword_1002A75E8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", InclusionProof, CFSTR("InclusionProof"), &unk_1002A2BE0, &off_1002A3018, 4, 40, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217267);
    qword_1002A75E8 = (uint64_t)v2;
  }
  return v2;
}

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

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("metadata"), a3, (void *)1);
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[InclusionProof setMetadata:](self, "setMetadata:", v8);

  }
}

- (id)mapLeafWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;

  if (-[InclusionProof hasMapEntry](self, "hasMapEntry")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapLeaf")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapLeaf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMapLeaf parseFromData:error:](IdsMapLeaf, "parseFromData:error:", v8, a3));

    if (!v9)
    {
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -142, *a3));
      if (qword_1002A77D8 != -1)
        dispatch_once(&qword_1002A77D8, &stru_1002481F0);
      v10 = qword_1002A77E0;
      if (os_log_type_enabled((os_log_t)qword_1002A77E0, OS_LOG_TYPE_ERROR))
      {
        if (a3)
          v11 = *a3;
        else
          v11 = 0;
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to decode map leaf: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -16, CFSTR("KT Inclusion proof missing map leaf")));
    if (qword_1002A77D8 != -1)
      dispatch_once(&qword_1002A77D8, &stru_1002481D0);
    v12 = qword_1002A77E0;
    if (os_log_type_enabled((os_log_t)qword_1002A77E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "KT Inclusion proof missing map leaf", buf, 2u);
    }
    v9 = 0;
  }
  return v9;
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  TransparencyMapEntryVerifier *v11;
  void *v12;
  void *v13;
  void *v14;
  TransparencyMapEntryVerifier *v15;
  TransparencyLogEntryVerifier *v16;
  void *v17;
  void *v18;
  void *v19;
  TransparencyLogEntryVerifier *v20;
  TransparencyLogEntryVerifier *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  uint64_t v49;
  NSObject *v50;
  void *v52;
  void *v53;
  id v54;
  TransparencyMapEntryVerifier *v55;
  void *v56;
  TransparencyLogEntryVerifier *v57;
  uint8_t buf[16];

  if (-[InclusionProof hasMapEntry](self, "hasMapEntry")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry")),
        v5,
        v5))
  {
    if (-[InclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
      && !-[InclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      v49 = -11;
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
      if (v6)
      {
        v7 = (void *)v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
        v9 = objc_msgSend(v8, "length");

        if (v9)
        {
          v10 = objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
          v11 = [TransparencyMapEntryVerifier alloc];
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyBag"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appSthKeyStore"));
          v56 = (void *)v10;
          v15 = -[TransparencyMapEntryVerifier initWithPositon:trustedKeyStore:](v11, "initWithPositon:trustedKeyStore:", v10, v14);

          v16 = [TransparencyLogEntryVerifier alloc];
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keyBag"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appSthKeyStore"));
          v20 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v16, "initWithTrustedKeyStore:", v19);

          v21 = [TransparencyLogEntryVerifier alloc];
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyBag"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tltKeyStore"));
          v57 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v21, "initWithTrustedKeyStore:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof dataStore](self, "dataStore"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v55 = v15;
          objc_msgSend(v26, "setVerifier:", v15);

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          objc_msgSend(v27, "setDataStore:", v25);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
          v30 = kTransparencyResponseMetadataKeyServerHint;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
          objc_msgSend(v28, "setMetadataValue:key:", v31, v30);

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "keyBag"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v34, "patLogBeginningMs")));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringValue"));
          objc_msgSend(v32, "setMetadataValue:key:", v36, CFSTR("overrideLogBeginTime"));

          if (-[InclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry")
            && (v37 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry")),
                v37,
                v37))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
            objc_msgSend(v38, "setVerifier:", v20);
            objc_msgSend(v38, "setDataStore:", v25);
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v30));
            objc_msgSend(v38, "setMetadataValue:key:", v40, v30);

            v41 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof optInServer](self, "optInServer"));
            objc_msgSend(v38, "setOptInServer:", v41);

            v42 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof followUp](self, "followUp"));
            objc_msgSend(v38, "setFollowUp:", v42);

            if (-[InclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));

              if (v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
                objc_msgSend(v44, "setVerifier:", v57);
                objc_msgSend(v44, "setDataStore:", v25);
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v30));
                objc_msgSend(v44, "setMetadataValue:key:", v46, v30);

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof optInServer](self, "optInServer"));
                objc_msgSend(v44, "setOptInServer:", v47);

                v48 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof followUp](self, "followUp"));
                objc_msgSend(v44, "setFollowUp:", v48);

LABEL_24:
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
                v54 = objc_msgSend(v52, "verifyInclusionProofWithMapEntry:perAppLogEntry:topLevelTreeEntry:error:", v53, v38, v44, a3);

                return (unint64_t)v54;
              }
            }
          }
          else
          {
            v38 = 0;
          }
          v44 = 0;
          goto LABEL_24;
        }
      }
      v49 = -48;
    }
  }
  else
  {
    v49 = -10;
  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v49, CFSTR("KT Inclusion proof data required for verification")));
  if (qword_1002A77D8 != -1)
    dispatch_once(&qword_1002A77D8, &stru_100248210);
  v50 = qword_1002A77E0;
  if (os_log_type_enabled((os_log_t)qword_1002A77E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "KT Inclusion proof data required for verification", buf, 2u);
  }
  return 0;
}

@end
