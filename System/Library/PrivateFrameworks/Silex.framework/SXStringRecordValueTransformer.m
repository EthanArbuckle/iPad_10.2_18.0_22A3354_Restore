@implementation SXStringRecordValueTransformer

- (id)transformValueForRecord:(id)a3 descriptor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  SXFormattedText *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  SXFormattedText *v17;
  SXFormattedText *v18;
  SXFormattedText *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_24D68E0F8;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [SXFormattedText alloc];
    objc_msgSend(v5, "specificationVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SXJSONObject initWithJSONObject:andVersion:](v13, "initWithJSONObject:andVersion:", v12, v14);
LABEL_8:
    v19 = (SXFormattedText *)v15;

    goto LABEL_9;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v17 = [SXFormattedText alloc];
  v18 = v17;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SXFormattedText initWithText:](v18, "initWithText:", v14);
    goto LABEL_8;
  }
  v19 = -[SXFormattedText initWithText:](v17, "initWithText:", v12);
LABEL_9:
  -[SXFormattedText setShouldWrapText:](v19, "setShouldWrapText:", objc_msgSend(v6, "dataType") == 2);

  return v19;
}

@end
