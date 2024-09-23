@implementation SXFloatRecordValueTransformer

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SXFormattedText *v12;
  id v13;
  SXFormattedText *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v7)
      v11 = objc_msgSend(v7, "decimals");
    else
      v11 = 2;
    v13 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v13, "setMinimumFractionDigits:", v11);
    objc_msgSend(v13, "setMaximumFractionDigits:", v11);
    v14 = [SXFormattedText alloc];
    objc_msgSend(v13, "stringFromNumber:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SXFormattedText initWithText:](v14, "initWithText:", v15);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
