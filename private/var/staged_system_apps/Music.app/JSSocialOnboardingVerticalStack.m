@implementation JSSocialOnboardingVerticalStack

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100231E18(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_pinnedChildViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_nextStepButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_cancelStepButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSocialOnboardingVerticalStack_cancelBarButtonItem));
}

@end
