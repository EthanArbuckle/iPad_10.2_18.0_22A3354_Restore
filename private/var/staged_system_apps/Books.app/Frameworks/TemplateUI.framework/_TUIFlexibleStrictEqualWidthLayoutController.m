@implementation _TUIFlexibleStrictEqualWidthLayoutController

- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4
{
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  float *v12;
  double result;
  double v14;
  _BOOL4 IsLessThanOrAlmostEqualFloat;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if ((unint64_t)-[NSMutableArray count](self->super.super._layouts, "count") < 2)
    return NAN;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->super.super._layouts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (float *)sub_DAF50(&self->super.super._layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v16);
        v10 = fmax(v10, v12[6] - fmax((float)(v12[6] - v12[7]), 0.0));
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v14 = v10 * (double)(unint64_t)-[NSMutableArray count](self->super.super._layouts, "count")
      - self->super.super._layoutTotalLength
      + a3;
  IsLessThanOrAlmostEqualFloat = TUICGFloatIsLessThanOrAlmostEqualFloat(v14, a4);
  result = NAN;
  if (!IsLessThanOrAlmostEqualFloat)
    return v14;
  return result;
}

@end
