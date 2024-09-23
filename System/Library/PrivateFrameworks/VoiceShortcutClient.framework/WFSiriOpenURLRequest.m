@implementation WFSiriOpenURLRequest

- (WFSiriOpenURLRequest)initWithURL:(id)a3 andBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  WFSiriOpenURLRequest *v9;
  WFSiriOpenURLRequest *v10;
  WFSiriOpenURLRequest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFSiriOpenURLRequest;
  v9 = -[WFSiriActionRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (WFSiriOpenURLRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriOpenURLRequest *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *bundleIdentifier;
  WFSiriOpenURLRequest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriOpenURLRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSiriOpenURLRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFSiriOpenURLRequest URL](self, "URL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[WFSiriOpenURLRequest bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
