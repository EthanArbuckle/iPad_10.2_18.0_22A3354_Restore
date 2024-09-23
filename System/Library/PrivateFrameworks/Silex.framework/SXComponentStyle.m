@implementation SXComponentStyle

uint64_t __55__SXComponentStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_45;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponentStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)fillWithValue:(id)a3 withType:(int)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  if (a4 == 5)
  {
    v5 = a3;
    v6 = objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", v6, v7);

    v9 = [v8 alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithJSONObject:andVersion:", v5, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)maskWithValue:(id)a3 withType:(int)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  if (a4 == 5)
  {
    v5 = a3;
    v6 = objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", v6, v7);

    v9 = [v8 alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithJSONObject:andVersion:", v5, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)traits
{
  void *v3;
  char isKindOfClass;
  void *v6;
  char v7;

  -[SXComponentStyle fill](self, "fill");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  -[SXComponentStyle fill](self, "fill");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
    return 4;
  else
    return 0;
}

@end
