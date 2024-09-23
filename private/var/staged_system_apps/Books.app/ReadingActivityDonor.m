@implementation ReadingActivityDonor

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC5Books20ReadingActivityDonor *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_10003E200((uint64_t)v11, v9, (uint64_t)a4, (uint64_t)v12, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (_TtC5Books20ReadingActivityDonor)initWithType:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC5Books20ReadingActivityDonor *result;

  self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_coachingPermissionApproved] = 0;
  v4 = OBJC_IVAR____TtC5Books20ReadingActivityDonor_coachingPermissionApprovedConfig;
  v5 = objc_allocWithZone((Class)type metadata accessor for CounterPropertyConfiguration(0, a2, a3));
  *(_QWORD *)&self->BMBaseDonor_opaque[v4] = CounterPropertyConfiguration.init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(0xD00000000000001ALL, 0x80000001007DBBF0, 0x7FFFFFFFFFFFFFFFLL, 1, 0);

  result = (_TtC5Books20ReadingActivityDonor *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000007BLL, 0x80000001007DBD10, "Books/ReadingActivityDonor.swift", 32, 2, 49, 0);
  __break(1u);
  return result;
}

- (_TtC5Books20ReadingActivityDonor)init
{
  _TtC5Books20ReadingActivityDonor *result;

  result = (_TtC5Books20ReadingActivityDonor *)_swift_stdlib_reportUnimplementedInitializer("Books.ReadingActivityDonor", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  _s5Books15CurrentPageViewVwxx_0(&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_goalsStateProvider]);
  _s5Books15CurrentPageViewVwxx_0(&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_historyStateProvider]);
  _s5Books15CurrentPageViewVwxx_0(&self->BMBaseDonor_opaque[OBJC_IVAR____TtC5Books20ReadingActivityDonor_booksFinishedStateProvider]);

}

@end
