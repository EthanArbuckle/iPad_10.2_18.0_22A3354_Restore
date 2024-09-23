@implementation ZNK5dyld39MachOFile8getEntryERyRb

_QWORD *___ZNK5dyld39MachOFile8getEntryERyRb_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _BYTE *v5;
  dyld3::MachOFile *v6;
  thread_command v7;

  v3 = result;
  if (*(_DWORD *)a2 == 5)
  {
    v6 = (dyld3::MachOFile *)result[4];
    v5 = (_BYTE *)result[5];
    *a3 = 1;
    *v5 = 1;
    v7 = dyld3::MachOFile::entryAddrFromThreadCmd(v6, (const thread_command *)a2);
    result = (_QWORD *)dyld3::MachOFile::preferredLoadAddress(v6);
    *(_QWORD *)v3[6] = *(_QWORD *)&v7 - (_QWORD)result;
  }
  else if (*(_DWORD *)a2 == -2147483608)
  {
    v4 = (_QWORD *)result[6];
    *(_BYTE *)result[5] = 0;
    *v4 = *(_QWORD *)(a2 + 8);
    *a3 = 1;
  }
  return result;
}

@end
