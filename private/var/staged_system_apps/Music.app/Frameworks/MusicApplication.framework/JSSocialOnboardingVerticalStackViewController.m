@implementation JSSocialOnboardingVerticalStackViewController

- (_TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_397F98();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController *v4;

  v4 = self;
  sub_391C28(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSSocialOnboardingVerticalStackViewController();
  v4 = v8.receiver;
  -[VerticalStackViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "presentingViewController", v8.receiver, v8.super_class);

  if (v5)
  {
    v6 = objc_msgSend(v4, "navigationController");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setModalInPresentation:", 1);

      v4 = v7;
    }
  }

}

- (void)viewDidLoad
{
  _TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController *v2;

  v2 = self;
  sub_391E5C();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController *v2;

  v2 = self;
  sub_392D24();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_promotionalParallaxViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController____lazy_storage___impressionsTracker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_onboardingVerticalStack));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_viewModelKindToViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController_pinnedButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController____lazy_storage___nextStepButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSSocialOnboardingVerticalStackViewController____lazy_storage___cancelStepButton));
}

@end
