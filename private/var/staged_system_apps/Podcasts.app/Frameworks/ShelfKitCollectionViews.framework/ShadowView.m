@implementation ShadowView

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews10ShadowView *v2;

  v2 = self;
  sub_CC904();

}

- (_TtC23ShelfKitCollectionViews10ShadowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerRadius) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerStyle) = 1;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow);
  v9 = (objc_class *)type metadata accessor for ShadowView();
  *v8 = 0u;
  v8[1] = 0u;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ShadowView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews10ShadowView)initWithCoder:(id)a3
{
  _OWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerRadius) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_cornerStyle) = 1;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow);
  v6 = (objc_class *)type metadata accessor for ShadowView();
  *v5 = 0u;
  v5[1] = 0u;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ShadowView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10ShadowView_shadow));
}

@end
