@implementation WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse

- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithDefaultOption:(id)a3 error:(id)a4
{
  id v7;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v8;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v9;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse;
  v8 = -[WFRemoteWidgetConfigurationResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultOption, a3);
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
  -[WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse defaultOption](self, "defaultOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWidgetConfigurationResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("defaultOption: %@, error: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_defaultOption, CFSTR("defaultOption"));
}

- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v5;
  uint64_t v6;
  LNDynamicOption *defaultOption;
  WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse;
  v5 = -[WFRemoteWidgetConfigurationResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultOption"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultOption = v5->_defaultOption;
    v5->_defaultOption = (LNDynamicOption *)v6;

    v8 = v5;
  }

  return v5;
}

- (LNDynamicOption)defaultOption
{
  return self->_defaultOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOption, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
