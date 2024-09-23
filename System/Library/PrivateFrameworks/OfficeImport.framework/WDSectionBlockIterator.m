@implementation WDSectionBlockIterator

- (id)childIteratorFrom:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockIterator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newChildIteratorFrom:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBlockIterator");

  return v4;
}

@end
