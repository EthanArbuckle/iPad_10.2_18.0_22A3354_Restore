@implementation CNVCardURLParser

+ (id)valueWithParser:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_stringByAddingPercentEscapesIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
