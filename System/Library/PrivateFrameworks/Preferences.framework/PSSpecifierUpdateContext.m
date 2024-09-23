@implementation PSSpecifierUpdateContext

+ (id)context
{
  return (id)objc_msgSend(a1, "contextWithUserInfo:", 0);
}

+ (PSSpecifierUpdateContext)contextWithUserInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUserInfo:", v3);

  return (PSSpecifierUpdateContext *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAnimated:", self->_animated);
  objc_msgSend(v4, "setUpdateModelOnly:", self->_updateModelOnly);
  objc_msgSend(v4, "setUserInfo:", self->_userInfo);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifierUpdateContext;
  -[PSSpecifierUpdateContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ animated: %d, updateModelOnly: %d, userInfo: %@"), v4, self->_animated, self->_updateModelOnly, self->_userInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)updateModelOnly
{
  return self->_updateModelOnly;
}

- (void)setUpdateModelOnly:(BOOL)a3
{
  self->_updateModelOnly = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
