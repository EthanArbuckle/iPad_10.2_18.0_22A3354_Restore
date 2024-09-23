@implementation PommesLocationManager

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  _TtC21SiriInformationSearch21PommesLocationManager *v4;
  CLLocationManager v5;
  objc_class *v6;

  v6 = (objc_class *)a3;
  v4 = self;
  v5.super.isa = v6;
  PommesLocationManager.locationManagerDidChangeAuthorization(_:)(v5);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v6;
  _TtC21SiriInformationSearch21PommesLocationManager *v7;
  CLLocationManager v8;
  Swift::OpaquePointer v9;
  objc_class *_;

  type metadata accessor for CNContactStore(0, (unint64_t *)&lazy cache variable for type metadata for CLLocation);
  v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _ = (objc_class *)a3;
  v7 = self;
  v8.super.isa = _;
  v8._internal = v6;
  PommesLocationManager.locationManager(_:didUpdateLocations:)(v8, v9);
  swift_bridgeObjectRelease();

}

- (_TtC21SiriInformationSearch21PommesLocationManager)init
{
  return (_TtC21SiriInformationSearch21PommesLocationManager *)PommesLocationManager.init()();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC21SiriInformationSearch21PommesLocationManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  specialized PommesLocationManager.locationManager(_:didFailWithError:)(v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch21PommesLocationManager____lazy_storage___locationShifter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch21PommesLocationManager____lazy_storage___locationShiftQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch21PommesLocationManager_statusQueue));
  outlined destroy of PommesSearchRequest((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch21PommesLocationManager__status, type metadata accessor for LocationStatus);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch21PommesLocationManager____lazy_storage___manager));
}

@end
