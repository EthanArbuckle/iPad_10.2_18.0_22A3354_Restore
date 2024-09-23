@implementation PPWriteTransaction

- (PPWriteTransaction)initWithHandle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPWriteTransaction;
  return -[PPReadTransaction initWithHandle:](&v4, sel_initWithHandle_, a3);
}

@end
