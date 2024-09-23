@implementation WFRemoteWidgetConfigurationDefaultValueForParameterResponse

- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithDefaultValue:(id)a3 error:(id)a4
{
  id v7;
  WFRemoteWidgetConfigurationDefaultValueForParameterResponse *v8;
  WFRemoteWidgetConfigurationDefaultValueForParameterResponse *v9;
  WFRemoteWidgetConfigurationDefaultValueForParameterResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationDefaultValueForParameterResponse;
  v8 = -[WFRemoteWidgetConfigurationResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultValue, a3);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFRemoteWidgetConfigurationDefaultValueForParameterResponse defaultValue](self, "defaultValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWidgetConfigurationResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("defaultValue: %@, error: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
}

- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationDefaultValueForParameterResponse *v5;
  uint64_t v6;
  NSSecureCoding *defaultValue;
  WFRemoteWidgetConfigurationDefaultValueForParameterResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationDefaultValueForParameterResponse;
  v5 = -[WFRemoteWidgetConfigurationResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("defaultValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSSecureCoding *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSSecureCoding)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
