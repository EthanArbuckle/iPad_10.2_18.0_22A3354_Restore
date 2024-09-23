@implementation PatInclusionProof

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_1002A75F0;
  if (!qword_1002A75F0)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PatInclusionProof, CFSTR("PatInclusionProof"), &unk_1002A2BE0, &off_1002A3098, 2, 24, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_100217288);
    qword_1002A75F0 = (uint64_t)v2;
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

- (TransparencyPatInclusionProofVerifier)verifier
{
  return (TransparencyPatInclusionProofVerifier *)objc_getAssociatedObject(self, CFSTR("verifier"));
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[PatInclusionProof setMetadata:](self, "setMetadata:", v8);

  }
}

- (id)patSigningKeyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodeBytes"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodeBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeConfigNode, "parseFromData:error:", v12, a3));

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyBytes"));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyBytes"));
          v17 = objc_msgSend(v16, "length");

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyBytes"));
LABEL_32:

            return v18;
          }
        }
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -216, CFSTR("Signing Public key missing from per-app tree config node")));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_1002483F0);
        v21 = qword_1002A7830;
        if (!os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          v18 = 0;
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        v22 = "Signing Public key missing from per-app tree config node";
        v23 = v21;
        v24 = 2;
      }
      else
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_1002483D0);
        v25 = qword_1002A7830;
        if (!os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        if (a3)
          v26 = *a3;
        else
          v26 = 0;
        *(_DWORD *)buf = 138412290;
        v28 = v26;
        v22 = "failed to decode Per Application Tree config node: %@";
        v23 = v25;
        v24 = 12;
      }
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      goto LABEL_31;
    }
  }
  else
  {

  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -164, CFSTR("KT PAT Config proof missing signing key")));
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_1002483B0);
  v19 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing signing key", buf, 2u);
  }
  return 0;
}

- (id)vrfPublicKeyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodeBytes"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodeBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeConfigNode, "parseFromData:error:", v12, a3));

      if (v13)
      {
        if (objc_msgSend(v13, "hasVrfPublicKey"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vrfPublicKey"));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vrfPublicKey"));
LABEL_27:

            return v15;
          }
        }
        if (a3)
        {
          v15 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -166, CFSTR("VRF Public key missing from per-app tree config node")));
          goto LABEL_27;
        }
      }
      else
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_100248430);
        v18 = qword_1002A7830;
        if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
        {
          if (a3)
            v19 = *a3;
          else
            v19 = 0;
          *(_DWORD *)buf = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to decode Per Application Tree config node: %@", buf, 0xCu);
        }
      }
      v15 = 0;
      goto LABEL_27;
    }
  }
  else
  {

  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -164, CFSTR("KT PAT Config proof missing VRFPublicKey")));
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_100248410);
  v16 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing VRFPublicKey", buf, 2u);
  }
  return 0;
}

- (int)earliestNextTreeVersionWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int Tree_RawValue;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodeBytes"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodeBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](LogClosedNode, "parseFromData:error:", v12, a3));

      if (v13)
      {
        Tree_RawValue = LogClosedNode_EarliestVersionForNextTree_RawValue((uint64_t)v13);
      }
      else
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -233, *a3));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_100248470);
        v16 = qword_1002A7830;
        if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
        {
          if (a3)
            v17 = *a3;
          else
            v17 = 0;
          *(_DWORD *)buf = 138412290;
          v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode PAT closed node: %@", buf, 0xCu);
        }
        Tree_RawValue = 0;
      }

      return Tree_RawValue;
    }
  }
  else
  {

  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -232, CFSTR("KT PAT closed proof missing node bytes")));
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_100248450);
  v15 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }
  return 0;
}

- (unint64_t)shutdownTimeStamp:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodeBytes"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodeBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](LogClosedNode, "parseFromData:error:", v12, a3));

      if (v13)
      {
        v14 = objc_msgSend(v13, "timestampMs");
      }
      else
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -233, *a3));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_1002484B0);
        v16 = qword_1002A7830;
        if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
        {
          if (a3)
            v17 = *a3;
          else
            v17 = 0;
          *(_DWORD *)buf = 138412290;
          v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to decode PAT closed node: %@", buf, 0xCu);
        }
        v14 = 0;
      }

      return (unint64_t)v14;
    }
  }
  else
  {

  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -232, CFSTR("KT PAT closed proof missing node bytes")));
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_100248490);
  v15 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }
  return 0;
}

- (int)earliestCurrentTreeVersionWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodeBytes"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodeBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeConfigNode, "parseFromData:error:", v12, a3));

      if (v13)
      {
        v14 = PerApplicationTreeConfigNode_EarliestVersion_RawValue((uint64_t)v13);
        if (v14 <= 1)
          v15 = 1;
        else
          v15 = v14;
      }
      else
      {
        if (a3)
          *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -165, *a3));
        if (qword_1002A7828 != -1)
          dispatch_once(&qword_1002A7828, &stru_1002484F0);
        v15 = 999999999;
        v17 = qword_1002A7830;
        if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
        {
          if (a3)
            v18 = *a3;
          else
            v18 = 0;
          *(_DWORD *)buf = 138412290;
          v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to decode Per Application Tree config node: %@", buf, 0xCu);
        }
      }

      return v15;
    }
  }
  else
  {

  }
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -164, CFSTR("KT PAT Config proof missing node bytes")));
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_1002484D0);
  v15 = 999999999;
  v16 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing node bytes", buf, 2u);
  }
  return v15;
}

- (unint64_t)patLogBeginningMs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "slh"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedLogHead"));
  v6 = objc_msgSend(v5, "logBeginningMs");

  return (unint64_t)v6;
}

- (unint64_t)tltLogBeginningMs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "slh"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedLogHead"));
  v6 = objc_msgSend(v5, "logBeginningMs");

  return (unint64_t)v6;
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v5;
  void *v6;
  TransparencyLogEntryVerifier *v7;
  void *v8;
  void *v9;
  void *v10;
  TransparencyLogEntryVerifier *v11;
  TransparencyLogEntryVerifier *v12;
  void *v13;
  void *v14;
  void *v15;
  TransparencyLogEntryVerifier *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v34;
  NSObject *v35;
  uint8_t v36[16];

  if (!-[PatInclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry")),
        v5,
        !v5))
  {
    v34 = -33;
    if (!a3)
      goto LABEL_8;
LABEL_7:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v34, CFSTR("PAT inclusion proof missing required field")));
    goto LABEL_8;
  }
  if (-[PatInclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));

    if (v6)
    {
      v7 = [TransparencyLogEntryVerifier alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyBag"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appSthKeyStore"));
      v11 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v7, "initWithTrustedKeyStore:", v10);

      v12 = [TransparencyLogEntryVerifier alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyBag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tltKeyStore"));
      v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v12, "initWithTrustedKeyStore:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof dataStore](self, "dataStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      objc_msgSend(v18, "setVerifier:", v11);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      objc_msgSend(v19, "setDataStore:", v17);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
      v22 = kTransparencyResponseMetadataKeyServerHint;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
      objc_msgSend(v20, "setMetadataValue:key:", v23, v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      objc_msgSend(v24, "setVerifier:", v16);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      objc_msgSend(v25, "setDataStore:", v17);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v22));
      objc_msgSend(v26, "setMetadataValue:key:", v28, v22);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      v32 = objc_msgSend(v29, "verifyPatInclusionProofWithPerAppLogEntry:topLevelTreeEntry:error:", v30, v31, a3);

      return (unint64_t)v32;
    }
  }
  v34 = -34;
  if (a3)
    goto LABEL_7;
LABEL_8:
  if (qword_1002A7828 != -1)
    dispatch_once(&qword_1002A7828, &stru_100248510);
  v35 = qword_1002A7830;
  if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "PAT inclusion proof missing required field", v36, 2u);
  }
  return 0;
}

- (unint64_t)verifyConfigProof:(id *)a3
{
  unint64_t result;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;

  result = -[PatInclusionProof verifyWithError:](self, "verifyWithError:");
  if (result == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v7 = objc_msgSend(v6, "nodePosition");

    if (v7)
    {
      if (a3)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        *a3 = objc_autorelease((id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -163, CFSTR("per-app tree (config) inclusion proof not position 0; instead position %llu"),
                                       objc_msgSend(v8, "nodePosition"))));

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        if (+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
          v11 = kTransparencyResponseMetadataKeyServerHint;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v11);

          }
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "application"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("VerifyPATInclusionProofEvent"), v17));
        objc_msgSend(v15, "logResultForEvent:hardFailure:result:withAttributes:", v18, 1, *a3, v9);

      }
      if (qword_1002A7828 != -1)
        dispatch_once(&qword_1002A7828, &stru_100248530);
      v19 = (void *)qword_1002A7830;
      if (os_log_type_enabled((os_log_t)qword_1002A7830, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        *(_DWORD *)buf = 134217984;
        v23 = objc_msgSend(v21, "nodePosition");
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "per-app tree (config) inclusion proof not position 0; instead position %llu",
          buf,
          0xCu);

      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end
