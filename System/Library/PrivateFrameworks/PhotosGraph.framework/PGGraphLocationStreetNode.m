@implementation PGGraphLocationStreetNode

- (PGGraphLocationStreetNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationStreetNode;
  return -[PGGraphNamedLocationNode initWithLabel:domain:properties:](&v6, sel_initWithLabel_domain_properties_, a3, a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Street");
  return CFSTR("Street");
}

- (PGGraphLocationStreetNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphLocationStreetNodeCollection alloc], "initWithNode:", self);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Street"), 200);
}

@end
