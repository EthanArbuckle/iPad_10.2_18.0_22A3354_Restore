@implementation TransparencyRPCRequestBuilder

+ (id)buildPublicKeysRequest:(id)a3 error:(id *)a4
{
  id v5;
  PublicKeysRequest *v6;
  void *v7;
  void *v8;
  PublicKeysRequest *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;

  v5 = a3;
  v6 = objc_alloc_init(PublicKeysRequest);
  -[PublicKeysRequest setVersion:](v6, "setVersion:", kTransparencyProtocolVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v5));
  v8 = v7;
  if (v7)
  {
    -[PublicKeysRequest setApplication:](v6, "setApplication:", objc_msgSend(v7, "intValue"));
    v9 = v6;
  }
  else
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -42, CFSTR("Unknown application %@"), v5));
    if (qword_1002A7C38 != -1)
      dispatch_once(&qword_1002A7C38, &stru_10024D080);
    v10 = qword_1002A7C40;
    if (os_log_type_enabled((os_log_t)qword_1002A7C40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unknown application %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)buildQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  QueryRequest *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(QueryRequest);
  -[QueryRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v6));

  -[QueryRequest setApplication:](v8, "setApplication:", objc_msgSend(v9, "intValue"));
  -[QueryRequest setUri:](v8, "setUri:", v7);

  return v8;
}

+ (id)buildBatchQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  BatchQueryRequest *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(BatchQueryRequest);
  -[BatchQueryRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v7));
  -[BatchQueryRequest setApplication:](v8, "setApplication:", objc_msgSend(v9, "intValue"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryRequest uriArray](v8, "uriArray", (_QWORD)v18));
        objc_msgSend(v16, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v8;
}

+ (id)buildBatchQueryRequests:(id)a3 application:(id)a4 maxURIsPerBatch:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v17), (_QWORD)v22);
        if ((unint64_t)objc_msgSend(v12, "count") >= a5)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildBatchQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildBatchQueryRequest:application:error:", v12, v10, a6));
          if (!v18)
          {

            v20 = 0;
            goto LABEL_16;
          }
          v19 = (void *)v18;
          objc_msgSend(v11, "addObject:", v18);
          objc_msgSend(v12, "removeAllObjects");

        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v12, "count"))
    goto LABEL_14;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildBatchQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildBatchQueryRequest:application:error:", v12, v10, a6));
  if (v20)
  {
    objc_msgSend(v11, "addObject:", v20);

LABEL_14:
    v20 = v11;
  }
LABEL_16:

  return v20;
}

+ (id)buildConsistencyProofRequest:(id)a3 revisions:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  ConsistencyProofRequest *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  ConsistencyProofRequest_LogConsistencyRequest *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v8 = objc_alloc_init(ConsistencyProofRequest);
    -[ConsistencyProofRequest setVersion:](v8, "setVersion:", kTransparencyProtocolVersion);
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v7, "count") - 1);
    -[ConsistencyProofRequest setRequestsArray:](v8, "setRequestsArray:", v9);

    if (objc_msgSend(v6, "isEqualToString:", kKTApplicationIdentifierTLT))
      v10 = 3;
    else
      v10 = 2;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v6));
    v12 = objc_msgSend(v11, "intValue");

    -[ConsistencyProofRequest setLogType:](v8, "setLogType:", v10);
    if ((_DWORD)v12)
      -[ConsistencyProofRequest setApplication:](v8, "setApplication:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

    if (objc_msgSend(v7, "count") != (id)1)
    {
      v15 = 0;
      do
      {
        v16 = objc_alloc_init(ConsistencyProofRequest_LogConsistencyRequest);
        -[ConsistencyProofRequest_LogConsistencyRequest setStartRevision:](v16, "setStartRevision:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", ++v15));
        -[ConsistencyProofRequest_LogConsistencyRequest setEndRevision:](v16, "setEndRevision:", objc_msgSend(v17, "unsignedLongLongValue"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v15));
        v14 = objc_msgSend(v18, "unsignedLongLongValue");

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofRequest requestsArray](v8, "requestsArray"));
        objc_msgSend(v19, "addObject:", v16);

      }
      while (v15 < (char *)objc_msgSend(v7, "count") - 1);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildRevisionLogInclusionProofRequest:(id)a3 logType:(int)a4 revisions:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v8;
  id v9;
  RevisionLogInclusionProofRequest *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(RevisionLogInclusionProofRequest);
  -[RevisionLogInclusionProofRequest setVersion:](v10, "setVersion:", kTransparencyProtocolVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v8));
  -[RevisionLogInclusionProofRequest setApplication:](v10, "setApplication:", objc_msgSend(v11, "intValue"));

  -[RevisionLogInclusionProofRequest setLogType:](v10, "setLogType:", v7);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RevisionLogInclusionProofRequest revisionArray](v10, "revisionArray", (_QWORD)v20));
        objc_msgSend(v18, "addValue:", objc_msgSend(v17, "unsignedLongLongValue"));

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v10;
}

@end
