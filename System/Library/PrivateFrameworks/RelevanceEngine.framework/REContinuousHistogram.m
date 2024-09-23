@implementation REContinuousHistogram

void __39___REContinuousHistogram_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __30___REContinuousHistogram_mean__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  if (REFeatureValueTypeForTaggedPointer((unint64_t)a2) == 1)
  {
    v7 = REIntegerValueForTaggedPointer((unint64_t)a2);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(double *)(v8 + 24) + (double)(v7 * a3);
  }
  else
  {
    v10 = REDoubleValueForTaggedPointer(a2, v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(double *)(v8 + 24) + v10 * (double)a3;
  }
  *(double *)(v8 + 24) = v9;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
}

double __43___REContinuousHistogram_standardDeviation__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  const char *v6;
  double v7;
  float v8;
  uint64_t v9;
  double result;

  if (REFeatureValueTypeForTaggedPointer((unint64_t)a2) == 1)
    v7 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)a2);
  else
    v7 = REDoubleValueForTaggedPointer(a2, v6);
  v8 = v7 - *(double *)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v9 + 24) + (float)((float)(v8 * v8) * (float)a3);
  *(double *)(v9 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

uint64_t __64___REContinuousHistogram_countOfValuesBetweenMinValue_maxValue___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke_2;
  v5[3] = &unk_24CF8BFF8;
  v8 = *(_OWORD *)(a1 + 48);
  v6 = v3;
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v4, "enumerateFeatureValuesUsingBlock:", v5);

}

uint64_t __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = RECompareFeatureValues(*(_QWORD *)(a1 + 48), a2);
  if (result != 1)
  {
    result = RECompareFeatureValues((unint64_t)a2, *(void **)(a1 + 56));
    if (result != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "countForFeatureValue:", a2);
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  return result;
}

void __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke_2;
  v8[3] = &unk_24CF8C048;
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  v11 = a4;
  v7 = v6;
  objc_msgSend(v7, "enumerateFeatureValuesUsingBlock:", v8);

}

uint64_t __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "countForFeatureValue:", a2);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*a3)
    **(_BYTE **)(a1 + 48) = 1;
  return result;
}

@end
