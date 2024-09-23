@implementation ZN2md18HomeQueueScheduler8syncWaitEjNSt3

_QWORD *___ZN2md18HomeQueueScheduler8syncWaitEjNSt3__18functionIFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  _QWORD *v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(v1 + 88);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
    v3 = *(unsigned __int8 **)(v1 + 48);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    return (_QWORD *)dispatch_semaphore_signal(**(dispatch_semaphore_t **)(v1 + 56));
  }
  else
  {
    std::__throw_bad_function_call[abi:nn180100]();
    return std::__function::__func<md::HomeQueueScheduler::syncWait(unsigned int,std::function<void ()(void)>)::$_0,std::allocator<md::HomeQueueScheduler::syncWait(unsigned int,std::function<void ()(void)>)::$_0>,void ()(void)>::~__func(v6);
  }
}

@end
