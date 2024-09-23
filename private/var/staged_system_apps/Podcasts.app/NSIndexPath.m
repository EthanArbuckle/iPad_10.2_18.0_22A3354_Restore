@implementation NSIndexPath

- (id)indexPathByChangingSection:(int64_t)a3
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[NSIndexPath row](self, "row"), (char *)-[NSIndexPath section](self, "section") + a3);
}

- (unint64_t)lastIndex
{
  if (-[NSIndexPath length](self, "length"))
    return -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", (char *)-[NSIndexPath length](self, "length") - 1);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isAfter:(id)a3
{
  return (id)-[NSIndexPath compare:](self, "compare:", a3) == (id)1;
}

- (BOOL)isBefore:(id)a3
{
  return -[NSIndexPath compare:](self, "compare:", a3) == NSOrderedAscending;
}

@end
