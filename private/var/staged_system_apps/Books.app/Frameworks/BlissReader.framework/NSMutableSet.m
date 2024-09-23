@implementation NSMutableSet

- (void)addMessageEntry:(id)a3
{
  id v5;

  v5 = -[NSMutableSet member:](self, "member:");
  if (v5)
  {
    objc_msgSend(v5, "mergeEntries:", a3);
  }
  else
  {
    -[NSMutableSet addObject:](self, "addObject:", a3);
    objc_msgSend(a3, "setTimeStamp:", -[NSMutableSet count](self, "count"));
  }
}

@end
