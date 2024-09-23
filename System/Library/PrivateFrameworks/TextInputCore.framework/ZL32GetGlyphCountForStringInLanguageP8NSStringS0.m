@implementation ZL32GetGlyphCountForStringInLanguageP8NSStringS0

void *___ZL32GetGlyphCountForStringInLanguageP8NSStringS0__block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  void *result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a3;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = reallocf(*(void **)(*(_QWORD *)(a1[6] + 8) + 24), 2 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = reallocf(*(void **)(*(_QWORD *)(a1[7] + 8) + 24), 16 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = reallocf(*(void **)(*(_QWORD *)(a1[8] + 8) + 24), 16 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = reallocf(*(void **)(*(_QWORD *)(a1[9] + 8) + 24), 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  *a4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  *a5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  *a6 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  *a7 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  v14 = (char *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 2 * a2);
  memmove(&v14[2 * a3], v14, 2 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) - a2));
  v15 = (char *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 16 * a2);
  memmove(&v15[16 * a3], v15, 16 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) - a2));
  v16 = (char *)(*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) + 16 * a2);
  memmove(&v16[16 * a3], v16, 16 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) - a2));
  v17 = (char *)(*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) + 8 * a2);
  result = memmove(&v17[8 * a3], v17, 8 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) - a2));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += a3;
  return result;
}

@end
