@implementation CNVCardReading

+ (id)firstDictionaryInData:(id)a3 error:(id *)a4
{
  id v4;
  CNVCardParsedDictionaryResultBuilder *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNVCardParsedDictionaryResultBuilder);
  +[CNVCardParser parseFirstResultInData:resultBuilder:](CNVCardParser, "parseFirstResultInData:resultBuilder:", v4, v5);

  -[CNVCardParsedDictionaryResultBuilder build](v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
