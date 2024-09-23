@implementation ErrorPresenter

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4;
  _TtC8ShelfKit14ErrorPresenter *v5;

  v4 = a3;
  v5 = self;
  ErrorPresenter.update()();

}

- (_TtC8ShelfKit14ErrorPresenter)init
{
  _TtC8ShelfKit14ErrorPresenter *result;

  result = (_TtC8ShelfKit14ErrorPresenter *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.ErrorPresenter", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit14ErrorPresenter_networkObserver));

  sub_6FC38((uint64_t)self + OBJC_IVAR____TtC8ShelfKit14ErrorPresenter_view);
  swift_errorRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit14ErrorPresenter_error));
}

@end
