@implementation NSMutableArray(Queue)

- (id)enqueue:()Queue
{
  id result;

  objc_msgSend(a1, "addObject:");
  result = (id)objc_msgSend(a1, "count");
  if ((unint64_t)result >= 0x21)
    return (id)objc_msgSend(a1, "dequeue");
  return result;
}

- (id)dequeue
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
