@implementation OSActivityLogMessageEvent

- (BOOL)br_isOversize
{
  return ((unint64_t)-[OSActivityLogMessageEvent traceID](self, "traceID") >> 27) & 1;
}

@end
