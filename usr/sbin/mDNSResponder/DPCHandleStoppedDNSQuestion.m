@implementation DPCHandleStoppedDNSQuestion

BOOL __DPCHandleStoppedDNSQuestion_block_invoke(id a1, const mdns_subscriber_s *a2)
{
  const __CFBag *Value;
  __CFBag *v4;
  CFIndex CountOfValue;
  CFIndex v6;

  if (gDPCSubscriberRegistries)
  {
    Value = (const __CFBag *)CFDictionaryGetValue((CFDictionaryRef)gDPCSubscriberRegistries, (const void *)*(unsigned int *)(*((_QWORD *)a2 + 7) + 96));
    if (Value)
    {
      v4 = Value;
      CountOfValue = CFBagGetCountOfValue(Value, a2);
      if (CountOfValue >= 1)
      {
        v6 = CountOfValue;
        CFBagRemoveValue(v4, a2);
        if (v6 == 1)
          mdns_client_invalidate((uint64_t)a2);
      }
    }
  }
  return 1;
}

@end
