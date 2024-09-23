@implementation DMDEngineDeactivateConfigurationOrganizationOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDeactivateConfigurationOrganizationOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", v6));

  v29 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "execute:", &v29));
  v9 = v29;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v11 = v10;
    if (v10)
    {
      v23 = v4;
      objc_msgSend(v10, "setActive:", 0);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloadMetadatas"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "setAvailable:", 0);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v14);
      }

      v24 = v9;
      v4 = v23;
      v17 = objc_msgSend(v23, "save:", &v24);
      v18 = v24;

      if ((v17 & 1) != 0)
        -[DMDEngineDeactivateConfigurationOrganizationOperation setResultObject:](self, "setResultObject:", 0);
      else
        -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v18);
      v9 = v18;
    }
    else
    {
      v31 = DMFConfigurationOrganizationIdentifierErrorKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
      v32 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v21 = DMFErrorWithCodeAndUserInfo(4002, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v22);

    }
  }
  else
  {
    -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v9);
  }

}

- (DMFDeactivateConfigurationOrganizationRequest)request
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
