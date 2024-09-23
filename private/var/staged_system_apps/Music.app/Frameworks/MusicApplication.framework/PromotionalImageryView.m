@implementation PromotionalImageryView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[PromotionalImageryView layoutSubviews](&v3, "layoutSubviews");
  sub_24C108(0);

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
  -[PromotionalImageryView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  objc_msgSend(v5, "setNeedsLayout", v6.receiver, v6.super_class);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC16MusicApplication22PromotionalImageryView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_24C4DC((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MusicApplication22PromotionalImageryView)initWithFrame:(CGRect)a3
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
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_promotionalParallaxContentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_upsellBannerView) = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_normalizedContentOffset);
  *v9 = 0;
  v9[1] = 0;
  *(UIOffset *)((char *)&self->super.super.super.isa
              + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_contentInsetAdditions) = UIOffsetZero;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[PromotionalImageryView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication22PromotionalImageryView)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication22PromotionalImageryView *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication22PromotionalImageryView *)sub_24C92C((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_promotionalParallaxContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_upsellBannerView));
}

@end
