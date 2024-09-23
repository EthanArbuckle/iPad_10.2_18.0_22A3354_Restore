@implementation NSOrderedSet(PhotoLibraryServices)

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  if (objc_msgSend(a1, "count"))
    pl_result_with_autoreleasepool();
  else
    PLEmptyContainerDescription();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
