@implementation ZN15SuplLppProvider11GetInstanceEv

_QWORD *___ZN15SuplLppProvider11GetInstanceEv_block_invoke()
{
  _QWORD *result;

  result = operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  SuplLppProvider::m_supl_lpp_provider = (uint64_t)result;
  return result;
}

@end
