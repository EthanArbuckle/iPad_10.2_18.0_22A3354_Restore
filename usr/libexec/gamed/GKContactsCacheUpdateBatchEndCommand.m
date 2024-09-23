@implementation GKContactsCacheUpdateBatchEndCommand

- (void)executeWithHandles:(id)a3 context:(id)a4
{
  -[GKContactsCacheUpdateBatchEndCommand addSyncedHandlesToIDSCache:withContext:](self, "addSyncedHandlesToIDSCache:withContext:", a3, a4);
}

- (void)addSyncedHandlesToIDSCache:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  GKCDIDSInfo *v16;
  void *v17;
  GKCDIDSInfo *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v29 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo _gkObjectsMatchingHandles:withContext:](GKCDIDSInfo, "_gkObjectsMatchingHandles:withContext:", v5, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_gkMapDictionaryWithKeyPath:", CFSTR("handle")));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v14, v28));
          if (!v15)
          {
            v16 = [GKCDIDSInfo alloc];
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDIDSInfo entity](GKCDIDSInfo, "entity"));
            v18 = -[GKCDIDSInfo initWithEntity:insertIntoManagedObjectContext:](v16, "initWithEntity:insertIntoManagedObjectContext:", v17, v29);

            -[GKCDIDSInfo _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:](v18, "_gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:", v14, 0, 0, 0, 0xFFFFFFFFLL);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }

    v5 = v28;
    v6 = v29;
  }
  else
  {
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(0);
    v20 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1000D1D0C(v20, v21, v22, v23, v24, v25, v26, v27);
  }

}

@end
