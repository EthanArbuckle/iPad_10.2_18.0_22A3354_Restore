@implementation ZN12SafeBrowsing13LookupContext17getDatabaseStatusENSt3

const std::error_category *___ZN12SafeBrowsing13LookupContext17getDatabaseStatusENSt3__18functionIFvNS_14DatabaseStatusENS1_10error_codeEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const std::error_category *result;

  v1 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v1 + 136) = 0;
  result = std::system_category();
  *(_QWORD *)(v1 + 144) = result;
  return result;
}

@end
