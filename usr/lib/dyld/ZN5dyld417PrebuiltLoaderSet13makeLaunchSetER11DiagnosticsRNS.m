@implementation ZN5dyld417PrebuiltLoaderSet13makeLaunchSetER11DiagnosticsRNS

void *___ZN5dyld417PrebuiltLoaderSet13makeLaunchSetER11DiagnosticsRNS_12RuntimeStateERKNS_12MissingPathsE_block_invoke_3(uint64_t a1, char *__s)
{
  dyld4::BumpAllocator *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  uint64_t v9;

  v4 = *(dyld4::BumpAllocator **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = _platform_strlen(__s) + 1;
  v6 = *((_QWORD *)v4 + 5);
  v4 = (dyld4::BumpAllocator *)((char *)v4 + 40);
  v7 = *((_QWORD *)v4 + 2) - v6;
  dyld4::BumpAllocator::zeroFill(v4, v5);
  result = memmove((void *)(*(_QWORD *)v4 + v7), __s, v5);
  v9 = **(_QWORD **)(a1 + 40) + *(_QWORD *)(a1 + 48);
  ++*(_DWORD *)(v9 + 32);
  return result;
}

@end
