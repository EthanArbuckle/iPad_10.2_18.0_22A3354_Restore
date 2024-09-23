@implementation WFSiriUserActivityRequest

- (WFSiriUserActivityRequest)initWithUserActivityData:(id)a3 andBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  WFSiriUserActivityRequest *v9;
  WFSiriUserActivityRequest *v10;
  WFSiriUserActivityRequest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFSiriUserActivityRequest;
  v9 = -[WFSiriActionRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivityData, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (WFSiriUserActivityRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriUserActivityRequest *v5;
  uint64_t v6;
  NSData *userActivityData;
  uint64_t v8;
  NSString *bundleIdentifier;
  WFSiriUserActivityRequest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriUserActivityRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
    v6 = objc_claimAutoreleasedReturnValue();
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;

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
  v7.super_class = (Class)WFSiriUserActivityRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFSiriUserActivityRequest userActivityData](self, "userActivityData", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userActivityData"));

  -[WFSiriUserActivityRequest bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

}

- (NSUserActivity)userActivity
{
  return (NSUserActivity *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", self->_userActivityData);
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
