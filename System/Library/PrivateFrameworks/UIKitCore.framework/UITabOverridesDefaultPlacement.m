@implementation UITabOverridesDefaultPlacement

void ___UITabOverridesDefaultPlacement_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("UITabOverrideDefaultPlacements"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D2B0;
  qword_1ECD7D2B0 = v0;

}

@end
