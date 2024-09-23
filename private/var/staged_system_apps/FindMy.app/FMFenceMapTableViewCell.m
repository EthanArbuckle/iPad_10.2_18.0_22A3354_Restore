@implementation FMFenceMapTableViewCell

- (void)prepareForReuse
{
  _TtC6FindMy23FMFenceMapTableViewCell *v2;

  v2 = self;
  sub_100336BB8();

}

- (void)layoutSubviews
{
  _TtC6FindMy23FMFenceMapTableViewCell *v2;

  v2 = self;
  sub_100336CD8();

}

- (_TtC6FindMy23FMFenceMapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC6FindMy23FMFenceMapTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMFenceMapTableViewCell();
  v9 = -[FMFenceMapTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC6FindMy23FMFenceMapTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFenceMapTableViewCell();
  return -[FMFenceMapTableViewCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record));
}

@end
