@implementation ReportConcernViewController

- (_TtC5Music27ReportConcernViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100556730();
}

- (void)viewDidLoad
{
  _TtC5Music27ReportConcernViewController *v2;

  v2 = self;
  sub_100553720();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music27ReportConcernViewController *v2;

  v2 = self;
  sub_100553A3C();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC5Music27ReportConcernViewController *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v15 = *(_OWORD *)&self->keyboardObserver[OBJC_IVAR____TtC5Music27ReportConcernViewController_contentReporter + 14];
  v16 = *(_OWORD *)&self->keyboardObserver[OBJC_IVAR____TtC5Music27ReportConcernViewController_contentReporter + 30];
  v17 = *(_OWORD *)&self->contentReporter[OBJC_IVAR____TtC5Music27ReportConcernViewController_contentReporter + 6];
  v13 = *(_OWORD *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music27ReportConcernViewController_contentReporter);
  v14 = *(_OWORD *)&self->cachedTextHeight[OBJC_IVAR____TtC5Music27ReportConcernViewController_contentReporter + 7];
  v5 = a3;
  v6 = self;
  v7 = sub_100554C6C();
  v8 = objc_msgSend(v7, "text", v13, v14, v15, v16, v17);

  if (v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v8);

  }
  sub_100551F04();
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v10 + 16);

  swift_bridgeObjectRelease();
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music27ReportConcernViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100553D8C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC5Music27ReportConcernViewController *v6;
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
  v9 = swift_allocObject(&unk_1010CD458, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = v8;
  UITableViewHeaderFooterView.configurationUpdateHandler.setter(sub_100556720, v9);

  return v10;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC5Music27ReportConcernViewController *v11;
  _TtC5Music27ReportConcernViewController *v12;
  Class isa;
  _TtC5Music27ReportConcernViewController *v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC5Music27ReportConcernViewController *)a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (_TtC5Music27ReportConcernViewController *)-[ReportConcernViewController cellForRowAtIndexPath:](v11, "cellForRowAtIndexPath:", isa);

  if (v14)
  {
    -[ReportConcernViewController setAccessoryType:](v14, "setAccessoryType:", 0);

    v11 = v12;
    v12 = v14;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC5Music27ReportConcernViewController *v11;
  _TtC5Music27ReportConcernViewController *v12;
  Class isa;
  _TtC5Music27ReportConcernViewController *v14;
  void *v15;
  id v16;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC5Music27ReportConcernViewController *)a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (_TtC5Music27ReportConcernViewController *)-[ReportConcernViewController cellForRowAtIndexPath:](v11, "cellForRowAtIndexPath:", isa);

  if (v14)
  {
    v15 = *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC5Music27ReportConcernViewController_tableView);
    v16 = sub_100554C6C();
    objc_msgSend(v15, "setTableFooterView:", v16);

    -[ReportConcernViewController setAccessoryType:](v14, "setAccessoryType:", 3);
    v11 = v12;
    v12 = v14;
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
  _TtC5Music27ReportConcernViewController *v13;
  double v14;
  double v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (double *)((char *)self + OBJC_IVAR____TtC5Music27ReportConcernViewController_cachedTextHeight);
  if ((self->isInPlaceholderState[OBJC_IVAR____TtC5Music27ReportConcernViewController_cachedTextHeight] & 1) != 0)
  {
    v12 = a3;
    v13 = self;
    sub_100554904();
    v15 = v14;
    *v11 = v14;
    *((_BYTE *)v11 + 8) = 0;

  }
  else
  {
    v15 = *v11;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15 + 20.0;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  int64_t location;
  id v7;
  _TtC5Music27ReportConcernViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  location = a4.location;
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v7, "text");
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    v14 = String.count.getter(v11, v13);
    swift_bridgeObjectRelease(v13);
    if (location > 400 && v14 >= 401)
      return 0;
  }
  else
  {

  }
  return 1;
}

- (void)_tapGestureAction:(id)a3
{
  _TtC5Music27ReportConcernViewController *v4;
  id v5;
  unsigned int v6;
  _TtC5Music27ReportConcernViewController *v7;
  _TtC5Music27ReportConcernViewController *v8;

  v4 = (_TtC5Music27ReportConcernViewController *)a3;
  v8 = self;
  v5 = sub_100554C6C();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    v7 = (_TtC5Music27ReportConcernViewController *)sub_100554C6C();
    -[ReportConcernViewController resignFirstResponder](v7, "resignFirstResponder");

    v4 = v8;
    v8 = v7;
  }

}

- (_TtC5Music27ReportConcernViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music27ReportConcernViewController *result;

  v4 = a4;
  result = (_TtC5Music27ReportConcernViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.ReportConcernViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1003608CC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music27ReportConcernViewController_keyboardObserver), *(_QWORD *)&self->isInPlaceholderState[OBJC_IVAR____TtC5Music27ReportConcernViewController_keyboardObserver], *(_QWORD *)&self->cachedTextHeight[OBJC_IVAR____TtC5Music27ReportConcernViewController_keyboardObserver + 7], *(_QWORD *)&self->keyboardObserver[OBJC_IVAR____TtC5Music27ReportConcernViewController_keyboardObserver + 6]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27ReportConcernViewController_tableView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27ReportConcernViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27ReportConcernViewController_tapRecognizer));
}

@end
