@implementation MZKeyValueStoreDeserializer

- (MZKeyValueStoreDeserializer)initWithTransaction:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  MZKeyValueStoreDeserializer *v9;
  NSMutableArray *v10;
  NSMutableArray *pendingDeserializations;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MZKeyValueStoreDeserializer;
  v9 = -[MZKeyValueStoreDeserializer init](&v17, "init");
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingDeserializations = v9->_pendingDeserializations;
    v9->_pendingDeserializations = v10;

    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v9->_serverResponse, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("status")));
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "integerValue");
      v9->_status = (int64_t)v14;
      if (v14 == (id)1197)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("retry-seconds")));
        v9->_retrySeconds = (unint64_t)objc_msgSend(v15, "unsignedIntegerValue");

      }
    }
    else
    {
      v9->_status = -1;
    }

  }
  return v9;
}

- (void)deserialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id obj;
  _QWORD v45[5];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];

  self->_isDirty = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer serverResponse](self, "serverResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("values")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer serverResponse](self, "serverResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("domain-version")));
  v7 = objc_opt_class(NSString);
  v8 = &selRef_shareImageProvider;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0 && (objc_opt_respondsToSelector(v6, "stringValue") & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

    v6 = (void *)v9;
  }

  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "valueForKey:", CFSTR("key")));
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v13);
  }

  -[MZKeyValueStoreDeserializer setPendingDeserializations:](self, "setPendingDeserializations:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "processor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  objc_msgSend(v18, "transaction:willProcessResponseWithDomainVersion:", v19, v6);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (!v21)
  {

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "processor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
    objc_msgSend(v39, "transaction:didProcessResponseWithDomainVersion:", v40, v6);

LABEL_24:
    -[MZKeyValueStoreDeserializer _delegateOperationDidFinish](self, "_delegateOperationDidFinish");
    goto LABEL_25;
  }
  v43 = v6;
  obj = v20;
  v42 = v10;
  v22 = *(_QWORD *)v48;
  v41 = v21;
  v23 = v21;
  do
  {
    v24 = 0;
    v25 = v8[247];
    do
    {
      if (*(_QWORD *)v48 != v22)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("key"), v41, v42));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("version")));
      v29 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0 && (objc_opt_respondsToSelector(v28, v25) & 1) != 0)
      {
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringValue"));

        v28 = (void *)v30;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("value")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "MZDataByInflatingWithGZip"));
      v33 = -[MZKeyValueStoreDeserializer versionMismatch](self, "versionMismatch");
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100090074;
      v45[3] = &unk_1004A8A78;
      v45[4] = self;
      v46 = v27;
      v34 = v27;
      -[MZKeyValueStoreDeserializer mergeData:forKey:version:mismatch:finishedBlock:](self, "mergeData:forKey:version:mismatch:finishedBlock:", v32, v34, v28, v33, v45);

      v24 = (char *)v24 + 1;
    }
    while (v23 != v24);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    v8 = &selRef_shareImageProvider;
  }
  while (v23);
  v20 = obj;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "processor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v6 = v43;
  objc_msgSend(v36, "transaction:didProcessResponseWithDomainVersion:", v37, v43);

  v10 = v42;
  if (!v41)
    goto LABEL_24;
LABEL_25:

}

- (void)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 finishedBlock:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  _DWORD v26[2];
  __int16 v27;
  _BOOL4 v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = (void *)objc_opt_class(self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
  v18 = objc_msgSend(v16, "responseTypeForTransaction:withData:forKey:mismatch:", v17, v12, v13, v8);

  switch((unint64_t)v18)
  {
    case 0uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "processor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      objc_msgSend(v21, "successfulGetTransaction:withData:forKey:version:finishedBlock:", v22, v12, v13, v14, v15);
      goto LABEL_5;
    case 1uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "processor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      objc_msgSend(v21, "successfulSetTransaction:withData:forKey:version:finishedBlock:", v22, v12, v13, v14, v15);
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "processor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
      objc_msgSend(v21, "conflictForSetTransaction:withData:forKey:version:finishedBlock:", v22, v12, v13, v14, v15);
LABEL_5:

      break;
    case 4uLL:
      v23 = _MTLogCategoryCloudSync(v19);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](self, "transaction"));
        v26[0] = 67109376;
        v26[1] = objc_msgSend(v25, "type");
        v27 = 1024;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Unacceptable combination of transaction type (%d) and mismatch (%d). Shouldn't reach this branch.", (uint8_t *)v26, 0xEu);

      }
      v15[2](v15, 0);
      break;
    default:
      break;
  }

}

