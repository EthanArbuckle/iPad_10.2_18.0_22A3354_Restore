@implementation PHRecentsFaceTimeHeaderView

- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8
{
  uint64_t v9;
  uint64_t v11;
  id v13;
  id v14;
  PHRecentsPersonFaceTimeHeaderSummaryView *v15;

  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v13 = a4;
  v14 = a3;
  v15 = -[PHRecentsPersonFaceTimeHeaderSummaryView initWithFrame:recentCall:occurrenceDate:status:duration:type:dataUsage:]([PHRecentsPersonFaceTimeHeaderSummaryView alloc], "initWithFrame:recentCall:occurrenceDate:status:duration:type:dataUsage:", v14, v13, v11, v9, a8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a6);

  return v15;
}

@end
