@implementation SiriPunchoutRequest

- (SiriPunchoutRequest)init
{
  SiriPunchoutRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriPunchoutRequest;
  result = -[SiriPunchoutRequest init](&v3, sel_init);
  if (result)
    result->_punchoutStyle = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SiriPunchoutRequest *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SiriPunchoutRequest);
  -[SiriPunchoutRequest bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPunchoutRequest setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  -[SiriPunchoutRequest url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPunchoutRequest setUrl:](v4, "setUrl:", v6);

  -[SiriPunchoutRequest setPunchoutStyle:](v4, "setPunchoutStyle:", -[SiriPunchoutRequest punchoutStyle](self, "punchoutStyle"));
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)punchoutStyle
{
  return self->_punchoutStyle;
}

- (void)setPunchoutStyle:(int64_t)a3
{
  self->_punchoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
