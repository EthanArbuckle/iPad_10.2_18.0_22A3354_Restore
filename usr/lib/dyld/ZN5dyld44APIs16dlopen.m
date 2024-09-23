@implementation ZN5dyld44APIs16dlopen

int *___ZN5dyld44APIs16dlopen_preflightEPKc_block_invoke_2(uint64_t a1, dyld3::FatFile *a2, unint64_t a3, int a4)
{
  int *result;
  unint64_t v6;

  v6 = 0;
  result = dyld3::MachOFile::compatibleSlice((vm_address_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &v6, a2, a3, *(const char **)(a1 + 56), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 68), a4, *(dyld3::GradedArchs **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 144), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 169));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 64) = 1;
  }
  return result;
}

@end
