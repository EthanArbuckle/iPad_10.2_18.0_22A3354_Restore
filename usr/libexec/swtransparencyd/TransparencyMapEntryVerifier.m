@implementation TransparencyMapEntryVerifier

- (TransparencyMapEntryVerifier)initWithPositon:(id)a3 trustedKeyStore:(id)a4
{
  id v7;
  id v8;
  TransparencyMapEntryVerifier *v9;
  TransparencyMapEntryVerifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyMapEntryVerifier;
  v9 = -[TransparencyMapEntryVerifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryPosition, a3);
    objc_storeStrong((id *)&v10->_trustedKeyStore, a4);
  }

  return v10;
}

+ (id)peerIndexAtDepth:(unint64_t)a3 leafIndex:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  char *v11;
  char v13;

  v5 = a4;
  v6 = 8 * (_QWORD)objc_msgSend(v5, "length") - a3;
  v7 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "resetBytesInRange:", (char *)objc_msgSend(v5, "length") - (v6 >> 3), v6 >> 3);
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "bytes");
  v10 = ~(v6 >> 3);
  v13 = *((_BYTE *)objc_msgSend(v5, "length") + v10 + (_QWORD)v9) & (-1 << (v6 & 7)) ^ (1 << (v6 & 7));
  v11 = (char *)objc_msgSend(v5, "length");

  objc_msgSend(v8, "replaceBytesInRange:withBytes:", &v11[v10], 1, &v13);
  return v8;
}

+ (id)leafHash:(id)a3 index:(id)a4 treeId:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v15;

  v15 = 76;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v15, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", a5, 8));
  objc_msgSend(v9, "appendData:", v10);

  objc_msgSend(v9, "appendData:", v7);
  v11 = objc_msgSend(v7, "length");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", 8 * (_QWORD)v11, 4));
  objc_msgSend(v9, "appendData:", v12);

  objc_msgSend(v9, "appendData:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_sha256"));

  return v13;
}

+ (id)interiorNodeForLeftData:(id)a3 rightData:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", a3));
  objc_msgSend(v6, "appendData:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_sha256"));
  return v7;
}

+ (id)emptyAtDepth:(unint64_t)a3 leafIndex:(id)a4 treeId:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;

  v13 = 69;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyMapEntryVerifier peerIndexAtDepth:leafIndex:](TransparencyMapEntryVerifier, "peerIndexAtDepth:leafIndex:", a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v13, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", a5, 8));
  objc_msgSend(v8, "appendData:", v9);

  objc_msgSend(v8, "appendData:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", a3, 4));
  objc_msgSend(v8, "appendData:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_sha256"));
  return v11;
}

