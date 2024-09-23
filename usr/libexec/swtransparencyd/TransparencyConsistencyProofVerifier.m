@implementation TransparencyConsistencyProofVerifier

- (TransparencyConsistencyProofVerifier)initWithTrustedKeyStore:(id)a3
{
  id v5;
  TransparencyConsistencyProofVerifier *v6;
  TransparencyConsistencyProofVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyConsistencyProofVerifier;
  v6 = -[TransparencyConsistencyProofVerifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trustedKeyStore, a3);

  return v7;
}

- (BOOL)verifyConsistencyProof:(id)a3 startHash:(id)a4 startSize:(unint64_t)a5 endHash:(id)a6 endSize:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  unsigned __int8 v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id *v49;
  void *context;
  id v51;
  id v52;
  id v53;
  void *v54;
  id obj;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  unint64_t v63;
  __int16 v64;
  unint64_t v65;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (!a5 || a7 <= a5)
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -180, CFSTR("first size (%llu) is <= 0 or second size (%llu) is <= first"), a5, a7));
    if (qword_10012A710 != -1)
      dispatch_once(&qword_10012A710, &stru_100105CB0);
    v39 = qword_10012A718;
    if (os_log_type_enabled((os_log_t)qword_10012A718, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v63 = a5;
      v64 = 2048;
      v65 = a7;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "first size (%llu) is <= 0 or second size (%llu) is <= first", buf, 0x16u);
    }
    goto LABEL_43;
  }
  context = objc_autoreleasePoolPush();
  v16 = objc_msgSend(v13, "mutableCopy");
  v17 = v16;
  v18 = a5 - 1;
  if ((a5 & (a5 - 1)) == 0)
    objc_msgSend(v16, "insertObject:atIndex:", v14, 0);
  v19 = a7 - 1;
  v52 = v14;
  v53 = v13;
  v51 = v15;
  v49 = a8;
  if ((v18 & 1) != 0)
  {
    do
    {
      v20 = v18 >> 1;
      v19 >>= 1;
      v21 = v18;
      v18 >>= 1;
    }
    while ((v21 & 2) != 0);
  }
  else
  {
    v20 = a5 - 1;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v17, "removeObjectAtIndex:", 0);
  buf[0] = 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 1));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v17;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v58;
    v54 = v23;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(obj);
        if (!v19)
        {

          v15 = v51;
          v14 = v52;
          v38 = v56;
          goto LABEL_33;
        }
        v28 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v29 = objc_msgSend(v23, "mutableCopy");
        v30 = objc_msgSend(v23, "mutableCopy");
        v31 = v30;
        if ((v20 & 1) != 0 || v20 == v19)
        {
          v33 = v25;
          v34 = v26;
          objc_msgSend(v29, "appendData:", v28);
          objc_msgSend(v29, "appendData:", v56);
          objc_msgSend(v31, "appendData:", v28);
          objc_msgSend(v31, "appendData:", v22);
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "kt_sha256"));

          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_sha256"));
          if (v20 && (v20 & 1) == 0)
          {
            do
            {
              v37 = v20;
              v20 >>= 1;
              v19 >>= 1;
            }
            while (v37 >= 2 && (v37 & 2) == 0);
          }
          v56 = (void *)v35;
          v22 = (void *)v36;
          v26 = v34;
          v25 = v33;
          v23 = v54;
        }
        else
        {
          objc_msgSend(v30, "appendData:", v22);
          objc_msgSend(v31, "appendData:", v28);
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "kt_sha256"));

          v22 = (void *)v32;
        }
        v20 >>= 1;
        v19 >>= 1;

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v25)
        continue;
      break;
    }
  }

  v15 = v51;
  v14 = v52;
  v38 = v56;
  if (v19)
    goto LABEL_36;
LABEL_33:
  if (!objc_msgSend(v38, "isEqualToData:", v14))
  {
LABEL_36:

    objc_autoreleasePoolPop(context);
    goto LABEL_37;
  }
  v40 = objc_msgSend(v22, "isEqualToData:", v15);

  objc_autoreleasePoolPop(context);
  if ((v40 & 1) == 0)
  {
LABEL_37:
    v13 = v53;
    if (v49)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
      *v49 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -179, CFSTR("failed to verify consistency proof from head %@ to head %@"), v42, v43));

    }
    if (qword_10012A710 != -1)
      dispatch_once(&qword_10012A710, &stru_100105CD0);
    v44 = (void *)qword_10012A718;
    if (os_log_type_enabled((os_log_t)qword_10012A718, OS_LOG_TYPE_ERROR))
    {
      v45 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v63 = (unint64_t)v46;
      v64 = 2112;
      v65 = (unint64_t)v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "failed to verify consistency proof from head %@ to head %@", buf, 0x16u);

    }
LABEL_43:
    v41 = 0;
    goto LABEL_44;
  }
  v41 = 1;
  v13 = v53;
LABEL_44:

  return v41;
}

- (unint64_t)verifyConsistencyProof:(id)a3 startLogHead:(id)a4 endLogHead:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v23;
  id v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (unint64_t)objc_msgSend(v11, "verifyWithError:", a6);
  if (v13 == 1 && (v13 = (unint64_t)objc_msgSend(v12, "verifyWithError:", a6), v13 == 1))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parsedLogHead"));
    v24 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "logHeadHash"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parsedLogHead"));
    v16 = objc_msgSend(v15, "logSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedLogHead"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logHeadHash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedLogHead"));
    v20 = -[TransparencyConsistencyProofVerifier verifyConsistencyProof:startHash:startSize:endHash:endSize:error:](self, "verifyConsistencyProof:startHash:startSize:endHash:endSize:error:", v24, v14, v16, v18, objc_msgSend(v19, "logSize"), a6);

    v10 = v24;
    v13 = v20;
  }
  else
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -188, *a6, CFSTR("SLH in consistency proof failed signature verification")));
    if (qword_10012A710 != -1)
      dispatch_once(&qword_10012A710, &stru_100105CF0);
    v21 = qword_10012A718;
    if (os_log_type_enabled((os_log_t)qword_10012A718, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "SLH in consistency proof failed signature verification", buf, 2u);
    }
  }

  return v13;
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
