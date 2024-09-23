@implementation DOMHTMLImageElement(UIWebInteraction)

- (BOOL)showsTapHighlight
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hrefURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)alwaysAttemptToShowTapHighlight
{
  return 1;
}

@end
