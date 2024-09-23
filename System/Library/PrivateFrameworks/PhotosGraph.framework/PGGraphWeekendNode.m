@implementation PGGraphWeekendNode

- (PGGraphWeekendNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraphWeekendNode;
  return -[PGGraphNode init](&v3, sel_init);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Weekend");
  return CFSTR("Weekend");
}

- (PGGraphWeekendNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphWeekendNodeCollection alloc], "initWithNode:", self);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Weekend"), 400);
}

@end
