@implementation BCPPTConfig

+ (NSString)launchTestKey
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (OS_os_log)os_log
{
  if (qword_30AB60 != -1)
    swift_once(&qword_30AB60, sub_1A5ED4);
  return (OS_os_log *)(id)qword_30CDE8;
}

+ (BOOL)currentlyInTest
{
  return sub_1A6730((uint64_t)a1, (uint64_t)a2, &qword_30AB68, (unsigned __int8 *)&byte_30CDF0, (uint64_t)sub_1A5F9C);
}

+ (BOOL)usePPTLaunchContent
{
  if (qword_30AB68 != -1)
    swift_once(&qword_30AB68, sub_1A5F9C);
  if ((byte_30CDF0 & 1) != 0)
    return 1;
  if (qword_30AB70 != -1)
    swift_once(&qword_30AB70, sub_1A6130);
  return byte_30CDF1;
}

+ (BOOL)hasExtendedLaunchTypeSet
{
  return sub_1A6730((uint64_t)a1, (uint64_t)a2, &qword_30AB70, (unsigned __int8 *)&byte_30CDF1, (uint64_t)sub_1A6130);
}

+ (NSString)extendedLaunchTestTypeForLogging
{
  return (NSString *)sub_1A6794((uint64_t)a1, (uint64_t)a2, _s8BookCore9PPTConfigC32extendedLaunchTestTypeForLoggingSSvgZ_0);
}

+ (BOOL)extendedLaunchTestDestinationIsHome
{
  return _s8BookCore9PPTConfigC35extendedLaunchTestDestinationIsHomeSbvgZ_0() & 1;
}

+ (BOOL)extendedLaunchTestDestinationIsBook
{
  return _s8BookCore9PPTConfigC031extendedLaunchTestDestinationIsA0SbvgZ_0() & 1;
}

+ (BOOL)extendedLaunchTestDestinationIsAudiobook
{
  return _s8BookCore9PPTConfigC40extendedLaunchTestDestinationIsAudiobookSbvgZ_0() & 1;
}

+ (BOOL)isReturningUser
{
  return sub_1A6730((uint64_t)a1, (uint64_t)a2, &qword_30AB80, (unsigned __int8 *)&byte_30CDF3, (uint64_t)sub_1A63A4);
}

+ (BOOL)shouldHaveContinueAndPreviousContent
{
  return sub_1A6730((uint64_t)a1, (uint64_t)a2, &qword_30AB88, (unsigned __int8 *)&byte_30CDF4, (uint64_t)sub_1A6548);
}

+ (BOOL)shouldUseCachedTopPicksCards
{
  char v2;

  _s8BookCore9PPTConfigC28shouldUseCachedTopPicksCardsSbvgZ_0();
  return v2 & 1;
}

+ (NSString)cachedTopPickCardsJSONString
{
  return (NSString *)sub_1A6794((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s8BookCore9PPTConfigC28cachedTopPickCardsJSONStringSSvgZ_0);
}

- (BCPPTConfig)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPTConfig();
  return -[BCPPTConfig init](&v3, "init");
}

@end
