@implementation GeneralMapsLocationUpdater

- (void)dealloc
{
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *v2;

  v2 = self;
  sub_10001E63C();
}

- (void).cxx_destruct
{

  swift_errorRelease(*(_QWORD *)&self->MapsSuggestionsBaseLocationUpdater_opaque[OBJC_IVAR____TtC17GeneralMapsWidget26GeneralMapsLocationUpdater_error]);
}

- (void)onStartImplementation
{
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *v2;

  v2 = self;
  sub_10001F638();

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  id v9;
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *v10;

  v7 = sub_10001FF30();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10001F838(v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v9 = a4;
  v7 = self;
  sub_100020010((uint64_t)v9, v8);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *v10;
  char v11;
  uint64_t v12;

  v5 = type metadata accessor for DispatchPredicate(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = a3;
  v10 = self;
  *v8 = -[GeneralMapsLocationUpdater dispatchQueue](v10, "dispatchQueue");
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v11 = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v11 & 1) != 0)
  {
    -[GeneralMapsLocationUpdater considerMyAllowanceAsLimited:](v10, "considerMyAllowanceAsLimited:", objc_msgSend(v9, "accuracyAuthorization") != 0);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC17GeneralMapsWidget26GeneralMapsLocationUpdater)initWithName:(id)a3 queue:(id)a4
{
  id v4;
  _TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *result;

  v4 = a4;
  result = (_TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *)_swift_stdlib_reportUnimplementedInitializer("GeneralMapsWidget.GeneralMapsLocationUpdater", 44, "init(name:queue:)", 17, 0);
  __break(1u);
  return result;
}

@end
