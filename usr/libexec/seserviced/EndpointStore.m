@implementation EndpointStore

- (_TtC10seserviced13EndpointStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[EndpointStore init](&v3, "init");
}

+ (void)insertWithEndpoint:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000EB1FC((uint64_t)v3, (uint64_t (*)(void))sub_1000EB450);

}

+ (void)updateWithEndpoint:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000EB1FC((uint64_t)v3, sub_1000EB2D8);

}

+ (void)removeWithEndpoint:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000EB1FC((uint64_t)v3, (uint64_t (*)(void))sub_1000EB2BC);

}

+ (BOOL)containsWithFilter:(id)a3
{
  void *v3;
  char v4;
  _QWORD v6[4];

  v3 = _Block_copy(a3);
  v6[2] = v3;
  v4 = sub_1000EB09C((uint64_t)sub_1000EB1DC, (uint64_t)v6);
  _Block_release(v3);
  return v4 & 1;
}

@end
