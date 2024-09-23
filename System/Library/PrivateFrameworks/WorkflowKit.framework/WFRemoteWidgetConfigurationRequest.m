@implementation WFRemoteWidgetConfigurationRequest

- (WFRemoteWidgetConfigurationRequest)initWithRequestType:(int64_t)a3 intent:(id)a4 actionIdentifier:(id)a5 serializedParameters:(id)a6 parameterName:(id)a7 searchTerm:(id)a8
{
  id v15;
  id v16;
  id v17;
  WFRemoteWidgetConfigurationRequest *v18;
  WFRemoteWidgetConfigurationRequest *v19;
  WFRemoteWidgetConfigurationRequest *v20;
  void *v22;
  id v24;
  id v25;
  objc_super v26;

  v15 = a4;
  v25 = a5;
  v24 = a6;
  v16 = a7;
  v17 = a8;
  if ((unint64_t)a3 <= 1 && !v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteWidgetConfigurationRequest.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

  }
  v26.receiver = self;
  v26.super_class = (Class)WFRemoteWidgetConfigurationRequest;
  v18 = -[WFRemoteWidgetConfigurationRequest init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_requestType = a3;
    objc_storeStrong((id *)&v18->_intent, a4);
    objc_storeStrong((id *)&v19->_actionIdentifier, a5);
    objc_storeStrong((id *)&v19->_serializedParameters, a6);
    objc_storeStrong((id *)&v19->_parameterName, a7);
    objc_storeStrong((id *)&v19->_searchTerm, a8);
    v20 = v19;
  }

  return v19;
}

- (Class)responseClass
{
  -[WFRemoteWidgetConfigurationRequest requestType](self, "requestType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)requestTypeDescription
{
  unint64_t v2;

  v2 = -[WFRemoteWidgetConfigurationRequest requestType](self, "requestType");
  if (v2 > 4)
    return CFSTR("Undefined");
  else
    return off_1E7AEF0B0[v2];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFRemoteWidgetConfigurationRequest requestTypeDescription](self, "requestTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Request type: %@, response class: %@"), v4, -[WFRemoteWidgetConfigurationRequest responseClass](self, "responseClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t requestType;
  void *v5;
  id v6;

  requestType = self->_requestType;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", requestType, CFSTR("requestType"));
  INIntentWithTypedIntent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("intent"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serializedParameters, CFSTR("serializedParameters"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_parameterName, CFSTR("parameterName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_searchTerm, CFSTR("searchTerm"));

}

- (WFRemoteWidgetConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v5 = -[WFRemoteWidgetConfigurationRequest init](self, "init");
  if (v5)
  {
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INTypedIntentWithIntent();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("serializedParameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchTerm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:](v5, "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", v20, v19, v7, v15, v16, v17);

  }
  return v5;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (id)localizedIntentRequestWithIntent:(id)a3
{
  id v3;
  WFRemoteWidgetConfigurationRequest *v4;

  v3 = a3;
  v4 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:]([WFRemoteWidgetConfigurationRequest alloc], "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", 0, v3, 0, 0, 0, 0);

  return v4;
}

+ (id)optionsForParameterRequestWithIntent:(id)a3 parameterName:(id)a4 searchTerm:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFRemoteWidgetConfigurationRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:]([WFRemoteWidgetConfigurationRequest alloc], "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", 1, v9, 0, 0, v8, v7);

  return v10;
}

+ (id)lnActionMetadataRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v5;
  id v6;
  WFRemoteWidgetConfigurationRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:]([WFRemoteWidgetConfigurationRequest alloc], "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", 2, 0, v6, v5, 0, 0);

  return v7;
}

+ (id)defaultLNOptionForParameterRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFRemoteWidgetConfigurationRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:]([WFRemoteWidgetConfigurationRequest alloc], "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", 3, 0, v9, v8, v7, 0);

  return v10;
}

+ (id)lnOptionsForParameterRequesttWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5 searchTerm:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  WFRemoteWidgetConfigurationRequest *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[WFRemoteWidgetConfigurationRequest initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:]([WFRemoteWidgetConfigurationRequest alloc], "initWithRequestType:intent:actionIdentifier:serializedParameters:parameterName:searchTerm:", 4, 0, v12, v11, v10, v9);

  return v13;
}

+ (id)fromSecureData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "bs_secureDecodedFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
