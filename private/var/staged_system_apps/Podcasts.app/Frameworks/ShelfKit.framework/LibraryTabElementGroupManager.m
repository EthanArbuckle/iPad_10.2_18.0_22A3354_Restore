@implementation LibraryTabElementGroupManager

- (_TtC8ShelfKit29LibraryTabElementGroupManager)init
{
  _TtC8ShelfKit29LibraryTabElementGroupManager *result;

  result = (_TtC8ShelfKit29LibraryTabElementGroupManager *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.LibraryTabElementGroupManager", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_actionRunner));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_tabMenuProvider));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_tabBarController);
  __swift_destroy_boxed_opaque_existential_1((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_libraryActionController));
  __swift_destroy_boxed_opaque_existential_1((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_episodeController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_subscription));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKit29LibraryTabElementGroupManager_tabElementGroup));
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6;
  id v7;
  _TtC8ShelfKit29LibraryTabElementGroupManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1499CC(v7);

}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  _QWORD *v6;
  id v7;
  _TtC8ShelfKit29LibraryTabElementGroupManager *v8;

  v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v7 = a3;
  v8 = self;
  LibraryTabElementGroupManager._tabElementGroup(_:didCustomizeDisplayOrder:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC8ShelfKit29LibraryTabElementGroupManager *v14;

  v9 = sub_327F8(0, &qword_3BC3C0, _UITab_ptr);
  v10 = sub_14CC70();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v9, v10);
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_14BFEC(v11);

  swift_bridgeObjectRelease();
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  return sub_1482F4(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id))sub_14C0D8);
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  return sub_1482F4(self, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id))sub_14C3CC);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8ShelfKit29LibraryTabElementGroupManager *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_14C88C(v10);

}

@end
