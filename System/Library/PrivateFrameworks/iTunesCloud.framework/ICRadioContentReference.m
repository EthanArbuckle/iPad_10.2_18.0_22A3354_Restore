@implementation ICRadioContentReference

- (int64_t)contentType
{
  return 0;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (ICRadioContentReference)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICRadioContentReference;
  return -[ICRadioContentReference init](&v4, sel_init, a3);
}

+ (id)storeItemWithIdentifier:(id)a3
{
  id v3;
  ICRadioStoreContentReference *v4;

  v3 = a3;
  v4 = -[ICRadioStoreContentReference initWithStoreIdentifier:]([ICRadioStoreContentReference alloc], "initWithStoreIdentifier:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
