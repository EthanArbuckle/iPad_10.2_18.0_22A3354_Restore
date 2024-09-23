@implementation ProtoVisualResponseProvider

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_24769316C();
  v6 = v5;
  v7 = sub_24769316C();
  static ProtoVisualResponseProvider.setPatternId(_:forViewId:)(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)preWarm:(id)a3
{
  id v3;

  v3 = a3;
  static ProtoVisualResponseProvider.preWarm(using:)(v3);

}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v5;
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *v6;

  v5 = a3;
  v6 = self;
  sub_247692F80();

  ProtoVisualResponseProvider.viewController(for:mode:)();
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5
{
  id v7;
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  v7 = a3;
  v8 = self;
  v9 = sub_247692F80();
  v11 = v10;

  v12 = (void *)ProtoVisualResponseProvider.view(for:mode:overload:)(v9, v11, a4);
  sub_247690488(v9, v11);

  return v12;
}

- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7;
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *v8;

  _Block_copy(a5);
  v7 = a3;
  v8 = self;
  sub_247692F80();

  swift_allocObject();
  ProtoVisualResponseProvider.viewController(for:mode:completion:)();
}

- (void)reset
{
  _TtC15SnippetUI_Proto27ProtoVisualResponseProvider *v2;

  v2 = self;
  ProtoVisualResponseProvider.reset()();

}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = sub_247692F80();
  v10 = v9;

  swift_getObjCClassMetadata();
  static ProtoVisualResponseProvider.transformModel(_:mode:currentIdiom:)(v8, v10, a4, a5);
  v12 = v11;
  sub_247690488(v8, v10);
  if (v12)
  {
    sub_247690798(0, &qword_2576B7040);
    v13 = (void *)sub_2476931A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)init
{
  return (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider *)ProtoVisualResponseProvider.init()();
}

@end
