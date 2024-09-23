@implementation UILabel(Truncation)

- (BOOL)px_isTruncatedForWidth:()Truncation lines:
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", *MEMORY[0x1E0C9D648], v8, a2, 9.22337204e18);
  v10 = v9;
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", a4 + 1, v7, v8, a2, 9.22337204e18);
  return v11 > v10;
}

+ (uint64_t)px_isTruncatedForAttributedString:()Truncation forWidth:lines:
{
  uint64_t v7;
  id v8;

  v7 = px_isTruncatedForAttributedString_forWidth_lines__onceToken;
  v8 = a4;
  if (v7 != -1)
    dispatch_once(&px_isTruncatedForAttributedString_forWidth_lines__onceToken, &__block_literal_global_24649);
  objc_msgSend((id)px_isTruncatedForAttributedString_forWidth_lines__label, "setAttributedText:", v8);

  return objc_msgSend((id)px_isTruncatedForAttributedString_forWidth_lines__label, "px_isTruncatedForWidth:lines:", a5, a1);
}

@end
