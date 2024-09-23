@implementation ZN2md21MapEngineFrameService13dispatchAsyncEN3geo6handleIvEENSt3

_QWORD *___ZN2md21MapEngineFrameService13dispatchAsyncEN3geo6handleIvEENSt3__18functionIFvvEEE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *result;
  uint64_t v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = (_QWORD *)a1[9];
  if (v4)
  {
    if (v4 == a1 + 6)
    {
      v8 = v7;
      (*(void (**)(_QWORD *, _BYTE *))(*v4 + 24))(v4, v7);
    }
    else
    {
      v8 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v4 + 16))(v4);
    }
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v2 + 32))(v2, v3, v7);
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
