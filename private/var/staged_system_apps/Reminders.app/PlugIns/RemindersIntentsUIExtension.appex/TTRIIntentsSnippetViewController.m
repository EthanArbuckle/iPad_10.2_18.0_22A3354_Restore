@implementation TTRIIntentsSnippetViewController

- (UITableView)tableView
{
  return (UITableView *)(id)swift_unknownObjectWeakLoadStrong(&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], a2);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign(&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(_QWORD *)(*(_QWORD *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel]
                   + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000205C0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)viewDidLoad
{
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v2;

  v2 = self;
  sub_10001B8D8();

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100020948();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *)sub_10001CB8C(v5, v7, a4);
}

- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *)sub_10001CD9C(a3);
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_contactsProvider]);
  swift_release(*(_QWORD *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel]);
  swift_unknownObjectWeakDestroy(&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders]);
}

- (double)desiredHeightForWidth:(double)a3
{
  uint64_t Strong;
  void *v5;
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Strong = swift_unknownObjectWeakLoadStrong(&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], a2);
  if (!Strong)
    return 0.0;
  v5 = (void *)Strong;
  v6 = self;
  objc_msgSend(v5, "contentSize");
  sub_10001D6E8(0, v7, v8, v9, v8, v9);
  v11 = v10;

  return v11;
}

- (void)desiresInteractivity:(id)a3
{
  void (**v4)(const void *, uint64_t);
  void (**v5)(const void *, uint64_t);
  void (*v6)(const void *, uint64_t);
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v7;

  v4 = (void (**)(const void *, uint64_t))_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = v4[2];
    v7 = self;
    v6(v5, 1);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  void (*v9)(uint64_t, uint64_t, __n128, __n128);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *v14;
  __n128 v15;
  __n128 v16;

  v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))_Block_copy(a6);
  if (a3)
  {
    v10 = sub_100013968(0, &qword_10002E6B8, INParameter_ptr);
    v11 = sub_1000216E8(&qword_10002E6C0, &qword_10002E6B8, INParameter_ptr);
    a3 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v10, v11);
  }
  if (v9)
  {
    v12 = swift_allocObject(&unk_100029170, 24, 7);
    *(_QWORD *)(v12 + 16) = v9;
    v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))sub_1000215F0;
  }
  else
  {
    v12 = 0;
  }
  v13 = a4;
  v14 = self;
  sub_100021354((uint64_t)a3, a4, v9, v15, v16);
  sub_100013880((uint64_t)v9, v12);

  swift_bridgeObjectRelease(a3);
}

@end
