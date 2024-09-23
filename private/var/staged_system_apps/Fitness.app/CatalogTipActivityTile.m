@implementation CatalogTipActivityTile

- (_TtC10FitnessApp22CatalogTipActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp22CatalogTipActivityTile *)sub_100011DA0(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp22CatalogTipActivityTile)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A97F8();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  objc_class *v6;
  _TtC10FitnessApp22CatalogTipActivityTile *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];
  objc_super v13;

  v3 = sub_100047110(&qword_1008283F8);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (objc_class *)type metadata accessor for CatalogTipActivityTile(0);
  v13.receiver = self;
  v13.super_class = v6;
  v7 = self;
  -[CatalogTipActivityTile prepareForReuse](&v13, "prepareForReuse");
  v8 = type metadata accessor for CatalogTipSectionItem(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_tipSectionItem;
  swift_beginAccess((char *)v7 + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_tipSectionItem, v12, 33, 0);
  sub_10004EEF4((uint64_t)v5, v9);
  v10 = swift_endAccess(v12);
  dispatch thunk of CatalogTipPlainView.prepareForReuse()(v10);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_catalogTipView));
  sub_1002A97B8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_tipSectionItem);
}

@end
