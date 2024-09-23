@implementation GEOComposedWalkingRouteSegment

- (id)transitInstructionInContext:(int64_t)a3
{
  return +[MNTransitWalkingSegmentInstruction instructionForWalkingSegment:context:](MNTransitWalkingSegmentInstruction, "instructionForWalkingSegment:context:", self, a3);
}

@end
