@implementation EQKitMathMLNone

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLNone;
  return -[EQKitMathMLNone init](&v5, sel_init, a3, a4);
}

- (const)mathMLAttributes
{
  return 0;
}

@end
