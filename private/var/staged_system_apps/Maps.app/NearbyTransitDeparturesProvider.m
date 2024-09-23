@implementation NearbyTransitDeparturesProvider

- (NSArray)storeSubscriptionTypes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_storeSubscriptionTypes);
  swift_bridgeObjectRetain(v2);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_storeSubscriptionTypes);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_storeSubscriptionTypes) = v6;
  swift_bridgeObjectRelease(v7);
}

- (_TtC4Maps31NearbyTransitDeparturesProvider)init
{
  return (_TtC4Maps31NearbyTransitDeparturesProvider *)sub_100026AF4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__referenceDate;
  v4 = sub_100008B04(&qword_1014940A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__categories;
  v6 = sub_100008B04((uint64_t *)&unk_101494090);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__state;
  v8 = sub_100008B04(&qword_1014940A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_storeSubscriptionTypes));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_requestedLocation));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_geoNearbyTransitSchedule));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_transitAttribution));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_singleLocationUpdate));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_pinnedLines));
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_delegate);
  sub_100010CC4((uint64_t)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_viewDelegate, (uint64_t *)&unk_1014940B0);
}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  id v4;
  _TtC4Maps31NearbyTransitDeparturesProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100035EFC();

  return v6;
}

- (void)transitMapItemUpdater:(id)a3 willUpdateMapItem:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC4Maps31NearbyTransitDeparturesProvider *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;

  v6 = qword_101490E90;
  v7 = a3;
  v14 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once(&qword_101490E90, sub_100114734);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_10000E918(v9, (uint64_t)qword_1014D4AC0);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Will update mapItem", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC4Maps31NearbyTransitDeparturesProvider *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100036064(v9, (uint64_t)a5);

}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps31NearbyTransitDeparturesProvider *v12;
  uint64_t v13;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100036418((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC4Maps31NearbyTransitDeparturesProvider *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = swift_allocObject(&unk_10119CDF0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, self);
  v9 = (_QWORD *)swift_allocObject(&unk_10119CEB8, 40, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v10 = self;
  v11 = sub_1001B0C08((uint64_t)v6, (uint64_t)&unk_101494080, (uint64_t)v9);

  swift_release(v11);
}

@end
