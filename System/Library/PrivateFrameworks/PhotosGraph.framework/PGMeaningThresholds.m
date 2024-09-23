@implementation PGMeaningThresholds

- (double)highRecallThreshold
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PGMeaningThresholds_highRecallThreshold);
}

- (double)highPrecisionThreshold
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PGMeaningThresholds_highPrecisionThreshold);
}

- (PGMeaningThresholds)init
{
  PGMeaningThresholds *result;

  result = (PGMeaningThresholds *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
