@implementation FMUnknownItemsLandingViewController

- (_TtC6FindMy35FMUnknownItemsLandingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10022D018();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  v2 = v3.receiver;
  -[FMBaseContentViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10022AABC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  v4 = v5.receiver;
  -[FMUnknownItemsLandingViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_10022A72C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  -[FMUnknownItemsLandingViewController viewWillAppear:](&v4, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  v4 = v7.receiver;
  -[FMUnknownItemsLandingViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = objc_msgSend(v5, "defaultCenter", v7.receiver, v7.super_class);
  if (qword_1005D20D8 != -1)
    swift_once(&qword_1005D20D8, sub_10005D2D8);
  objc_msgSend(v6, "removeObserver:name:object:", v4, qword_1005F61F8, 0);

}

- (void)viewLayoutMarginsDidChange
{
  _TtC6FindMy35FMUnknownItemsLandingViewController *v2;

  v2 = self;
  sub_10022A4E4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[FMBaseContentViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10022AABC();

}

- (void)handleButtonTap:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC6FindMy35FMUnknownItemsLandingViewController *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_100388900();

    swift_unknownObjectRelease(v6);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_heroImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_secondarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_spacerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_searchButtonTopConstraint));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_cardChangeSubscription));
}

@end
