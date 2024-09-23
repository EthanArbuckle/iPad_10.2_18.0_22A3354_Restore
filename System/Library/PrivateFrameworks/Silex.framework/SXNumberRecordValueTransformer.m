@implementation SXNumberRecordValueTransformer

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SXFormattedText *v9;
  void *v10;
  SXFormattedText *v11;

  v5 = a4;
  objc_msgSend(a3, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = [SXFormattedText alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SXFormattedText initWithText:](v9, "initWithText:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
