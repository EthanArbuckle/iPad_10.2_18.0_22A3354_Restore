@implementation DirectInvocationBuilderExtension

- (id)handle:(id)a3 withUserData:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = sub_1C2CFDD58();
  v6 = v5;
  v7 = sub_1C2CFDC68();
  sub_1C2CFD350();
  sub_1C2AAE3E0(v4, v6, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1C2CFDD34();
  swift_bridgeObjectRelease();
  return v8;
}

@end
