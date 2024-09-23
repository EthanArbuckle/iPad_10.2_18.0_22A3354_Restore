@implementation NSMutableArray(SectionStackExtension)

- (id)section_pop
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

@end
