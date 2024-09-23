@implementation _UIStatusBarVisualProvider_RoundedPad

+ (double)height
{
  return 24.0;
}

+ (double)cornerRadius
{
  return 20.0;
}

+ (double)baselineOffset
{
  return 16.0;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 18.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)pillFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD79B98;
  if (unk_1ECD79B98)
    v4 = byte_1ECD79B6D == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B6D = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC78);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79B98;
    unk_1ECD79B98 = v5;

    v3 = (void *)unk_1ECD79B98;
  }
  return v3;
}

- (id)pillSmallFont
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  v3 = (void *)unk_1ECD79BA0;
  if (unk_1ECD79BA0)
    v4 = byte_1ECD79B6E == v2;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1ECD79B6E = v2;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 11.0, *(double *)off_1E167DC50);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1ECD79BA0;
    unk_1ECD79BA0 = v5;

    v3 = (void *)unk_1ECD79BA0;
  }
  return v3;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 15.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)regionCursorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -2.0;
  v3 = -8.0;
  v4 = -2.0;
  v5 = -8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)regionCursorIsPill
{
  return 1;
}

@end
