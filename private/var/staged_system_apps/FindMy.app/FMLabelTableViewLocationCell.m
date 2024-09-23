@implementation FMLabelTableViewLocationCell

- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMy28FMLabelTableViewLocationCell *)sub_100382504(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100382E18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLabelTableViewLocationCell_locationView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->locationView[OBJC_IVAR____TtC6FindMy28FMLabelTableViewLocationCell_displayAddress]);
}

@end
