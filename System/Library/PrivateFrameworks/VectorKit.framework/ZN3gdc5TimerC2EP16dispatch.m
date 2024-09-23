@implementation ZN3gdc5TimerC2EP16dispatch

_QWORD *___ZN3gdc5TimerC2EP16dispatch_queue_sNSt3__18functionIFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD *result;
  uint64_t v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    if (v3 == a1 + 40)
    {
      v8 = v7;
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v3 + 24))(v3, v7);
    }
    else
    {
      v8 = (_BYTE *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    v8 = 0;
  }
  std::mutex::lock((std::mutex *)(v2 + 16));
  v4 = *(double *)(v2 + 8);
  if (v4 <= 0.0)
    *(_BYTE *)(v2 + 96) = 0;
  else
    *(CFAbsoluteTime *)(v2 + 88) = CFAbsoluteTimeGetCurrent() + v4;
  std::mutex::unlock((std::mutex *)(v2 + 16));
  if (!v8)
    std::__throw_bad_function_call[abi:nn180100]();
  (*(void (**)(_BYTE *))(*(_QWORD *)v8 + 48))(v8);
  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
}

@end
