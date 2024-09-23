@implementation SafariSheetModifier.SafariPresenter.Coordinator

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_100139C98((uint64_t)a3);

}

- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002C8F04();
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4;
  _TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1002C913C();

}

- (_TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1002C91B0();
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;

  sub_100021AA4((uint64_t)self+ OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_initialURL, &qword_100BD4280);
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_wantsPresentation);
  swift_release(*(_QWORD *)&self->wantsPresentation[OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_wantsPresentation]);
  swift_release(v3);
  v4 = (char *)self
     + OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_colorScheme;
  v5 = type metadata accessor for ColorScheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVV7WeatherP33_6F14ACE14E05F94F19B7002A2956129619SafariSheetModifier15SafariPresenter11Coordinator_safariViewController));
}

@end
