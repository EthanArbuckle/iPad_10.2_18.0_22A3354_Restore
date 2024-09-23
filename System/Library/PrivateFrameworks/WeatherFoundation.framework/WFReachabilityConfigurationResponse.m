@implementation WFReachabilityConfigurationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFReachabilityConfigurationResponse)initWithCoder:(id)a3
{
  id v4;
  WFReachabilityConfigurationResponse *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFReachabilityConfigurationResponse;
  v5 = -[WFResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFReachabilityConfiguratiionReachabilityHostURLKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFReachabilityConfigurationResponse setReachabilityHostURL:](v5, "setReachabilityHostURL:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFReachabilityConfigurationResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFReachabilityConfigurationResponse reachabilityHostURL](self, "reachabilityHostURL", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFReachabilityConfiguratiionReachabilityHostURLKey"));

}

- (NWPathEvaluator)pathEvaluator
{
  void *v2;
  void *v3;

  -[WFReachabilityConfigurationResponse reachabilityHostURL](self, "reachabilityHostURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE07E8], "wf_pathEvaluatorForURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NWPathEvaluator *)v3;
}

- (NSURL)reachabilityHostURL
{
  return self->_reachabilityHostURL;
}

- (void)setReachabilityHostURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityHostURL, 0);
}

@end
