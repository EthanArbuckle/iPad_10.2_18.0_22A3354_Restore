@implementation TUINetworkObserver

- (_TtP11TextInputUI26TUINetworkObserverDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP11TextInputUI26TUINetworkObserverDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC11TextInputUI18TUINetworkObserver)init
{
  return (_TtC11TextInputUI18TUINetworkObserver *)sub_18C793344();
}

- (BOOL)isNetworkAvailable
{
  _TtC11TextInputUI18TUINetworkObserver *v2;
  char v3;

  v2 = self;
  v3 = sub_18C7937CC();

  return v3 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus;
  v4 = sub_18C802B18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

@end
