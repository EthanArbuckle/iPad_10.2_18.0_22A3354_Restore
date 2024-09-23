@implementation CNVCardDictionarySerialization

+ (id)dictionariesWithData:(id)a3 error:(id *)a4
{
  id v6;
  CNVCardReadingOptions *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(CNVCardReadingOptions);
  objc_msgSend(a1, "dictionariesWithData:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dictionariesWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CNVCardParsedDictionaryResultBuilder factory](CNVCardParsedDictionaryResultBuilder, "factory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardParser parseData:options:resultFactory:](CNVCardParser, "parseData:options:resultFactory:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
