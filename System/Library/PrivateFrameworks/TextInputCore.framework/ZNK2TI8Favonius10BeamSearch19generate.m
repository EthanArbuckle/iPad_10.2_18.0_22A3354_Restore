@implementation ZNK2TI8Favonius10BeamSearch19generate

unsigned int *___ZNK2TI8Favonius10BeamSearch19generate_candidatesEmPN2KB6StringENS2_10LookupTypeEf_block_invoke@<X0>(unsigned int *result@<X0>, uint64_t *a2@<X1>, TI::Favonius::SearchNodeLanguageExtensions **a3@<X8>)
{
  unsigned int *v5;
  uint64_t v6;
  float v7;
  unsigned int v8;
  float v9;
  float v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;

  if (*((_BYTE *)result + 48)
    && (v5 = result,
        result = (unsigned int *)TI::Favonius::BeamSearch::should_extend_for_prediction(*((_QWORD *)result + 4), a2, result[10]), (_DWORD)result))
  {
    v6 = *a2;
    v14 = 0;
    v7 = *((float *)v5 + 11);
    if (*(_QWORD *)(v6 + 16))
    {
      v8 = *(_DWORD *)(v6 + 164);
      if (v8 >= 5)
        v8 = 5;
      v9 = TI::Favonius::SearchParameters::k_prediction_costs[v8];
    }
    else
    {
      v9 = 0.8;
    }
    v10 = logf(v9);
    TI::Favonius::SearchNodeLanguageExtensions::create(v6, &v14, a3, 0.35, v7, (float)(1.0 - v7) * (float)(v10 * 0.35));
    result = v14;
    if (v14)
    {
      v11 = v14 + 2;
      v12 = atomic_load(v14 + 2);
      if (v12 == 1)
      {
        return (unsigned int *)(*(uint64_t (**)(void))(*(_QWORD *)v14 + 8))();
      }
      else
      {
        do
          v13 = __ldaxr(v11);
        while (__stlxr(v13 - 1, v11));
      }
    }
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

@end
