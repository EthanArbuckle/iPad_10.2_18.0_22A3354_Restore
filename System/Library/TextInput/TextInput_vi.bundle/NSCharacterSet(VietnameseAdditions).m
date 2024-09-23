@implementation NSCharacterSet(VietnameseAdditions)

+ (id)TI_vietnameseBaseCharacterSet
{
  if (TI_vietnameseBaseCharacterSet___onceToken != -1)
    dispatch_once(&TI_vietnameseBaseCharacterSet___onceToken, &__block_literal_global);
  return (id)TI_vietnameseBaseCharacterSet___vietnameseBaseCharacterSet;
}

+ (id)TI_vietnameseTelexSpecialsCharacterSet
{
  if (TI_vietnameseTelexSpecialsCharacterSet___onceToken != -1)
    dispatch_once(&TI_vietnameseTelexSpecialsCharacterSet___onceToken, &__block_literal_global_4);
  return (id)TI_vietnameseTelexSpecialsCharacterSet___vietnameseTelexSpecialsCharacterSet;
}

+ (id)TI_vietnameseVIQRSpecialsCharacterSet
{
  if (TI_vietnameseVIQRSpecialsCharacterSet___onceToken != -1)
    dispatch_once(&TI_vietnameseVIQRSpecialsCharacterSet___onceToken, &__block_literal_global_7);
  return (id)TI_vietnameseVIQRSpecialsCharacterSet___vietnameseVIQRSpecialsCharacterSet;
}

+ (id)TI_vietnameseVNISpecialsCharacterSet
{
  if (TI_vietnameseVNISpecialsCharacterSet___onceToken != -1)
    dispatch_once(&TI_vietnameseVNISpecialsCharacterSet___onceToken, &__block_literal_global_8);
  return (id)TI_vietnameseVNISpecialsCharacterSet___vietnameseVNISpecialsCharacterSet;
}

@end
