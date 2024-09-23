@implementation VILogger

+ (OS_os_log)log
{
  id v2;

  if (qword_1ED98F398 != -1)
    swift_once();
  if (byte_1ED98F388 == 1)
  {
    if (qword_1ED98D450 != -1)
      swift_once();
    v2 = (id)qword_1ED98D440;
  }
  else
  {
    sub_1D470D004();
    v2 = (id)sub_1D4922A3C();
  }
  return (OS_os_log *)v2;
}

+ (OS_os_log)verboseLog
{
  return (OS_os_log *)_s18VisualIntelligence8VILoggerC10verboseLogSo9OS_os_logCvgZ_0();
}

+ (BOOL)shouldLogMessage
{
  if (qword_1ED98F398 != -1)
    swift_once();
  return byte_1ED98F388;
}

+ (BOOL)shouldLogVerboseMessage
{
  return _s18VisualIntelligence8VILoggerC23shouldLogVerboseMessageSbvgZ_0() & 1;
}

- (_TtC18VisualIntelligence8VILogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VILogger();
  return -[VILogger init](&v3, sel_init);
}

@end
