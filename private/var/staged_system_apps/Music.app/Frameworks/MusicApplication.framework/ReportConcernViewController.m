@implementation ReportConcernViewController

- (_TtC16MusicApplication27ReportConcernViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_5CC1CC();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27ReportConcernViewController *v2;

  v2 = self;
  sub_5C92C4();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27ReportConcernViewController *v2;

  v2 = self;
  sub_5C95E0();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC16MusicApplication27ReportConcernViewController *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v16 = *(_OWORD *)&self->keyboardObserver[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_contentReporter
                                         + 14];
  v17 = *(_OWORD *)&self->keyboardObserver[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_contentReporter
                                         + 30];
  v18 = *(_OWORD *)&self->contentReporter[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_contentReporter
                                        + 6];
  v14 = *(_OWORD *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_contentReporter);
  v15 = *(_OWORD *)&self->cachedTextHeight[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_contentReporter
                                         + 7];
  v5 = a3;
  v6 = self;
  v7 = sub_5CA87C();
  v8 = objc_msgSend(v7, "text", v14, v15, v16, v17, v18);
  if (v8)
  {
    v9 = v8;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v8);

  }
  else
  {

  }
  sub_5C7A70();
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v11 + 16);

  swift_bridgeObjectRelease();
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication27ReportConcernViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = (void *)sub_5C9930(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC16MusicApplication27ReportConcernViewController *v6;
  NSString v7;
  id v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = self;
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);

  if (!v8)
    v8 = objc_msgSend(objc_allocWithZone((Class)UITableViewHeaderFooterView), "init");
  v9 = swift_allocObject(&unk_13737E8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = v8;
  UITableViewHeaderFooterView.configurationUpdateHandler.setter(sub_5CC1BC, v9);

  return v10;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16MusicApplication27ReportConcernViewController *v11;
  id v12;
  _TtC16MusicApplication27ReportConcernViewController *v13;
  Class isa;
  _TtC16MusicApplication27ReportConcernViewController *v15;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC16MusicApplication27ReportConcernViewController *)a3;
  v12 = a4;
  v13 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = (_TtC16MusicApplication27ReportConcernViewController *)-[ReportConcernViewController cellForRowAtIndexPath:](v11, "cellForRowAtIndexPath:", isa);

  if (v15)
  {
    -[ReportConcernViewController setAccessoryType:](v15, "setAccessoryType:", 0);

    v11 = v13;
    v13 = v15;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16MusicApplication27ReportConcernViewController *v11;
  id v12;
  _TtC16MusicApplication27ReportConcernViewController *v13;
  Class isa;
  _TtC16MusicApplication27ReportConcernViewController *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC16MusicApplication27ReportConcernViewController *)a3;
  v12 = a4;
  v13 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = (_TtC16MusicApplication27ReportConcernViewController *)-[ReportConcernViewController cellForRowAtIndexPath:](v11, "cellForRowAtIndexPath:", isa);

  if (v15)
  {
    v16 = *(Class *)((char *)&v13->super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_tableView);
    v17 = sub_5CA87C();
    objc_msgSend(v16, "setTableFooterView:", v17);

    -[ReportConcernViewController setAccessoryType:](v15, "setAccessoryType:", 3);
    v11 = v13;
    v13 = v15;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double *v11;
  id v12;
  id v13;
  _TtC16MusicApplication27ReportConcernViewController *v14;
  double v15;
  double v16;
  id v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (double *)((char *)self + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_cachedTextHeight);
  if ((self->isInPlaceholderState[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_cachedTextHeight] & 1) != 0)
  {
    v12 = a4;
    v13 = a3;
    v14 = self;
    sub_5CA514();
    v16 = v15;
    *v11 = v15;
    *((_BYTE *)v11 + 8) = 0;

  }
  else
  {
    v16 = *v11;
    v17 = a4;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16 + 20.0;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  int64_t location;
  id v8;
  id v9;
  _TtC16MusicApplication27ReportConcernViewController *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = self;
  v11 = objc_msgSend(v8, "text");
  if (v11)
  {
    v12 = v11;
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v15 = v14;

    v16 = String.count.getter(v13, v15);
    swift_bridgeObjectRelease(v15);
    if (location > 400 && v16 >= 401)
      return 0;
  }
  else
  {

  }
  return 1;
}

- (void)_tapGestureAction:(id)a3
{
  _TtC16MusicApplication27ReportConcernViewController *v4;
  id v5;
  unsigned int v6;
  _TtC16MusicApplication27ReportConcernViewController *v7;
  _TtC16MusicApplication27ReportConcernViewController *v8;

  v4 = (_TtC16MusicApplication27ReportConcernViewController *)a3;
  v8 = self;
  v5 = sub_5CA87C();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    v7 = (_TtC16MusicApplication27ReportConcernViewController *)sub_5CA87C();
    -[ReportConcernViewController resignFirstResponder](v7, "resignFirstResponder");

    v4 = v8;
    v8 = v7;
  }

}

- (_TtC16MusicApplication27ReportConcernViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27ReportConcernViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27ReportConcernViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ReportConcernViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_45E79C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_keyboardObserver), *(_QWORD *)&self->isInPlaceholderState[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_keyboardObserver], *(_QWORD *)&self->cachedTextHeight[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_keyboardObserver+ 7], *(_QWORD *)&self->keyboardObserver[OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_keyboardObserver+ 6]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_tableView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27ReportConcernViewController_tapRecognizer));
}

@end
