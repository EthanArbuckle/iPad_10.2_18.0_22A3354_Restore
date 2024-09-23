@implementation ServerRPC

- (id)batchQuery
{
  ServerRPC *v3;

  if (-[ServerRPC rpcType](self, "rpcType") == (id)1)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("ServerRPC"));
}

- (id)singleQuery
{
  ServerRPC *v3;

  if (-[ServerRPC rpcType](self, "rpcType"))
    v3 = 0;
  else
    v3 = self;
  return v3;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  sub_1001A7B0C(self, a3, a4);
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001A7A14(self, a3);
}

@end
