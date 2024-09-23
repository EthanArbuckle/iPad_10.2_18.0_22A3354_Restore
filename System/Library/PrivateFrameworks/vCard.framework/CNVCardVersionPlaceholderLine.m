@implementation CNVCardVersionPlaceholderLine

+ (id)line
{
  return objc_alloc_init((Class)a1);
}

- (void)serializeWithStrategy:(id)a3
{
  objc_msgSend(a3, "serializeVersionPlaceholder");
}

@end
