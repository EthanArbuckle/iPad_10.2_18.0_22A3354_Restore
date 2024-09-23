@implementation FMLostModeFeaturesListView

- (_TtC6FindMy26FMLostModeFeaturesListView)init
{
  uint64_t v3;
  id v4;
  _TtC6FindMy26FMLostModeFeaturesListView *v5;
  _TtC6FindMy26FMLostModeFeaturesListView *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for FMLostModeFeaturesListView();
  v6 = -[FMSymbolBulletedListView init](&v8, "init");
  sub_10032C174();
  sub_10032C29C();

  return v6;
}

- (_TtC6FindMy26FMLostModeFeaturesListView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy26FMLostModeFeaturesListView *result;

  v5 = OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy26FMLostModeFeaturesListView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLostModeFeaturesListView.swift", 39, 2, 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMLostModeFeaturesListView_featureDisclosureLabel));
}

@end
