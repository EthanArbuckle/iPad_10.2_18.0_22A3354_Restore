@implementation VUIJetPackController

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI20VUIJetPackController_location);
}

- (id)getJetPackSource
{
  _TtC8VideosUI20VUIJetPackController *v2;
  void *v3;
  void *v4;

  v2 = self;
  VUIJetPackController.getJetPackSource()();
  v4 = v3;

  return OUTLINED_FUNCTION_111(v4);
}

- (id)getJetPackURL
{
  _TtC8VideosUI20VUIJetPackController *v2;
  void *v3;
  void *v4;

  v2 = self;
  VUIJetPackController.getJetPackURL()();
  v4 = v3;

  return OUTLINED_FUNCTION_111(v4);
}

- (_TtC8VideosUI20VUIJetPackController)init
{
  sub_1D9F5444C();
}

+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = sub_1DA143E80();
  v9 = v8;
  swift_getObjCClassMetadata();
  v10 = a3;
  v11 = a4;
  static VUIJetPackController.controller(bagKey:defaults:urlOverrideDefaultKey:)(v10, a4, v7, v9);
  v13 = v12;

  swift_bridgeObjectRelease();
  return (_TtC8VideosUI20VUIJetPackController *)OUTLINED_FUNCTION_2_89(v13);
}

+ (_TtC8VideosUI20VUIJetPackController)controllerWithBagKey:(id)a3 defaults:(id)a4 urlOverrideDefaultKey:(id)a5 withCachePolicy:(unint64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v9 = sub_1DA143E80();
  v11 = v10;
  swift_getObjCClassMetadata();
  v12 = a3;
  v13 = a4;
  static VUIJetPackController.controller(bagKey:defaults:urlOverrideDefaultKey:withCachePolicy:)(v12, a4, v9, v11, a6);
  v15 = v14;

  swift_bridgeObjectRelease();
  return (_TtC8VideosUI20VUIJetPackController *)OUTLINED_FUNCTION_2_89(v15);
}

@end
