@implementation NSArray

- (id)safeObjectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self, "count") <= a3)
  {
    NSLog(CFSTR("Index %lu is out of bounds for the array"), a3);
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a3));
  }
  return v5;
}

@end
