@implementation NSMutableArray(PUPhotoEditAggregateSession)

- (void)pu_addCFString:()PUPhotoEditAggregateSession
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)pu_valuesChanged:()PUPhotoEditAggregateSession forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "pu_addCFString:", a4);
  return a1;
}

@end
