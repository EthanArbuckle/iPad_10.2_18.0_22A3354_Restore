@implementation WFHandoffRunRequest

- (WFHandoffRunRequest)initWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  NSString *actionIdentifier;
  NSDictionary *v16;
  NSDictionary *serializedParameters;
  NSDictionary *v18;
  NSDictionary *processedParameters;
  WFHandoffRunRequest *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10
    && (v22.receiver = self,
        v22.super_class = (Class)WFHandoffRunRequest,
        (self = -[WFHandoffRunRequest init](&v22, "init")) != 0))
  {
    v14 = (NSString *)objc_msgSend(v10, "copy");
    actionIdentifier = self->_actionIdentifier;
    self->_actionIdentifier = v14;

    v16 = (NSDictionary *)objc_msgSend(v12, "copy");
    serializedParameters = self->_serializedParameters;
    self->_serializedParameters = v16;

    v18 = (NSDictionary *)objc_msgSend(v13, "copy");
    processedParameters = self->_processedParameters;
    self->_processedParameters = v18;

    objc_storeStrong((id *)&self->_input, a4);
    self = self;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFHandoffRunRequest actionIdentifier](self, "actionIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFHandoffRunRequest input](self, "input"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("input"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFHandoffRunRequest serializedParameters](self, "serializedParameters"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serializedParameters"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[WFHandoffRunRequest processedParameters](self, "processedParameters"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("processedParameters"));

}

- (WFHandoffRunRequest)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFHandoffRunRequest *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("actionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(WFContentCollection), CFSTR("input"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("serializedParameters")))
  {
    v9 = objc_opt_class(NSString);
    v10 = objc_opt_class(NSNumber);
    v11 = objc_opt_class(NSArray);
    v12 = objc_opt_class(NSDictionary);
    v13 = objc_opt_class(NSDate);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(NSData), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("serializedParameters")));

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("processedParameters")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[WFParameterValueRegistry registeredValueClasses](WFParameterValueRegistry, "registeredValueClasses"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("processedParameters")));

  }
  else
  {
    v18 = 0;
  }
  v19 = -[WFHandoffRunRequest initWithActionIdentifier:input:serializedParameters:processedParameters:](self, "initWithActionIdentifier:input:serializedParameters:processedParameters:", v6, v8, v16, v18);

  return v19;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5
{
  return _objc_msgSend(a1, "handoffRunRequestWithActionIdentifier:input:serializedParameters:processedParameters:", a3, a4, a5, 0);
}

+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithActionIdentifier:input:serializedParameters:processedParameters:", v13, v12, v11, v10);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
