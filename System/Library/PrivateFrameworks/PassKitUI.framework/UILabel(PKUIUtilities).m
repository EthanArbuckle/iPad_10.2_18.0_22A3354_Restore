@implementation UILabel(PKUIUtilities)

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_sizeThatFits:forceWordWrap:", 0);
}

- (double)pkui_sizeThatFits:()PKUIUtilities forceWordWrap:
{
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a1, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", objc_msgSend(a1, "numberOfLines"), a5, a2, a3);
  v11 = v10;

  return v11;
}

@end
