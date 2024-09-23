@implementation NSMutableAttributedString(UIKitAdditions)

- (uint64_t)_ui_restoreOriginalFontAttributes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)off_1E1678F78;
  v3 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__NSMutableAttributedString_UIKitAdditions___ui_restoreOriginalFontAttributes__block_invoke;
  v5[3] = &unk_1E16B15D0;
  v5[4] = a1;
  return objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v2, 0, v3, 0x100000, v5);
}

@end
