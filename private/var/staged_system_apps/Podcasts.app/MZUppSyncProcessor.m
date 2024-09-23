@implementation MZUppSyncProcessor

- (MZUppSyncProcessor)initWithStorageProviderDelegate:(id)a3
{
  id v4;
  MZUppSyncProcessor *v5;
  MZUppSyncProcessor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MZUppSyncProcessor;
  v5 = -[MZUppSyncProcessor init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[MZUppSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsFromDataSource:](v6, "setMetadataItemsFromDataSource:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsFromKVSStorage:](v6, "setMetadataItemsFromKVSStorage:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsToCommitToDataSource:](v6, "setMetadataItemsToCommitToDataSource:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setMetadataItemsToCommitToKVSStorage:](v6, "setMetadataItemsToCommitToKVSStorage:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MZUppSyncProcessor setReportedItemVersionForIdentifier:](v6, "setReportedItemVersionForIdentifier:", v11);

  }
  return v6;
}

- (int)mergeMetadataItemFromSetResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  double v15;
  double v16;
  double v17;
  uint64_t (*v18)(_QWORD *, uint64_t);
  double v19;
  double v20;
  double v21;
  _QWORD *v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  _QWORD v27[5];
  id v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  objc_msgSend(v7, "setNumMetadataItemsFromKVSStorage:", objc_msgSend(v8, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromDataSource](self, "metadataItemsFromDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000A427C;
  v27[3] = &unk_1004A9340;
  v27[4] = self;
  v12 = v4;
  v28 = v12;
  v13 = v11;
  v29 = v13;
  v14 = objc_retainBlock(v27);
  if (!v13)
    goto LABEL_5;
  objc_msgSend(v13, "timestamp");
  v16 = v15;
  objc_msgSend(v12, "timestamp");
  if (v16 > v17)
  {
    v18 = (uint64_t (*)(_QWORD *, uint64_t))v14[2];
LABEL_8:
    v22 = v14;
    v23 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v13, "timestamp");
  v20 = v19;
  objc_msgSend(v12, "timestamp");
  if (v20 >= v21)
  {
    v24 = objc_msgSend(v13, "isEqual:", v12);
    v18 = (uint64_t (*)(_QWORD *, uint64_t))v14[2];
    if (!v24)
      goto LABEL_8;
  }
  else
  {
LABEL_5:
    v18 = (uint64_t (*)(_QWORD *, uint64_t))v14[2];
  }
  v22 = v14;
  v23 = 2;
LABEL_9:
  v25 = v18(v22, v23);

  return v25;
}

- (void)mergeMetadataItemsFromGetResponse
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MZUppSyncProcessor *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromDataSource](self, "metadataItemsFromDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
  v48 = self;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](self, "metadataItemsToCommitToDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage"));
  v7 = _MTLogCategoryUPPSync(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v3;
    v62 = 2114;
    v63 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Merging local and remote items\nlocal items = %{public}@\nremote items = %{public}@", buf, 0x16u);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v15));

        if (!v16
          || (objc_msgSend(v14, "timestamp"), v18 = v17, objc_msgSend(v16, "timestamp"), v18 > v19)
          || (objc_msgSend(v14, "timestamp"), v21 = v20, objc_msgSend(v16, "timestamp"), v21 == v22)
          && (objc_msgSend(v14, "isEqual:", v16) & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifier"));
          objc_msgSend(v5, "setObject:forKey:", v14, v23);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "itemIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v30));

        if (!v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "itemIdentifier"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v32));

          if (!v33 || (objc_msgSend(v29, "timestamp"), v35 = v34, objc_msgSend(v33, "timestamp"), v35 > v36))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "itemIdentifier"));
            objc_msgSend(v49, "setObject:forKey:", v29, v37);

          }
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v26);
  }

  v40 = _MTLogCategoryUPPSync(v38, v39);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](v48, "metadataItemsToCommitToDataSource"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](v48, "metadataItemsToCommitToKVSStorage"));
    *(_DWORD *)buf = 138543618;
    v61 = v42;
    v62 = 2114;
    v63 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Merge result:\nmetadataItemsToCommitToDataSource = %{public}@\nmetadataItemsToCommitToKVSStorage = %{public}@", buf, 0x16u);

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](v48, "storageProvider"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToDataSource](v48, "metadataItemsToCommitToDataSource"));
  objc_msgSend(v44, "setNumMetadataItemsToCommitToDataSource:", objc_msgSend(v45, "count"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](v48, "storageProvider"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](v48, "metadataItemsToCommitToKVSStorage"));
  objc_msgSend(v46, "setNumMetadataItemsToCommitToKVSStorage:", objc_msgSend(v47, "count"));

}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  return 0;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
  *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyValueStorePayload"));
  return v11;
}

- (void)transaction:(id)a3 willProcessResponseWithDomainVersion:(id)a4
{
  id v5;

  if (a4)
  {
    -[MZUppSyncProcessor setResponseDomainVersion:](self, "setResponseDomainVersion:", a4);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor responseDomainVersion](self, "responseDomainVersion", a3));
    -[MZUppSyncProcessor setResponseDomainVersion:](self, "setResponseDomainVersion:", v5);

  }
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  v15 = objc_msgSend(v14, "wasCanceled");

  if (v15)
  {
    v13[2](v13, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:keyValueStorePayload:](MZUniversalPlaybackPositionMetadata, "metadataWithValuesItemIdentifier:keyValueStorePayload:", v11, v23));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemIdentifier"));
      objc_msgSend(v17, "setObject:forKey:", v16, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemIdentifier"));
      objc_msgSend(v19, "setObject:forKey:", v12, v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor metadataItemsFromKVSStorage](self, "metadataItemsFromKVSStorage"));
      objc_msgSend(v21, "setNumMetadataItemsFromKVSStorage:", objc_msgSend(v22, "count"));

    }
    v13[2](v13, 0);

  }
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v8, "wasCanceled");

  v9[2](v9, 0);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id v20;

  v20 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor storageProvider](self, "storageProvider"));
  v15 = objc_msgSend(v14, "wasCanceled");

  if (v15)
  {
    v13[2](v13, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MZUniversalPlaybackPositionMetadata metadataWithValuesItemIdentifier:keyValueStorePayload:](MZUniversalPlaybackPositionMetadata, "metadataWithValuesItemIdentifier:keyValueStorePayload:", v11, v20));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUppSyncProcessor reportedItemVersionForIdentifier](self, "reportedItemVersionForIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemIdentifier"));
      objc_msgSend(v17, "setObject:forKey:", v12, v18);

      v19 = -[MZUppSyncProcessor mergeMetadataItemFromSetResponse:](self, "mergeMetadataItemFromSetResponse:", v16) == 1;
    }
    else
    {
      v19 = 0;
    }
    v13[2](v13, v19);

  }
}

- (NSString)responseDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponseDomainVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)metadataItemsFromDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadataItemsFromDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)metadataItemsToCommitToDataSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadataItemsToCommitToDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)metadataItemsToCommitToKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetadataItemsToCommitToKVSStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)metadataItemsFromKVSStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadataItemsFromKVSStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)reportedItemVersionForIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReportedItemVersionForIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MZUppSyncProcessorStorageProviding)storageProvider
{
  return (MZUppSyncProcessorStorageProviding *)objc_loadWeakRetained((id *)&self->_storageProvider);
}

- (void)setStorageProvider:(id)a3
{
  objc_storeWeak((id *)&self->_storageProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_reportedItemVersionForIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromDataSource, 0);
  objc_storeStrong((id *)&self->_responseDomainVersion, 0);
}

@end
