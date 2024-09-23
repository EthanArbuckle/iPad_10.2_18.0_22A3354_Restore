@implementation NCNotificationListInsetMarginHorizontal

void ___NCNotificationListInsetMarginHorizontal_block_invoke()
{
  double Width;
  id v1;
  CGRect v2;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom"))
  {

  }
  else
  {
    v2.origin.x = NCMainScreenReferenceBounds();
    Width = CGRectGetWidth(v2);

    if (Width >= 393.0)
      _NCNotificationListInsetMarginHorizontal___insetMarginHorizontal = 0x402C000000000000;
  }
}

@end
