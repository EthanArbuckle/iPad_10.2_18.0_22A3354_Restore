@implementation JSSocialProfileVerticalStackViewController

- (_TtC16MusicApplication42JSSocialProfileVerticalStackViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4038F0();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication42JSSocialProfileVerticalStackViewController *v2;

  v2 = self;
  sub_400660();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication42JSSocialProfileVerticalStackViewController *v6;

  v5 = a3;
  v6 = self;
  sub_401090((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_profileModelResponseInvalidationObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_profileModelResponse));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController____lazy_storage___contextActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController____lazy_storage___contextActionBarButtonItem));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_profileDidUpdateObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_userSocialProfileDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_relationshipButtonController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_pendingFollowRequestsControlEventHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42JSSocialProfileVerticalStackViewController_artistPageControlEventHandler));
}

@end
