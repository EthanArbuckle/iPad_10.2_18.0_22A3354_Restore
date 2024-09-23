@implementation FMContactDetailsWelcomeScreenViewController

- (_TtC6FindMy43FMContactDetailsWelcomeScreenViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DB360();
}

- (void)viewDidLoad
{
  _TtC6FindMy43FMContactDetailsWelcomeScreenViewController *v2;

  v2 = self;
  sub_1001D8D00();

}

- (void)doneAction
{
  _TtC6FindMy43FMContactDetailsWelcomeScreenViewController *v2;

  v2 = self;
  sub_1001DA4BC((uint64_t)v2);

}

- (void)cancelActionWithSender:(id)a3
{
  -[FMContactDetailsWelcomeScreenViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_contentStackView));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_deviceNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_phoneNumberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_showContactDetailsSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_showContactDetailsSwitch));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_productImageCancellable));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_device;
  v4 = type metadata accessor for FMIPDevice(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
