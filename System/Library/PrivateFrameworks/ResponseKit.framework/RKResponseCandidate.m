@implementation RKResponseCandidate

- (RKResponseCandidate)initWithString:(id)a3 attributes:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RKResponseCandidate;
  return -[RKResponse initWithString:attributes:category:](&v5, sel_initWithString_attributes_category_, a3, a4, 0);
}

@end
