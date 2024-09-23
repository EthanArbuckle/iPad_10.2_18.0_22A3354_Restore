@implementation TransparencyPublicKeyBag

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  _QWORD *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  TransparencyPublicKeyBag *v64;
  void *v65;
  TransparencyPublicKeyBag *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  TransparencyPublicKeyBag *v70;
  void *v71;
  void *v72;
  uint64_t v74;
  id *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  TransparencyPublicKeyBag *v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;

  v8 = a6;
  v12 = a3;
  v80 = a4;
  v79 = a5;
  v13 = (_QWORD *)&unk_1002A7000;
  v81 = self;
  if (objc_msgSend(v12, "status") == 1)
  {
    v14 = 0;
  }
  else
  {
    v15 = a7;
    v16 = kTransparencyErrorServer;
    v17 = (int)objc_msgSend(v12, "status");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
    v19 = objc_msgSend(v12, "status");
    v20 = v16;
    v13 = &unk_1002A7000;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v20, v17, CFSTR("PublicKeysResponse for %@ indicates server failure %d"), v18, v19));

    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_1002462C8);
    v21 = (void *)qword_1002A7670;
    a7 = v15;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](v81, "application"));
      *(_DWORD *)buf = 138412546;
      v84 = v23;
      v85 = 1024;
      LODWORD(v86) = objc_msgSend(v12, "status");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "PublicKeysResponse for %@ indicates server failure %d", buf, 0x12u);

      v13 = &unk_1002A7000;
    }
  }
  if (objc_msgSend(v12, "hasPatConfigProof")
    && (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "patConfigProof")), v24, v24))
  {
    if (objc_msgSend(v12, "hasTltConfigProof")
      && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltConfigProof")), v25, v25))
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appLeafsArray"));
      if (v26 && (v27 = (void *)v26, v28 = objc_msgSend(v12, "appLeafsArray_Count"), v27, v28))
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltLeafsArray"));
        if (v29)
        {
          v30 = (void *)v29;
          v31 = objc_msgSend(v12, "tltLeafsArray_Count");

          if (v31)
          {
            v32 = 0;
            v33 = 1;
            if (!v8)
              goto LABEL_46;
            goto LABEL_40;
          }
        }
        if (qword_1002A7668 != -1)
          dispatch_once(&qword_1002A7668, &stru_100246348);
        v37 = qword_1002A7670;
        if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing tlt leafs", buf, 2u);
        }
        v33 = 0;
        v32 = -36;
        if (v8)
        {
LABEL_40:
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oldAppRootCertsArray"));
          if (v38)
          {
            v39 = (void *)v38;
            v40 = objc_msgSend(v12, "oldAppRootCertsArray_Count");

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appLeafsArray"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oldAppRootCertsArray"));
              objc_msgSend(v41, "addObjectsFromArray:", v42);

            }
          }
          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oldTltRootCertsArray"));
          if (v43)
          {
            v44 = (void *)v43;
            v45 = objc_msgSend(v12, "oldTltRootCertsArray_Count");

            if (v45)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltLeafsArray"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oldTltRootCertsArray"));
              objc_msgSend(v46, "addObjectsFromArray:", v47);

            }
          }
        }
      }
      else
      {
        if (qword_1002A7668 != -1)
          dispatch_once(&qword_1002A7668, &stru_100246328);
        v36 = qword_1002A7670;
        if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing app leafs", buf, 2u);
        }
        v33 = 0;
        v32 = -31;
        if (v8)
          goto LABEL_40;
      }
    }
    else
    {
      if (v13[205] != -1)
        dispatch_once(&qword_1002A7668, &stru_100246308);
      v35 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing data required for TLT key verification", buf, 2u);
      }
      v33 = 0;
      v32 = -223;
      if (v8)
        goto LABEL_40;
    }
  }
  else
  {
    if (v13[205] != -1)
      dispatch_once(&qword_1002A7668, &stru_1002462E8);
    v34 = qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "PublicKeyResponse missing data required for PAT key verification", buf, 2u);
    }
    v33 = 0;
    v32 = -32;
    if (v8)
      goto LABEL_40;
  }
LABEL_46:
  if ((v33 & 1) == 0)
  {
    v59 = kTransparencyErrorDecode;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](v81, "application"));
    v61 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v59, v32, CFSTR("PublicKeysResponse for %@ missing or invalid content: %ld"), v60, v32));

    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_100246368);
    v62 = (void *)qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      v63 = v62;
      v64 = v81;
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](v81, "application"));
      *(_DWORD *)buf = 138543618;
      v84 = v65;
      v85 = 2048;
      v86 = v32;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "PublicKeysResponse for %{public}@ missing or invalid content: %ld", buf, 0x16u);

      v66 = 0;
      if (!a7)
        goto LABEL_72;
      goto LABEL_70;
    }
    goto LABEL_56;
  }
  if (objc_msgSend(v12, "status") != 1)
  {
    v61 = v14;
LABEL_56:
    v66 = 0;
    v64 = v81;
    if (!a7)
      goto LABEL_72;
    goto LABEL_70;
  }
  v75 = a7;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "patConfigProof"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v50 = kTransparencyResponseMetadataKeyServerHint;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", kTransparencyResponseMetadataKeyServerHint));
  objc_msgSend(v48, "setMetadataValue:key:", v51, v50);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltConfigProof"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v50));
  objc_msgSend(v52, "setMetadataValue:key:", v54, v50);

  v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appLeafsArray"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltLeafsArray"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "intermediatesArray"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "patConfigProof"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tltConfigProof"));
  v57 = objc_msgSend(v12, "hasPatClosedProof");
  if (v57)
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "patClosedProof"));
  else
    v58 = 0;
  v67 = objc_msgSend(v12, "hasPamHeadInPatProof");
  if (v67)
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pamHeadInPatProof"));
  else
    v68 = 0;
  v82 = v14;
  LOBYTE(v74) = v8;
  v69 = (void *)v55;
  v70 = -[TransparencyPublicKeyBag initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:](v81, "initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:", v55, v78, v77, v76, v56, v58, v68, v80, v74, v79, &v82);
  v61 = v82;

  v66 = v70;
  if (v67)

  if (v57)
  if (v66)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "treeRollInfoURL"));
    -[TransparencyPublicKeyBag setTreeRollInfoURL:](v66, "setTreeRollInfoURL:", v71);

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[TransparencyPublicKeyBag setReceiptTime:](v66, "setReceiptTime:", v72);

    v64 = v66;
  }
  else
  {
    v64 = 0;
  }
  a7 = v75;
  if (v75)
  {
LABEL_70:
    if (v61)
      *a7 = objc_retainAutorelease(v61);
  }
