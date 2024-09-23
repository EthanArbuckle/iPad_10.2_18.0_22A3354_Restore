@implementation ZN17BasebandTransport5writeEPKhmPjbj

uint64_t (***___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke_50(_QWORD *a1))(_QWORD, _QWORD, _QWORD, uint64_t)
{
  uint64_t (***result)(_QWORD, _QWORD, _QWORD, uint64_t);

  result = *(uint64_t (****)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[7] + 128);
  if (result)
  {
    result = (uint64_t (***)(_QWORD, _QWORD, _QWORD, uint64_t))(**result)(result, a1[8], a1[9], *(_QWORD *)(a1[4] + 8) + 40);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48)
                                                 - *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  }
  return result;
}

@end
