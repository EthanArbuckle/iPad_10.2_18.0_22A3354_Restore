@implementation ChargingNetworksDataSource

- (NSString)searchString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->provider[OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->provider[OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setSearchString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _TtC4Maps26ChargingNetworksDataSource *v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString);
  v7 = *(_QWORD *)&self->provider[OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString];
  *v6 = v4;
  v6[1] = v5;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_1000C3F4C();

}

- (NSSet)selectedNetworks
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_selectedNetworks);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_selectedNetworks, v6, 0, 0);
  v3 = *v2;
  sub_10000E4BC(0, (unint64_t *)&unk_1014994F0, VGChargingNetwork_ptr);
  sub_1000C6480();
  swift_bridgeObjectRetain(v3);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (void)setSelectedNetworks:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10[24];

  v5 = sub_10000E4BC(0, (unint64_t *)&unk_1014994F0, VGChargingNetwork_ptr);
  v6 = sub_1000C6480();
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_selectedNetworks);
  swift_beginAccess(v8, v10, 1, 0);
  v9 = *v8;
  *v8 = v7;
  swift_bridgeObjectRelease(v9);
}

- (_TtC4Maps26ChargingNetworksDataSource)initWithExcludedNetworks:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v7;
  uint64_t v9;
  unint64_t v10;

  v7 = a3;
  if (a3)
  {
    v9 = sub_10000E4BC(0, (unint64_t *)&unk_1014994F0, VGChargingNetwork_ptr);
    v10 = sub_1000C6480();
    v7 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v9, v10);
  }
  swift_unknownObjectRetain(a5);
  return (_TtC4Maps26ChargingNetworksDataSource *)sub_1001FA970(v7, a4, a5, (char *)self);
}

- (id)indexPathForNetwork:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC4Maps26ChargingNetworksDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101499510);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_1000C46E4(v8, (uint64_t)v7);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (_TtC4Maps26ChargingNetworksDataSource)init
{
  _TtC4Maps26ChargingNetworksDataSource *result;

  result = (_TtC4Maps26ChargingNetworksDataSource *)_swift_stdlib_reportUnimplementedInitializer("Maps.ChargingNetworksDataSource", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_excludedNetworks));
  swift_bridgeObjectRelease(*(_QWORD *)&self->provider[OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_suggestedNetworks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_otherNetworks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_filteredSuggestedNetworks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_filteredOtherNetworks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_selectedNetworks));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC4Maps26ChargingNetworksDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_1000C4B48((uint64_t)v6, a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC4Maps26ChargingNetworksDataSource *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1000C4D50((uint64_t)v6, a4);

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC4Maps26ChargingNetworksDataSource *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000C63D0(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps26ChargingNetworksDataSource *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000C5154(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  sub_1000C590C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_1000C54A4);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  sub_1000C590C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_1000C56EC);
}

- (void)availableNetworksDidChangeForProvider:(id)a3
{
  id v4;
  _TtC4Maps26ChargingNetworksDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1000C59C8(v4);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC4Maps26ChargingNetworksDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1000C5D64(v4);

}

@end
