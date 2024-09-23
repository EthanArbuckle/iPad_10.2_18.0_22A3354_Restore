@implementation WFHMServiceParameterState

- (WFHMServiceParameterState)initWithService:(id)a3 homeIdentifier:(id)a4
{
  id v8;
  id v9;
  WFHMServiceParameterState *v10;
  WFHMServiceParameterState *v11;
  uint64_t v12;
  NSDictionary *serializedService;
  WFHMServiceParameterState *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHMServiceParameterState.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFHMServiceParameterState;
  v10 = -[WFHMServiceParameterState init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeIdentifier, a4);
    objc_msgSend(v8, "serializedDictionaryRepresentation");
    v12 = objc_claimAutoreleasedReturnValue();
    serializedService = v11->_serializedService;
    v11->_serializedService = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_service, a3);
    v14 = v11;
  }

  return v11;
}

- (WFHMServiceParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  WFHMServiceParameterState *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSDictionary *serializedService;
  WFHMServiceParameterState *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFHMServiceParameterState;
  v7 = -[WFHMServiceParameterState init](&v14, sel_init);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v6;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HomeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&v7->_homeIdentifier, v9);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HomeService"));
      v10 = objc_claimAutoreleasedReturnValue();
      serializedService = v7->_serializedService;
      v7->_serializedService = (NSDictionary *)v10;

      v12 = v7;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[WFHMServiceParameterState homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("HomeIdentifier"));

  -[WFHMServiceParameterState serializedService](self, "serializedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFHMServiceParameterState serializedService](self, "serializedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("HomeService"));

  }
  return (WFPropertyListObject *)v3;
}

- (HMService)service
{
  HMService *service;
  void *v4;
  void *v5;
  void *v6;
  Class HMServiceClass;
  void *v8;
  HMService *v9;
  HMService *v10;
  HMService *v11;

  service = self->_service;
  if (!service)
  {
    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHMServiceParameterState homeIdentifier](self, "homeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v11 = 0;
      return v11;
    }
    if (self->_serializedService)
    {
      HMServiceClass = getHMServiceClass();
      -[WFHMServiceParameterState serializedService](self, "serializedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class serviceWithSerializedDictionaryRepresentation:home:](HMServiceClass, "serviceWithSerializedDictionaryRepresentation:home:", v8, v6);
      v9 = (HMService *)objc_claimAutoreleasedReturnValue();
      v10 = self->_service;
      self->_service = v9;

    }
    service = self->_service;
  }
  v11 = service;
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WFHMServiceParameterState *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = (WFHMServiceParameterState *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFHMServiceParameterState serializedService](v6, "serializedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHMServiceParameterState serializedService](self, "serializedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[WFHMServiceParameterState serializedService](v6, "serializedService"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[WFHMServiceParameterState serializedService](self, "serializedService"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        -[WFHMServiceParameterState homeIdentifier](v6, "homeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHMServiceParameterState homeIdentifier](self, "homeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v7 == v8)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        v9 = 0;
      }

      goto LABEL_10;
    }
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  v3 = (void *)objc_opt_new();
  -[WFHMServiceParameterState serializedService](self, "serializedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFHMServiceParameterState homeIdentifier](self, "homeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  v8 = objc_msgSend(v3, "finalize");
  return v8;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (NSDictionary)serializedService
{
  return self->_serializedService;
}

- (void)setSerializedService:(id)a3
{
  objc_storeStrong((id *)&self->_serializedService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedService, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
