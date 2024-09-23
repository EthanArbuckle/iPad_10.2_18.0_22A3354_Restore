@implementation ZN16LcsSuplGlueLayer11GetInstanceEv

_QWORD *___ZN16LcsSuplGlueLayer11GetInstanceEv_block_invoke()
{
  _QWORD *result;

  result = operator new(0x30uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *result = off_24E2F6810;
    result[1] = &unk_24E2F6878;
    *((_DWORD *)result + 6) = 0;
    *((_DWORD *)result + 4) = 0;
    result[4] = 0;
    result[5] = 0;
  }
  LcsSuplGlueLayer::m_suplgluelayer_handle = (uint64_t)result;
  return result;
}

@end
