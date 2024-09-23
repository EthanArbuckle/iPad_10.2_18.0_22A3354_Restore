@implementation ZN8SimUtils11GetInstanceEv

_QWORD *___ZN8SimUtils11GetInstanceEv_block_invoke()
{
  _QWORD *result;

  result = operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *(_DWORD *)result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  SimUtils::m_sim_utils = (uint64_t)result;
  return result;
}

@end
