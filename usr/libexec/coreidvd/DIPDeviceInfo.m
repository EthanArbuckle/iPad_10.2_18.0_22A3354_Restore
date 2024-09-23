@implementation DIPDeviceInfo

- (_TtC8coreidvd13DIPDeviceInfo)init
{
  return (_TtC8coreidvd13DIPDeviceInfo *)sub_100420188();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__ctSubscriptionsInUse));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__ctPhoneNumbers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__ctDefaultVoiceNumber));
  sub_1001070C4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__seInfo), *(_QWORD *)&self->workQueue[OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__seInfo]);
}

- (void)phoneNumberChanged:(id)a3
{
  id v4;
  _TtC8coreidvd13DIPDeviceInfo *v5;

  v4 = a3;
  v5 = self;
  sub_1004220F8(v4);

}

@end
