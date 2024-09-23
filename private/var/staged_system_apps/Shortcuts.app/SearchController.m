@implementation SearchController

- (void).cxx_destruct
{
  sub_100069E60((uint64_t)self + OBJC_IVAR____TtC9Shortcuts16SearchController_destinationIdentifier);
  sub_100014CFC((uint64_t)self + OBJC_IVAR____TtC9Shortcuts16SearchController_viewController);
  sub_100069E60((uint64_t)self + OBJC_IVAR____TtC9Shortcuts16SearchController_placeholder);
  sub_100069E60((uint64_t)self + OBJC_IVAR____TtC9Shortcuts16SearchController_state);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Shortcuts16SearchController_stateController);
}

- (void)dealloc
{
  _TtC9Shortcuts16SearchController *v2;

  v2 = self;
  sub_100069524();
}

- (int64_t)positionForBar:(id)a3
{
  return 2;
}

- (void)beginSearching
{
  _TtC9Shortcuts16SearchController *v2;

  v2 = self;
  sub_100069758();

}

- (_TtC9Shortcuts16SearchController)init
{
  sub_1000697C8();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC9Shortcuts16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100069800(v4);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC9Shortcuts16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100069888(v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC9Shortcuts16SearchController *v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = self;
  sub_100069930(v8);

  swift_bridgeObjectRelease(v7);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtC9Shortcuts16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_1000699B4(v4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtC9Shortcuts16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100069A88(v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtC9Shortcuts16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100069B1C(v4);

}

@end
