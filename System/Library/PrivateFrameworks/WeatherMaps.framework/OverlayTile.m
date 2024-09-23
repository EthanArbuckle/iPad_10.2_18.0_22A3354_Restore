@implementation OverlayTile

- (_TtC11WeatherMaps11OverlayTile)init
{
  sub_1DBEB03F8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WeatherMaps11OverlayTile *v4;
  _TtC11WeatherMaps11OverlayTile *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DBFF8B18();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1DBEB04AC((uint64_t)v8);

  sub_1DBEB05B8((uint64_t)v8);
  return v6;
}

@end
