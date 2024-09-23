@implementation OS_firehose_client

- (void)dealloc
{
  objc_super v3;

  sub_10000FBD4((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_firehose_client;
  -[OS_firehose_client dealloc](&v3, "dealloc");
}

- (OS_firehose_client)init
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  return 0;
}

@end
