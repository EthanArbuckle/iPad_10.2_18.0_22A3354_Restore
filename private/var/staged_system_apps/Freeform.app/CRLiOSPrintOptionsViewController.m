@implementation CRLiOSPrintOptionsViewController

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo));
}

- (void)setPrintInfo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo) = (Class)a3;
  v3 = a3;

}

- (NSString)summary
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->printInfo[OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_summary];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setSummary:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_summary);
  v6 = *(_QWORD *)&self->printInfo[OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_summary];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1009FE03C();
}

- (void)viewDidLoad
{
  _TtC8Freeform32CRLiOSPrintOptionsViewController *v2;

  v2 = self;
  sub_1009FB7B0();

}

- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform32CRLiOSPrintOptionsViewController *result;

  v4 = a4;
  result = (_TtC8Freeform32CRLiOSPrintOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPrintOptionsViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo));
  swift_bridgeObjectRelease(*(_QWORD *)&self->printInfo[OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_summary]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_hostingController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->printInfo[OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printScenesSummaryMessage]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->printInfo[OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printBoardSummaryMessage]);
}

@end
