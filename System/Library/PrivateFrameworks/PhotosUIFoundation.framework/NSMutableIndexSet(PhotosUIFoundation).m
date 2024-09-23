@implementation NSMutableIndexSet(PhotosUIFoundation)

- (uint64_t)px_adjustIndexesForDeletedRange:()PhotosUIFoundation
{
  return objc_msgSend(a1, "shiftIndexesStartingAtIndex:by:", a3 + a4, -a4);
}

- (uint64_t)px_adjustIndexesForDeletions:()PhotosUIFoundation
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__NSMutableIndexSet_PhotosUIFoundation__px_adjustIndexesForDeletions___block_invoke;
  v4[3] = &unk_2514D0978;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateRangesWithOptions:usingBlock:", 2, v4);
}

- (uint64_t)px_adjustIndexesForInsertions:()PhotosUIFoundation
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__NSMutableIndexSet_PhotosUIFoundation__px_adjustIndexesForInsertions___block_invoke;
  v4[3] = &unk_2514D0978;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateRangesUsingBlock:", v4);
}

@end
