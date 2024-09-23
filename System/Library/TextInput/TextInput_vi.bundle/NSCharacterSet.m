@implementation NSCharacterSet

void __68__NSCharacterSet_VietnameseAdditions__TI_vietnameseBaseCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TI_vietnameseBaseCharacterSet___vietnameseBaseCharacterSet;
  TI_vietnameseBaseCharacterSet___vietnameseBaseCharacterSet = v0;

}

void __77__NSCharacterSet_VietnameseAdditions__TI_vietnameseTelexSpecialsCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("[]{}"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TI_vietnameseTelexSpecialsCharacterSet___vietnameseTelexSpecialsCharacterSet;
  TI_vietnameseTelexSpecialsCharacterSet___vietnameseTelexSpecialsCharacterSet = v0;

}

void __76__NSCharacterSet_VietnameseAdditions__TI_vietnameseVIQRSpecialsCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TI_vietnameseVIQRSpecialsCharacterSet___vietnameseVIQRSpecialsCharacterSet;
  TI_vietnameseVIQRSpecialsCharacterSet___vietnameseVIQRSpecialsCharacterSet = v0;

}

void __75__NSCharacterSet_VietnameseAdditions__TI_vietnameseVNISpecialsCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("1234567890"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TI_vietnameseVNISpecialsCharacterSet___vietnameseVNISpecialsCharacterSet;
  TI_vietnameseVNISpecialsCharacterSet___vietnameseVNISpecialsCharacterSet = v0;

}

@end
