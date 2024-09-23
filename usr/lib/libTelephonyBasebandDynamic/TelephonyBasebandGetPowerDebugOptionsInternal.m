@implementation TelephonyBasebandGetPowerDebugOptionsInternal

void __TelephonyBasebandGetPowerDebugOptionsInternal_block_invoke()
{
  void *__p[2];
  char v1;
  int v2;
  int v3;

  os_unfair_lock_lock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  v3 = 0;
  v2 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "CommandMask");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)&v3);
  if (v1 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "Intervention");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)&v2);
  if (v1 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "TimeoutMilliseconds");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 8));
  if (v1 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "ShouldOnlyInterveneOnce");
  if ((PowerDebugOptionsAdapter::getPreference<BOOL>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 12)) & 1) == 0)
    BYTE12(sPowerDebugOptions) = 0;
  if (v1 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "DidInterveneOnce");
  if ((PowerDebugOptionsAdapter::getPreference<BOOL>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 13)) & 1) == 0)
    BYTE13(sPowerDebugOptions) = 0;
  if (v1 < 0)
    operator delete(__p[0]);
  LODWORD(sPowerDebugOptions) = v3;
  DWORD1(sPowerDebugOptions) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
}

@end
