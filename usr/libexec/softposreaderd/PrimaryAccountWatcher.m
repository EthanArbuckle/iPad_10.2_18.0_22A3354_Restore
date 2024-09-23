@implementation PrimaryAccountWatcher

- (_TtC9SPREngine21PrimaryAccountWatcher)init
{
  _TtC9SPREngine21PrimaryAccountWatcher *result;

  sub_100144234();
  return result;
}

- (void)accountWasAdded:(id)a3
{
  id v4;
  _TtC9SPREngine21PrimaryAccountWatcher *v5;

  v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasAdded(_:)((ACAccount)v4);

}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  _TtC9SPREngine21PrimaryAccountWatcher *v5;

  v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasRemoved(_:)((ACAccount)v4);

}

- (void)accountWasModified:(id)a3
{
  id v4;
  _TtC9SPREngine21PrimaryAccountWatcher *v5;

  v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasModified(_:)((ACAccount)v4);

}

- (void).cxx_destruct
{

  sub_10004B5D0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler), *(_QWORD *)&self->isSandboxAccount[OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler]);
}

@end
