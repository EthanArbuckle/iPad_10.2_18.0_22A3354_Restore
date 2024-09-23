@implementation OS_launch_endpoint

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  sub_1000456E8((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9 = sub_100019EE0();
  v16.receiver = self;
  v16.super_class = (Class)OS_launch_endpoint;
  sub_100019EE8(v9, "dealloc", v10, v11, v12, v13, v14, v15, v16);
  sub_100019ED4();
}

@end
