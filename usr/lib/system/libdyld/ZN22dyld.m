@implementation ZN22dyld

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke(const char *result, const mach_header *a2, unint64_t a3)
{
  const char *v3;

  if (a3 >= 0x1D)
  {
    v3 = result;
    result = (const char *)*((_QWORD *)result + 6);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 4) + 8) + 24) = a2->sizeofcmds + 28;
    if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 4) + 8) + 24) <= a3)
    {
      result = dyld_process_info_base::addInfoFromLoadCommands(result, a2);
      *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8) + 24) = 1;
    }
  }
  return result;
}

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke_2(uint64_t a1, const mach_header *a2)
{
  return dyld_process_info_base::addInfoFromLoadCommands(*(const char **)(a1 + 32), a2);
}

const char *___ZN22dyld_process_info_base8copyPathEjPiy_block_invoke(uint64_t a1, const char *a2, size_t a3)
{
  const char *result;

  result = dyld_process_info_base::addString(*(dyld_process_info_base **)(a1 + 40), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
