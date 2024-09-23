@implementation NSParagraphStyle(UIKitAdditions)

- (uint64_t)_ui_resolvedTextAlignment
{
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
}

- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions
{
  uint64_t result;
  uint64_t v6;
  _BOOL4 v7;

  result = objc_msgSend(a1, "alignment");
  if ((unint64_t)(result - 3) <= 1)
  {
    v6 = objc_msgSend(a1, "baseWritingDirection");
    v7 = a3 != 0;
    if (v6 != -1)
      v7 = v6 == 1;
    if (v7)
      return 2;
    else
      return 0;
  }
  return result;
}

- (uint64_t)_ui_resolvedWritingDirection
{
  return objc_msgSend(a1, "_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
}

- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions
{
  uint64_t result;

  result = objc_msgSend(a1, "baseWritingDirection");
  if (result == -1)
    return a3 != 0;
  return result;
}

@end
