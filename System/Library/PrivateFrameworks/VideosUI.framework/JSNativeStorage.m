@implementation JSNativeStorage

- (_TtC8VideosUI15JSNativeStorage)initWithAppContext:(id)a3
{
  id v4;
  _TtC8VideosUI15JSNativeStorage *result;

  v4 = a3;
  sub_1D97B9968(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)storeData:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8VideosUI15JSNativeStorage *v11;
  _BYTE v12[32];

  v7 = sub_1DA143E80();
  v9 = v8;
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = self;
  sub_1DA144B7C();
  swift_unknownObjectRelease();
  sub_1D9CFC8B8(v7, v9, (uint64_t)v12, v10);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

- (void)readData:(id)a3 :(id)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI15JSNativeStorage *v10;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_1D9CFD254(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI15JSNativeStorage)init
{
  _TtC8VideosUI15JSNativeStorage *result;

  sub_1D9AFA824();
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
