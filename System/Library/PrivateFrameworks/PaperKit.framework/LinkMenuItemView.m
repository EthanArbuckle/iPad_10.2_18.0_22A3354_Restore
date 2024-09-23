@implementation LinkMenuItemView

- (_TtC8PaperKit16LinkMenuItemView)initWithCoder:(id)a3
{
  id v5;
  _TtC8PaperKit16LinkMenuItemView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___subtitleLabel) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC8PaperKit16LinkMenuItemView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tapGestureHandler:(id)a3
{
  id v5;
  _TtC8PaperKit16LinkMenuItemView *v6;

  if (MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    PKPaperTextViewLinkingController.linkMenuItemViewDidReceiveTap(_:)();

    swift_unknownObjectRelease();
  }
}

- (_TtC8PaperKit16LinkMenuItemView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit16LinkMenuItemView *result;

  result = (_TtC8PaperKit16LinkMenuItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView____lazy_storage___subtitleLabel));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit16LinkMenuItemView_delegate);
  swift_unknownObjectRelease();
}

@end
