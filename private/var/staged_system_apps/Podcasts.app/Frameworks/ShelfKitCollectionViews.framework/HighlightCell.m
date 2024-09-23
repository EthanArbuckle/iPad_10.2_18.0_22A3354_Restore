@implementation HighlightCell

- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC23ShelfKitCollectionViews13HighlightCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_highlightView;
  v10 = objc_allocWithZone((Class)SLAttributionView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, "init");
  *(Class *)((char *)&v11->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_objectGraph) = 0;

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[HighlightCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_FD318();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_highlightView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_objectGraph));
}

@end
