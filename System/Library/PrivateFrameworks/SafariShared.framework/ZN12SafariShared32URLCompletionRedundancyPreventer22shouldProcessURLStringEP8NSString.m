@implementation ZN12SafariShared32URLCompletionRedundancyPreventer22shouldProcessURLStringEP8NSString

uint64_t **___ZN12SafariShared32URLCompletionRedundancyPreventer22shouldProcessURLStringEP8NSString_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CFTypeRef *v3;
  uint64_t **result;

  v2 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = (CFTypeRef *)(a1 + 48);
  result = std::__hash_table<NSString * {__strong},std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>(v2, (CFTypeRef *)(a1 + 48));
  if (!result)
    return (uint64_t **)std::__hash_table<NSString * {__strong},std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,std::allocator<NSString * {__strong}>>::__emplace_unique_key_args<NSString * {__strong},NSString * const {__strong}&>((uint64_t)v2, v3, (id *)v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
