@implementation AppIntentBackfiller

- (_TtC13SiriRemembers19AppIntentBackfiller)init
{
  return (_TtC13SiriRemembers19AppIntentBackfiller *)AppIntentBackfiller.init()();
}

- (void)main
{
  _TtC13SiriRemembers19AppIntentBackfiller *v2;

  v2 = self;
  sub_1C0477DC4();

}

- (void).cxx_destruct
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super._iop.__nextPriOp + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store);
  v4 = *(unint64_t *)((char *)&self->super._iop.__queue
                           + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store);
  swift_release();
  swift_release();
  sub_1C03FB2C8(v3, v4);

}

@end
