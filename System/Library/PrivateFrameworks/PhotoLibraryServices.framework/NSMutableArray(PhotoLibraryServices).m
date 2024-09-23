@implementation NSMutableArray(PhotoLibraryServices)

- (void)_pl_addNonNilObject:()PhotoLibraryServices
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (uint64_t)_pl_insertObject:()PhotoLibraryServices atBinarySearchingInsertionIndexWithComparator:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(a1, "count"), 1024, v6);

  objc_msgSend(a1, "insertObject:atIndex:", v7, v8);
  return v8;
}

@end
