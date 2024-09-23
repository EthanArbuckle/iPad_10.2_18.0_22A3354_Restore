@implementation UIFoundationAssert

void ___UIFoundationAssert_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _UIFoundationAssert_raise = objc_msgSend(v0, "BOOLForKey:", CFSTR("_UIFoundationAssertThrows"));

}

@end
