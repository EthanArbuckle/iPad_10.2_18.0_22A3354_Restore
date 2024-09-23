@implementation SearchExtensionHelper

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v5;

  v4 = a3;
  v5 = self;
  sub_16761C(v4);

  return 1;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v5;

  v4 = a3;
  v5 = self;
  sub_16774C(v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_167B40(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v7;

  v6 = a3;
  v7 = self;
  sub_168B38(a4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v5;

  v4 = a3;
  v5 = self;
  sub_167D08(v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v9;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D8F68);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_didCancel) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_didCommit) = 0;
  v8 = a3;
  v9 = self;
  SearchExtensionTerm.init(term:searchPrefix:state:)(0, 0xE000000000000000, 0, 0, 3);
  sub_167324((uint64_t)v7);
  sub_D1D4((uint64_t)v7, &qword_3D8F68);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D8F68);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  SearchExtensionTerm.init(term:searchPrefix:state:)(0, 0xE000000000000000, 0, 0, 4);
  sub_167324((uint64_t)v7);
  sub_D1D4((uint64_t)v7, &qword_3D8F68);

  return 1;
}

- (_TtC23ShelfKitCollectionViews21SearchExtensionHelper)init
{
  _TtC23ShelfKitCollectionViews21SearchExtensionHelper *result;

  result = (_TtC23ShelfKitCollectionViews21SearchExtensionHelper *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.SearchExtensionHelper", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_searchController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_searchExtension));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_scopeBar));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SearchExtensionHelper_subscriptions));
}

@end
