@implementation CpuPiecewiseCC

- (CpuPiecewiseCC)initWithParams:(__CFDictionary *)a3 listID:(int)a4 needspowerZones:(BOOL)a5
{
  double v5;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  void *Value;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;

  v22.receiver = self;
  v22.super_class = (Class)CpuPiecewiseCC;
  LODWORD(v5) = 1.0;
  v7 = -[CpuCC initWithParams:powerScale:listID:needspowerZones:](&v22, "initWithParams:powerScale:listID:needspowerZones:", a3, *(_QWORD *)&a4, a5, v5);
  v8 = v7;
  if (!v7)
    return (CpuPiecewiseCC *)v8;
  v9 = v7 + 212;
  *(_OWORD *)(v7 + 212) = 0u;
  *(_OWORD *)(v7 + 228) = 0u;
  *((_DWORD *)v7 + 61) = 0;
  v10 = v7 + 248;
  *((_DWORD *)v7 + 70) = 0;
  *(_OWORD *)(v7 + 248) = 0u;
  *(_OWORD *)(v7 + 264) = 0u;
  Value = (void *)CFDictionaryGetValue(a3, CFSTR("maxLoadIndexLimits"));
  v12 = (void *)CFDictionaryGetValue(a3, CFSTR("dvdFactor1Limits"));
  v13 = objc_msgSend(Value, "count");
  if (v13 != objc_msgSend(v12, "count"))
  {
    v14 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050054(v14);
  }
  v15 = objc_msgSend(Value, "count");
  *((_DWORD *)v8 + 52) = v15;
  if (v15 < 10)
    goto LABEL_8;
  v16 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<Error> %s: data array too large", buf, 0xCu);
    v15 = *((_DWORD *)v8 + 52);
LABEL_8:
    if (v15 < 1)
      return (CpuPiecewiseCC *)v8;
  }
  v17 = 0;
  do
  {
    *(_DWORD *)&v9[4 * v17] = objc_msgSend(objc_msgSend(Value, "objectAtIndex:", v17), "intValue");
    *(_DWORD *)&v10[4 * v17] = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", v17), "intValue");
    ++v17;
    v18 = *((int *)v8 + 52);
  }
  while (v17 < v18);
  if ((int)v18 >= 2)
  {
    v19 = 0;
    do
    {
      if (*(_DWORD *)&v9[4 * v19] >= *(_DWORD *)&v9[4 * v19 + 4]
        || *(_DWORD *)&v10[4 * v19] >= *(_DWORD *)&v10[4 * v19 + 4])
      {
        v20 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[CpuPiecewiseCC initWithParams:listID:needspowerZones:]";
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "<Error> %s: data improperly sorted", buf, 0xCu);
          LODWORD(v18) = *((_DWORD *)v8 + 52);
        }
      }
      ++v19;
    }
    while (v19 < (int)v18 - 1);
  }
  return (CpuPiecewiseCC *)v8;
}

- (void)refreshFunctionalTelemetry
{
  *(&self->super.super.currentPower + 1) = -[CpuPiecewiseCC maxLoadIndexToDVDFactor1:](self, "maxLoadIndexToDVDFactor1:", self->super.super.currentLoadingIndex);
  *(_DWORD *)&self->super.super.allowLIOverride = self->super.super.currentLoadingIndex;
}

- (int)maxLoadIndexToDVDFactor1:(int)a3
{
  float *v3;
  int v4;
  uint64_t directMapIntercept_low;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;

  v3 = &self->super._directMapIntercept + 1;
  v4 = *((_DWORD *)&self->super._directMapIntercept + 1);
  directMapIntercept_low = LODWORD(self->super._directMapIntercept);
  if (v4 <= a3)
  {
    v4 = LODWORD(v3[(int)directMapIntercept_low - 1]);
    if (v4 >= a3)
      v4 = a3;
  }
  if ((int)directMapIntercept_low < 2)
  {
    LODWORD(directMapIntercept_low) = 1;
  }
  else
  {
    v6 = 1;
    while (v4 >= SLODWORD(v3[v6]))
    {
      if (directMapIntercept_low == ++v6)
        goto LABEL_11;
    }
    LODWORD(directMapIntercept_low) = v6;
  }
LABEL_11:
  v7 = (int)directMapIntercept_low - 1;
  v8 = v3[v7];
  v9 = v3[directMapIntercept_low];
  if (LODWORD(v9) == LODWORD(v8))
    return 0;
  else
    return (int)(float)((float)((float)((float)(LODWORD(v9) - v4) * (float)self->_maxLoadIndexLimits[v7 + 7])
                              + (float)((float)self->_maxLoadIndexLimits[directMapIntercept_low + 7]
                                      * (float)(v4 - LODWORD(v8))))
                      / (float)(LODWORD(v9) - LODWORD(v8)));
}

@end
