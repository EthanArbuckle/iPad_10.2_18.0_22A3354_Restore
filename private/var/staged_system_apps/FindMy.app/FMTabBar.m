@implementation FMTabBar

- (void)layoutSubviews
{
  _TtC6FindMy8FMTabBar *v2;

  v2 = self;
  sub_10001C7E0();

}

- (UITraitCollection)traitCollection
{
  _TtC6FindMy8FMTabBar *v2;
  id v3;

  v2 = self;
  v3 = sub_10005B144();

  return (UITraitCollection *)v3;
}

- (_TtC6FindMy8FMTabBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001D7C28();
}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy8FMTabBar *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001D819C((uint64_t)v7);

}

- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4
{
  id v5;
  _TtC6FindMy8FMTabBar *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1001D83C0();

  return v7;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  id v7;
  _TtC6FindMy8FMTabBar *v8;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001D85C0();

  swift_unknownObjectRelease(a4);
}

- (_TtC6FindMy8FMTabBar)initWithFrame:(CGRect)a3
{
  _TtC6FindMy8FMTabBar *result;

  result = (_TtC6FindMy8FMTabBar *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMTabBar", 15, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy8FMTabBar_contentDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy8FMTabBar_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy8FMTabBar_peopleSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy8FMTabBar_devicesSubscription));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy8FMTabBar_selectionSubscription));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy8FMTabBar____lazy_storage___largeContentInteraction));
}

@end
