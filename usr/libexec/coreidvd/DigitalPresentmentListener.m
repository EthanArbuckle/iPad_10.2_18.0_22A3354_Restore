@implementation DigitalPresentmentListener

- (void)dealloc
{
  _TtC8coreidvd26DigitalPresentmentListener *v2;

  v2 = self;
  sub_1003BA068();
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];

  v3 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 96];
  v8[6] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 80];
  v8[7] = v3;
  v4 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 128];
  v8[8] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 112];
  v8[9] = v4;
  v5 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 32];
  v8[2] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 16];
  v8[3] = v5;
  v6 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                     + 64];
  v8[4] = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment
                                                        + 48];
  v8[5] = v6;
  v7 = *(_OWORD *)&self->digitalPresentmentEnvironment[OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC8coreidvd26DigitalPresentmentListener_digitalPresentmentEnvironment);
  v8[1] = v7;
  sub_10002EF3C((uint64_t *)v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd26DigitalPresentmentListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1003BDD5C(v7);

  return v9 & 1;
}

- (_TtC8coreidvd26DigitalPresentmentListener)init
{
  _TtC8coreidvd26DigitalPresentmentListener *result;

  result = (_TtC8coreidvd26DigitalPresentmentListener *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DigitalPresentmentListener", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
