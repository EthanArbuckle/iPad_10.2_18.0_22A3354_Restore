@implementation _PSUAvailabilityManager

+ (BOOL)areGenerativeModelsAvailableFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (a3)
  {
    v3 = sub_244C7E474();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = static AvailabilityManager.areGenerativeModelsAvailable(for:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_PSUAvailabilityManager)init
{
  return (_PSUAvailabilityManager *)AvailabilityManager.init()();
}

@end
