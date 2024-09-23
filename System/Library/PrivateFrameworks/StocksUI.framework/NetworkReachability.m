@implementation NetworkReachability

+ (id)sharedNetworkReachability
{
  if (qword_1EDB30F18 != -1)
    swift_once();
  return (id)qword_1EDB30F08;
}

- (_TtC8StocksUI19NetworkReachability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[FCNetworkReachability init](&v3, sel_init);
}

@end
