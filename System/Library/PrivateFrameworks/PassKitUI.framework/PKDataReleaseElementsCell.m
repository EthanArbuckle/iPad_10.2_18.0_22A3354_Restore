@implementation PKDataReleaseElementsCell

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)dataReleaseConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration);
  swift_beginAccess();
  return (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)*v2;
}

- (void)setDataReleaseConfiguration:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC9PassKitUI25PKDataReleaseElementsCell *v8;

  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_19D6C6220();
}

- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC9PassKitUI25PKDataReleaseElementsCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_19DE87BF4();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
    a4 = (id)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PKDataReleaseElementsCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[PKDataReleaseElementsCell initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration));
}

@end
