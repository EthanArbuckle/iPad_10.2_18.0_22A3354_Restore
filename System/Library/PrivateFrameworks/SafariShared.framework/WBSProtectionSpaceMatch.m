@implementation WBSProtectionSpaceMatch

- (WBSProtectionSpaceMatch)initWithProtectionSpace:(id)a3 credentials:(id)a4 defaultCredential:(id)a5 matchLevel:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  WBSProtectionSpaceMatch *v14;
  WBSProtectionSpaceMatch *v15;
  uint64_t v16;
  NSDictionary *credentials;
  WBSProtectionSpaceMatch *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSProtectionSpaceMatch;
  v14 = -[WBSProtectionSpaceMatch init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_protectionSpace, a3);
    v16 = objc_msgSend(v12, "copy");
    credentials = v15->_credentials;
    v15->_credentials = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_defaultCredential, a5);
    v15->_matchLevel = a6;
    v18 = v15;
  }

  return v15;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; protection space = %@; _matchLevel = %ld >"),
    v5,
    self,
    self->_protectionSpace,
    self->_matchLevel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSDictionary)credentials
{
  return self->_credentials;
}

- (NSURLCredential)defaultCredential
{
  return self->_defaultCredential;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCredential, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
}

@end
