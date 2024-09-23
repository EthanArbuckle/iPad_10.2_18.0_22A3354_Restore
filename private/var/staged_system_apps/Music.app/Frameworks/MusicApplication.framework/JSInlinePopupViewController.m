@implementation JSInlinePopupViewController

- (_TtC16MusicApplication27JSInlinePopupViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_74DA0C();
}

- (NSString)title
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v2 = v9.receiver;
  v3 = -[JSInlinePopupViewController title](&v9, "title");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16MusicApplication27JSInlinePopupViewController *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_74A4E0(v4, v6);

}

- (void)viewDidLoad
{
  _TtC16MusicApplication27JSInlinePopupViewController *v2;

  v2 = self;
  sub_74A950();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication27JSInlinePopupViewController *v4;

  v4 = self;
  sub_74B1F8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication27JSInlinePopupViewController *v4;

  v4 = self;
  sub_74B2D0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicApplication27JSInlinePopupViewController *v4;

  v4 = self;
  sub_74B398(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication27JSInlinePopupViewController *v4;

  v4 = self;
  sub_74B470(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27JSInlinePopupViewController *v2;

  v2 = self;
  sub_74B538();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[JSInlinePopupViewController didMoveToParentViewController:](&v6, "didMoveToParentViewController:", v4);
  sub_74BB08();

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[JSInlinePopupViewController music_viewInheritedLayoutInsetsDidChange](&v3, "music_viewInheritedLayoutInsetsDidChange");
  sub_74BD8C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication27JSInlinePopupViewController *v6;

  v5 = a3;
  v6 = self;
  sub_74C214(a3);

}

- (MPButton)accessibilityCloseButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_closeButton));
}

- (UIView)accessibilityContainerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_containerView));
}

- (_TtC16MusicApplication27JSInlinePopupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27JSInlinePopupViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27JSInlinePopupViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSInlinePopupViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_inlinePopup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_closeButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_titleHeaderView));
  sub_74D1D4(*(unint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_contentKind), *(void **)&self->inlinePopup[OBJC_IVAR____TtC16MusicApplication27JSInlinePopupViewController_contentKind]);
}

@end
