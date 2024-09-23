@implementation URMTLStructType

- (URMTLStructType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)URMTLStructType;
  return -[URMTLStructType init](&v3, sel_init);
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_storeStrong((id *)&self->_members, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);
}

@end
