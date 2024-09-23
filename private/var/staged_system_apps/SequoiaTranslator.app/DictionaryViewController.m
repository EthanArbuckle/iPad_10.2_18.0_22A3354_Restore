@implementation DictionaryViewController

- (_TtC17SequoiaTranslator24DictionaryViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC17SequoiaTranslator24DictionaryViewController *)sub_1000A5EB4(v5, v7, a4);
}

- (_TtC17SequoiaTranslator24DictionaryViewController)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator24DictionaryViewController *)sub_1000A6130(a3);
}

- (void)loadView
{
  id v3;
  _TtC17SequoiaTranslator24DictionaryViewController *v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v7 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v5 = sub_1000A5B98();
  objc_msgSend(v7, "addSubview:", v5);

  v6 = sub_1000A5BAC();
  objc_msgSend(v7, "addSubview:", v6);

  -[DictionaryViewController setView:](v4, "setView:", v7);
}

- (void)viewDidLoad
{
  _TtC17SequoiaTranslator24DictionaryViewController *v2;

  v2 = self;
  sub_1000A63F8();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  NSString v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DictionaryViewController(0);
  v4 = v12.receiver;
  -[DictionaryViewController viewDidDisappear:](&v12, "viewDidDisappear:", v3);
  v5 = String._bridgeToObjectiveC()();
  v6 = swift_allocObject(&unk_100268048, 24, 7);
  *(_QWORD *)(v6 + 16) = v4;
  v10[4] = sub_1000A8EB0;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100170878;
  v10[3] = &unk_100268060;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = v4;
  swift_release(v8);
  AnalyticsSendEventLazy(v5, v7);
  _Block_release(v7);

}

- (void)closeActionWithSender:(id)a3
{
  _TtC17SequoiaTranslator24DictionaryViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_1000A6E70();

  sub_100009C08(v6);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000A8C7C((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_sourceLocale);
  sub_1000A8C7C((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_targetLocale);
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_text]);
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___webview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___notFoundLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___queue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController____lazy_storage___dictionaryManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_analytics));
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_timeStamp;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_observer));
}

@end
