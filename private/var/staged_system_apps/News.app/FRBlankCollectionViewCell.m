@implementation FRBlankCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("FRBlankCollectionViewCell");
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end
