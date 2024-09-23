@implementation WFLink

+ (id)linkWithNode:(_xmlNode *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithNode:", a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFLink;
  -[XMLNode dealloc](&v2, sel_dealloc);
}

- (id)title
{
  return -[XMLNode _stringValueFromAttribute:](self, "_stringValueFromAttribute:", CFSTR("title"));
}

- (id)url
{
  id result;

  result = -[XMLNode _stringValueFromAttribute:](self, "_stringValueFromAttribute:", CFSTR("href"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", result);
  return result;
}

@end
