@implementation DMDEngineCreateConfigurationOrganizationOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  DMDConfigurationOrganization *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineCreateConfigurationOrganizationOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationType"));
  v7 = DMFAllConfigurationOrganizationTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    if ((objc_msgSend(v6, "isEqualToString:", DMFConfigurationOrganizationTypeInternal) & 1) != 0)
    {
      v10 = 0;
      v11 = 1;
      goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationsOfType:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationsOfType:", v6));
    v36 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "execute:", &v36));
    v16 = v36;
    v10 = v16;
    if (v15)
    {
      v11 = objc_msgSend(v15, "count") == 0;

LABEL_7:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", v17));

      v35 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "execute:", &v35));
      v19 = v35;

      if (!v18)
      {
        v27 = DMFConfigurationEngineLog(v20);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_100075E38(v5, v19);

        -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v19);
        goto LABEL_19;
      }
      v21 = (DMDConfigurationOrganization *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
      if (!v21)
      {
        if (!v11)
        {
          v31 = DMFConfigurationEngineLog(0);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_100075EDC((uint64_t)v6, v32);

          v33 = DMFErrorWithCodeAndUserInfo(4006, 0);
          v21 = (DMDConfigurationOrganization *)objc_claimAutoreleasedReturnValue(v33);
          -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v21);
          goto LABEL_18;
        }
        v21 = -[DMDConfigurationOrganization initWithContext:]([DMDConfigurationOrganization alloc], "initWithContext:", v4);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationDisplayName"));
      -[DMDConfigurationOrganization setDisplayName:](v21, "setDisplayName:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));
      -[DMDConfigurationOrganization setIdentifier:](v21, "setIdentifier:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationType"));
      -[DMDConfigurationOrganization setType:](v21, "setType:", v24);

      -[DMDConfigurationOrganization setActive:](v21, "setActive:", 1);
      v34 = v19;
      v25 = objc_msgSend(v4, "save:", &v34);
      v26 = v34;

      if ((v25 & 1) != 0)
        -[DMDEngineCreateConfigurationOrganizationOperation setResultObject:](self, "setResultObject:", 0);
      else
        -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v26);
      v19 = v26;
LABEL_18:

LABEL_19:
      v10 = v19;
      goto LABEL_20;
    }
    v29 = DMFConfigurationEngineLog(v16);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100075F50((uint64_t)v6, v10);

    -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v10);
  }
  else
  {
    v37 = DMFInvalidParameterErrorKey;
    v38 = CFSTR("request.organizationType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v13 = DMFErrorWithCodeAndUserInfo(1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v14);

    v10 = 0;
  }
LABEL_20:

}

- (DMFCreateConfigurationOrganizationRequest)request
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
