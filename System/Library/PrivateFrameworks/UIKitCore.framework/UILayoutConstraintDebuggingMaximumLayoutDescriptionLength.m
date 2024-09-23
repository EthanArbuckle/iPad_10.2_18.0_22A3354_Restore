@implementation UILayoutConstraintDebuggingMaximumLayoutDescriptionLength

uint64_t __UILayoutConstraintDebuggingMaximumLayoutDescriptionLength_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("UILayoutConstraintDebuggingMaximumLayoutDescriptionLength"));
  if (result)
    UILayoutConstraintDebuggingMaximumLayoutDescriptionLength_maxLength = result;
  return result;
}

@end
