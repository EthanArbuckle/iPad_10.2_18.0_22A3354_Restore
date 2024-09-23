@implementation VUIUserConsentState

- (int64_t)status
{
  int64_t result;

  VUIUserConsentState.status.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_1D9CDCD90((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIUserConsentState.lastModifiedDate.getter);
}

- (_TtC8VideosUI19VUIUserConsentState)init
{
  VUIUserConsentState.init()();
}

- (void).cxx_destruct
{
  sub_1D970F4B0((uint64_t)self + OBJC_IVAR____TtC8VideosUI19VUIUserConsentState_lastModifiedDate, (uint64_t *)&unk_1EDA877D0);
}

@end
