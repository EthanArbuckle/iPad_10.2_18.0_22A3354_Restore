@implementation SBUIPrewarmKeyboard

uint64_t __SBUIPrewarmKeyboard_block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  UIKeyboardOrderInAutomaticSkippingAnimation();
  return UIKeyboardOrderOutAutomaticSkippingAnimation();
}

@end
