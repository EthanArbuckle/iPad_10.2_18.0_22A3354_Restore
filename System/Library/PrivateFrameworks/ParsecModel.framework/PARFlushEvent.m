@implementation PARFlushEvent

- (PARFlushEvent)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (PARFlushEvent *)PARFlushEvent.init(entity:insertInto:)();
}

@end
