@implementation DetailHeader.PlaylistVisibilitySwitchContainerView

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView *)sub_67EA10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_680320();
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView *v2;

  v2 = self;
  sub_67ECC4();

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 56.0;
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 56.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_title]);
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_textComponents);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_textComponents]);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_switchButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_textStackView));
}

@end