LABEL_72:

  return v66;
}

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return -[TransparencyPublicKeyBag initWithPublicKeysResponse:application:settings:allowOldKeys:error:](self, "initWithPublicKeysResponse:application:settings:allowOldKeys:error:", a3, a4, a5, 0, a6);
}

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 error:(id *)a5
{
  return -[TransparencyPublicKeyBag initWithPublicKeysResponse:application:settings:error:](self, "initWithPublicKeysResponse:application:settings:error:", a3, a4, 0, a5);
}

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSString *v34;
  NSObject *v35;
  NSString *application;
  TransparencyPublicKeyBag *v37;
  NSObject *v39;
  NSString *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  TransparencyPublicKeyBag *v45;
  id v46;
  TransparencyPublicKeyBag *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  NSString *v57;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PatConfigProof")));
  if (!v15)
    goto LABEL_22;
  v16 = (void *)v15;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TltConfigProof")));
  if (!v17)
    goto LABEL_21;
  v18 = (void *)v17;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Leafs")));
  if (!v19)
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v20 = (void *)v19;
  v54 = v13;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TltLeafs")));
  if (!v21)
  {
LABEL_19:

    v13 = v54;
    goto LABEL_20;
  }
  v22 = (void *)v21;
  v53 = v14;
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Intermediates")));
  if (!v23)
  {

    goto LABEL_19;
  }
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ReceiptTime")));

  v14 = v53;
  v13 = v54;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PatConfigProof")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PatInclusionProof, "parseFromData:error:", v26, a7));

    if (!v27)
    {
      if (a7)
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -35, *a7));
      v14 = v53;
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_1002463A8);
      v39 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        if (a7)
          v40 = (NSString *)*a7;
        else
          v40 = 0;
        *(_DWORD *)buf = 138412290;
        v57 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "PAT inclusion proof from disk failed to parse: %@", buf, 0xCu);
      }
      v37 = 0;
      goto LABEL_59;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TltConfigProof")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](LogEntry, "parseFromData:error:", v28, a7));

    if (v29)
    {
      v52 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PatClosedProof")));

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PatClosedProof")));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PatInclusionProof, "parseFromData:error:", v31, a7));

        if (!v32)
        {
          if (a7)
            *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -35, *a7));
          v29 = v52;
          v14 = v53;
          if (qword_1002A7668 != -1)
            dispatch_once(&qword_1002A7668, &stru_1002463E8);
          v33 = qword_1002A7670;
          if (!os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          if (a7)
            v34 = (NSString *)*a7;
          else
            v34 = 0;
          *(_DWORD *)buf = 138412290;
          v57 = v34;
          v49 = "PAT closed inclusion proof from disk failed to parse: %@";
LABEL_56:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
LABEL_57:
          v37 = 0;
LABEL_58:

LABEL_59:
          goto LABEL_29;
        }
      }
      else
      {
        v32 = 0;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TreeRollInfoURL")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Leafs")));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TltLeafs")));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Intermediates")));
      v55 = 0;
      LOBYTE(v50) = a6;
      v45 = -[TransparencyPublicKeyBag initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:](self, "initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:", v42, v43, v44, v27, v52, v32, 0, v54, v50, v53, &v55);
      v46 = v55;
      v47 = v45;

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ReceiptTime")));
      -[TransparencyPublicKeyBag setReceiptTime:](v47, "setReceiptTime:", v48);

      -[TransparencyPublicKeyBag setTreeRollInfoURL:](v47, "setTreeRollInfoURL:", v51);
      if (a7 && v46)
        *a7 = objc_retainAutorelease(v46);
      self = v47;

      v37 = self;
      v14 = v53;
      v13 = v54;
      v29 = v52;
      goto LABEL_58;
    }
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -218, *a7));
    v14 = v53;
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_1002463C8);
    v33 = qword_1002A7670;
    if (!os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    if (a7)
      v41 = (NSString *)*a7;
    else
      v41 = 0;
    *(_DWORD *)buf = 138412290;
    v57 = v41;
    v49 = "TLT inclusion proof from disk failed to parse: %@";
    goto LABEL_56;
  }
