@implementation ChannelUberCollectionViewCell

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_43FB4(a3);

}

- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_innerView);
  *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_currentModel) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_sizeClass) = 8;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_objectGraph) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[UberCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell *)sub_44398(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_innerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_currentModel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29ChannelUberCollectionViewCell_objectGraph));
}

@end
