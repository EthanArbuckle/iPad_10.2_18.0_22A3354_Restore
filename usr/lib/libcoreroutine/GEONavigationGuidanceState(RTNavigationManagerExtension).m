@implementation GEONavigationGuidanceState(RTNavigationManagerExtension)

- (id)description
{
  void *v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_msgSend(a1, "navigationState");
  if (v2 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E92A3FF8[(int)v2];
  }
  objc_msgSend(v1, "stringWithFormat:", CFSTR("navigation state, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
