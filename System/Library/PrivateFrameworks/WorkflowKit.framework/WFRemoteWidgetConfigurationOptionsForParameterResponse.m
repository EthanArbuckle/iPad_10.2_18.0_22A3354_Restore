@implementation WFRemoteWidgetConfigurationOptionsForParameterResponse

- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithOptions:(id)a3 error:(id)a4
{
  id v7;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v8;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v9;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationOptionsForParameterResponse;
  v8 = -[WFRemoteWidgetConfigurationResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a3);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFRemoteWidgetConfigurationOptionsForParameterResponse options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[WFRemoteWidgetConfigurationOptionsForParameterResponse options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWidgetConfigurationResponse error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("options count: %ld, items: %@, error: %@"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_options, CFSTR("options"));
}

- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v5;
  uint64_t v6;
  INObjectCollection *options;
  WFRemoteWidgetConfigurationOptionsForParameterResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationOptionsForParameterResponse;
  v5 = -[WFRemoteWidgetConfigurationResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (INObjectCollection *)v6;

    v8 = v5;
  }

  return v5;
}

- (INObjectCollection)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
