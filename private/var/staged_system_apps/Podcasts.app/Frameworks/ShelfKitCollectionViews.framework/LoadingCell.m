@implementation LoadingCell

- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews11LoadingCell *)sub_13ADA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews11LoadingCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_13B654();
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[LoadingCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews11LoadingCell_spinner];
  if ((objc_msgSend(v3, "isAnimating", v4.receiver, v4.super_class) & 1) == 0)
    objc_msgSend(v3, "startAnimating");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11LoadingCell_spinner));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews11LoadingCell_objectGraph));
}

@end
