@implementation OS_launch_cache

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  sub_1000435D0((uint64_t)self);
  v3 = sub_100019EE0();
  v10.receiver = self;
  v10.super_class = (Class)OS_launch_cache;
  sub_100019EE8(v3, "dealloc", v4, v5, v6, v7, v8, v9, v10);
  sub_100019ED4();
}

@end
