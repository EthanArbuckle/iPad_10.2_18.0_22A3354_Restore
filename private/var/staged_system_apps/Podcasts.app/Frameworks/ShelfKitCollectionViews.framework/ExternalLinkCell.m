@implementation ExternalLinkCell

- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ExternalLinkCell *)sub_216344(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2170B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[ExternalLinkCell traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  objc_msgSend(v5, "setNeedsUpdateConstraints", v6.receiver, v6.super_class);

}

- (void)updateConstraints
{
  id v2;
  id v3;
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[ExternalLinkCell updateConstraints](&v6, "updateConstraints");
  v3 = sub_216214();
  v4 = objc_msgSend(v2, "traitCollection", v6.receiver, v6.super_class);
  v5 = (char *)objc_msgSend(v4, "horizontalSizeClass");

  objc_msgSend(v3, "setActive:", v5 == (_BYTE *)&dword_0 + 1);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell_listContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell____lazy_storage___iconForcedToTrailingEdgeConstraint));
}

@end
