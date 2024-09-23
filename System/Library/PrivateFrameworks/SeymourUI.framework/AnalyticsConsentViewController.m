@implementation AnalyticsConsentViewController

- (void)viewDidLoad
{
  _TtC9SeymourUI30AnalyticsConsentViewController *v2;

  v2 = self;
  AnalyticsConsentViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B29CCBC();
  sub_22BA7DC94();

}

- (void)didTapLearnMoreButton
{
  _TtC9SeymourUI30AnalyticsConsentViewController *v2;

  v2 = self;
  sub_22B29CE70();

}

- (void)didTapOptInButton
{
  sub_22B29D518((char *)self, (uint64_t)a2, 1);
}

- (void)didTapOptOutButton
{
  sub_22B29D518((char *)self, (uint64_t)a2, 0);
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3
{
  _TtC9SeymourUI30AnalyticsConsentViewController *result;

  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SeymourUI30AnalyticsConsentViewController *result;

  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SeymourUI30AnalyticsConsentViewController *result;

  v6 = a5;
  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_privacyPreferenceClient);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_onConsent));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_onDismiss));
}

@end
