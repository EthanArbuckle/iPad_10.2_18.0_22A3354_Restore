@implementation TabBarController.LibraryTabDataSource

- (void)dealloc
{
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v2;
  uint64_t *v3;
  uint64_t v4;
  void (*v5)(_TtCC16MusicApplication16TabBarController20LibraryTabDataSource *, _UNKNOWN **, __n128);
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v6;
  __n128 v7;
  objc_super v8;

  v2 = self;
  v3 = CloudLibrary.StatusObserver.shared.unsafeMutableAddressor();
  v4 = *v3;
  v5 = *(void (**)(_TtCC16MusicApplication16TabBarController20LibraryTabDataSource *, _UNKNOWN **, __n128))(*(_QWORD *)*v3 + 232);
  v6 = v2;
  v7 = swift_retain(v4);
  v5(v6, &off_1342560, v7);
  swift_release(v4);

  v8.receiver = v6;
  v8.super_class = (Class)_s20LibraryTabDataSourceCMa(0);
  -[TabBarController.LibraryTabDataSource dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_rootTab));
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_onSelection), *(_QWORD *)&self->rootTab[OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_onSelection]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_selectedLibrary));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___menuTabElementsController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___editableMenuController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___playlistsTabsController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_createdPlaylist, (uint64_t *)&unk_14AE790);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_artworkCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___cloudLibraryStatusView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___playlistSortButton));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_sharedLibrariesController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource_sharedLibraryObservers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication16TabBarController20LibraryTabDataSource____lazy_storage___homeSharingButton));
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6;
  id v7;
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_8C124((uint64_t)v6, v7);

}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v10;

  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_8C4B4(v8, v7);

  swift_bridgeObjectRelease(v7);
}

- (_TtCC16MusicApplication16TabBarController20LibraryTabDataSource)init
{
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *result;

  result = (_TtCC16MusicApplication16TabBarController20LibraryTabDataSource *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryTabDataSource", 37, "init()", 6, 0);
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
  id v14;
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v15;

  v9 = sub_4E684(0, &qword_14ACC50, _UITab_ptr);
  v10 = sub_950D0((unint64_t *)&qword_14CEFE0, &qword_14ACC50, _UITab_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_8E8EC(0, v11);

  swift_bridgeObjectRelease(v11);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_95174(v8, v10);

}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC16MusicApplication16TabBarController20LibraryTabDataSource *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_969D0((uint64_t)v8, v10);

  return v12;
}

@end
