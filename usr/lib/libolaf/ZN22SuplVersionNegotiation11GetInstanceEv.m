@implementation ZN22SuplVersionNegotiation11GetInstanceEv

_DWORD *___ZN22SuplVersionNegotiation11GetInstanceEv_block_invoke()
{
  _DWORD *result;

  result = operator new(4uLL, MEMORY[0x24BEDB6B8]);
  if (result)
    *result = 196352;
  SuplVersionNegotiation::m_supl_version_negotiation = (uint64_t)result;
  return result;
}

@end
