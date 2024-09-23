@implementation TTRLocationChangeMonitor

- (void)dealloc
{
  _TtC15RemindersUICore24TTRLocationChangeMonitor *v2;

  v2 = self;
  TTRLocationChangeMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B4229360(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_lastResult), self->locationChange[OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_lastResult]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_locationManager));
  swift_release();

}

- (_TtC15RemindersUICore24TTRLocationChangeMonitor)init
{
  _TtC15RemindersUICore24TTRLocationChangeMonitor *result;

  result = (_TtC15RemindersUICore24TTRLocationChangeMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
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
  TTRLocationChangeMonitor.locationManagerDidChangeAuthorization(_:)(v5);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC15RemindersUICore24TTRLocationChangeMonitor *v8;

  sub_1B41DF50C(0, (unint64_t *)&unk_1ED4ECE90);
  v6 = sub_1B4906DAC();
  v7 = a3;
  v8 = self;
  sub_1B4229404(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC15RemindersUICore24TTRLocationChangeMonitor *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1B42295D4((uint64_t)v8);

}

@end
