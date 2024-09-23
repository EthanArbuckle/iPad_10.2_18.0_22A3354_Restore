@implementation WFRemoteWidgetConfigurationResponse

- (WFRemoteWidgetConfigurationResponse)initWithError:(id)a3
{
  id v5;
  WFRemoteWidgetConfigurationResponse *v6;
  WFRemoteWidgetConfigurationResponse *v7;
  WFRemoteWidgetConfigurationResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationResponse;
  v6 = -[WFRemoteWidgetConfigurationResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (WFRemoteWidgetConfigurationResponse)initWithCoder:(id)a3
{
  id v4;
  WFRemoteWidgetConfigurationResponse *v5;
  uint64_t v6;
  NSError *error;

  v4 = a3;
  v5 = -[WFRemoteWidgetConfigurationResponse init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5 = -[WFRemoteWidgetConfigurationResponse initWithError:](v5, "initWithError:", v5->_error);
  }

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromSecureData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureDecodedFromData:withAdditionalClasses:", v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
