@implementation ZN7WebCore15ResourceRequest23doUpdateResourceRequestEv

WTF::StringImpl *___ZN7WebCore15ResourceRequest23doUpdateResourceRequestEv_block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  WebCore::HTTPHeaderMap *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *result;
  WTF::StringImpl *v7;

  v4 = (WebCore::HTTPHeaderMap *)(*(_QWORD *)(a1 + 32) + 96);
  MEMORY[0x19AEA5508](&v7, a3);
  WebCore::HTTPHeaderMap::set(v4, a2, &v7);
  result = v7;
  v7 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v5);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

@end
