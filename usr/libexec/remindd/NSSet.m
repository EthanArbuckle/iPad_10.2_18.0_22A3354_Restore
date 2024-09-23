@implementation NSSet

- (id)jsonify
{
  NSSet *v2;
  id v3;

  v2 = self;
  v3 = sub_1003A5340((Class *)NSMutableSet_ptr, (uint64_t (*)(void))&NSSet.makeIterator());

  return v3;
}

@end
