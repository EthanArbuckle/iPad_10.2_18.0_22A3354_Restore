@implementation PKPeerPaymentProcessMessageWithDataURLAndSessionIdentifier

uint64_t __PKPeerPaymentProcessMessageWithDataURLAndSessionIdentifier_block_invoke()
{
  PKPeerPaymentService *v0;
  void *v1;

  v0 = objc_alloc_init(PKPeerPaymentService);
  v1 = (void *)_MergedGlobals_188;
  _MergedGlobals_188 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_188, "suspendAccountChangedNotifications");
}

void __PKPeerPaymentProcessMessageWithDataURLAndSessionIdentifier_block_invoke_163(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Memo updated for recurring payment %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
