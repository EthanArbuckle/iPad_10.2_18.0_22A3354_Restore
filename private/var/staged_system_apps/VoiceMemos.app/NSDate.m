@implementation NSDate

- (id)dateByAddingDays:(int64_t)a3
{
  return -[NSDate dateByAddingTimeInterval:](self, "dateByAddingTimeInterval:", (double)(86400 * a3));
}

@end
