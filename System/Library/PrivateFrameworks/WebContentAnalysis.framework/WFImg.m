@implementation WFImg

+ (id)imgWithNode:(_xmlNode *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithNode:", a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFImg;
  -[XMLNode dealloc](&v2, sel_dealloc);
}

- (id)alt
{
  return -[XMLNode _stringValueFromAttribute:](self, "_stringValueFromAttribute:", CFSTR("alt"));
}

- (id)title
{
  return -[XMLNode _stringValueFromAttribute:](self, "_stringValueFromAttribute:", CFSTR("title"));
}

- (id)src
{
  return -[XMLNode _stringValueFromAttribute:](self, "_stringValueFromAttribute:", CFSTR("src"));
}

- (int64_t)width
{
  return -[XMLNode _intValueFromAttribute:](self, "_intValueFromAttribute:", CFSTR("width"));
}

- (int64_t)height
{
  return -[XMLNode _intValueFromAttribute:](self, "_intValueFromAttribute:", CFSTR("height"));
}

- (int64_t)area
{
  int64_t v3;
  int64_t v4;

  v3 = -[WFImg width](self, "width");
  v4 = -[WFImg height](self, "height");
  if (v4 == kWFImgDimensionUnknown || v3 == kWFImgDimensionUnknown)
    return kWFImgDimensionUnknown;
  else
    return v4 * v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ alt:%@ src:%@ width:%ld height:%ld)"), objc_msgSend((id)objc_opt_class(), "description"), -[WFImg alt](self, "alt"), -[WFImg src](self, "src"), -[WFImg width](self, "width"), -[WFImg height](self, "height"));
}

@end
