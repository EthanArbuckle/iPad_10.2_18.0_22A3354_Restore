@implementation NotificationConsentViewController

- (_TtC9SeymourUI33NotificationConsentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s9SeymourUI33NotificationConsentViewControllerC5coderACSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI33NotificationConsentViewController *v2;

  v2 = self;
  NotificationConsentViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI33NotificationConsentViewController *v6;
  _TtC9SeymourUI33NotificationConsentViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  NotificationConsentViewController.traitCollectionDidChange(_:)(v8);

}

- (void)didTapContinueButton
{
  _TtC9SeymourUI33NotificationConsentViewController *v2;

  v2 = self;
  sub_22B95AC14();

}

- (_TtC9SeymourUI33NotificationConsentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI33NotificationConsentViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI33NotificationConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_continueButton));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_contentAvailability;
  v4 = sub_22BA7B588();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_fallbackLocalizationBundle));
  sub_22B95BB10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_storefrontLocalizer);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_continueButtonHandler));
  v5 = (char *)self
     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController__fitnessPlusNotificationSettingsEnabled;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
