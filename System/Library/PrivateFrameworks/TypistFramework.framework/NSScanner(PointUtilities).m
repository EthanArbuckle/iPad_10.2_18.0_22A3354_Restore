@implementation NSScanner(PointUtilities)

- (double)scanPoint
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v6;
  double v7;

  v6 = 0;
  v7 = 0.0;
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addCharactersInString:", CFSTR("-"));
  objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:", v3, 0);
  objc_msgSend(a1, "scanDouble:", &v7);
  objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:", v3, 0);
  objc_msgSend(a1, "scanDouble:", &v6);
  v4 = v7;

  return v4;
}

@end
