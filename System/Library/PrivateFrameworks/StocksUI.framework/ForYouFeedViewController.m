@implementation ForYouFeedViewController

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[ForYouFeedViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);
  sub_1DC404048();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[ForYouFeedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8StocksUI24ForYouFeedViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DC0D34A0((uint64_t)a3);

}

- (int64_t)preferredStatusBarStyle
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  _TtC8StocksUI24ForYouFeedViewController *v13;
  int64_t v14;
  uint64_t v16;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_styler);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, __n128))(v7 + 16))((char *)&v16 - v9, v8);
  v11 = *(_QWORD *)(v5 + 16);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8StocksUI24ForYouFeedViewController *v4;

  v4 = self;
  sub_1DC092714(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[ForYouFeedViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  sub_1DC081B48((unint64_t *)&unk_1EDB27F10, v5, (uint64_t (*)(uint64_t))type metadata accessor for ForYouFeedViewController, (uint64_t)&unk_1DC42C5C4);
  sub_1DC402590();

}

- (void)viewDidLoad
{
  _TtC8StocksUI24ForYouFeedViewController *v2;

  v2 = self;
  sub_1DC0B30F0();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8StocksUI24ForYouFeedViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC40403C();
  sub_1DC091B18();

}

- (_TtC8StocksUI24ForYouFeedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC382A8C();
}

- (_TtC8StocksUI24ForYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI24ForYouFeedViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI24ForYouFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_cardViewScrollViewCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_statusBarView));
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_keyboardInputMonitor);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_watchlistManager);
  swift_bridgeObjectRelease();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[ForYouFeedViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  swift_getObjectType();
  sub_1DC404D8C();
  v4[OBJC_IVAR____TtC8StocksUI24ForYouFeedViewController_toolbarTitleIsHidden] = 1;
  sub_1DC081B48((unint64_t *)&unk_1EDB27F10, v5, (uint64_t (*)(uint64_t))type metadata accessor for ForYouFeedViewController, (uint64_t)&unk_1DC42C5C4);
  sub_1DC40259C();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8StocksUI24ForYouFeedViewController *v5;

  v4 = a3;
  v5 = self;
  MEMORY[0x1DF0C48A4](v4);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _TtC8StocksUI24ForYouFeedViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1DC382B74();

  return self & 1;
}

@end