- (BOOL)verifyInclusionOfMapLeaf:(id)a3 position:(id)a4 treeHead:(id)a5 treeId:(unint64_t)a6 hashPath:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  id v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id *v43;
  void *context;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v51 = a6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyMapEntryVerifier leafHash:index:treeId:](TransparencyMapEntryVerifier, "leafHash:index:treeId:", v13, v14, a6));
  v18 = objc_msgSend(v16, "count");
  if (v18 != (id)(8 * (_QWORD)objc_msgSend(v14, "length")))
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -50, CFSTR("Not enough hashes to match position size")));
    if (qword_10012A840 != -1)
      dispatch_once(&qword_10012A840, &stru_100106D70);
    v35 = qword_10012A848;
    if (os_log_type_enabled((os_log_t)qword_10012A848, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Not enough hashes to match position size", buf, 2u);
    }
    goto LABEL_26;
  }
  v43 = a8;
  v46 = v15;
  v47 = v13;
  context = objc_autoreleasePoolPush();
  v45 = v17;
  v19 = objc_msgSend(v17, "copy");
  if (objc_msgSend(v14, "length"))
  {
    v20 = 0;
    v21 = -1;
    v22 = 1;
    v48 = v14;
    do
    {
      v23 = (unsigned __int8 *)objc_msgSend(v14, "length");
      v49 = v22;
      v24 = objc_retainAutorelease(v14);
      v25 = 0;
      v26 = v23[(_QWORD)objc_msgSend(v24, "bytes") - v22];
      v50 = v21;
      v27 = 8 * (_QWORD)&v23[v21] + 8;
      v28 = v19;
      do
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v20 + v25));
        if (!objc_msgSend(v29, "length"))
        {
          v30 = +[TransparencyMapEntryVerifier emptyAtDepth:leafIndex:treeId:](TransparencyMapEntryVerifier, "emptyAtDepth:leafIndex:treeId:", v27, v24, v51);

          v29 = v30;
        }
        if (((v26 >> v25) & 1) != 0)
        {
          v31 = v29;
          v32 = v28;
        }
        else
        {
          v31 = v28;
          v32 = v29;
        }
        v19 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyMapEntryVerifier interiorNodeForLeftData:rightData:](TransparencyMapEntryVerifier, "interiorNodeForLeftData:rightData:", v31, v32));

        ++v25;
        --v27;
        v28 = v19;
      }
      while (v25 != 8);
      v22 = v49 + 1;
      v21 = v50 - 1;
      v20 += 8;
      v14 = v48;
    }
    while (v49 + 1 <= (unint64_t)objc_msgSend(v24, "length"));
  }
  v15 = v46;
  v33 = objc_msgSend(v19, "isEqualToData:", v46);

  objc_autoreleasePoolPop(context);
  if ((v33 & 1) == 0)
  {
    v13 = v47;
    if (v43)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "kt_hexString"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "kt_hexString"));
      *v43 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -45, CFSTR("failed to verify inclusion proof for leaf (%@) in head (%@)"), v36, v37));

    }
    v17 = v45;
    if (qword_10012A840 != -1)
      dispatch_once(&qword_10012A840, &stru_100106D90);
    v38 = (void *)qword_10012A848;
    if (os_log_type_enabled((os_log_t)qword_10012A848, OS_LOG_TYPE_ERROR))
    {
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "kt_hexString"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v53 = v40;
      v54 = 2112;
      v55 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for leaf hash (%@) in head (%@)", buf, 0x16u);

    }
LABEL_26:
    v34 = 0;
    goto LABEL_27;
  }
  v34 = 1;
  v13 = v47;
  v17 = v45;
LABEL_27:

  return v34;
}

+ (void)storeSMHSignatureResult:(unint64_t)a3 smh:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataStore"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001C8E8;
  v12[3] = &unk_100105D38;
  v14 = v8;
  v15 = a3;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

- (unint64_t)verifyMapEntryWithMapLeaf:(id)a3 hashesToRoot:(id)a4 signedMapHead:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  NSData *entryPosition;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSObject *v20;
  uint8_t v22[8];
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23 = 0;
  v13 = (unint64_t)objc_msgSend(v12, "verifyWithError:", &v23);
  v14 = v23;
  +[TransparencyMapEntryVerifier storeSMHSignatureResult:smh:error:](TransparencyMapEntryVerifier, "storeSMHSignatureResult:smh:error:", v13, v12, v14);
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);
  if (v13 == 1)
  {
    entryPosition = self->_entryPosition;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedMapHead"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapHeadHash"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedMapHead"));
    v19 = -[TransparencyMapEntryVerifier verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:](self, "verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:", v10, entryPosition, v17, objc_msgSend(v18, "treeId"), v11, a6);

    if ((v19 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -43, *a6, CFSTR("failed to verify inclusion proof for map leaf in mapHeadHash")));
      if (qword_10012A840 != -1)
        dispatch_once(&qword_10012A840, &stru_100106DF0);
      v20 = qword_10012A848;
      if (os_log_type_enabled((os_log_t)qword_10012A848, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for map leaf in mapHeadHash", v22, 2u);
      }
      v13 = 0;
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

- (NSData)entryPosition
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntryPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPosition, 0);
  objc_storeStrong((id *)&self->_trustedKeyStore, 0);
}

@end
