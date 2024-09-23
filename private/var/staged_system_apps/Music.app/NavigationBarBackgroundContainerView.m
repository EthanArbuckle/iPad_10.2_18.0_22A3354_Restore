@implementation NavigationBarBackgroundContainerView

- (_TtC5Music36NavigationBarBackgroundContainerView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Music36NavigationBarBackgroundContainerView *result;

  v4 = (char *)self + OBJC_IVAR____TtC5Music36NavigationBarBackgroundContainerView_visibleBackgroundBottom;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC5Music36NavigationBarBackgroundContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NavigationController.swift", 32, 2, 683, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC5Music36NavigationBarBackgroundContainerView *v2;

  v2 = self;
  sub_100864D78();

}

- (_TtC5Music36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
  sub_1000535F0((uint64_t)self, (uint64_t)a2, (uint64_t)"Music.NavigationBarBackgroundContainerView", 42);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music36NavigationBarBackgroundContainerView_backgroundView));
}

@end
