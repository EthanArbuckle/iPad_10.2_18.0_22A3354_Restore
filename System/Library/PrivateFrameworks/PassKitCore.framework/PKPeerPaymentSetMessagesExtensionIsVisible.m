@implementation PKPeerPaymentSetMessagesExtensionIsVisible

void __PKPeerPaymentSetMessagesExtensionIsVisible_block_invoke()
{
  uint64_t IsVisible;
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  IsVisible = PKPeerPaymentMessagesExtensionIsVisible();
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("visible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsVisible);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:userInfo:", CFSTR("PKPeerPaymentMessagesExtensionVisibilityChangedNotification"), 0, v3);

}

@end
