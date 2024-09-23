@implementation ServicePresenter.AppPresentation.SecureAppAssertion

- (void)dealloc
{
  _TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion *v2;

  v2 = self;
  sub_10004CE88();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion_assertion));
  v3 = (char *)self
     + OBJC_IVAR____TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v9;
  _TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion *v10;

  swift_unknownObjectRetain(a3);
  v9 = a5;
  v10 = self;
  sub_10004D444((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease(a3);

}

- (_TtCCC12SidecarRelay16ServicePresenterP33_82D211662E7B4B6BB6B9239E3718712D15AppPresentation18SecureAppAssertion)init
{
  sub_10004D6E0();
}

@end
