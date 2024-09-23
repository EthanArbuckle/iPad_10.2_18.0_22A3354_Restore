@implementation PKDataReleaseElementsTransactionCell

- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)dataReleaseConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC9PassKitUI36PKDataReleaseElementsTransactionCell_dataReleaseConfiguration);
  swift_beginAccess();
  return (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *)*v2;
}

- (void)setDataReleaseConfiguration:(id)a3
{
  _TtC9PassKitUI36PKDataReleaseElementsTransactionCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_19D80BEA8(a3);

}

- (_TtC9PassKitUI36PKDataReleaseElementsTransactionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC9PassKitUI36PKDataReleaseElementsTransactionCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_19DE87BF4();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI36PKDataReleaseElementsTransactionCell_dataReleaseConfiguration) = 0;
    a4 = (id)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI36PKDataReleaseElementsTransactionCell_dataReleaseConfiguration) = 0;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PKDataReleaseElementsTransactionCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC9PassKitUI36PKDataReleaseElementsTransactionCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI36PKDataReleaseElementsTransactionCell_dataReleaseConfiguration) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[PKDataReleaseElementsTransactionCell initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36PKDataReleaseElementsTransactionCell_dataReleaseConfiguration));
}

@end
