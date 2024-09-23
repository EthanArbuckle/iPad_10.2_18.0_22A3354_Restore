@implementation VisualResponseProvider

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_21F11369C();
  v6 = v5;
  v7 = sub_21F11369C();
  static VisualResponseProvider.setPatternId(_:forViewId:)(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)preloadPlugins
{
  static VisualResponseProvider.preloadPlugins()();
}

+ (void)preWarm:(id)a3
{
  id v3;

  v3 = a3;
  static VisualResponseProvider.preWarm(using:)(v3);

}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v5;
  _TtC9SnippetUI22VisualResponseProvider *v6;

  v5 = a3;
  v6 = self;
  sub_21F10EC14();

  VisualResponseProvider.viewController(for:mode:)();
}

- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v7;
  id v8;
  _TtC9SnippetUI22VisualResponseProvider *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_21F10EC14();

  sub_21F11369C();
  VisualResponseProvider.viewController(for:bundleName:mode:)();
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4 overload:(int64_t)a5
{
  id v6;
  _TtC9SnippetUI22VisualResponseProvider *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = self;
  v8 = sub_21F10EC14();
  v10 = v9;

  VisualResponseProvider.view(for:mode:overload:)(v8, v10);
  v12 = v11;
  sub_21EE1D6A0(v8, v10);

  return v12;
}

- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  _TtC9SnippetUI22VisualResponseProvider *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_21F10EC14();
  v13 = v12;

  v14 = sub_21F11369C();
  v16 = v15;

  VisualResponseProvider.view(for:bundleName:mode:)(v11, v13, v14, v16, a5);
  v18 = v17;
  swift_bridgeObjectRelease();
  sub_21EE1D6A0(v11, v13);

  return v18;
}

- (void)viewControllerFor:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7;
  _TtC9SnippetUI22VisualResponseProvider *v8;

  _Block_copy(a5);
  v7 = a3;
  v8 = self;
  sub_21F10EC14();

  swift_allocObject();
  VisualResponseProvider.viewController(for:mode:completion:)();
}

- (void)reset
{
  _TtC9SnippetUI22VisualResponseProvider *v2;

  v2 = self;
  VisualResponseProvider.reset()();

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
  v8 = sub_21F10EC14();
  v10 = v9;

  swift_getObjCClassMetadata();
  static VisualResponseProvider.transformModel(_:mode:currentIdiom:)(v8, v10, a4, (char *)a5);
  v12 = v11;
  sub_21EE1D6A0(v8, v10);
  if (v12)
  {
    sub_21EE3A6EC(0, (unint64_t *)&unk_255497F88);
    v13 = (void *)sub_21F1138A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (_TtC9SnippetUI22VisualResponseProvider)init
{
  return (_TtC9SnippetUI22VisualResponseProvider *)VisualResponseProvider.init()();
}

@end
