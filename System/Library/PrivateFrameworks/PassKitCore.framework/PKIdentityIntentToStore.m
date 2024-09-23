@implementation PKIdentityIntentToStore

- (PKIdentityIntentToStore)initWithDIIdentityIntentToStore:(id)a3
{
  DIIdentityIntentToStore *v4;
  PKIdentityIntentToStore *v5;
  DIIdentityIntentToStore *wrapped;
  objc_super v8;

  v4 = (DIIdentityIntentToStore *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIdentityIntentToStore;
  v5 = -[PKIdentityIntentToStore init](&v8, sel_init);
  wrapped = v5->_wrapped;
  v5->_wrapped = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKIdentityIntentToStore *v5;
  void *v6;
  PKIdentityIntentToStore *v7;

  v5 = [PKIdentityIntentToStore alloc];
  v6 = (void *)-[DIIdentityIntentToStore copyWithZone:](self->_wrapped, "copyWithZone:", a3);
  v7 = -[PKIdentityIntentToStore initWithDIIdentityIntentToStore:](v5, "initWithDIIdentityIntentToStore:", v6);

  return v7;
}

- (id)description
{
  return (id)-[DIIdentityIntentToStore description](self->_wrapped, "description");
}

+ (PKIdentityIntentToStore)willNotStoreIntent
{
  PKIdentityIntentToStore *v2;
  void *v3;
  PKIdentityIntentToStore *v4;

  v2 = [PKIdentityIntentToStore alloc];
  objc_msgSend(MEMORY[0x1E0D16A10], "willNotStoreIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityIntentToStore initWithDIIdentityIntentToStore:](v2, "initWithDIIdentityIntentToStore:", v3);

  return v4;
}

+ (PKIdentityIntentToStore)mayStoreIntent
{
  PKIdentityIntentToStore *v2;
  void *v3;
  PKIdentityIntentToStore *v4;

  v2 = [PKIdentityIntentToStore alloc];
  objc_msgSend(MEMORY[0x1E0D16A10], "mayStoreIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityIntentToStore initWithDIIdentityIntentToStore:](v2, "initWithDIIdentityIntentToStore:", v3);

  return v4;
}

+ (PKIdentityIntentToStore)mayStoreIntentForDays:(NSInteger)days
{
  PKIdentityIntentToStore *v4;
  void *v5;
  PKIdentityIntentToStore *v6;

  v4 = [PKIdentityIntentToStore alloc];
  objc_msgSend(MEMORY[0x1E0D16A10], "mayStoreIntentForDays:", days);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKIdentityIntentToStore initWithDIIdentityIntentToStore:](v4, "initWithDIIdentityIntentToStore:", v5);

  return v6;
}

- (id)asDIIdentityIntentToStore
{
  return self->_wrapped;
}

- (DIIdentityIntentToStore)wrapped
{
  return (DIIdentityIntentToStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWrapped:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
