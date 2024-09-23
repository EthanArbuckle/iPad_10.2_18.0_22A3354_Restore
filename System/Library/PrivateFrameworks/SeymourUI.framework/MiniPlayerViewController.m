@implementation MiniPlayerViewController

- (_TtC9SeymourUI24MiniPlayerViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC9SeymourUI24MiniPlayerViewController *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_contentOverlayView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_isPictureInPictureActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_settingsPopoverSourceView) = 0;
  v5 = a3;

  result = (_TtC9SeymourUI24MiniPlayerViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI24MiniPlayerViewController *v2;

  v2 = self;
  sub_22B5B5A9C();

}

- (_TtC9SeymourUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI24MiniPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI24MiniPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_contentOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_settingsPopoverSourceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_miniPlayerView));
}

@end