LABEL_22:
  if (a7)
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorFile, -54, CFSTR("missing fields from the disk store for %@"), self->_application));
  if (qword_1002A7668 != -1)
    dispatch_once(&qword_1002A7668, &stru_100246388);
  v35 = qword_1002A7670;
  if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
  {
    application = self->_application;
    *(_DWORD *)buf = 138412290;
    v57 = application;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "missing fields from the disk store for %@", buf, 0xCu);
  }
  v37 = 0;
LABEL_29:

  return v37;
}

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return -[TransparencyPublicKeyBag initWithDiskKeyStore:application:settings:allowOldKeys:error:](self, "initWithDiskKeyStore:application:settings:allowOldKeys:error:", a3, a4, a5, 0, a6);
}

- (TransparencyPublicKeyBag)initWithKeyData:(id)a3 tltLeafs:(id)a4 intermediates:(id)a5 patConfigProof:(id)a6 tltConfigProof:(id)a7 patClosedProof:(id)a8 pamHeadInPatProof:(id)a9 application:(id)a10 allowOldKeys:(BOOL)a11 settings:(id)a12 error:(id *)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TransparencyPublicKeyBag *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSDictionary *v29;
  NSDictionary *trustedAppSigningKeys;
  void *v31;
  TransparencyTrustedKeyStore *v32;
  void *v33;
  TransparencyTrustedKeyStore *v34;
  void *v35;
  NSDictionary *v36;
  NSDictionary *trustedTltSigningKeys;
  TransparencyTrustedKeyStore *v38;
  void *v39;
  TransparencyTrustedKeyStore *v40;
  TransparencyTrustedKeyStore *tltKeyStore;
  void *v42;
  NSArray *v43;
  TransparencyPublicKeyBag *v44;
  void *v45;
  NSArray *trustedIntermediates;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  unsigned int v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  id objb;
  id obja;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  unsigned int v83;

  v19 = a3;
  v66 = a4;
  v74 = a4;
  v20 = a5;
  v75 = a6;
  v21 = a7;
  v73 = a8;
  v76 = a9;
  v22 = a10;
  v23 = a12;
  v77.receiver = self;
  v77.super_class = (Class)TransparencyPublicKeyBag;
  v24 = -[TransparencyPublicKeyBag init](&v77, "init");
  if (v24)
  {
    v72 = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[TransparencyPublicKeyBag set__verifiedLogHeads:](v24, "set__verifiedLogHeads:", v25);

    -[TransparencyPublicKeyBag setApplication:](v24, "setApplication:", v22);
    -[TransparencyPublicKeyBag setAllowOldKeys:](v24, "setAllowOldKeys:", a11);
    -[TransparencyPublicKeyBag setSettings:](v24, "setSettings:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](v24, "settings"));

    if (!v26)
    {
      v27 = objc_alloc_init((Class)TransparencySettings);
      -[TransparencyPublicKeyBag setSettings:](v24, "setSettings:", v27);

    }
    v28 = v19;
    if (-[TransparencyPublicKeyBag verifyCertificates:intermediates:application:error:](v24, "verifyCertificates:intermediates:application:error:", v19, v20, v22, a13))
    {
      v29 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:](TransparencyCertificateHelper, "copyTrustedKeysFromDataArray:error:", v19, a13);
      trustedAppSigningKeys = v24->_trustedAppSigningKeys;
      v24->_trustedAppSigningKeys = v29;

      v31 = v74;
      if (v24->_trustedAppSigningKeys)
      {
        objc_storeStrong((id *)&v24->_trustedAppLeafs, a3);
        v32 = [TransparencyTrustedKeyStore alloc];
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedAppSigningKeys](v24, "trustedAppSigningKeys"));
        v34 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v32, "initWithTrustedKeys:", v33);
        -[TransparencyPublicKeyBag setAppSmtKeyStore:](v24, "setAppSmtKeyStore:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag appSmtKeyStore](v24, "appSmtKeyStore"));
        -[TransparencyPublicKeyBag setAppSthKeyStore:](v24, "setAppSthKeyStore:", v35);

        if (-[TransparencyPublicKeyBag verifyCertificates:intermediates:application:error:](v24, "verifyCertificates:intermediates:application:error:", v74, v20, kKTApplicationIdentifierTLT, a13))
        {
          v36 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:](TransparencyCertificateHelper, "copyTrustedKeysFromDataArray:error:", v74, a13);
          trustedTltSigningKeys = v24->_trustedTltSigningKeys;
          v24->_trustedTltSigningKeys = v36;

          if (v24->_trustedTltSigningKeys)
          {
            objc_storeStrong((id *)&v24->_trustedTltLeafs, v66);
            v38 = [TransparencyTrustedKeyStore alloc];
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](v24, "trustedTltSigningKeys"));
            v40 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v38, "initWithTrustedKeys:", v39);
            tltKeyStore = v24->_tltKeyStore;
            v24->_tltKeyStore = v40;

            v42 = v75;
            if (objc_msgSend(v20, "count"))
              v43 = (NSArray *)v20;
            else
              v43 = (NSArray *)&__NSArray0__struct;
            trustedIntermediates = v24->_trustedIntermediates;
            v24->_trustedIntermediates = v43;

            v45 = v73;
            if (!-[TransparencyPublicKeyBag processTltConfigProof:error:](v24, "processTltConfigProof:error:", v21, a13))goto LABEL_38;
            if (!v76)
            {
LABEL_30:
              if (-[TransparencyPublicKeyBag processPatConfigProof:error:](v24, "processPatConfigProof:error:", v42, a13)&& (!v45|| -[TransparencyPublicKeyBag processPatClosedProof:error:](v24, "processPatClosedProof:error:", v45, a13)))
              {
                v44 = v24;
                goto LABEL_15;
              }
LABEL_38:
              v44 = 0;
              goto LABEL_15;
            }
            if (qword_1002A7668 != -1)
              dispatch_once(&qword_1002A7668, &stru_100246408);
            v48 = qword_1002A7670;
            if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "pamHeadInPatProof present", buf, 2u);
            }
            objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "perApplicationTreeEntry"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "slh"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "object"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "slh"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "object"));
            v67 = objc_msgSend(v50, "isEqualToData:", v52);

            if ((v67 & 1) == 0)
            {
              if (qword_1002A7668 != -1)
                dispatch_once(&qword_1002A7668, &stru_100246428);
              v31 = v74;
              v42 = v75;
              v21 = v72;
              v45 = v73;
              v63 = qword_1002A7670;
              if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "pamHeadInPatProof was present but didn't match patConfigProof SLH", buf, 2u);
              }
              goto LABEL_38;
            }
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topLevelTreeEntry"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag processPamHeadInPatProof:tltEntry:error:](v24, "processPamHeadInPatProof:tltEntry:error:", v76, v53, a13));

            if (v54)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "parsedMapHead"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v55, "application")));
              obja = (id)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationIdentifierForValue:](TransparencyApplication, "applicationIdentifierForValue:", v56));

              if (qword_1002A7668 != -1)
                dispatch_once(&qword_1002A7668, &stru_100246468);
              v21 = v72;
              v57 = (void *)qword_1002A7670;
              if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_INFO))
              {
                v58 = v57;
                v68 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "parsedMapHead"));
                v59 = objc_msgSend(v68, "revision");
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "parsedMapHead"));
                v61 = objc_msgSend(v60, "populating");
                *(_DWORD *)buf = 138412802;
                v79 = obja;
                v80 = 2048;
                v81 = v59;
                v21 = v72;
                v82 = 1024;
                v83 = v61;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "pamHeadInPatProof SMH for %@ with revision %llu, populating = %d", buf, 0x1Cu);

              }
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "parsedMapHead"));
              -[TransparencyPublicKeyBag setMapStillPopulating:](v24, "setMapStillPopulating:", objc_msgSend(v62, "populating"));

              v31 = v74;
              v42 = v75;
              v45 = v73;
              goto LABEL_30;
            }
            v42 = v75;
            if (qword_1002A7668 != -1)
              dispatch_once(&qword_1002A7668, &stru_100246448);
            v31 = v74;
            v21 = v72;
            v64 = qword_1002A7670;
            if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
            {
              if (a13)
                v65 = *a13;
              else
                v65 = 0;
              *(_DWORD *)buf = 138412290;
              v79 = v65;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "pamHeadInPatProof was present but didn't validate: %@", buf, 0xCu);
            }
            v44 = 0;
            goto LABEL_11;
          }
        }
      }
      v44 = 0;
    }
    else
    {
      v44 = 0;
      v31 = v74;
    }
    v42 = v75;
    v45 = v73;
    goto LABEL_15;
  }
  v44 = 0;
  v28 = v19;
  v31 = v74;
  v42 = v75;
