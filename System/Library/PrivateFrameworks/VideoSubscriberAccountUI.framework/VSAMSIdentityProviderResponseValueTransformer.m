@implementation VSAMSIdentityProviderResponseValueTransformer

- (VSAMSIdentityProviderResponseValueTransformer)init
{
  VSAMSIdentityProviderResponseValueTransformer *v2;
  VSAMSIdentityProviderResponseDictionaryValueTransformer *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)VSAMSIdentityProviderResponseValueTransformer;
  v2 = -[VSCompoundValueTransformer init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSAMSIdentityProviderResponseDictionaryValueTransformer);
    v4 = objc_alloc_init(MEMORY[0x24BDF8BF8]);
    objc_msgSend(v4, "setObjectValueTransformer:", v3);
    objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", *MEMORY[0x24BDF8E68]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDF8BF8]);
    objc_msgSend(v6, "setObjectValueTransformer:", v5);
    v10[0] = v6;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCompoundValueTransformer setValueTransformers:](v2, "setValueTransformers:", v7);

  }
  return v2;
}

@end
