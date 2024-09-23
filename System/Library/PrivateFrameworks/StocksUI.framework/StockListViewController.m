@implementation StockListViewController

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
  _TtC8StocksUI23StockListViewController *v13;
  int64_t v14;
  uint64_t v16;

  v3 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI23StockListViewController_styler);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, __n128))(v7 + 16))((char *)&v16 - v9, v8);
  v11 = *(_QWORD *)(v5 + 24);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC0D39D0(v4);

}

- (id)contentScrollView
{
  _TtC8StocksUI23StockListViewController *v2;
  void *v3;

  v2 = self;
  sub_1DC4055CC();
  v3 = (void *)sub_1DC405074();

  swift_release();
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8StocksUI23StockListViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DC0A0414((uint64_t)a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC8StocksUI23StockListViewController *v2;

  v2 = self;
  sub_1DC0A9B2C();

}

- (void)viewDidLayoutSubviews
{
  _TtC8StocksUI23StockListViewController *v2;

  v2 = self;
  sub_1DC11BBC4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8StocksUI23StockListViewController *v4;

  v4 = self;
  sub_1DC0A5E28(a3);

}

- (void)viewDidLoad
{
  _TtC8StocksUI23StockListViewController *v2;

  v2 = self;
  sub_1DC0BC2C4();

}

- (_TtC8StocksUI23StockListViewController)initWithCoder:(id)a3
{
  sub_1DC2FEE60(a3);
}

- (void)dealloc
{
  _TtC8StocksUI23StockListViewController *v2;

  v2 = self;
  sub_1DC2FEFBC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_scrollTracker));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_bootstrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController____lazy_storage___exchangeStatusToolbarItem));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_keyboardInputMonitor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_appConfigurationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_quoteAttributionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_featureAvailability);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_editWatchlistMenuProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_logger;
  v4 = sub_1DC403F64();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC8StocksUI23StockListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI23StockListViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI23StockListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[StockListViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, v3);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(_BOOL8, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC8StocksUI23StockListViewController *v12;

  v5 = a3;
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8StocksUI23StockListViewController_eventHandler);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = self;
  *(_BYTE *)(v8 + 24) = v5;
  *(_BYTE *)(v8 + 25) = a4;
  v9 = *(_QWORD *)(v7 + 40);
  ObjectType = swift_getObjectType();
  v11 = *(void (**)(_BOOL8, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 136);
  v12 = self;
  v11(v5, sub_1DC307458, v8, ObjectType, v9);

  swift_release();
}

- (void)reconfigureLayoutForAccessibilityStateChange
{
  _TtC8StocksUI23StockListViewController *v2;
  id v3;

  v2 = self;
  v3 = -[StockListViewController traitCollection](v2, sel_traitCollection);
  sub_1DC0989E0(v3);

}

- (void)didTapAttributionButton
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _TtC8StocksUI23StockListViewController *v6;

  v3 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8StocksUI23StockListViewController_eventHandler))[5];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 104);
  v6 = self;
  v5(ObjectType, v3);

}

- (void)didTapPlusButton
{
  id v2;
  id v3;
  _TtC8StocksUI23StockListViewController *v4;
  _TtC8StocksUI23StockListViewController *v5;
  _TtC8StocksUI23StockListViewController *v6;

  v6 = self;
  v2 = -[StockListViewController navigationItem](v6, sel_navigationItem);
  v3 = objc_msgSend(v2, sel_searchController);

  if (v3)
  {
    v4 = (_TtC8StocksUI23StockListViewController *)objc_msgSend(v3, sel_searchBar);

    -[StockListViewController becomeFirstResponder](v4, sel_becomeFirstResponder);
    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1DC30602C();

  return self & 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC303BC4(v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC8StocksUI23StockListViewController *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1DC306168(v4);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC3043F0(v4);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC306224();

}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _TtC8StocksUI23StockListViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_1DC403F4C();
  v6 = sub_1DC408FE0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DC07D000, v5, v6, "Hiding ForYou card due to presenting search controller", v7, 2u);
    MEMORY[0x1DF0CAC88](v7, -1, -1);
  }

  sub_1DC2FFFE4(1, 1);
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC304624(v4);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC8StocksUI23StockListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DC3049B8(v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC8StocksUI23StockListViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_1DC4090D0();
  if (v5)
  {
    v6 = (void *)v5;
    sub_1DC0C9038((int)-[StockListViewController isEditing](v8, sel_isEditing), (int)-[StockListViewController isEditing](v8, sel_isEditing));
    sub_1DC0821D4(0, (unint64_t *)&qword_1EDB3F880);
    v7 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setToolbarItems_, v7);

  }
  objc_msgSend(v4, sel_setAutomaticallyShowsSearchResultsController_, 1);

}

- (NSArray)keyCommands
{
  void *v2;

  if (sub_1DC3062DC())
  {
    sub_1DC0821D4(0, &qword_1EDB42CF0);
    v2 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)deleteItem
{
  _TtC8StocksUI23StockListViewController *v2;

  v2 = self;
  sub_1DC305130();

}

- (void)delete:(id)a3
{
  _TtC8StocksUI23StockListViewController *v4;
  _TtC8StocksUI23StockListViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DC409634();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1DC305130();

  sub_1DC0A6180((uint64_t)v6, (uint64_t)&qword_1EDB40100, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1DC083594);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC8StocksUI23StockListViewController *v6;
  _TtC8StocksUI23StockListViewController *v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1DC409634();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1DC305470((uint64_t)a3, (uint64_t)v10);

  sub_1DC0A6180((uint64_t)v10, (uint64_t)&qword_1EDB40100, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1DC083594);
  return v8 & 1;
}

@end
