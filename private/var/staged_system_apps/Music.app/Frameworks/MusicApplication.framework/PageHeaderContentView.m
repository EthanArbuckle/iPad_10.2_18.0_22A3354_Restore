@implementation PageHeaderContentView

- (_TtC16MusicApplication21PageHeaderContentView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21PageHeaderContentView *)sub_77DBBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21PageHeaderContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_780D7C();
}

- (UIView)accessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView));
}

- (void)setAccessoryView:(id)a3
{
  id v4;
  _TtC16MusicApplication21PageHeaderContentView *v5;
  id v6;

  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView) = (Class)a3;
  v4 = a3;
  v5 = self;
  sub_77E1D4(v6);

}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_title);
}

- (void)setTitle:(id)a3
{
  sub_77E3A4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_77E3A4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_subtitle);
}

- (NSString)supertitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_supertitle);
}

- (void)setSupertitle:(id)a3
{
  sub_77E3A4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_supertitle);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication21PageHeaderContentView *v2;

  v2 = self;
  sub_77E934();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication21PageHeaderContentView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[PageHeaderContentView traitCollection](v4, "traitCollection");
  v6 = sub_77F6E0(v5, width);

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PageHeaderContentView();
  v2 = v3.receiver;
  -[PageHeaderContentView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication21PageHeaderContentView *v6;

  v5 = a3;
  v6 = self;
  sub_77FA04((uint64_t)a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC16MusicApplication21PageHeaderContentView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_77FB68((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_pageHeaderContentViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_leadingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_leadingSizingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_gradientView));
}

@end
