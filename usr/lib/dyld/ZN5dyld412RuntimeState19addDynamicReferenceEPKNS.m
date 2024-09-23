@implementation ZN5dyld412RuntimeState19addDynamicReferenceEPKNS

_QWORD *___ZN5dyld412RuntimeState19addDynamicReferenceEPKNS_6LoaderES3__block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = result[4];
  v2 = result[5];
  v3 = *(_QWORD *)(v1 + 968);
  if (v3)
  {
    v4 = 16 * v3;
    v5 = (_QWORD *)(*(_QWORD *)(v1 + 960) + 8);
    while (*(v5 - 1) != v2 || *v5 != result[6])
    {
      v5 += 2;
      v4 -= 16;
      if (!v4)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v6 = result[6];
    result = (_QWORD *)lsl::Vector<dyld4::InterposeTupleAll>::reserve(v1 + 952, v3 + 1);
    v7 = *(_QWORD *)(v1 + 960);
    v8 = *(_QWORD *)(v1 + 968);
    *(_QWORD *)(v1 + 968) = v8 + 1;
    v9 = (_QWORD *)(v7 + 16 * v8);
    *v9 = v2;
    v9[1] = v6;
  }
  return result;
}

@end
