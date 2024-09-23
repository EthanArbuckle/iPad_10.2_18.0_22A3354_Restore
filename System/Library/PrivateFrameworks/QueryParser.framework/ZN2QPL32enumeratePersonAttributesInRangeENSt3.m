@implementation ZN2QPL32enumeratePersonAttributesInRangeENSt3

_QWORD *___ZN2QPL32enumeratePersonAttributesInRangeENSt3__110shared_ptrINS_5ParseEEE7CFRangeU13block_pointerFvNS1_INS_14ParseAttributeEEEE_block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v2 + 40);
  result = (_QWORD *)(v2 + 40);
  v4 = v5;
  if (!v5)
    return std::shared_ptr<QP::GraphStructureStack::Node>::operator=[abi:ne180100](result, a2);
  v6 = *a2;
  v7 = *(unsigned __int8 *)(*a2 + 71);
  v8 = (char)v7;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(*a2 + 56);
  if (v7 == 17)
  {
    v11 = *(_QWORD *)(v6 + 48);
    v9 = v6 + 48;
    v10 = v11;
    if (v8 < 0)
      v9 = v10;
    v12 = *(_QWORD *)v9;
    v13 = *(_QWORD *)(v9 + 8);
    v14 = *(unsigned __int8 *)(v9 + 16);
    v15 = v12 == 0x6E756F724750516BLL && v13 == 0x6F73726550646564;
    if (v15 && v14 == 110)
    {
      v17 = *(unsigned __int8 *)(v4 + 71);
      v18 = (char)v17;
      if ((v17 & 0x80u) != 0)
        v17 = *(_QWORD *)(v4 + 56);
      if (v17 != 17)
        return std::shared_ptr<QP::GraphStructureStack::Node>::operator=[abi:ne180100](result, a2);
      v21 = *(uint64_t **)(v4 + 48);
      v19 = (uint64_t *)(v4 + 48);
      v20 = v21;
      if (v18 < 0)
        v19 = v20;
      v22 = *v19;
      v23 = v19[1];
      v24 = *((unsigned __int8 *)v19 + 16);
      v25 = v22 == 0x6E756F724750516BLL && v23 == 0x6F73726550646564;
      if (!v25 || v24 != 110)
        return std::shared_ptr<QP::GraphStructureStack::Node>::operator=[abi:ne180100](result, a2);
    }
  }
  return result;
}

@end
