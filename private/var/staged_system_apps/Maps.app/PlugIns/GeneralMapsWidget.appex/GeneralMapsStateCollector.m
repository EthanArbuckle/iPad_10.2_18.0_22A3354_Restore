@implementation GeneralMapsStateCollector

- (NSString)uniqueName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(self, a2);
  v2 = sub_1000027AC(&qword_10008C038);
  String.init<A>(describing:)(&ObjectType, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  _TtC17GeneralMapsWidget25GeneralMapsStateCollector *v5;
  uint64_t v6;
  _TtC17GeneralMapsWidget25GeneralMapsStateCollector *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  _OWORD v19[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v19, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    v7 = self;
  }
  if (qword_10008B9F0 != -1)
    swift_once(&qword_10008B9F0, sub_100035150);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100014D70(v8, (uint64_t)qword_100090B98);
  v13 = Logger.logObject.getter(v9, v10, v11, v12);
  v17 = static os_log_type_t.debug.getter(v13, v14, v15, v16);
  if (os_log_type_enabled(v13, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v17, "GeneralMapsStateCollector: MSg invalidate sink", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  sub_100015590((uint64_t)v19, &qword_10008BF30);
}

- (void)navigationServiceDidSynchronize:(id)a3
{
  id v4;
  _TtC17GeneralMapsWidget25GeneralMapsStateCollector *v5;

  v4 = a3;
  v5 = self;
  sub_100015C48();

}

- (_TtC17GeneralMapsWidget25GeneralMapsStateCollector)init
{
  _TtC17GeneralMapsWidget25GeneralMapsStateCollector *result;

  result = (_TtC17GeneralMapsWidget25GeneralMapsStateCollector *)_swift_stdlib_reportUnimplementedInitializer("GeneralMapsWidget.GeneralMapsStateCollector", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_locationUpdater));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_suggestionsEngine));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_suggestionsNetworkRequester));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_transportModePredictor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_isolationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_collectorGroup));
  sub_100014F38(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state), *(_QWORD *)&self->locationUpdater[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(_QWORD *)&self->suggestionsEngine[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void **)&self->suggestionsNetworkRequester[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(_QWORD *)&self->transportModePredictor[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(_QWORD *)&self->isolationQueue[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(_QWORD *)&self->collectorGroup[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void **)&self->$__lazy_storage_$_state[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(_QWORD *)&self->$__lazy_storage_$_state[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state+ 8], *(_QWORD *)&self->$__lazy_storage_$_state[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state+ 16]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_pendingNearbyCategoriesCancellation));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_pendingNavigationRouteCancellation));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_pendingLocationShiftCancellation));
}

@end
