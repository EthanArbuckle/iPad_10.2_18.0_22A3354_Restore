@implementation CNVCardParsedResultBuilderFactory

+ (id)factoryWithBlock:(id)a3
{
  id v3;
  _CNVCardParsedResultBuilderBlockFactory *v4;

  v3 = a3;
  v4 = -[_CNVCardParsedResultBuilderBlockFactory initWithBlock:]([_CNVCardParsedResultBuilderBlockFactory alloc], "initWithBlock:", v3);

  return v4;
}

@end
