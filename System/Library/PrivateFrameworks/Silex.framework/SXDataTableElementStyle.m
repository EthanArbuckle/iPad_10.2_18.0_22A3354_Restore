@implementation SXDataTableElementStyle

- (id)valueForLookupKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")))
  {
    -[SXJSONObject jsonDictionary](self, "jsonDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_6;
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)SXDataTableElementStyle;
  -[SXJSONObject valueForLookupKey:](&v9, sel_valueForLookupKey_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

@end
