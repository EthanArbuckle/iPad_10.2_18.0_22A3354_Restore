@implementation ICQDismissAllAlerts

uint64_t ___ICQDismissAllAlerts_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "dismissAlert");
}

@end
