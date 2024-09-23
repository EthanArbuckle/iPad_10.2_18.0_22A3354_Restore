@implementation LNPhotoItemCollection(Workflow)

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "if_map:", &__block_literal_global_26137);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id)objc_msgSend(a1, "initWithItems:", v10);

      v11 = a1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_116_26133);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("items"));
  return v2;
}

@end
