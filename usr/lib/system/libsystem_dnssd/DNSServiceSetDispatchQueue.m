@implementation DNSServiceSetDispatchQueue

uint64_t __DNSServiceSetDispatchQueue_block_invoke(uint64_t a1)
{
  return DNSServiceProcessResult(*(DNSServiceRef *)(a1 + 32));
}

uint64_t __DNSServiceSetDispatchQueue_block_invoke_2()
{
  return close_NOCANCEL();
}

@end
