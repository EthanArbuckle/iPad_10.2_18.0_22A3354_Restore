@implementation ZN13NNetExtractor14compute

char *___ZN13NNetExtractor14compute_outputERNSt3__16vectorINS1_IfNS0_9allocatorIfEEEENS2_IS4_EEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = 3 * a2;
  std::vector<float>::resize(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24 * a2, *(unsigned int *)(*(_QWORD *)(v4 + 296) + 4 * *(_QWORD *)(a1 + 48)));
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 8 * v5;
  result = *(char **)v6;
  v8 = *(_BYTE **)(v6 + 8);
  if (v8 - result >= 1)
  {
    bzero(result, 4 * (((unint64_t)(v8 - result) >> 2) - ((unint64_t)(v8 - result) > 3)) + 4);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24 * a2;
    result = *(char **)v9;
    v8 = *(_BYTE **)(v9 + 8);
  }
  if (v8 != result)
  {
    v10 = 0;
    v11 = 0;
    v12 = **(_QWORD **)(a1 + 56) + 24 * a2;
    v13 = *(_QWORD *)(v4 + 280);
    LODWORD(v14) = *(_DWORD *)(a1 + 64);
    v15 = *(const float **)v12;
    v16 = *(_QWORD *)(v12 + 8);
    do
    {
      vDSP_dotpr(v15, 1, (const float *)(v13 + 4 * (((v16 - (uint64_t)v15) >> 2) * v11 + (int)v14)), 1, (float *)&result[v10], (v16 - (uint64_t)v15) >> 2);
      v13 = *(_QWORD *)(v4 + 280);
      v14 = *(int *)(a1 + 64);
      v15 = *(const float **)(**(_QWORD **)(a1 + 56) + 24 * a2);
      v16 = *(_QWORD *)(**(_QWORD **)(a1 + 56) + 24 * a2 + 8);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24 * a2);
      *(float *)(v17 + 4 * v11) = *(float *)(v13
                                           + 4
                                           * (v11
                                            + v14
                                            + ((unint64_t)(v16 - (_QWORD)v15) >> 2)
                                            * *(unsigned int *)(*(_QWORD *)(v4 + 296) + 4 * *(_QWORD *)(a1 + 48))))
                                + *(float *)(v17 + 4 * v11);
      ++v11;
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 24 * a2;
      result = *(char **)v18;
      v10 += 4;
    }
    while (v11 < (uint64_t)(*(_QWORD *)(v18 + 8) - *(_QWORD *)v18) >> 2);
  }
  return result;
}

@end
