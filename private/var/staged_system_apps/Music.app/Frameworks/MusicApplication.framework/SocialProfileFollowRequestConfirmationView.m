@implementation SocialProfileFollowRequestConfirmationView

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)init
{
  return (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *)sub_AAF9C();
}

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AC5C0();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *v2;

  v2 = self;
  sub_AB898();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_ABC40(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *v6;

  v5 = a3;
  v6 = self;
  sub_ABEA0((uint64_t)a3);

}

- (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *result;

  result = (_TtC16MusicApplication42SocialProfileFollowRequestConfirmationView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialProfileFollowRequestConfirmationView", 59, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->followerName[OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_followerName]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptButtonHandler), *(_QWORD *)&self->followerName[OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineButtonHandler), *(_QWORD *)&self->followerName[OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_titleCompositingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_acceptActionEventHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42SocialProfileFollowRequestConfirmationView_declineActionEventHandler));
}

@end
