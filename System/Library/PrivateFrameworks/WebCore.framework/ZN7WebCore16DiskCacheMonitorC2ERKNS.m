@implementation ZN7WebCore16DiskCacheMonitorC2ERKNS

WebCore::ResourceRequest *___ZN7WebCore16DiskCacheMonitorC2ERKNS_15ResourceRequestEN3PAL9SessionIDEPK20_CFCachedURLResponse_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  WebCore::ResourceRequest *result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(WebCore::ResourceRequest **)(v3 + 24);
  if (result)
  {
    WebCore::ResourceRequest::~ResourceRequest(result, a2);
    result = (WebCore::ResourceRequest *)MEMORY[0x19AEA7644]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v3 + 24) = 0;
  return result;
}

@end
