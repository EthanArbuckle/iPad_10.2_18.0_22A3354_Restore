@implementation ZN12

void *___ZN12_GLOBAL__N_130ensureMobileGestaltDylibLoadedEv_block_invoke()
{
  void *result;
  char v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  strcpy(v1, "/usr/lib/libMobileGestalt.dylib");
  result = dlopen(v1, 1);
  _MergedGlobals_4 = (uint64_t)result;
  if (result)
  {
    result = dlsym(result, "MGCopyAnswer");
    off_1ECF85848 = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
