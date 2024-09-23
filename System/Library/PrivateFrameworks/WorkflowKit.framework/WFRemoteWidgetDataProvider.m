@implementation WFRemoteWidgetDataProvider

- (WFRemoteWidgetDataProvider)init
{
  WFRemoteWidgetDataProvider *v2;
  uint64_t v3;
  WFRemoteWidgetConnection *remoteWidgetConnection;
  WFRemoteWidgetDataProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRemoteWidgetDataProvider;
  v2 = -[WFRemoteWidgetDataProvider init](&v7, sel_init);
  if (v2)
  {
    +[WFRemoteWidgetConnection startListeningForIncomingConfigurations](WFRemoteWidgetConnection, "startListeningForIncomingConfigurations");
    v3 = objc_claimAutoreleasedReturnValue();
    remoteWidgetConnection = v2->_remoteWidgetConnection;
    v2->_remoteWidgetConnection = (WFRemoteWidgetConnection *)v3;

    -[WFRemoteWidgetConnection setListenerDelegate:](v2->_remoteWidgetConnection, "setListenerDelegate:", v2);
    v5 = v2;
  }

  return v2;
}

- (void)remoteWidgetConnection:(id)a3 didReceiveData:(id)a4 responseHandler:(id)a5
{
  +[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:](WFRemoteWidgetDataProvider, "handleReceivedData:responseHandler:", a4, a5);
}

- (WFRemoteWidgetConnection)remoteWidgetConnection
{
  return self->_remoteWidgetConnection;
}

- (void)setRemoteWidgetConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remoteWidgetConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteWidgetConnection, 0);
}

+ (id)linkActionFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  WFLinkActionProvider *v6;
  void *v7;
  WFLinkActionProvider *v8;
  WFActionRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [WFLinkActionProvider alloc];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44200]), "initWithOptions:", 2);
  v8 = -[WFLinkActionProvider initWithMetadataProvider:](v6, "initWithMetadataProvider:", v7);

  v9 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v4, v5);
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionProvider createActionsForRequests:](v8, "createActionsForRequests:", v10);

  -[WFActionRequest result](v9, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v12;
    else
      v11 = 0;
  }
  v13 = v11;

  return v13;
}

+ (id)enumerationParameterWithKey:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__WFRemoteWidgetDataProvider_enumerationParameterWithKey_action___block_invoke;
  v10[3] = &unk_1E7AED778;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "if_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)handleReceivedData:(id)a3 responseHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  WFRemoteWidgetConfigurationLocalizedIntentResponse *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  WFIntentExecutor *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(id, void *);
  _QWORD v30[4];
  void (**v31)(id, void *);
  _QWORD v32[4];
  void (**v33)(id, void *);
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  +[WFRemoteWidgetConfigurationRequest fromSecureData:](WFRemoteWidgetConfigurationRequest, "fromSecureData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getWFWidgetConfigurationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider received a request: %{public}@", buf, 0x16u);
  }

  switch(objc_msgSend(v6, "requestType"))
  {
    case 0:
      objc_msgSend(v6, "intent");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "languageCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setLanguageCode:", v10);
        v34 = 0;
        objc_msgSend(v9, "widgetPlistableRepresentationWithParameters:error:", v11, &v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v34;
        v14 = -[WFRemoteWidgetConfigurationLocalizedIntentResponse initWithLocalizedIntentRepresentation:languageCode:error:]([WFRemoteWidgetConfigurationLocalizedIntentResponse alloc], "initWithLocalizedIntentRepresentation:languageCode:error:", v12, v10, v13);
        getWFWidgetConfigurationLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
          v37 = 2114;
          v38 = v14;
          _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", buf, 0x16u);
        }

        -[WFRemoteWidgetConfigurationResponse secureData](v14, "secureData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, v16);

        goto LABEL_20;
      }
      getWFWidgetConfigurationLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_DWORD *)buf = 136315394;
      v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
      v37 = 2114;
      v38 = v6;
      v26 = "%s WFRemoteWidgetDataProvider received a nil intent. Unable to localize. Request: %{public}@";
      goto LABEL_26;
    case 1:
      objc_msgSend(v6, "intent");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v9 = (void *)v17;
        v18 = -[WFIntentExecutor initWithIntent:donateInteraction:groupIdentifier:requiresTrustCheck:]([WFIntentExecutor alloc], "initWithIntent:donateInteraction:groupIdentifier:requiresTrustCheck:", v17, 0, 0, 0);
        objc_msgSend(v6, "parameterName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "searchTerm");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke;
        v32[3] = &unk_1E7AF7790;
        v33 = v5;
        -[WFIntentExecutor getDynamicOptionsForParameterNamed:searchTerm:completionHandler:](v18, "getDynamicOptionsForParameterNamed:searchTerm:completionHandler:", v19, v20, v32);

LABEL_19:
      }
      else
      {
        getWFWidgetConfigurationLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
          v37 = 2114;
          v38 = v6;
          v26 = "%s WFRemoteWidgetDataProvider received a nil intent. Unable to provide dynamic options. Request: %{public}@";
LABEL_26:
          _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
        }
