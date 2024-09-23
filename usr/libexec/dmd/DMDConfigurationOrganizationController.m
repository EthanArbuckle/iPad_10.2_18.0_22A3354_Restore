@implementation DMDConfigurationOrganizationController

- (DMDConfigurationOrganizationController)initWithOrganization:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  DMDConfigurationOrganizationController *v8;
  uint64_t v9;
  NSString *identifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *persistentConfigurationSourceControllersByIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *ephemeralConfigurationSourceControllersByIdentifier;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMDConfigurationOrganizationController;
  v8 = -[DMDConfigurationOrganizationController init](&v16, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = objc_opt_new(NSMutableDictionary);
    persistentConfigurationSourceControllersByIdentifier = v8->_persistentConfigurationSourceControllersByIdentifier;
    v8->_persistentConfigurationSourceControllersByIdentifier = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    ephemeralConfigurationSourceControllersByIdentifier = v8->_ephemeralConfigurationSourceControllersByIdentifier;
    v8->_ephemeralConfigurationSourceControllersByIdentifier = v13;

    -[DMDConfigurationOrganizationController updateWithOrganization:](v8, "updateWithOrganization:", v6);
  }

  return v8;
}

- (void)updateWithOrganization:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  DMDConfigurationSourceController *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = NSStringFromSelector(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationOrganizationController.m"), 44, CFSTR("%@ must be called from the main thread"), v34);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationOrganizationController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.identifier isEqualToString:organization.identifier]"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  -[DMDConfigurationOrganizationController setDisplayName:](self, "setDisplayName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  -[DMDConfigurationOrganizationController setType:](self, "setType:", v10);

  v36 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentConfigurationSources"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("identifier")));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "containsObject:", v19) & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
          objc_msgSend(v20, "removeObjectForKey:", v19);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v16);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
        v29 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v28));

        if (v29)
          -[DMDConfigurationSourceController updateWithConfigurationSource:](v29, "updateWithConfigurationSource:", v26);
        else
          v29 = -[DMDConfigurationSourceController initWithConfigurationSource:delegate:]([DMDConfigurationSourceController alloc], "initWithConfigurationSource:delegate:", v26, self);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v23);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v7;

  v7 = CFSTR("organization");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (DMFConfigurationOrganization)organization
{
  DMFConfigurationOrganization *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(DMFConfigurationOrganization);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](self, "identifier"));
  -[DMFConfigurationOrganization setIdentifier:](v3, "setIdentifier:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController displayName](self, "displayName"));
  -[DMFConfigurationOrganization setDisplayName:](v3, "setDisplayName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController type](self, "type"));
  -[DMFConfigurationOrganization setType:](v3, "setType:", v6);

  v7 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController configurationSourceControllers](self, "configurationSourceControllers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "configurationSource"));
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[DMFConfigurationOrganization setRegisteredConfigurationSources:](v3, "setRegisteredConfigurationSources:", v7);
  return v3;
}

- (NSArray)configurationSourceControllers
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSources](self, "persistentConfigurationSources"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSources](self, "ephemeralConfigurationSources"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  v6 = -[NSMutableArray copy](v3, "copy");
  return (NSArray *)v6;
}

- (NSArray)persistentConfigurationSources
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSArray)ephemeralConfigurationSources
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier](self, "ephemeralConfigurationSourceControllersByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (id)configurationSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier](self, "ephemeralConfigurationSourceControllersByIdentifier"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v4));

  }
  return v8;
}

- (id)registerConfigurationSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DMDConfigurationSourceController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DMDConfigurationSourceController *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier](self, "persistentConfigurationSourceControllersByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    -[DMDConfigurationSourceController updateWithConfigurationSource:](v7, "updateWithConfigurationSource:", v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier](self, "ephemeralConfigurationSourceControllersByIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

    if (v7)
      -[DMDConfigurationSourceController updateWithConfigurationSource:](v7, "updateWithConfigurationSource:", v4);
    else
      v7 = -[DMDConfigurationSourceController initWithConfigurationSource:delegate:]([DMDConfigurationSourceController alloc], "initWithConfigurationSource:delegate:", v4, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier](self, "ephemeralConfigurationSourceControllersByIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

  }
  v12 = v7;

  return v12;
}

- (void)unregisterConfigurationSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier](self, "ephemeralConfigurationSourceControllersByIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
    objc_msgSend(v11, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:", v6, v7);

  }
  else
  {
    v12 = DMFConfigurationEngineLog(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100073F50(self, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "configurationSourceController:fetchEventsWithCompletionHandler:");

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
    objc_msgSend(v11, "configurationSourceController:fetchEventsWithCompletionHandler:", v6, v7);

  }
  else
  {
    v12 = DMFConfigurationEngineLog(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100073F50(self, "configurationSourceController:fetchEventsWithCompletionHandler:");

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

- (void)resolveAssetWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController persistentConfigurationSources](self, "persistentConfigurationSources"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController ephemeralConfigurationSources](self, "ephemeralConfigurationSources"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (!v6)
    {
      v8 = DMFErrorWithCodeAndUserInfo(4003, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v9, "assetResolutionFailedWithError:", v6);
      goto LABEL_5;
    }
  }
  objc_msgSend(v6, "resolveAssetWithContext:", v9);
LABEL_5:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (DMDConfigurationOrganizationControllerDelegate)delegate
{
  return (DMDConfigurationOrganizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)persistentConfigurationSourceControllersByIdentifier
{
  return self->_persistentConfigurationSourceControllersByIdentifier;
}

- (void)setPersistentConfigurationSourceControllersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_persistentConfigurationSourceControllersByIdentifier, a3);
}

- (NSMutableDictionary)ephemeralConfigurationSourceControllersByIdentifier
{
  return self->_ephemeralConfigurationSourceControllersByIdentifier;
}

- (void)setEphemeralConfigurationSourceControllersByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralConfigurationSourceControllersByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralConfigurationSourceControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentConfigurationSourceControllersByIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
