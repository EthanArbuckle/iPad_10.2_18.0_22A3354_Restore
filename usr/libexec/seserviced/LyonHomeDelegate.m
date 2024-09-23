@implementation LyonHomeDelegate

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v4;
  _TtC10seserviced16LyonHomeDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10015562C(v4);

}

- (_TtC10seserviced16LyonHomeDelegate)init
{
  _TtC10seserviced16LyonHomeDelegate *result;

  result = (_TtC10seserviced16LyonHomeDelegate *)_swift_stdlib_reportUnimplementedInitializer("seserviced.LyonHomeDelegate", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->homeUUID[OBJC_IVAR____TtC10seserviced16LyonHomeDelegate_homeUUID]);
}

@end
