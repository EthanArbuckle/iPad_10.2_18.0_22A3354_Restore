@implementation ShazamMatcher.ThrottledSubscriber

- (_TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber)init
{
  _TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber *result;

  result = (_TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_session));
  v3 = (char *)self
     + OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_logger;
  v4 = sub_1A93F7698();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_workQueue));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_currentInput));
  sub_1A905FD54((uint64_t)self+ OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_subscription, &qword_1ED2A90E8);
  sub_1A9173164(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber_completion));
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v6;
  id v7;
  _TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9173C18(v7);

}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCC18PodcastsFoundation13ShazamMatcherP33_02683B609352F691B94A08829495C57A19ThrottledSubscriber *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1A9173E9C(a5);

}

@end
