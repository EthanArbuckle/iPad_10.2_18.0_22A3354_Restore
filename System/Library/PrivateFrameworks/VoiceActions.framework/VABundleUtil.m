@implementation VABundleUtil

+ (id)bundePathFallbackWithResource:(id)a3 type:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  sub_24A215CB4();
  sub_24A215CB4();
  sub_24A17E11C();
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24A17E20C();
    v6 = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v6)
    {
      v7 = 0;
      return v7;
    }
  }
  v7 = (void *)sub_24A215C90();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)bundlePathFallbackWithPath:(id)a3 error:(id *)a4
{
  void *v4;

  sub_24A215CB4();
  sub_24A17F8D8();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_24A215C90();
  swift_bridgeObjectRelease();
  return v4;
}

- (VABundleUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VABundleUtil();
  return -[VABundleUtil init](&v3, sel_init);
}

@end
