@implementation FMTrustedLocationDetailViewController

- (_TtC6FindMy37FMTrustedLocationDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003FD2E8();
}

- (void)viewDidLoad
{
  _TtC6FindMy37FMTrustedLocationDetailViewController *v2;

  v2 = self;
  sub_1003F7350();

}

- (void)doneAction
{
  -[FMTrustedLocationDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_heightConstraint));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_trustedLocationsDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_trustedLocationsSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_suggestionsSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_nonMeDescriptionPadView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_assignedSafeLocations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_suggestedSafeLocations));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_beaconUUID]);
}

@end
