@implementation UIDistanceBetweenPointAndPolygon

uint64_t __UIDistanceBetweenPointAndPolygon_block_invoke(uint64_t result, int *a2)
{
  int v2;
  double *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *a2;
  if (*a2 == 4)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v4 = *(double *)(v7 + 32);
    v5 = *(double *)(v7 + 40);
  }
  else
  {
    v3 = (double *)*((_QWORD *)a2 + 1);
    v4 = *v3;
    v5 = v3[1];
    if (v2 != 1)
    {
      if (!v2)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
        *(double *)(v6 + 32) = v4;
        *(double *)(v6 + 40) = v5;
      }
      goto LABEL_17;
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v10 = *(double *)(result + 56);
  v9 = *(double *)(result + 64);
  v12 = *(double *)(v8 + 32);
  v11 = *(double *)(v8 + 40);
  v13 = v4 - v12;
  v14 = v5 - v11;
  v15 = ((v10 - v12) * (v4 - v12) + (v9 - v11) * (v5 - v11)) / (float)((float)(v13 * v13) + (float)(v14 * v14));
  if (v15 > 0.0 && v15 < 1.0)
  {
    v18 = sqrt((v12 + (v4 - v12) * v15 - v10) * (v12 + (v4 - v12) * v15 - v10)+ (v11 + (v5 - v11) * v15 - v9) * (v11 + (v5 - v11) * v15 - v9));
  }
  else
  {
    v17 = sqrt((v12 - v10) * (v12 - v10) + (v11 - v9) * (v11 - v9));
    v18 = sqrt((v4 - v10) * (v4 - v10) + (v5 - v9) * (v5 - v9));
    if (v17 < v18)
      v18 = v17;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (*(double *)(v19 + 24) < v18)
    v18 = *(double *)(v19 + 24);
  *(double *)(v19 + 24) = v18;
LABEL_17:
  v20 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  *(double *)(v20 + 32) = v4;
  *(double *)(v20 + 40) = v5;
  return result;
}

@end
