@implementation DMDEngineSetDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  DMDEngineSetDeclarationsOperation *v58;
  void *v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:", v6));

  v72 = 0;
  v60 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v7, &v72));
  v9 = v72;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i), "setFailed:", 0);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "organizationIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:", v16));

  v67 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "execute:", &v67));
  v19 = v67;

  if (v18)
  {
    v59 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "declarations"));
    v58 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "organizationIdentifier"));
    v66 = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata declarationsWithDictionaries:organizationIdentifier:context:error:](DMDDeclarationPayloadMetadata, "declarationsWithDictionaries:organizationIdentifier:context:error:", v22, v24, v60, &v66));
    v57 = v66;

    v26 = objc_msgSend(v25, "mutableCopy");
    v28 = DMFConfigurationEngineLog(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = v29;
    if (v26)
    {
      v54 = v17;
      v55 = v10;
      v56 = v7;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](v58, "request"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "organizationIdentifier"));
        *(_DWORD *)buf = 138543362;
        v75 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Start set declarations for %{public}@", buf, 0xCu);

      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v33 = v59;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(_QWORD *)v63 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v38, "setAvailable:", 0, v54);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v39));

            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "serverHash"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "serverHash"));
            v43 = objc_msgSend(v41, "isEqualToString:", v42);

            if (v43)
            {
              v45 = DMFConfigurationEngineLog(v44);
              v46 = objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v75 = v40;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Declaration already present, skipping: %{public}@", buf, 0xCu);
              }

              objc_msgSend(v60, "deleteObject:", v40);
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
              objc_msgSend(v26, "removeObjectForKey:", v47);

              objc_msgSend(v38, "setAvailable:", 1);
            }

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        }
        while (v35);
      }

      v61 = v57;
      v48 = objc_msgSend(v60, "save:", &v61);
      v19 = v61;

      if ((v48 & 1) != 0)
      {
        -[DMDEngineSetDeclarationsOperation setResultObject:](v58, "setResultObject:", 0);
        v10 = v55;
        v7 = v56;
      }
      else
      {
        v52 = DMFConfigurationEngineLog(v49);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        v10 = v55;
        v7 = v56;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_100076D30(v19);

        -[DMDEngineSetDeclarationsOperation setError:](v58, "setError:", v19);
      }
      v17 = v54;
    }
    else
    {
      v19 = v57;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_100076CB4(v57);

      -[DMDEngineSetDeclarationsOperation setError:](v58, "setError:", v57);
    }
    v18 = v59;

  }
  else
  {
    v50 = DMFConfigurationEngineLog(v20);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_100076C38(v19);

    -[DMDEngineSetDeclarationsOperation setError:](self, "setError:", v19);
  }

}

- (DMFSetDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
