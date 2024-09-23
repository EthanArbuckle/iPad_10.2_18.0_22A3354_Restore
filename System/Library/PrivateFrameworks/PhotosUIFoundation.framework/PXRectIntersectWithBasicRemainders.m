@implementation PXRectIntersectWithBasicRemainders

BOOL __PXRectIntersectWithBasicRemainders_block_invoke(_BOOL8 result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  _QWORD *v10;
  uint64_t v11;
  double *v12;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v10 = (_QWORD *)result;
    if (a2 == 1)
    {
      result = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 32));
      if (result)
      {
        v11 = v10[6];
        goto LABEL_8;
      }
    }
    else
    {
      if (a2 != -1)
        return result;
      result = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32));
      if (result)
      {
        v11 = v10[5];
LABEL_8:
        v12 = *(double **)(v11 + 8);
        v12[4] = a3;
        v12[5] = a4;
        v12[6] = a5;
        v12[7] = a6;
        return result;
      }
    }
    *(_BYTE *)(*(_QWORD *)(v10[4] + 8) + 24) = 0;
  }
  return result;
}

@end
