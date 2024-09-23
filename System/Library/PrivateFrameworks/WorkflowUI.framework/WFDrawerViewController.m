@implementation WFDrawerViewController

- (_TtC10WorkflowUI22WFDrawerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22017BEE8();
}

- (void)dealloc
{
  _TtC10WorkflowUI22WFDrawerViewController *v2;

  v2 = self;
  sub_22017C068();
}

- (void).cxx_destruct
{
  sub_2200A0118((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_delegate);
  sub_22018935C(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), (char)*(UIView **)((char *)&self->super._view + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._tabBarItem + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode));
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_searchBar);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_tokenScrollView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_headerSeparator);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_tableView);
  OUTLINED_FUNCTION_202_0(OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_contentContainer);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_41_7();
  OUTLINED_FUNCTION_41_7();
  swift_unknownObjectWeakDestroy();
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI22WFDrawerViewController *v2;

  v2 = self;
  sub_22017C1B0();

}

- (void)viewWillLayoutSubviews
{
  _TtC10WorkflowUI22WFDrawerViewController *v2;

  v2 = self;
  sub_22017C7DC();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI22WFDrawerViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  sub_2201811C4();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return sub_2201817D4();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_220181808((uint64_t)self, a4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  _TtC10WorkflowUI22WFDrawerViewController *v7;

  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v6 = a3;
  v7 = self;
  sub_220181964((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)searchBarDidBeginEditing:(id)a3
{
  id v4;
  _TtC10WorkflowUI22WFDrawerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_220181A0C((uint64_t)v5);

}

- (void)searchBarCancelButtonWillHide:(id)a3
{
  id v4;
  _TtC10WorkflowUI22WFDrawerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_220181A9C((uint64_t)v5);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10WorkflowUI22WFDrawerViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_220181AEC(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  sub_220181C1C((uint64_t)self, a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI22WFDrawerViewController *v11;
  double v12;
  double v13;
  uint64_t v15;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  sub_220181CF0();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10WorkflowUI22WFDrawerViewController *v11;
  uint64_t v12;

  v6 = sub_220304758();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v10 = a3;
  v11 = self;
  sub_220181EF8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC10WorkflowUI22WFDrawerViewController *v14;
  uint64_t v15;

  v8 = sub_220304758();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22030471C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_2201822D0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10WorkflowUI22WFDrawerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22018269C();

}

- (_TtC10WorkflowUI22WFDrawerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  sub_2201826EC();
}

@end
