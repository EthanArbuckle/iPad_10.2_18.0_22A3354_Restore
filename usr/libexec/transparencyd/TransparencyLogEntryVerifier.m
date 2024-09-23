@implementation TransparencyLogEntryVerifier

- (TransparencyLogEntryVerifier)initWithTrustedKeyStore:(id)a3
{
  id v5;
  TransparencyLogEntryVerifier *v6;
  TransparencyLogEntryVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyLogEntryVerifier;
  v6 = -[TransparencyLogEntryVerifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trustedKeyStore, a3);

  return v7;
}

- (BOOL)verifyInclusionOfLogLeaf:(id)a3 position:(unint64_t)a4 treeSize:(unint64_t)a5 treeHead:(id)a6 hashPath:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id *v29;
  NSObject *v30;
  unsigned __int8 v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *context;
  id *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (a4 >= a5)
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -49, CFSTR("leaf index is too big for tree size")));
    if (qword_1002A7A88 != -1)
      dispatch_once(&qword_1002A7A88, &stru_10024B530);
    v30 = qword_1002A7A90;
    if (os_log_type_enabled((os_log_t)qword_1002A7A90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "leaf index is too big for tree size", buf, 2u);
    }
    goto LABEL_34;
  }
  v43 = a8;
  context = objc_autoreleasePoolPush();
  buf[0] = 0;
  v50 = 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", buf, 1));
  v45 = v13;
  objc_msgSend(v16, "appendData:", v13);
  v41 = v16;
  v17 = a5 - 1;
  v40 = (void *)SecSHA256DigestCreateFromData(0, v16);
  v18 = objc_msgSend(v40, "copy");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v44 = v15;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        v24 = v18;
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        if (!v17)
        {

          goto LABEL_26;
        }
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v50, 1));
        v27 = v26;
        if ((a4 & 1) != 0 || a4 == v17)
        {
          objc_msgSend(v26, "appendData:", v25);
          objc_msgSend(v27, "appendData:", v24);
          v18 = (id)SecSHA256DigestCreateFromData(0, v27);
          if (a4 && (a4 & 1) == 0)
          {
            do
            {
              v28 = a4;
              a4 >>= 1;
              v17 >>= 1;
            }
            while (v28 >= 2 && (v28 & 2) == 0);
          }
        }
        else
        {
          objc_msgSend(v26, "appendData:", v24);
          objc_msgSend(v27, "appendData:", v25);
          v18 = (id)SecSHA256DigestCreateFromData(0, v27);
        }
        a4 >>= 1;
        v17 >>= 1;

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v21)
        continue;
      break;
    }
  }

  if (v17)
  {

    objc_autoreleasePoolPop(context);
    v13 = v45;
    v29 = v43;
LABEL_28:
    if (v29)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      *v29 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -45, CFSTR("failed to verify inclusion proof for leaf (%@) in head (%@)"), v33, v34));

    }
    if (qword_1002A7A88 != -1)
      dispatch_once(&qword_1002A7A88, &stru_10024B550);
    v15 = v44;
    v35 = (void *)qword_1002A7A90;
    if (os_log_type_enabled((os_log_t)qword_1002A7A90, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v52 = v37;
      v53 = 2112;
      v54 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for leaf (%@) in head (%@)", buf, 0x16u);

    }
LABEL_34:
    v32 = 0;
    goto LABEL_35;
  }
  v24 = v18;
LABEL_26:
  v13 = v45;
  v29 = v43;
  v31 = objc_msgSend(v24, "isEqualToData:", v14);

  objc_autoreleasePoolPop(context);
  if ((v31 & 1) == 0)
    goto LABEL_28;
  v32 = 1;
  v15 = v44;
LABEL_35:

  return v32;
}

- (unint64_t)verifyLogEntryWithLogLeaf:(id)a3 position:(unint64_t)a4 hashesToRoot:(id)a5 signedLogHead:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  uint8_t v23[16];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (unint64_t)objc_msgSend(v14, "verifyWithError:", a7);
  if (v15 == 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parsedLogHead"));
    v17 = objc_msgSend(v16, "logSize");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parsedLogHead"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logHeadHash"));
    v20 = -[TransparencyLogEntryVerifier verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:](self, "verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:", v12, a4, v17, v19, v13, a7);

    if ((v20 & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      if (a7)
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -44, *a7, CFSTR("failed to verify inclusion proof for log leaf in log head")));
      if (qword_1002A7A88 != -1)
        dispatch_once(&qword_1002A7A88, &stru_10024B570);
      v21 = qword_1002A7A90;
      if (os_log_type_enabled((os_log_t)qword_1002A7A90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for log leaf in log head", v23, 2u);
      }
      v15 = 0;
    }
  }

  return v15;
}

- (TransparencyTrustedKeyStore)trustedKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrustedKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedKeyStore, 0);
}

@end
