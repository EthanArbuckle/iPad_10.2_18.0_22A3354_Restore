@implementation JSAppleMusicSubscription

- (void)refreshAppleMusicSubscriptionStatusWithJsCallback:(id)a3
{
  id v4;
  _TtC8VideosUI24JSAppleMusicSubscription *v5;

  v4 = a3;
  v5 = self;
  sub_1D9EA673C(v4);

}

- (void)musicSubscriptionStatusHasChanged
{
  _TtC8VideosUI24JSAppleMusicSubscription *v2;

  v2 = self;
  sub_1D9EA6D84();

}

- (_TtC8VideosUI24JSAppleMusicSubscription)initWithAppContext:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9EA6F84();
}

- (_TtC8VideosUI24JSAppleMusicSubscription)init
{
  sub_1D9EA6FC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24JSAppleMusicSubscription_musicSubscriptionStatusController));
}

@end