LABEL_11:
  v45 = v73;
LABEL_15:

  return v44;
}

- (id)createTrustedSthKeyStoreFromProofSPKI:(id)a3 signingKeysMap:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  TransparencyTrustedKeyStore *v11;
  void *v12;
  void *v13;
  TransparencyTrustedKeyStore *v14;
  NSObject *v15;
  uint8_t v17[16];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  if (v10)
  {
    v11 = [TransparencyTrustedKeyStore alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v10, v12));
    v14 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v11, "initWithTrustedKeys:", v13);

  }
  else
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -219, CFSTR("Signing key in proof does not match any signing key in certs")));
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_100246488);
    v15 = qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Signing key in proof does not match any signing key in certs", v17, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)diskStoreDictionary
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedAppLeafs](self, "trustedAppLeafs"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Leafs"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltLeafs](self, "trustedTltLeafs"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("TltLeafs"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedIntermediates](self, "trustedIntermediates"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Intermediates"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag patConfigProof](self, "patConfigProof"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PatConfigProof"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltConfigProof](self, "tltConfigProof"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("TltConfigProof"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag receiptTime](self, "receiptTime"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ReceiptTime"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag patClosedProof](self, "patClosedProof"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PatClosedProof"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag treeRollInfoURL](self, "treeRollInfoURL"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("TreeRollInfoURL"));

  return v3;
}

