@implementation TabBarController.LibraryTabDataSource

- (void)dealloc
{
  _TtCC5Music16TabBarController20LibraryTabDataSource *v2;
  void (*v3)(_TtCC5Music16TabBarController20LibraryTabDataSource *, _UNKNOWN **, __n128);
  _TtCC5Music16TabBarController20LibraryTabDataSource *v4;
  __n128 v5;
  objc_super v6;

  v2 = self;
  v3 = *(void (**)(_TtCC5Music16TabBarController20LibraryTabDataSource *, _UNKNOWN **, __n128))(*(_QWORD *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor() + 232);
  v4 = v2;
  v5 = swift_retain();
  v3(v4, &off_1010D7A48, v5);
  swift_release();

  v6.receiver = v4;
  v6.super_class = (Class)_s20LibraryTabDataSourceCMa(0);
  -[TabBarController.LibraryTabDataSource dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource_onSelection), *(_QWORD *)&self->rootTab[OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource_onSelection]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource_createdPlaylist, &qword_1011A30F0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource____lazy_storage___cloudLibraryStatusView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource____lazy_storage___playlistSortButton));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Music16TabBarController20LibraryTabDataSource____lazy_storage___homeSharingButton));
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6;
  id v7;
  _TtCC5Music16TabBarController20LibraryTabDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1006DFE34((uint64_t)v6, v7);

}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCC5Music16TabBarController20LibraryTabDataSource *v8;

  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v7 = a3;
  v8 = self;
  sub_1006E01C4(v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtCC5Music16TabBarController20LibraryTabDataSource)init
{
  _TtCC5Music16TabBarController20LibraryTabDataSource *result;

  result = (_TtCC5Music16TabBarController20LibraryTabDataSource *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryTabDataSource", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtCC5Music16TabBarController20LibraryTabDataSource *v14;

  v9 = sub_10004A07C(0, &qword_10119D458, _UITab_ptr);
  v10 = sub_1000EA1BC((unint64_t *)&qword_1011A0090, &qword_10119D458, _UITab_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1006E24F4(0, v11);

  swift_bridgeObjectRelease();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC5Music16TabBarController20LibraryTabDataSource *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1006E7F7C(v8, v10);

}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC5Music16TabBarController20LibraryTabDataSource *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1006E97F0((uint64_t)v8, v10);

  return v12;
}

@end
