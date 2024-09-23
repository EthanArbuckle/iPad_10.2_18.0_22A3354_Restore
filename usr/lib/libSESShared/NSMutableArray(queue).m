@implementation NSMutableArray(queue)

- (id)popFirst
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