- (id)copyTltBag
{
  TransparencyPublicKeyBag *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(TransparencyPublicKeyBag);
  -[TransparencyPublicKeyBag setApplication:](v3, "setApplication:", kKTApplicationIdentifierTLT);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  -[TransparencyPublicKeyBag setAppSthKeyStore:](v3, "setAppSthKeyStore:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
  -[TransparencyPublicKeyBag setTrustedAppSigningKeys:](v3, "setTrustedAppSigningKeys:", v5);

  -[TransparencyPublicKeyBag setPatLogBeginningMs:](v3, "setPatLogBeginningMs:", -[TransparencyPublicKeyBag tltLogBeginningMs](self, "tltLogBeginningMs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  -[TransparencyPublicKeyBag setTltKeyStore:](v3, "setTltKeyStore:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
  -[TransparencyPublicKeyBag setTrustedTltSigningKeys:](v3, "setTrustedTltSigningKeys:", v7);

  -[TransparencyPublicKeyBag setTltLogBeginningMs:](v3, "setTltLogBeginningMs:", -[TransparencyPublicKeyBag tltLogBeginningMs](self, "tltLogBeginningMs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag vrfKey](self, "vrfKey"));
  -[TransparencyPublicKeyBag setVrfKey:](v3, "setVrfKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag receiptTime](self, "receiptTime"));
  -[TransparencyPublicKeyBag setReceiptTime:](v3, "setReceiptTime:", v9);

  -[TransparencyPublicKeyBag setTltEarliestVersion:](v3, "setTltEarliestVersion:", -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion"));
  -[TransparencyPublicKeyBag setShutDown:](v3, "setShutDown:", -[TransparencyPublicKeyBag shutDown](self, "shutDown"));
  return v3;
}

- (NSArray)verifiedLogHeads
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v2));

  return (NSArray *)v3;
}

- (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  BOOL v17;
  uint64_t AppleKeyTransparency;
  const void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](self, "settings"));
  if ((objc_msgSend(v13, "allowsInternalSecurityPolicies") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](self, "settings"));
    v15 = objc_msgSend(v14, "getBool:", kTransparencyFlagDisableVerifyKeyStoreCertificates);

    if (v15)
    {
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_1002464A8);
      v16 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "certificate verification not enabled", buf, 2u);
      }
      v17 = 1;
      goto LABEL_24;
    }
  }
  else
  {

  }
  AppleKeyTransparency = SecPolicyCreateAppleKeyTransparency(v12);
  if (AppleKeyTransparency)
  {
    v19 = (const void *)AppleKeyTransparency;
    v20 = +[TransparencyCertificateHelper verifyCertificates:intermediates:policy:error:](TransparencyCertificateHelper, "verifyCertificates:intermediates:policy:error:", v10, v11, AppleKeyTransparency, a6);
    v17 = v20;
    if (a6 && (v20 & 1) == 0)
    {
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -29, v12, *a6));
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_1002464E8);
      v21 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        v22 = *a6;
        *(_DWORD *)buf = 138412546;
        v26 = v12;
        v27 = 2112;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "certificates for %@ failed trust evaluation: %@", buf, 0x16u);
      }
    }
    CFRelease(v19);
  }
  else
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAlloc, -53, CFSTR("failed to create KT policy for %@"), v12));
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_1002464C8);
    v23 = qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create KT policy for %@", buf, 0xCu);
    }
    v17 = 0;
  }
LABEL_24:

  return v17;
}

- (BOOL)processTltConfigProof:(id)a3 error:(id *)a4
{
  id v6;
  TransparencyLogEntryVerifier *v7;
  void *v8;
  TransparencyLogEntryVerifier *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  signed int v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  TransparencyError *v28;
  NSObject *v29;
  id v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  _QWORD v38[2];

  v6 = a3;
  v7 = [TransparencyLogEntryVerifier alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  v9 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v7, "initWithTrustedKeyStore:", v8);

  objc_msgSend(v6, "setVerifier:", v9);
  if (!objc_msgSend(v6, "verifyWithError:", a4))
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -224, *a4, CFSTR("TLT config proof failed to verify")));
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_100246508);
    v17 = qword_1002A7670;
    if (!os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    if (a4)
      v18 = *a4;
    else
      v18 = 0;
    *(_DWORD *)buf = 138412290;
    v38[0] = v18;
    v14 = "TLT config proof failed to verify: %@";
    v15 = v17;
    v16 = 12;
    goto LABEL_36;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "slh"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v11));
  objc_msgSend(v10, "addObject:", v12);

  if (!objc_msgSend(v6, "nodePosition"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodeBytes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](TopLevelTreeConfigNode, "parseFromData:error:", v19, a4));

    if (!v20)
    {
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_100246548);
      v29 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        if (a4)
          v30 = *a4;
        else
          v30 = 0;
        *(_DWORD *)buf = 138412290;
        v38[0] = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "TLT config node failed to parse: %@", buf, 0xCu);
      }
      v31 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -141, *a4, CFSTR("TLT config node failed to parse")));
      goto LABEL_52;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "publicKeyBytes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:](self, "createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:", v21, v22, a4));

    if (v23)
    {
      if (!-[TransparencyPublicKeyBag allowOldKeys](self, "allowOldKeys"))
        -[TransparencyPublicKeyBag setTltKeyStore:](self, "setTltKeyStore:", v23);
      -[TransparencyPublicKeyBag setTltEarliestVersion:](self, "setTltEarliestVersion:", TopLevelTreeConfigNode_EarliestVersion_RawValue((uint64_t)v20));
      if (!-[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion"))
        -[TransparencyPublicKeyBag setTltEarliestVersion:](self, "setTltEarliestVersion:", 1);
      v24 = -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion");
      v25 = kTransparencyProtocolVersion;
      if (v24 <= kTransparencyProtocolVersion)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
        -[TransparencyPublicKeyBag setTltConfigProof:](self, "setTltConfigProof:", v33);

        v31 = 1;
        goto LABEL_47;
      }
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_100246588);
      v26 = (void *)qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        *(_DWORD *)buf = 67109376;
        LODWORD(v38[0]) = -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion");
        WORD2(v38[0]) = 1024;
        *(_DWORD *)((char *)v38 + 6) = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "TLT config proof earliest version later %d than our version %d", buf, 0xEu);

      }
      if (a4)
      {
        v28 = +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -235, *a4, CFSTR("TLT config proof earliest version later %d than our version %d"), -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion"), v25);
LABEL_44:
        v31 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v28);
