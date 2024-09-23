@implementation RPCBatchQuery

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("RPCBatchQuery"));
}

@end
