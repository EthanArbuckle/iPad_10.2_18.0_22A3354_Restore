@implementation TTRGeoLocationService

- (_TtC15RemindersUICore21TTRGeoLocationService)init
{
  _TtC15RemindersUICore21TTRGeoLocationService *result;

  result = (_TtC15RemindersUICore21TTRGeoLocationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__addressToResolvedLocationCache;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4ECD58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__locationToResolvedLocationCache;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4ECD70);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1B4361770(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation], *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation + 8], *(_QWORD *)&self->locationAccuracyUpperBound[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation]);
  v7 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__lastKnownCurrentLocation;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4ECD80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_locationManager));
  sub_1B41E1CB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_blockToPerformAfterRequestingInUseAuthorization));
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  objc_class *v4;
  CLLocationManager v5;
  id internal;

  v4 = (objc_class *)a3;
  v5._internal = self;
  internal = v5._internal;
  v5.super.isa = v4;
  TTRGeoLocationService.locationManagerDidChangeAuthorization(_:)(v5);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC15RemindersUICore21TTRGeoLocationService *v8;

  sub_1B41DF50C(0, (unint64_t *)&unk_1ED4ECE90);
  v6 = sub_1B4906DAC();
  v7 = a3;
  v8 = self;
  sub_1B468BD2C(v6);

  swift_bridgeObjectRelease();
}

@end