LABEL_47:

LABEL_52:
        goto LABEL_53;
      }
    }
    else
    {
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_100246568);
      v32 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "TLT config proof signing key did not match any trusted cert", buf, 2u);
      }
      if (a4)
      {
        v28 = +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -222, *a4, CFSTR("TLT config proof signing key did not match any trusted cert"), v35, v36);
        goto LABEL_44;
      }
    }
    v31 = 0;
    goto LABEL_47;
  }
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -220, CFSTR("TLT config proof at wrong position")));
  if (qword_1002A7668 != -1)
    dispatch_once(&qword_1002A7668, &stru_100246528);
  v13 = qword_1002A7670;
  if (!os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    goto LABEL_37;
  *(_WORD *)buf = 0;
  v14 = "TLT config proof at wrong position";
  v15 = v13;
  v16 = 2;
LABEL_36:
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_37:
  v31 = 0;
LABEL_53:

  return v31;
}

- (id)processPamHeadInPatProof:(id)a3 tltEntry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  TransparencyLogEntryVerifier *v16;
  void *v17;
  TransparencyLogEntryVerifier *v18;
  TransparencyLogEntryVerifier *v19;
  void *v20;
  TransparencyLogEntryVerifier *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  TransparencyMapInclusionProofVerifier *v28;
  void *v29;
  TransparencyMapInclusionProofVerifier *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  TransparencyLogEntryVerifier *v36;
  TransparencyMapInclusionProofVerifier *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodeBytes"));
  v40 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](PerApplicationTreeNode, "parseFromData:error:", v10, &v40));
  v12 = v40;

  if (v11 && (objc_msgSend(v11, "hasObjectMapHead") ? (v13 = v12 == 0) : (v13 = 0), v13))
  {
    v16 = [TransparencyLogEntryVerifier alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag appSthKeyStore](self, "appSthKeyStore"));
    v18 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v16, "initWithTrustedKeyStore:", v17);

    v19 = [TransparencyLogEntryVerifier alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
    v21 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v19, "initWithTrustedKeyStore:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectMapHead"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](SignedMapHead, "signedTypeWithObject:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogEntryVerifier trustedKeyStore](v18, "trustedKeyStore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "signatureVerifier"));
    objc_msgSend(v23, "setVerifier:", v25);

    objc_msgSend(v23, "setOverrideBeginTimeFromLogEntry:", v8);
    if (v23)
    {
      v39 = 0;
      v26 = objc_msgSend(v23, "verifyWithError:", &v39);
      v27 = v39;
      if (v26 == (id)1)
      {
        objc_msgSend(v8, "setVerifier:", v18);
        v36 = v21;
        objc_msgSend(v9, "setVerifier:", v21);
        v28 = [TransparencyMapInclusionProofVerifier alloc];
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
        v30 = -[TransparencyMapInclusionProofVerifier initWithKeyBag:application:](v28, "initWithKeyBag:application:", self, v29);

        v37 = v30;
        v38 = v27;
        v31 = -[TransparencyMapInclusionProofVerifier verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:](v30, "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:", v8, v23, v9, &v38);
        v12 = v38;

        if (v12)
        {
          if (qword_1002A7668 != -1)
            dispatch_once(&qword_1002A7668, &stru_100246608);
          v21 = v36;
          v32 = qword_1002A7670;
          if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v12;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "verifyPerApplicationTreeEntry failed for pamInPatEntry: %@", buf, 0xCu);
          }
          v15 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v12);
        }
        else
        {
          if (v31)
          {
            -[TransparencyPublicKeyBag setVerifiedSignedMapHead:](self, "setVerifiedSignedMapHead:", v23);
            v15 = v23;
          }
          else
          {
            v15 = 0;
          }
          v21 = v36;
        }

      }
      else
      {
        if (qword_1002A7668 != -1)
          dispatch_once(&qword_1002A7668, &stru_1002465E8);
        v34 = qword_1002A7670;
        if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v27;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Couldn't verify SMH from pamHeadInPatProof: signature was invalid with error %@", buf, 0xCu);
        }
        v15 = 0;
        if (a5 && v27)
        {
          v12 = objc_retainAutorelease(v27);
          v15 = 0;
          *a5 = v12;
        }
        else
        {
          v12 = v27;
        }
      }
    }
    else
    {
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_1002465C8);
      v33 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Couldn't verify SMH from pamHeadInPatProof: object init failure", buf, 2u);
      }
      v12 = 0;
      v15 = 0;
    }

  }
  else
  {
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_1002465A8);
    v14 = qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't parse SMH from pamHeadInPatProof: %@", buf, 0xCu);
    }
    v15 = 0;
    if (a5 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v15 = 0;
      *a5 = v12;
    }
  }

  return v15;
}

