@implementation TVRemoteParticipantCell

- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23TVRemoteParticipantCell *)sub_22B3595B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23TVRemoteParticipantCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B35B76C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI23TVRemoteParticipantCell *v2;

  v2 = self;
  sub_22B359FF4();

}

- (void)prepareForReuse
{
  _TtC9SeymourUI23TVRemoteParticipantCell *v2;

  v2 = self;
  sub_22B35A0CC();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI23TVRemoteParticipantCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B35AB4C(v6, v7);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_titleLabel));
}

- (_TtC9SeymourUI15DeviceBadgeView)accessibilityDeviceBadgeView
{
  return (_TtC9SeymourUI15DeviceBadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_deviceBadgeView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super._swiftAnimationInfo
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_monogramButtonContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_monogramButton));
  swift_bridgeObjectRelease();
  sub_22B35B62C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_type);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVRemoteParticipantCell_deviceBadgeView));
}

@end
