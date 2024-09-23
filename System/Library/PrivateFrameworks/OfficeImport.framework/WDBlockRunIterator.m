@implementation WDBlockRunIterator

- (id)childIteratorFrom:(id)a3
{
  objc_msgSend(a3, "runIterator");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newChildIteratorFrom:(id)a3
{
  return (id)objc_msgSend(a3, "newRunIterator");
}

@end
