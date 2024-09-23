@implementation DOCProgressCollectionIndicatorPresenterView

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4;
  _TtC5Files43DOCProgressCollectionIndicatorPresenterView *v5;

  v4 = a3;
  v5 = self;
  sub_100407CD4(v4);

}

- (_TtC5Files43DOCProgressCollectionIndicatorPresenterView)initWithFrame:(CGRect)a3
{
  _TtC5Files43DOCProgressCollectionIndicatorPresenterView *result;

  result = (_TtC5Files43DOCProgressCollectionIndicatorPresenterView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionIndicatorPresenterView", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files43DOCProgressCollectionIndicatorPresenterView_progressSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files43DOCProgressCollectionIndicatorPresenterView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files43DOCProgressCollectionIndicatorPresenterView_progressIndicatorView));
}

@end
