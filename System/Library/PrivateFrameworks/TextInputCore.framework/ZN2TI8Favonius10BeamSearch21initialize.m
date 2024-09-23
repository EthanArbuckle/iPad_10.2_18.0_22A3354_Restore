@implementation ZN2TI8Favonius10BeamSearch21initialize

uint64_t (***___ZN2TI8Favonius10BeamSearch21initialize_input_nodeERKN3WTF6RefPtrINS0_8KeyMatchEEEf_block_invoke(uint64_t a1, uint64_t *a2))(_QWORD)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  BOOL v8;
  uint64_t (***result)(_QWORD);
  uint64_t v10;

  v3 = *(_QWORD *)(*a2 + 48);
  v4 = **(_QWORD **)(a1 + 32);
  v5 = *(_QWORD *)(*a2 + 32);
  if (*(_QWORD *)(a1 + 40) == v5)
  {
    v8 = 0;
  }
  else
  {
    v7 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v5 + 56) + 192))(*(_QWORD *)(v5 + 56));
    v8 = v7 != (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 56) + 192))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  }
  result = 0;
  if (v4 == v3 && !v8)
  {
    v10 = *a2;
    if (*(_QWORD *)(v10 + 32))
    {
      result = *(uint64_t (****)(_QWORD))(v10 + 56);
      if (result)
        return (uint64_t (***)(_QWORD))((**result)(result) == *(_QWORD *)(*(_QWORD *)(v10 + 32) + 56));
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