LABEL_27:

        v5[2](v5, 0);
        v9 = 0;
      }
LABEL_20:

LABEL_21:
      return;
    case 2:
      +[WFRemoteWidgetDataProvider linkActionFromRequest:](WFRemoteWidgetDataProvider, "linkActionFromRequest:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v18 = (WFIntentExecutor *)objc_claimAutoreleasedReturnValue();
      getWFWidgetConfigurationLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
        v37 = 2114;
        v38 = v18;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved metadata: %{public}@", buf, 0x16u);
      }

      v22 = -[WFRemoteWidgetConfigurationLNActionMetadataResponse initWithMetadata:error:]([WFRemoteWidgetConfigurationLNActionMetadataResponse alloc], "initWithMetadata:error:", v18, 0);
      getWFWidgetConfigurationLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]";
        v37 = 2114;
        v38 = v22;
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", buf, 0x16u);
      }

      -[WFRemoteWidgetConfigurationResponse secureData](v22, "secureData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v24);
      goto LABEL_17;
    case 3:
      objc_msgSend(v6, "parameterName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFRemoteWidgetDataProvider linkActionFromRequest:](WFRemoteWidgetDataProvider, "linkActionFromRequest:", v6);
      v18 = (WFIntentExecutor *)objc_claimAutoreleasedReturnValue();
      +[WFRemoteWidgetDataProvider enumerationParameterWithKey:action:](WFRemoteWidgetDataProvider, "enumerationParameterWithKey:action:", v9, v18);
      v22 = (WFRemoteWidgetConfigurationLNActionMetadataResponse *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_119;
      v30[3] = &unk_1E7AF6258;
      v31 = v5;
      -[WFIntentExecutor loadDefaultResultForEnumeration:completionHandler:](v18, "loadDefaultResultForEnumeration:completionHandler:", v22, v30);

      goto LABEL_18;
    case 4:
      objc_msgSend(v6, "parameterName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchTerm");
      v18 = (WFIntentExecutor *)objc_claimAutoreleasedReturnValue();
      +[WFRemoteWidgetDataProvider linkActionFromRequest:](WFRemoteWidgetDataProvider, "linkActionFromRequest:", v6);
      v22 = (WFRemoteWidgetConfigurationLNActionMetadataResponse *)objc_claimAutoreleasedReturnValue();
      +[WFRemoteWidgetDataProvider enumerationParameterWithKey:action:](WFRemoteWidgetDataProvider, "enumerationParameterWithKey:action:", v9, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_122;
      v28[3] = &unk_1E7AED7A0;
      v29 = v5;
      -[WFRemoteWidgetConfigurationLNActionMetadataResponse loadDynamicResultForEnumeration:searchTerm:completionHandler:](v22, "loadDynamicResultForEnumeration:searchTerm:completionHandler:", v24, v18, v28);

LABEL_17:
LABEL_18:

      goto LABEL_19;
    default:
      goto LABEL_21;
  }
}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v5;
  id v6;
  NSObject *v7;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFWidgetConfigurationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved the dynamic options: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v8 = -[WFRemoteWidgetConfigurationOptionsForParameterResponse initWithOptions:error:]([WFRemoteWidgetConfigurationOptionsForParameterResponse alloc], "initWithOptions:error:", v5, v6);
  getWFWidgetConfigurationLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[WFRemoteWidgetConfigurationResponse secureData](v8, "secureData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v5;
  id v6;
  NSObject *v7;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFWidgetConfigurationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved the default option: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v8 = -[WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse initWithDefaultOption:error:]([WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse alloc], "initWithDefaultOption:error:", v5, v6);
  getWFWidgetConfigurationLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[WFRemoteWidgetConfigurationResponse secureData](v8, "secureData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__WFRemoteWidgetDataProvider_handleReceivedData_responseHandler___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  WFRemoteWidgetConfigurationLNOptionsForParameterResponse *v5;
  id v6;
  NSObject *v7;
  WFRemoteWidgetConfigurationLNOptionsForParameterResponse *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  WFRemoteWidgetConfigurationLNOptionsForParameterResponse *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFWidgetConfigurationLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider retrieved dynamic options: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v8 = -[WFRemoteWidgetConfigurationLNOptionsForParameterResponse initWithResult:error:]([WFRemoteWidgetConfigurationLNOptionsForParameterResponse alloc], "initWithResult:error:", v5, v6);
  getWFWidgetConfigurationLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WFRemoteWidgetDataProvider handleReceivedData:responseHandler:]_block_invoke";
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s WFRemoteWidgetDataProvider is sending a response: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[WFRemoteWidgetConfigurationResponse secureData](v8, "secureData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65__WFRemoteWidgetDataProvider_enumerationParameterWithKey_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
