@implementation AppResultsViewFeedbackDelegate

- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4
{
  id v6;
  _TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate *v7;

  if (a3)
    sub_2460AD0F4();
  v6 = a4;
  v7 = self;
  sub_2460A5600();
}

- (void)lockupViewEngagedForAppIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate *v7;

  if (a3)
  {
    v4 = sub_2460AD0F4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_2460A589C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate *v9;

  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_5;
    goto LABEL_3;
  }
  v6 = sub_2460AD0F4();
  v8 = v7;
  if (a4)
LABEL_3:
    sub_2460AD0F4();
LABEL_5:
  v9 = self;
  sub_2460A5AFC(v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate)init
{
  sub_2460A5D94();
}

- (void).cxx_destruct
{
  sub_2460A6610(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler));
}

@end
