@implementation PaletteBackgroundView

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  v2 = (char *)v14.receiver;
  -[PaletteBackgroundView layoutSubviews](&v14, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "contentView", v14.receiver, v14.super_class);
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    v2 = v4;
  }

}

- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithEffect:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return -[PaletteBackgroundView initWithEffect:](&v5, "initWithEffect:", a3);
}

- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return -[PaletteBackgroundView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView));
}

@end
