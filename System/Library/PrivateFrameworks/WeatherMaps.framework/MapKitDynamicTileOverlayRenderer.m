@implementation MapKitDynamicTileOverlayRenderer

- (void)drawTileAtPath:(id *)a3 withTile:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6
{
  int64_t var0;
  int64_t var1;
  int64_t var2;
  id v11;
  __IOSurface *v12;
  _TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer *v13;

  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_1DBEFBD20(var0, var1, var2, (uint64_t)v11, v12);

}

- (BOOL)isFallbackEnabled
{
  return sub_1DBEFC55C() & 1;
}

- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4
{
  int64_t var0;
  int64_t var1;
  int64_t var2;
  double var3;
  id v9;
  _TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer *v10;

  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  v9 = a4;
  v10 = self;
  LOBYTE(var0) = sub_1DBEFC56C(var0, var1, var2, (uint64_t)v9, var3);

  return var0 & 1;
}

- (void)onVisibleTiles:(id *)a3 count:(int64_t)a4
{
  _TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer *v6;

  v6 = self;
  sub_1DBEFCC70((uint64_t)a3, a4);

}

- (void)didExitTile:(id *)a3
{
  int64_t var0;
  int64_t var1;
  int64_t var2;
  double var3;
  _TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer *v7;

  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  v7 = self;
  sub_1DBEFD14C(var0, var1, var2, var3);

}

- (int64_t)estimatedCostForTile:(id)a3
{
  id v4;
  _TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1DBEFD224((uint64_t)v4);

  return v6;
}

- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithTileOverlay:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEFD304();
}

- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithOverlay:(id)a3
{
  swift_unknownObjectRetain();
  sub_1DBEFD340();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_dynamicOverlay));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_signposter;
  v4 = sub_1DBFF77F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_renderTimer));
  swift_bridgeObjectRelease();
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_delegate);
  v5 = (char *)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_ioSurfaceRefCache;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0331668);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
