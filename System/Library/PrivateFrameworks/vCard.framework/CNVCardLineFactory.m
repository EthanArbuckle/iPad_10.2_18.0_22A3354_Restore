@implementation CNVCardLineFactory

+ (id)version30LineFactory
{
  return objc_alloc_init(CNVCardLineFactory);
}

+ (id)version21LineFactory
{
  return objc_alloc_init(CNVCardLineFactory);
}

- (id)stringLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:value:](CNVCardLine, "lineWithName:value:", a3, a4);
}

- (id)arrayLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:value:](CNVCardLine, "lineWithName:value:", a3, a4);
}

- (id)arrayLineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  return +[CNVCardLine lineWithName:value:itemSeparator:](CNVCardLine, "lineWithName:value:itemSeparator:", a3, a4, a5);
}

- (id)dataLineWithName:(id)a3 value:(id)a4
{
  return +[CNVCardLine lineWithName:value:](CNVCardLine, "lineWithName:value:", a3, a4);
}

- (id)lineWithLiteralValue:(id)a3
{
  return +[CNVCardLine lineWithLiteralValue:](CNVCardLine, "lineWithLiteralValue:", a3);
}

- (id)versionPlaceholderLine
{
  return +[CNVCardLine versionPlaceholderLine](CNVCardLine, "versionPlaceholderLine");
}

@end
