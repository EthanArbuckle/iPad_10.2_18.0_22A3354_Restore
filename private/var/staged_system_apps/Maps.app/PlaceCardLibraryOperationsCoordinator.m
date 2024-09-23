@implementation PlaceCardLibraryOperationsCoordinator

- (MKMapItem)mapItem
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem, v4, 0, 0);
  return (MKMapItem *)*v2;
}

- (void)setMapItem:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_mapItem, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_10010DA94(v6);

}

- (int64_t)savedStateOfPlace
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace, v4, 0, 0);
  return *v2;
}

- (void)setSavedStateOfPlace:(int64_t)a3
{
  int64_t *v5;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v6;
  _BYTE v7[24];

  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateOfPlace, v7, 1, 0);
  *v5 = a3;
  v6 = self;
  sub_10010DEA8();

}

- (UIViewController)viewControllerForPresentingAlert
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_viewControllerForPresentingAlert;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_viewControllerForPresentingAlert, v4, 0, 0);
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setViewControllerForPresentingAlert:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_viewControllerForPresentingAlert;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_viewControllerForPresentingAlert, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (NSString)placeNote
{
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  PlaceCardLibraryOperationsCoordinator.placeNote.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isPinned
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_placeItemInLibrary);
  if (!v2)
    return 0;
  v3 = type metadata accessor for FavoriteItem(0, a2);
  return swift_dynamicCastClass(v2, v3) != 0;
}

- (_TtC8MapsSync14MapsSyncObject)syncObject
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_placeItemInLibrary);
  if (v2)
  {
    v3 = type metadata accessor for MapsSyncObject(0, a2);
    v4 = (void *)swift_dynamicCastClass(v2, v3);
    if (v4)
      swift_unknownObjectRetain(v2);
  }
  else
  {
    v4 = 0;
  }
  return (_TtC8MapsSync14MapsSyncObject *)v4;
}

- (_TtC4Maps37PlaceCardLibraryOperationsCoordinator)init
{
  return (_TtC4Maps37PlaceCardLibraryOperationsCoordinator *)sub_10010E5BC();
}

- (void)dealloc
{
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v3;
  void *v4;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v5;
  objc_super v6;

  type metadata accessor for MapsSyncStore(0);
  v3 = self;
  v4 = (void *)static MapsSyncStore.sharedStore.getter();
  v5 = v3;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)();

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for PlaceCardLibraryOperationsCoordinator();
  -[PlaceCardLibraryOperationsCoordinator dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_viewControllerForPresentingAlert);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateObservers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_dataOperationsProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_placeItemInLibrary));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_storeSubscriptionTypes));
}

- (void)addPlaceToLibraryWithCustomName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_10010E9BC(v4, v6, 0, 0);

  swift_bridgeObjectRelease(v6);
}

- (void)deletePlaceFromLibrary
{
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v2;

  v2 = self;
  PlaceCardLibraryOperationsCoordinator.deletePlaceFromLibrary()();

}

- (void)updatePlaceNote:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  PlaceCardLibraryOperationsCoordinator.updatePlaceNote(to:)(v8);

  swift_bridgeObjectRelease(v6);
}

- (void)registerObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateObservers), "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_savedStateObservers), "unregisterObserver:", a3);
}

- (NSArray)storeSubscriptionTypes
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_storeSubscriptionTypes);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_storeSubscriptionTypes, v6, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v3);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardLibraryOperationsCoordinator_storeSubscriptionTypes);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v3;

  v3 = self;
  _s4Maps37PlaceCardLibraryOperationsCoordinatorC14storeDidChange5typesySaySSG_tF_0();

}

@end
