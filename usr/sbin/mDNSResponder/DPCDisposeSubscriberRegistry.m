@implementation DPCDisposeSubscriberRegistry

BOOL ___DPCDisposeSubscriberRegistry_block_invoke(id a1, const mdns_subscriber_s *a2)
{
  mdns_client_invalidate((uint64_t)a2);
  return 1;
}

@end