- (BOOL)verifyConfigProof:(id)a3 error:(id *)a4
{
  id v6;
  TransparencyPatInclusionProofVerifier *v7;
  void *v8;
  TransparencyPatInclusionProofVerifier *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = [TransparencyPatInclusionProofVerifier alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
  v9 = -[TransparencyPatInclusionProofVerifier initWithKeyBag:application:](v7, "initWithKeyBag:application:", self, v8);

  objc_msgSend(v6, "setVerifier:", v9);
  v10 = objc_msgSend(v6, "verifyConfigProof:", a4);
  if (v10 == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "perApplicationTreeEntry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "slh"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v13));
    objc_msgSend(v11, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelTreeEntry"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "slh"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v17));
    objc_msgSend(v15, "addObject:", v18);

  }
  return v10 == (id)1;
}

- (id)copyVRFKeyFromConfigProof:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "vrfPublicKeyWithError:", a4));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyVRFVerifier verifierOfType:key:](TransparencyVRFVerifier, "verifierOfType:key:", objc_msgSend(v6, "type"), v6));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "vrfType"))
    {
      v10 = v7;
    }
    else
    {
      if (a4)
      {
        v11 = kTransparencyErrorDecode;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vrfKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v11, -143, CFSTR("VRF public key [%@] of type %d is invalid"), v13, objc_msgSend(v7, "type")));

      }
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_100246648);
      v14 = (void *)qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vrfKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_hexString"));
        *(_DWORD *)buf = 138412546;
        v23 = v17;
        v24 = 1024;
        v25 = objc_msgSend(v7, "type");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "VRF public key [%@] of type %d is invalid", buf, 0x12u);

      }
      v10 = 0;
    }

  }
  else
  {
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_100246628);
    v18 = (void *)qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to get vrf public key from config proof for %{public}@", buf, 0xCu);

    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)processPatConfigProof:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  signed int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[10];
  id v33;

  v6 = a3;
  if (!-[TransparencyPublicKeyBag verifyConfigProof:error:](self, "verifyConfigProof:error:", v6, a4))
    goto LABEL_13;
  if (qword_1002A7668 != -1)
    dispatch_once(&qword_1002A7668, &stru_100246668);
  v7 = (void *)qword_1002A7670;
  if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v32 = -[TransparencyPublicKeyBag patLogBeginningMs](self, "patLogBeginningMs");
    *(_WORD *)&v32[8] = 2048;
    v33 = objc_msgSend(v6, "patLogBeginningMs");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing new PAT config. Current %llu, processing %llu", buf, 0x16u);

  }
  -[TransparencyPublicKeyBag setPatEarliestVersion:](self, "setPatEarliestVersion:", objc_msgSend(v6, "earliestCurrentTreeVersionWithError:", a4));
  v9 = -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion");
  v10 = kTransparencyProtocolVersion;
  if (v9 > kTransparencyProtocolVersion)
  {
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_100246688);
    v11 = (void *)qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v32 = v13;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "PAT config proof earliest version later %d than our version %d", buf, 0xEu);

    }
    if (a4)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -236, *a4, CFSTR("PAT config proof earliest version later %d than our version %d"), -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion"), v10));
      v15 = 0;
      *a4 = v14;
      goto LABEL_44;
    }
LABEL_13:
    v15 = 0;
    goto LABEL_44;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "patSigningKeyWithError:", a4));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedAppSigningKeys](self, "trustedAppSigningKeys"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:](self, "createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:", v16, v17, a4));

    if (v18)
    {
      if (!-[TransparencyPublicKeyBag allowOldKeys](self, "allowOldKeys"))
        -[TransparencyPublicKeyBag setAppSthKeyStore:](self, "setAppSthKeyStore:", v18);
      v30 = 0;
      v19 = -[TransparencyPublicKeyBag copyVRFKeyFromConfigProof:error:](self, "copyVRFKeyFromConfigProof:error:", v6, &v30);
      v29 = v30;
      if (v19)
      {
        -[TransparencyPublicKeyBag setVrfKey:](self, "setVrfKey:", v19);
        -[TransparencyPublicKeyBag setVrfType:](self, "setVrfType:", objc_msgSend(v19, "type"));
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
      -[TransparencyPublicKeyBag setPatConfigProof:](self, "setPatConfigProof:", v20);

      v21 = objc_msgSend(v6, "tltLogBeginningMs");
      v22 = objc_msgSend(v6, "patLogBeginningMs");
      if (v21)
        v23 = v22 == 0;
      else
        v23 = 1;
      v15 = !v23;
      if (v23)
      {
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -169, CFSTR("PAT config proof STHs missing epoch begin times")));
        if (qword_1002A7668 != -1)
          dispatch_once(&qword_1002A7668, &stru_1002466C8);
        v25 = v29;
        v27 = qword_1002A7670;
        if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "PAT config proof STHs missing epoch begin times", buf, 2u);
        }
      }
      else
      {
        v24 = v22;
        -[TransparencyPublicKeyBag setTltLogBeginningMs:](self, "setTltLogBeginningMs:", v21);
        -[TransparencyPublicKeyBag setPatLogBeginningMs:](self, "setPatLogBeginningMs:", v24);
        v25 = v29;
      }

    }
    else
    {
      if (qword_1002A7668 != -1)
        dispatch_once(&qword_1002A7668, &stru_1002466A8);
      v26 = qword_1002A7670;
      if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "PAT config proof signing key did not match any trusted cert", buf, 2u);
      }
      v15 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -221, *a4, CFSTR("PAT config proof signing key did not match any trusted cert")));
    }

  }
  else
  {
    v15 = 0;
  }

LABEL_44:
  return v15;
}

