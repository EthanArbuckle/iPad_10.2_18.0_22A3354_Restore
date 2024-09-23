@implementation ZN17PCSingletonObjectI7PCMutexN13PCConsoleLock12SingletonTagELi1000000000EE6objectEv

PCMutex *___ZN17PCSingletonObjectI7PCMutexN13PCConsoleLock12SingletonTagELi1000000000EE6objectEv_block_invoke()
{
  uint64_t v0;
  PCMutex *result;

  v0 = operator new();
  PCSingleton::PCSingleton((PCSingleton *)v0, 1000000000);
  *(_QWORD *)v0 = &unk_1E656D158;
  result = PCMutex::PCMutex((PCMutex *)(v0 + 8));
  PCSingletonObject<PCMutex,PCConsoleLock::SingletonTag,1000000000>::_instance = v0;
  return result;
}

@end
