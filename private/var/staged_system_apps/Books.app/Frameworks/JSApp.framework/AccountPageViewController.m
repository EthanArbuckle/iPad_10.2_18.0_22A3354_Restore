@implementation AccountPageViewController

- (_TtC5JSApp25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5JSApp25AccountPageViewController *)sub_61E78(v5, v7, a4);
}

- (_TtC5JSApp25AccountPageViewController)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  id v6;
  _TtC5JSApp25AccountPageViewController *result;

  self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_pageType] = 0;
  v4 = &self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_contentID];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_onFinish];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = a3;

  result = (_TtC5JSApp25AccountPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/AccountPageViewController.swift", 37, 2, 57, 0);
  __break(1u);
  return result;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  _TtC5JSApp25AccountPageViewController *v4;
  id v5;
  char *v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = (char *)objc_msgSend(v5, "userInterfaceIdiom");

  return v6 == (_BYTE *)&dword_0 + 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC5JSApp25AccountPageViewController *v4;
  id v5;
  char *v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = (char *)objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (_BYTE *)&dword_0 + 1)
    return 30;
  else
    return 2;
}

- (_TtC5JSApp25AccountPageViewController)initWithAccountURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC5JSApp25AccountPageViewController *result;
  uint64_t v10;

  v4 = sub_29EF0((uint64_t *)&unk_B8CA0);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = type metadata accessor for URL(0);
    v8 = 0;
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    v8 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, v8, 1);
  result = (_TtC5JSApp25AccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer("JSApp.AccountPageViewController", 31, "init(accountURL:)", 17, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->pageType[OBJC_IVAR____TtC5JSApp25AccountPageViewController_contentID]);
  sub_2D4DC(*(_QWORD *)&self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_onFinish], *(_QWORD *)&self->pageType[OBJC_IVAR____TtC5JSApp25AccountPageViewController_onFinish]);
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC5JSApp25AccountPageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_62238(v4);

}

@end
