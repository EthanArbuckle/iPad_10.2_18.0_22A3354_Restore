@implementation CornerPointFromPath

_QWORD *__CornerPointFromPath_block_invoke(_QWORD *result, uint64_t a2)
{
  double *v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  _BOOL4 v9;
  uint64_t v10;

  if (*(_DWORD *)a2 <= 1u)
  {
    v2 = *(double **)(a2 + 8);
    v3 = *v2;
    v4 = v2[1];
    v5 = *(_QWORD *)(result[4] + 8);
    v7 = *(double *)(v5 + 32);
    v6 = *(double *)(v5 + 40);
    if (v7 == 1.79769313e308 && v6 == 1.79769313e308)
    {
      *(double *)(v5 + 32) = v3;
      *(double *)(v5 + 40) = v4;
    }
    else
    {
      switch(result[7])
      {
        case 1:
          v9 = v3 < v7;
          goto LABEL_10;
        case 2:
          v9 = v3 > v7;
LABEL_10:
          if (v4 < v6)
            v9 = 1;
          goto LABEL_16;
        case 4:
          v9 = v3 < v7;
          goto LABEL_14;
        case 8:
          v9 = v3 > v7;
LABEL_14:
          if (v4 > v6)
            v9 = 1;
LABEL_16:
          if (v9)
          {
            v6 = v4;
            v7 = v3;
          }
          break;
        default:
          break;
      }
      *(double *)(v5 + 32) = v7;
      *(double *)(v5 + 40) = v6;
      *(double *)(*(_QWORD *)(result[5] + 8) + 32) = v3 - *(double *)(*(_QWORD *)(result[6] + 8) + 32);
      *(double *)(*(_QWORD *)(result[5] + 8) + 40) = v4 - *(double *)(*(_QWORD *)(result[6] + 8) + 40);
    }
    v10 = *(_QWORD *)(result[6] + 8);
    *(double *)(v10 + 32) = v3;
    *(double *)(v10 + 40) = v4;
  }
  return result;
}

@end
