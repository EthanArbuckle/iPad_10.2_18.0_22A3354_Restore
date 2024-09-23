@implementation ZN12SuplProvider11GetInstanceEv

char *___ZN12SuplProvider11GetInstanceEv_block_invoke()
{
  char *result;

  result = (char *)operator new(0x40uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *(_QWORD *)result = &off_24E2B1D60;
    *((_QWORD *)result + 1) = &unk_24E2B1DA8;
    *((_QWORD *)result + 2) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *((_QWORD *)result + 7) = 0;
  }
  SuplProvider::m_supl_provider = (uint64_t)result;
  return result;
}

@end
