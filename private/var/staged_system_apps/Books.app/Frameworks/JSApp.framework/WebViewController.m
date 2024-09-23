@implementation WebViewController

- (_TtC5JSApp17WebViewController)initWithCoder:(id)a3
{
  _TtC5JSApp17WebViewController *result;

  result = (_TtC5JSApp17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/WebViewController.swift", 29, 2, 32, 0);
  __break(1u);
  return result;
}

- (_TtC5JSApp17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v7;
  id v8;
  _TtC5JSApp17WebViewController *result;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = a5;
  result = (_TtC5JSApp17WebViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.WebViewController", 23, "init(bag:account:clientInfo:)", 29, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC5JSApp17WebViewController_url;
  v3 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _TtC5JSApp17WebViewController *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_A1FD0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = objc_allocWithZone((Class)AMSUIAuthenticateTask);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, "initWithRequest:presentingViewController:", v12, v13);
  v15 = objc_msgSend(v14, "performAuthentication");
  v18[4] = sub_6F16C;
  v19 = v9;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_6EAE8;
  v18[3] = &unk_A1FE8;
  v16 = _Block_copy(v18);
  v17 = v19;
  swift_retain(v9);
  swift_release(v17);
  objc_msgSend(v15, "addFinishBlock:", v16);
  _Block_release(v16);

  swift_release(v9);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _TtC5JSApp17WebViewController *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_A1F80, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = objc_allocWithZone((Class)AMSUIAlertDialogTask);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, "initWithRequest:presentingViewController:", v12, v13);
  v15 = objc_msgSend(v14, "present");
  v18[4] = sub_6F13C;
  v19 = v9;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_6EAE8;
  v18[3] = &unk_A1F98;
  v16 = _Block_copy(v18);
  v17 = v19;
  swift_retain(v9);
  objc_msgSend(v15, "addFinishBlock:", v16, swift_release(v17).n128_f64[0]);
  _Block_release(v16);

  swift_release(v9);
}

@end
