@implementation NSArray(PersonaUI)

- (id)pr_objectPassingTest:()PersonaUI
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
