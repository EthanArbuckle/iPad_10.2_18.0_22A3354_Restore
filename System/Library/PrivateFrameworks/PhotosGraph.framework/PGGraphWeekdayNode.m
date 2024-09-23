@implementation PGGraphWeekdayNode

- (PGGraphWeekdayNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraphWeekdayNode;
  return -[PGGraphNode init](&v3, sel_init);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Weekday");
  return CFSTR("Weekday");
}

- (PGGraphWeekdayNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphWeekdayNodeCollection alloc], "initWithNode:", self);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Weekday"), 400);
}

@end
