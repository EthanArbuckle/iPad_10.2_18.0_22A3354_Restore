@implementation DMDEngineFetchDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  id v41;
  void *v42;
  void *v43;
  DMDEngineFetchDeclarationsOperation *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  NSMutableDictionary *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation request](self, "request", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadIdentifiers"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloadIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier IN %@"), v6));

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:](DMDPayloadMetadata, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:", v8, v7));

  v64 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "execute:", &v64));
  v11 = v64;
  v12 = v11;
  if (v10)
  {
    v41 = v11;
    v42 = v9;
    v43 = v7;
    v44 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v40 = v10;
    obj = v10;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v61;
      v17 = DMFDeclarationPayloadIdentifierKey;
      v18 = DMFDeclarationPayloadTypeKey;
      v53 = DMFDeclarationStatusMessageStateKey;
      v45 = DMFDeclarationPayloadDataKey;
      v46 = DMFDeclarationPayloadTypeKey;
      v49 = v13;
      v50 = v4;
      v47 = DMFDeclarationPayloadIdentifierKey;
      v48 = *(_QWORD *)v61;
      do
      {
        v19 = 0;
        v51 = v15;
        do
        {
          if (*(_QWORD *)v61 != v16)
            objc_enumerationMutation(obj);
          v54 = v19;
          v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v19);
          v21 = objc_opt_new(NSMutableDictionary);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, v17);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "type"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v18);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateDictionary"));
          v55 = v21;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v24, v53);

          if (objc_msgSend(v4, "includePayloadContents"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "payload"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "payloadDictionary"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v26, v45);

          }
          if (objc_msgSend(v4, "includeInternalState"))
          {
            v27 = objc_opt_new(NSMutableDictionary);
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "descriptiveProperties"));
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v30; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v57 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKeyPath:", v33));
                  if (v34)
                  {
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v34, v33);
                  }
                  else
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v35, v33);

                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
              }
              while (v30);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v27, CFSTR("Debug"));
            v13 = v49;
            v4 = v50;
            v17 = v47;
            v16 = v48;
            v15 = v51;
            v18 = v46;
          }
          objc_msgSend(v13, "addObject:", v55);

          v19 = v54 + 1;
        }
        while ((id)(v54 + 1) != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v15);
    }

    objc_msgSend(v13, "sortUsingComparator:", &stru_1000BAEC8);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](v44, "completionHandler"));

    if (v36)
    {
      v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](v44, "completionHandler"));
      ((void (**)(_QWORD, void *, _QWORD))v37)[2](v37, v13, 0);

    }
    -[DMDEngineFetchDeclarationsOperation setResultObject:](v44, "setResultObject:", 0);

    v9 = v42;
    v7 = v43;
    v10 = v40;
    v12 = v41;
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](self, "completionHandler"));

    if (v38)
    {
      v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](self, "completionHandler"));
      ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v12);

    }
    -[DMDEngineFetchDeclarationsOperation setError:](self, "setError:", v12);
  }

}

- (DMFFetchDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
