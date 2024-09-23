@implementation WDTableRowCellIterator

- (id)childIteratorFrom:(id)a3
{
  objc_msgSend(a3, "cellIterator");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newChildIteratorFrom:(id)a3
{
  return (id)objc_msgSend(a3, "newCellIterator");
}

@end
