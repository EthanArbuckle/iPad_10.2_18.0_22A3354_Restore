@implementation TSBackgroundFetchJournalEntry

- (NSString)reason
{
  void *v2;

  BackgroundFetchJournalEntry.reason.getter();
  v2 = (void *)sub_190BE4FDC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)date
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_190BE47E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BackgroundFetchJournalEntry.date.getter((uint64_t)v5);
  v6 = (void *)sub_190BE476C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)v6;
}

- (TSBackgroundFetchJournalEntry)initWithReason:(id)a3 date:(id)a4
{
  uint64_t v4;

  v4 = sub_190BE47E4();
  MEMORY[0x1E0C80A78](v4);
  sub_190BE5000();
  sub_190BE47B4();
  return (TSBackgroundFetchJournalEntry *)BackgroundFetchJournalEntry.init(reason:date:)();
}

- (TSBackgroundFetchJournalEntry)init
{
  BackgroundFetchJournalEntry.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TSBackgroundFetchJournalEntry_date;
  v4 = OUTLINED_FUNCTION_0_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
