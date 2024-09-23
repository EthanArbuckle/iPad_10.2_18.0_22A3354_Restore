@implementation CHDivingDataCalculator

- (CHDivingDataCalculatorDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___CHDivingDataCalculator_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___CHDivingDataCalculator_delegate, v4, 0, 0);
  return (CHDivingDataCalculatorDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR___CHDivingDataCalculator_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___CHDivingDataCalculator_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (CHDivingDataCalculator)initWithHealthStore:(id)a3 diveSession:(id)a4 formattingManager:(id)a5
{
  return (CHDivingDataCalculator *)sub_100573B24(a3, a4, a5);
}

- (CHDivingDataCalculator)init
{
  CHDivingDataCalculator *result;

  result = (CHDivingDataCalculator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.DivingDataCalculator", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHDivingDataCalculator_delegate);

  v3 = (char *)self + OBJC_IVAR___CHDivingDataCalculator__metrics;
  v4 = sub_100047110(&qword_10083AF20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR___CHDivingDataCalculator_rawTempSamples), v5, v6, v7, v8, v9, v10, v11);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR___CHDivingDataCalculator_rawDepthSamples), v12, v13, v14, v15, v16, v17, v18);
}

@end
