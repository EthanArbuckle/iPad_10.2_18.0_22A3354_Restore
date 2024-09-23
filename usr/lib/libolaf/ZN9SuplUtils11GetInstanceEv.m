@implementation ZN9SuplUtils11GetInstanceEv

char *___ZN9SuplUtils11GetInstanceEv_block_invoke()
{
  char *result;

  result = (char *)operator new(0x118uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *((_OWORD *)result + 15) = 0u;
    *((_OWORD *)result + 16) = 0u;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *((_WORD *)result + 20) = -254;
    *(_OWORD *)result = 0u;
    result[36] = 1;
    *((_WORD *)result + 30) = 0;
    *((_WORD *)result + 38) = 0;
    *((_WORD *)result + 46) = 0;
    result[105] = 0;
    *((_WORD *)result + 60) = 0;
    *((_WORD *)result + 68) = 0;
    *((_WORD *)result + 76) = 0;
    *((_WORD *)result + 82) = 0;
    *((_WORD *)result + 90) = 0;
    *((_DWORD *)result + 46) = 0;
    *(_DWORD *)(result + 187) = 0;
    *((_WORD *)result + 102) = 0;
    *((_WORD *)result + 110) = 0;
    *((_QWORD *)result + 30) = 0;
    *((_QWORD *)result + 29) = 0;
    *((_QWORD *)result + 31) = 0;
    *(_QWORD *)(result + 255) = 0;
    result[276] = 0;
    *(_QWORD *)(result + 268) = 0;
    *(_WORD *)(result + 277) = 1;
    result[279] = 1;
  }
  SuplUtils::m_supl_utils = (uint64_t)result;
  return result;
}

@end
