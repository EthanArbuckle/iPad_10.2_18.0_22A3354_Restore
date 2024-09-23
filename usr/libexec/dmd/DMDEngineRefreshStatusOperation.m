@implementation DMDEngineRefreshStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRefreshStatusOperation organizationIdentifier](self, "organizationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:](DMDPayloadMetadata, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:", v5, 0));

  v30 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "execute:", &v30));
  v8 = v30;
  v9 = v8;
  if (v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v14), "setNeedsRefreshStatus");
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }

    v25 = v9;
    v15 = objc_msgSend(v4, "save:", &v25);
    v16 = v25;

    if ((v15 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRefreshStatusOperation organizationIdentifier](self, "organizationIdentifier"));
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("DMDConfigurationSourceStatusDidChange"), v18);

      v20 = DMFConfigurationEngineLog(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        sub_100076B80(v10, self, v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
      -[DMDEngineRefreshStatusOperation setResultObject:](self, "setResultObject:", v22);

    }
    else
    {
      -[DMDEngineRefreshStatusOperation setError:](self, "setError:", v16);
    }
    v9 = v16;
  }
  else
  {
    v23 = DMFConfigurationEngineLog(v8);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100076AEC(self, v24);

    -[DMDEngineRefreshStatusOperation setError:](self, "setError:", v9);
  }

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_organizationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
