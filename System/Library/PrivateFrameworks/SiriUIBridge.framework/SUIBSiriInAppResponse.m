@implementation SUIBSiriInAppResponse

- (SUIBSiriInAppResponse)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBSiriInAppResponseMutation *);
  SUIBSiriInAppResponse *v5;
  SUIBSiriInAppResponse *v6;
  SUIBSiriInAppResponseMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  objc_super v12;

  v4 = (void (**)(id, SUIBSiriInAppResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBSiriInAppResponse;
  v5 = -[SUIBSiriInAppResponse init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBSiriInAppResponseMutation);
    v4[2](v4, v7);
    -[SUIBSiriInAppResponseMutation bundleIdentifier](v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v9;

  }
  return v6;
}

- (SUIBSiriInAppResponse)init
{
  return -[SUIBSiriInAppResponse initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBSiriInAppResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SUIBSiriInAppResponse *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBSiriInAppResponse::bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__SUIBSiriInAppResponse_initWithCoder___block_invoke;
  v9[3] = &unk_2518A44F0;
  v10 = v5;
  v6 = v5;
  v7 = -[SUIBSiriInAppResponse initWithBuilder:](self, "initWithBuilder:", v9);

  return v7;
}

uint64_t __39__SUIBSiriInAppResponse_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("SUIBSiriInAppResponse::bundleIdentifier"));
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
