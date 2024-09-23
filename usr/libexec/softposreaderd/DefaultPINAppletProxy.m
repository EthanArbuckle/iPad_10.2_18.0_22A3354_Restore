@implementation DefaultPINAppletProxy

- (void)dealloc
{
  _TtC9SPREngine21DefaultPINAppletProxy *v2;

  v2 = self;
  sub_100121968();
}

- (void).cxx_destruct
{

  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_monitorManager));
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_systemInfo));
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_auditor));
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_secureElement));
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  _TtC9SPREngine21DefaultPINAppletProxy *v5;

  v4 = a3;
  v5 = self;
  sub_100124158(v4);

}

- (_TtC9SPREngine21DefaultPINAppletProxy)init
{
  _TtC9SPREngine21DefaultPINAppletProxy *result;

  result = (_TtC9SPREngine21DefaultPINAppletProxy *)_swift_stdlib_reportUnimplementedInitializer("SPREngine.DefaultPINAppletProxy", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
