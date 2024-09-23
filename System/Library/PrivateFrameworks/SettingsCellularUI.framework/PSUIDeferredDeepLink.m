@implementation PSUIDeferredDeepLink

- (PSUIDeferredDeepLink)initWithSpecifierID:(id)a3 resourceDictionary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSUIDeferredDeepLink *v11;
  PSUIDeferredDeepLink *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUIDeferredDeepLink;
  v11 = -[PSUIDeferredDeepLink init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PSUIDeferredDeepLink setSpecifierID:](v11, "setSpecifierID:", v8);
    -[PSUIDeferredDeepLink setResourceDictionary:](v12, "setResourceDictionary:", v9);
    -[PSUIDeferredDeepLink setCompletion:](v12, "setCompletion:", v10);
  }

  return v12;
}

- (NSString)specifierID
{
  return self->_specifierID;
}

- (void)setSpecifierID:(id)a3
{
  objc_storeStrong((id *)&self->_specifierID, a3);
}

- (NSDictionary)resourceDictionary
{
  return self->_resourceDictionary;
}

- (void)setResourceDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_resourceDictionary, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_resourceDictionary, 0);
  objc_storeStrong((id *)&self->_specifierID, 0);
}

@end
