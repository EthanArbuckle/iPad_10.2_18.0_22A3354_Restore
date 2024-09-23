@implementation STUConcreteLSAppLink

- (STUConcreteLSAppLink)initWithAppLink:(id)a3
{
  id v5;
  STUConcreteLSAppLink *v6;
  STUConcreteLSAppLink *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUConcreteLSAppLink;
  v6 = -[STUConcreteLSAppLink init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appLink, a3);

  return v7;
}

- (BOOL)isEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteLSAppLink appLink](self, "appLink"));
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteLSAppLink appLink](self, "appLink"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "targetApplicationRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  return (NSString *)v4;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
}

@end