- (BOOL)processPatClosedProof:(id)a3 error:(id *)a4
{
  id v6;
  TransparencyPatInclusionProofVerifier *v7;
  void *v8;
  TransparencyPatInclusionProofVerifier *v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  _BOOL4 v18;
  __int16 v19;
  int v20;

  v6 = a3;
  v7 = [TransparencyPatInclusionProofVerifier alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
  v9 = -[TransparencyPatInclusionProofVerifier initWithKeyBag:application:](v7, "initWithKeyBag:application:", self, v8);

  objc_msgSend(v6, "setVerifier:", v9);
  if (objc_msgSend(v6, "verifyWithError:", a4) != (id)1)
    goto LABEL_11;
  v10 = objc_msgSend(v6, "earliestNextTreeVersionWithError:", a4);
  v11 = (_BOOL8)v10;
  if ((_DWORD)v10)
  {
    v12 = kTransparencyProtocolVersion;
    if (kTransparencyProtocolVersion < (int)v10)
    {
      LOBYTE(v11) = 1;
      -[TransparencyPublicKeyBag setUnsupported:](self, "setUnsupported:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
      -[TransparencyPublicKeyBag setPatClosedProof:](self, "setPatClosedProof:", v13);

      -[TransparencyPublicKeyBag setShutDown:](self, "setShutDown:", objc_msgSend(v6, "shutdownTimeStamp:", a4));
      goto LABEL_12;
    }
    if (qword_1002A7668 != -1)
      dispatch_once(&qword_1002A7668, &stru_1002466E8);
    v14 = qword_1002A7670;
    if (os_log_type_enabled((os_log_t)qword_1002A7670, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v18 = v11;
      v19 = 1024;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "PAT Closed proof for %d but our version is supported %d", buf, 0xEu);
    }
    if (a4)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -234, *a4, CFSTR("PAT Closed proof for %d but our version is supported %d"), v11, v12));
      LOBYTE(v11) = 0;
      *a4 = v15;
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v11) = 0;
  }
LABEL_12:

  return v11;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)trustedAppSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTrustedAppSigningKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)receiptTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReceiptTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (VRFPublicKey)vrfKey
{
  return (VRFPublicKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVrfKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (TransparencyTrustedKeyStore)appSmtKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppSmtKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TransparencyTrustedKeyStore)appSthKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAppSthKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (TransparencyTrustedKeyStore)tltKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTltKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)patLogBeginningMs
{
  return self->_patLogBeginningMs;
}

- (void)setPatLogBeginningMs:(unint64_t)a3
{
  self->_patLogBeginningMs = a3;
}

- (unint64_t)tltLogBeginningMs
{
  return self->_tltLogBeginningMs;
}

- (void)setTltLogBeginningMs:(unint64_t)a3
{
  self->_tltLogBeginningMs = a3;
}

- (int)tltEarliestVersion
{
  return self->_tltEarliestVersion;
}

- (void)setTltEarliestVersion:(int)a3
{
  self->_tltEarliestVersion = a3;
}

- (int)patEarliestVersion
{
  return self->_patEarliestVersion;
}

- (void)setPatEarliestVersion:(int)a3
{
  self->_patEarliestVersion = a3;
}

- (unint64_t)shutDown
{
  return self->_shutDown;
}

- (void)setShutDown:(unint64_t)a3
{
  self->_shutDown = a3;
}

- (BOOL)unsupported
{
  return self->_unsupported;
}

- (void)setUnsupported:(BOOL)a3
{
  self->_unsupported = a3;
}

- (NSString)treeRollInfoURL
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTreeRollInfoURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)mapStillPopulating
{
  return self->_mapStillPopulating;
}

- (void)setMapStillPopulating:(BOOL)a3
{
  self->_mapStillPopulating = a3;
}

- (SignedMapHead)verifiedSignedMapHead
{
  return (SignedMapHead *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVerifiedSignedMapHead:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSData)patConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPatConfigProof:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSData)tltConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTltConfigProof:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSData)patClosedProof
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPatClosedProof:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int)vrfType
{
  return self->_vrfType;
}

- (void)setVrfType:(int)a3
{
  self->_vrfType = a3;
}

- (NSArray)trustedAppLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTrustedAppLeafs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)trustedTltSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTrustedTltSigningKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)trustedTltLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTrustedTltLeafs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)trustedIntermediates
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrustedIntermediates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)allowOldKeys
{
  return self->_allowOldKeys;
}

- (void)setAllowOldKeys:(BOOL)a3
{
  self->_allowOldKeys = a3;
}

- (NSMutableArray)__verifiedLogHeads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)set__verifiedLogHeads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->___verifiedLogHeads, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_trustedIntermediates, 0);
  objc_storeStrong((id *)&self->_trustedTltLeafs, 0);
  objc_storeStrong((id *)&self->_trustedTltSigningKeys, 0);
  objc_storeStrong((id *)&self->_trustedAppLeafs, 0);
  objc_storeStrong((id *)&self->_patClosedProof, 0);
  objc_storeStrong((id *)&self->_tltConfigProof, 0);
  objc_storeStrong((id *)&self->_patConfigProof, 0);
  objc_storeStrong((id *)&self->_verifiedSignedMapHead, 0);
  objc_storeStrong((id *)&self->_treeRollInfoURL, 0);
  objc_storeStrong((id *)&self->_tltKeyStore, 0);
  objc_storeStrong((id *)&self->_appSthKeyStore, 0);
  objc_storeStrong((id *)&self->_appSmtKeyStore, 0);
  objc_storeStrong((id *)&self->_vrfKey, 0);
  objc_storeStrong((id *)&self->_receiptTime, 0);
  objc_storeStrong((id *)&self->_trustedAppSigningKeys, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
