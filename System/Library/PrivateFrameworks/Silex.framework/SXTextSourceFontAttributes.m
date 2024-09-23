@implementation SXTextSourceFontAttributes

+ (id)attributesWithFamilyName:(id)a3 style:(int64_t)a4 weight:(int64_t)a5
{
  id v7;
  SXTextSourceFontAttributes *v8;

  v7 = a3;
  v8 = -[SXFontAttributes initWithFamilyName:weight:width:style:]([SXTextSourceFontAttributes alloc], "initWithFamilyName:weight:width:style:", v7, a5, 7, a4);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[SXFontAttributes familyName](self, "familyName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXTextSourceFontAttributes attributesWithFamilyName:style:weight:](SXTextSourceFontAttributes, "attributesWithFamilyName:style:weight:", v4, -[SXFontAttributes style](self, "style"), -[SXFontAttributes weight](self, "weight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
