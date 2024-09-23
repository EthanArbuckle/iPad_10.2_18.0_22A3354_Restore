@implementation SXDataRecord

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXJSONObject jsonDictionary](self, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SXJSONObject jsonDictionary](self, "jsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
