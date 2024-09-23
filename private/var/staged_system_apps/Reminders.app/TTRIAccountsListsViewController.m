@implementation TTRIAccountsListsViewController

- (void)loadView
{
  char *v3;
  char *v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  NSObject *v6;

  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for TTRIAccountsListsTreeView(0));
  v4 = &v3[qword_10064DEC0];
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4, 0);
  *(_QWORD *)&v3[qword_10064DEC8] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v3[qword_10064DED0] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v3[qword_10064DED8] = &_swiftEmptySetSingleton;
  v5 = self;
  v6 = sub_100011B78(2, 0.0, 0.0, 0.0, 0.0);
  -[TTRIAccountsListsViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLayoutSubviews
{
  uint64_t v2;
  _TtC9Reminders31TTRIAccountsListsViewController *v3;

  v3 = self;
  sub_100009F5C((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v4;

  v4 = self;
  sub_1000130F8(a3, (uint64_t)v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v4;

  v4 = self;
  sub_1000078DC(a3, (uint64_t)v4);

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders31TTRIAccountsListsViewController *v3;

  v3 = self;
  sub_10001B76C((uint64_t)v3, v2);

}

- (_TtC9Reminders31TTRIAccountsListsViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders31TTRIAccountsListsViewController *)sub_10006095C(v3, v4);
}

- (void)dealloc
{
  _TtC9Reminders31TTRIAccountsListsViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_100060B90((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchSelection, (uint64_t *)&unk_1006549F0);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchResultContainerViewController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_pendingSearchTerm]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___addListButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___addReminderButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___addGroupButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___editButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___actionMenuButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_accountSpinnerVisibleByAccountID));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_dropExceedsMaximumNumberOfPinnedListsTracker));
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_lastAppliedSelection, (uint64_t *)&unk_1006549F0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v4;

  v4 = self;
  sub_100060D78(a3, (uint64_t)v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC9Reminders31TTRIAccountsListsViewController *v7;
  _TtC9Reminders31TTRIAccountsListsViewController *v8;
  char v9;
  _OWORD v11[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = sub_100060F0C((uint64_t)a3, (uint64_t)v11);

  sub_1000073A0((uint64_t)v11, &qword_100640E50);
  return v9 & 1;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v6;

  v4 = a4;
  v6 = self;
  sub_1000612D0(a3, v4);

}

- (void)didTapNewReminder:(id)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  _TtC9Reminders31TTRIAccountsListsViewController *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  void *v13;
  _OWORD v14[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v14);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v6 = self;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_presenter);
  if (qword_10063D680 != -1)
    swift_once(&qword_10063D680, sub_1000074FC);
  v8 = type metadata accessor for Logger(0);
  sub_100012DC4(v8, (uint64_t)qword_100655F30);
  v9 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000143B4((uint64_t)"Accounts Lists New Reminder", 27, 2, v9);
  swift_bridgeObjectRelease(v9);
  sub_10001413C(v7 + 14, v7[17]);
  v10 = v7[9];
  ObjectType = swift_getObjectType(v7[8], v11);
  v13 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 8))(ObjectType);
  sub_1001E4B58((uint64_t)v13, (uint64_t)v7, (uint64_t)&off_1006010A8);

  sub_1000073A0((uint64_t)v14, &qword_100640E50);
}

- (void)didTapNewList:(id)a3
{
  sub_10006377C(self, (uint64_t)a2, a3, (void (*)(void))sub_1003459B8);
}

- (void)didTapNewGroup:(id)a3
{
  sub_10006377C(self, (uint64_t)a2, a3, sub_100345B50);
}

- (void)didTapEdit:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000612D0(1, 1);

}

- (void)didTapDone:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000612D0(0, 1);

}

- (void)newListAction:(id)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  _TtC9Reminders31TTRIAccountsListsViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_100063884();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (void)beginSearchAction:(id)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  _TtC9Reminders31TTRIAccountsListsViewController *v6;
  void *v7;
  id v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchController);
  if (v7)
  {
    v8 = objc_msgSend(v7, "searchBar");
    objc_msgSend(v8, "becomeFirstResponder");

    sub_1000073A0((uint64_t)v9, &qword_100640E50);
  }
  else
  {
    __break(1u);
  }
}

- (void)showListAction:(id)a3
{
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  _TtC9Reminders31TTRIAccountsListsViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_100063B50((uint64_t)v7);

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (_TtC9Reminders31TTRIAccountsListsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *result;

  v4 = a4;
  result = (_TtC9Reminders31TTRIAccountsListsViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIAccountsListsViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100068170(v4);

}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100068454(v4);

}

- (void)presentSearchController:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)UIViewController.effectiveNavigationControllerForBars.getter();
  objc_msgSend(v6, "isToolbarHidden");
  objc_msgSend(v6, "setToolbarHidden:animated:", 1, 1);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100068610((uint64_t)v4);

}

- (void)didDismissSearchController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC9Reminders31TTRIAccountsListsViewController *v9;
  id v10;

  v5 = type metadata accessor for TTRISearchController();
  v6 = swift_dynamicCastClass(a3, v5);
  if (v6)
    *(_BYTE *)(v6
             + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchResultContainerViewController);
  if (v7)
  {
    v8 = a3;
    v9 = self;
    v10 = v7;
    sub_1004354C8();

  }
  else
  {
    __break(1u);
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIAccountsListsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100068204(1);

}

@end
