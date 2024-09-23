@implementation WRWidgetRendererInitializationPayload

- (WRWidgetRendererInitializationPayload)initWithExtensions:(id)a3 configurations:(id)a4 systemEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  WRWidgetRendererInitializationPayload *v11;
  uint64_t v12;
  NSSet *extensions;
  uint64_t v14;
  NSDictionary *configurations;
  uint64_t v16;
  NSData *systemEnvironment;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WRWidgetRendererInitializationPayload;
  v11 = -[WRWidgetRendererInitializationPayload init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    extensions = v11->_extensions;
    v11->_extensions = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    configurations = v11->_configurations;
    v11->_configurations = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    systemEnvironment = v11->_systemEnvironment;
    v11->_systemEnvironment = (NSData *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *extensions;
  id v5;

  extensions = self->_extensions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensions, CFSTR("extensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurations, CFSTR("configurations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemEnvironment, CFSTR("systemEnvironment"));

}

- (WRWidgetRendererInitializationPayload)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  WRWidgetRendererInitializationPayload *v16;
  WRWidgetRendererInitializationPayload *v17;
  id *p_isa;
  objc_super v20;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("extensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("configurations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemEnvironment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v9 && v14 && v15)
  {
    v20.receiver = self;
    v20.super_class = (Class)WRWidgetRendererInitializationPayload;
    v17 = -[WRWidgetRendererInitializationPayload init](&v20, sel_init);
    p_isa = (id *)&v17->super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_extensions, v9);
      objc_storeStrong(p_isa + 2, v14);
      objc_storeStrong(p_isa + 3, v15);
    }
    self = p_isa;
    v16 = self;
  }

  return v16;
}

- (NSSet)extensions
{
  return self->_extensions;
}

- (NSDictionary)configurations
{
  return self->_configurations;
}

- (NSData)systemEnvironment
{
  return self->_systemEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemEnvironment, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
