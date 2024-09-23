@implementation RunloopThread.Thread

- (_TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread)init
{
  return (_TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread *)sub_1B1EB6E08();
}

- (void)main
{
  _TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread *v2;

  v2 = self;
  sub_1B1EB6EE4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_runloopSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_currentRunloop));
  sub_1B19E5A18(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtCC3VFX13RunloopThreadP33_C5453D25073BE51EF98804DB40F9E2866Thread_startedCallback));
}

@end