+ (unint64_t)responseTypeForTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 mismatch:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v19;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = objc_msgSend(v12, "type");
  v14 = objc_msgSend(v12, "type");
  v15 = objc_msgSend(v12, "type");

  if (v14 != 2 || v6)
  {
    v17 = 4;
    if (v15 == 2 && v6)
      v17 = 2;
  }
  else
  {
    v16 = objc_msgSend((id)objc_opt_class(a1), "validateDataFromSuccessfulSetTransaction:forKey:", v10, v11);
    v17 = 3;
    if (v16)
      v17 = 1;
  }
  if (v13 != 1 || v6)
    v19 = v17;
  else
    v19 = 0;

  return v19;
}

+ (BOOL)validateDataFromSuccessfulSetTransaction:(id)a3 forKey:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = objc_msgSend(a3, "length");
  v5 = v4;
  if (v4)
  {
    v6 = _MTLogCategoryCloudSync(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Responses to successful SET transactions with mismatch=NO shouldn't return any data", v9, 2u);
    }

  }
  return v5 == 0;
}

- (void)finishedDeserializationForKey:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self->_pendingDeserializations;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer pendingDeserializations](self, "pendingDeserializations"));
  objc_msgSend(v5, "removeObjectIdenticalTo:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer pendingDeserializations](self, "pendingDeserializations"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[MZKeyValueStoreDeserializer _delegateOperationDidFinish](self, "_delegateOperationDidFinish");
  objc_sync_exit(v4);

}

- (void)_delegateOperationDidFinish
{
  MZKeyValueStoreDeserializer *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  MZKeyValueStoreDeserializer *v7;

  v7 = self;
  if (!-[MZKeyValueStoreDeserializer versionMismatch](v7, "versionMismatch"))
  {
    v5 = 0;
LABEL_9:
    v2 = v7;
    goto LABEL_10;
  }
  v2 = v7;
  if (v7->_isDirty)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](v7, "transaction"));
    if (objc_msgSend(v3, "type") == 2)
    {
      v5 = 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer transaction](v7, "transaction"));
      v5 = objc_msgSend(v4, "type") == 3;

    }
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer delegate](v2, "delegate"));
  objc_msgSend(v6, "deserializeOperationDidFinish:shouldReschedule:", v7, v5);

}

- (BOOL)unsupportedClient
{
  return self->_status == 1101;
}

- (BOOL)authenticationError
{
  return self->_status == -4;
}

- (BOOL)validationError
{
  return self->_status == -2;
}

- (BOOL)genericError
{
  return self->_status == -3;
}

- (BOOL)success
{
  return self->_status == 0;
}

- (BOOL)versionMismatch
{
  return self->_status == 1198;
}

- (NSError)requestError
{
  id v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  if (-[MZKeyValueStoreDeserializer success](self, "success"))
  {
    v3 = 0;
  }
  else
  {
    v4 = &qword_1004A88B8;
    do
    {
      v6 = *v4;
      v4 += 4;
      v5 = v6;
    }
    while (v6 != -9999 && v5 != self->_status);
    v8 = *(v4 - 2);
    if (*((_BYTE *)v4 - 8))
      v9 = CFSTR(" Please enable logging and file a bug.");
    else
      v9 = &stru_1004C6D40;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (status = %d)%@"), v8, self->_status, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0));
    v3 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MZBookkeeperRequestErrorDomain"), self->_status, v11);

  }
  return (NSError *)v3;
}

- (BOOL)hasBackoff
{
  return -[MZKeyValueStoreDeserializer retrySeconds](self, "retrySeconds") != 0;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (MZKeyValueStoreController)keyValueStoreController
{
  return self->_keyValueStoreController;
}

- (void)setKeyValueStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStoreController, a3);
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverResponse, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)retrySeconds
{
  return self->_retrySeconds;
}

- (MZKeyValueStoreDeserializeOperationDelegate)delegate
{
  return (MZKeyValueStoreDeserializeOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)pendingDeserializations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingDeserializations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeserializations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyValueStoreController, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
