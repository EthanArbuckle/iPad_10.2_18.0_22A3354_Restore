@implementation WANWActivityTransform

- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithLater:(id)a3 early:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21266D730();
  v5 = sub_21266D730();
  return (_TtC13WiFiAnalytics21WANWActivityTransform *)WANWActivityTransform.init(later:early:)(v4, v5);
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithSingle:(id)a3
{
  uint64_t v3;

  v3 = sub_21266D730();
  return (_TtC13WiFiAnalytics21WANWActivityTransform *)WANWActivityTransform.init(single:)(v3);
}

- (id)getTransformedMeasurementForLogging
{
  _TtC13WiFiAnalytics21WANWActivityTransform *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = (unint64_t)WANWActivityTransform.getTransformedMeasurementForLogging()();

  if (v3)
  {
    v4 = (void *)sub_21266D724();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getTransformedMeasurementForTelemetryWithIndex:(unsigned int)a3
{
  return sub_212584500(self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t (*)(uint64_t))WANWActivityTransform.getTransformedMeasurementForTelemetry(index:));
}

- (id)getTransformedMeasurementWithIndex:(unsigned int)a3
{
  return sub_212584500(self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t (*)(uint64_t))WANWActivityTransform.getTransformedMeasurement(index:));
}

- (id)trimKeyNameLengthsFrom:(id)a3
{
  return sub_212587114(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, _BYTE *))sub_212584590);
}

- (id)expandKeyNameLengthsFrom:(id)a3
{
  return sub_212587114(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, _BYTE *))sub_212585AEC);
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)init
{
  _TtC13WiFiAnalytics21WANWActivityTransform *result;

  result = (_TtC13WiFiAnalytics21WANWActivityTransform *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
