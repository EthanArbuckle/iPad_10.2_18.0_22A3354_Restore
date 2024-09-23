@implementation SplitViewController.PaletteViewController

- (_TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_45E220();
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController *v2;

  v2 = self;
  sub_459250();

}

- (void)viewDidLayoutSubviews
{
  _TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController *v2;

  v2 = self;
  sub_459528();

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController *v2;

  v2 = self;
  sub_459610();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController.PaletteViewController();
  v2 = v3.receiver;
  -[SplitViewController.PaletteViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  sub_45A69C();

}

- (int64_t)preferredStatusBarStyle
{
  _TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_4597AC();

  return v3;
}

- (_TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.PaletteViewController", 38);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController_contentNavigationController));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController_onWillNavigateToViewController), *(_QWORD *)&self->contentNavigationController[OBJC_IVAR____TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController_onWillNavigateToViewController]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController_accessoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19SplitViewControllerP33_7A1626E95DCA8A4D36C577E39B8D78C121PaletteViewController____lazy_storage___accessoryContainerView));
}

@end
