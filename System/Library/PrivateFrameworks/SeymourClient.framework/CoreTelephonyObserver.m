@implementation CoreTelephonyObserver

- (void).cxx_destruct
{
  sub_1CDFC5D94((uint64_t)self + OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_coreTelephonyClient));

}

- (_TtC13SeymourClient21CoreTelephonyObserver)init
{
  _TtC13SeymourClient21CoreTelephonyObserver *result;

  result = (_TtC13SeymourClient21CoreTelephonyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cellularDataStateChanged
{
  _TtC13SeymourClient21CoreTelephonyObserver *v2;

  v2 = self;
  sub_1CE05CD44();

}

- (void)cellularDataStateChangedWithCellularDataEnabled:(BOOL)a3
{
  _TtC13SeymourClient21CoreTelephonyObserver *v4;

  v4 = self;
  sub_1CE05CED4(a3, &OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_isCellularDataEnabled, (void (*)(uint64_t))sub_1CDFB66B8);

}

- (void)cellularDataStateChangedWithRoaming:(BOOL)a3
{
  _TtC13SeymourClient21CoreTelephonyObserver *v4;

  v4 = self;
  sub_1CE05CED4(a3, &OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_isRoaming, (void (*)(uint64_t))sub_1CDFB6520);

}

@end
