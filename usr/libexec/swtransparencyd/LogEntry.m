@implementation LogEntry

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A658;
  if (!qword_10012A658)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", LogEntry, CFSTR("LogEntry"), &unk_1001259B0, &off_100125BA8, 6, 48, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB354);
    qword_10012A658 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyLogEntryVerifier)verifier
{
  return (TransparencyLogEntryVerifier *)objc_getAssociatedObject(self, CFSTR("verifierKey"));
}

- (void)setVerifier:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("verifierKey"), a3, (void *)1);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, CFSTR("dataStoreKey"));
}

- (void)setDataStore:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("dataStoreKey"), a3, (void *)1);
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[LogEntry setMetadata:](self, "setMetadata:", v8);

  }
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = LogType_EnumDescriptor();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textFormatNameForValue:", -[LogEntry logType](self, "logType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("logType"));

  v7 = NodeType_EnumDescriptor();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textFormatNameForValue:", -[LogEntry nodeType](self, "nodeType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nodeType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogEntry nodePosition](self, "nodePosition")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("nodePosition"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry nodeBytes](self, "nodeBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("nodeBytes"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v18), "kt_hexString"));
        objc_msgSend(v13, "addObject:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hashesOfPeersInPathToRoot"));
  if (-[LogEntry hasSlh](self, "hasSlh"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry slh](self, "slh"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](SignedLogHead, "signedTypeWithObject:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("slh"));

  }
  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;

  if (!-[LogEntry hasSlh](self, "hasSlh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry slh](self, "slh")), v5, !v5))
  {
    v13 = -18;
    if (!a3)
    {
LABEL_12:
      if (qword_10012A778 != -1)
        dispatch_once(&qword_10012A778, &stru_100105E88);
      v14 = qword_10012A780;
      if (os_log_type_enabled((os_log_t)qword_10012A780, OS_LOG_TYPE_ERROR))
      {
        v27 = 134217984;
        v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "log entry missing data required for verification: %ld", (uint8_t *)&v27, 0xCu);
      }
      return 0;
    }
LABEL_11:
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v13, CFSTR("log entry missing data required for verification")));
    goto LABEL_12;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[LogEntry nodeBytes](self, "nodeBytes"));
  if (!v6
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry nodeBytes](self, "nodeBytes")),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        !v9))
  {
    v13 = -19;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = objc_claimAutoreleasedReturnValue(-[LogEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  if (-[LogEntry nodePosition](self, "nodePosition"))
  {
    v12 = -[LogEntry hashesOfPeersInPathToRootArray_Count](self, "hashesOfPeersInPathToRootArray_Count");

    if (!v12)
    {
LABEL_8:
      v13 = -20;
      if (!a3)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry slh](self, "slh"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry verifier](self, "verifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trustedKeyStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "signatureVerifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry dataStore](self, "dataStore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:verifier:dataStore:](SignedLogHead, "signedTypeWithObject:verifier:dataStore:", v17, v20, v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry verifier](self, "verifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry nodeBytes](self, "nodeBytes"));
  v25 = -[LogEntry nodePosition](self, "nodePosition");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  v15 = objc_msgSend(v23, "verifyLogEntryWithLogLeaf:position:hashesToRoot:signedLogHead:error:", v24, v25, v26, v22, a3);
  if (-[LogEntry logType](self, "logType") == 3)
    -[LogEntry setInclusionResult:signedLogHead:error:](self, "setInclusionResult:signedLogHead:error:", v15, v22, 0);

  return (unint64_t)v15;
}

- (unint64_t)setInclusionResult:(unint64_t)a3 signedLogHead:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;
  LogEntry *v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;

  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry dataStore](self, "dataStore"));
  objc_msgSend(v8, "setDataStore:", v9);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10000B2C0;
  v26 = sub_10000B2D0;
  v27 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry dataStore](self, "dataStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B2D8;
  v15[3] = &unk_100105F10;
  v11 = v8;
  v18 = &v28;
  v19 = &v22;
  v16 = v11;
  v17 = self;
  v20 = a3;
  v21 = a5;
  objc_msgSend(v10, "performBlockAndWait:", v15);

  if (a5)
  {
    v12 = (void *)v23[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (unint64_t)verifyTLTEntryForPerApplicationLogHead:(id)a3 error:(id *)a4
{
  id v5;
  void ***v6;
  id v7;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, _QWORD *, _QWORD *);
  void *v12;
  LogEntry *v13;
  id v14;

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10000B944;
  v12 = &unk_100105F98;
  v13 = self;
  v14 = a3;
  v5 = v14;
  v6 = objc_retainBlock(&v9);
  v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:](TransparencyAnalytics, "doKTResultWithAnalyticsForEventName:validateType:error:block:", CFSTR("ktTLTVerifyInclusionProofEvent"), 3, a4, v6, v9, v10, v11, v12, v13);

  return (unint64_t)v7;
}

@end
