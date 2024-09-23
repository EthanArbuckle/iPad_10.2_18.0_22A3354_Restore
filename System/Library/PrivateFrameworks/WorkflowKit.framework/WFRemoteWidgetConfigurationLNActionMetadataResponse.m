@implementation WFRemoteWidgetConfigurationLNActionMetadataResponse

- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithMetadata:(id)a3 error:(id)a4
{
  id v7;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v8;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v9;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationLNActionMetadataResponse;
  v8 = -[WFRemoteWidgetConfigurationResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metadata, a3);
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
  -[WFRemoteWidgetConfigurationLNActionMetadataResponse metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteWidgetConfigurationResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("metadata: %@, error: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
}

- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v5;
  uint64_t v6;
  LNActionMetadata *metadata;
  WFRemoteWidgetConfigurationLNActionMetadataResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationLNActionMetadataResponse;
  v5 = -[WFRemoteWidgetConfigurationResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (LNActionMetadata *)v6;

    v8 = v5;
  }

  return v5;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
