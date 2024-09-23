@implementation SSUIShowScreenshotServiceRequest

+ (id)entitlement
{
  return SSUIShowScreenshotUIEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUIShowScreenshotServiceRequest;
  v4 = a3;
  -[SSUIServiceRequest encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[SSUIShowScreenshotServiceRequest options](self, "options", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSUIServiceRequestOptions"));

}

- (SSUIShowScreenshotServiceRequest)initWithBSXPCCoder:(id)a3
{
  id v3;
  SSUIShowScreenshotServiceRequest *v4;
  uint64_t v5;
  SSUIServiceOptions *options;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSUIShowScreenshotServiceRequest;
  v3 = a3;
  v4 = -[SSUIServiceRequest initWithBSXPCCoder:](&v8, sel_initWithBSXPCCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIServiceRequestOptions"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  options = v4->_options;
  v4->_options = (SSUIServiceOptions *)v5;

  return v4;
}

- (SSUIServiceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
