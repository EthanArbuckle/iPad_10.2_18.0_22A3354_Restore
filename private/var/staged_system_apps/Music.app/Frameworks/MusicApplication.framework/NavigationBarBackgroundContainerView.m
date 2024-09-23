@implementation NavigationBarBackgroundContainerView

- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16MusicApplication36NavigationBarBackgroundContainerView *result;

  v4 = (char *)self + OBJC_IVAR____TtC16MusicApplication36NavigationBarBackgroundContainerView_visibleBackgroundBottom;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC16MusicApplication36NavigationBarBackgroundContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NavigationController.swift", 43, 2, 683, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication36NavigationBarBackgroundContainerView *v2;

  v2 = self;
  sub_3B8D88();

}

- (_TtC16MusicApplication36NavigationBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.NavigationBarBackgroundContainerView", 53);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36NavigationBarBackgroundContainerView_backgroundView));
}

@end
