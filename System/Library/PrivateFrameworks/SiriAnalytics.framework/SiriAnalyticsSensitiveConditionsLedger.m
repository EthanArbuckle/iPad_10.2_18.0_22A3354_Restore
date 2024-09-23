@implementation SiriAnalyticsSensitiveConditionsLedger

- (SiriAnalyticsSensitiveConditionsLedger)initWithClockIdentifier:(id)a3 metastore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = sub_1A0307334();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030731C();
  return (SiriAnalyticsSensitiveConditionsLedger *)SensitiveConditionsLedger.init(clockIdentifier:metastore:)((uint64_t)v7, (uint64_t)a4);
}

- (void)startWithSensitiveCondition:(int)a3 at:(unint64_t)a4
{
  uint64_t v5;
  SiriAnalyticsSensitiveConditionsLedger *v6;

  v5 = *(_QWORD *)&a3;
  v6 = self;
  sub_1A02964B8(v5, a4);

}

- (void)endWithSensitiveCondition:(int)a3 at:(unint64_t)a4
{
  uint64_t v5;
  SiriAnalyticsSensitiveConditionsLedger *v6;

  v5 = *(_QWORD *)&a3;
  v6 = self;
  sub_1A0296D74(v5, a4);

}

- (SiriAnalyticsSensitiveConditionsLedger)init
{
  SensitiveConditionsLedger.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SiriAnalyticsSensitiveConditionsLedger_clockIdentifier;
  v4 = OUTLINED_FUNCTION_9();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
