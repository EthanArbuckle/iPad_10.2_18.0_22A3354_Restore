@implementation DisclosureView

- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21A354();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *v2;

  v2 = self;
  sub_2198BC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_219B3C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)firstBaselineFromTop
{
  void *v2;
  _TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_accessoryTextLabel);
  v3 = self;
  objc_msgSend(v2, "firstBaselineFromTop");
  v5 = v4;
  objc_msgSend(v2, "origin");
  v7 = v6;

  return v5 + v7;
}

- (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *result;

  result = (_TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.DisclosureView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_accessoryTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_3A8437458FA0C4629A859D072288700F14DisclosureView_imageView));
}

@end
