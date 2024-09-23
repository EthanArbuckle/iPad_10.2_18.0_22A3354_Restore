@implementation FPRangeList

- (void)dealloc
{
  FPRangeListNode *rangeListHead;
  FPRangeListNode *var7;
  objc_super v5;

  rangeListHead = self->_rangeListHead;
  if (rangeListHead)
  {
    do
    {
      var7 = rangeListHead->var7;
      free(rangeListHead);
      rangeListHead = var7;
    }
    while (var7);
  }
  self->_rangeListHead = 0;
  v5.receiver = self;
  v5.super_class = (Class)FPRangeList;
  -[FPRangeList dealloc](&v5, "dealloc");
}

@end
