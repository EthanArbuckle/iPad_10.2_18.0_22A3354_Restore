@implementation MapKitDynamicTileOverlay

- (void)loadTileAtPath:(id *)a3 result:(id)a4
{
  int64_t var0;
  int64_t var1;
  int64_t var2;
  double var3;
  void *v9;
  _TtC11WeatherMaps24MapKitDynamicTileOverlay *v10;

  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  v9 = _Block_copy(a4);
  _Block_copy(v9);
  v10 = self;
  sub_1DBFA4648(var0, var1, var2, v10, (void (**)(_QWORD, _QWORD, _QWORD))v9, var3);
  _Block_release(v9);

}

- (void)cancelLoadingTileAtPath:(id *)a3
{
  int64_t var0;
  _TtC11WeatherMaps24MapKitDynamicTileOverlay *v4;

  var0 = a3->var0;
  v4 = self;
  sub_1DBFA5298(var0);

}

- (_TtC11WeatherMaps24MapKitDynamicTileOverlay)init
{
  sub_1DBFA5524();
}

- (void).cxx_destruct
{
  _BYTE v3[192];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_overlayDescriptor, sizeof(v3));
  sub_1DBF3B64C((uint64_t)v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_1DBEFD738((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_timeConfiguration);

  sub_1DBEAB908(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose), *(_QWORD *)((char *)&self->super._providerID + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose), *((_BYTE *)&self->super._minimumZ + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose));
}

@end
