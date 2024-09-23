@implementation MOAnalyticsStats

- (MOAnalyticsStats)init
{
  MOAnalyticsStats *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOAnalyticsStats;
  result = -[MOAnalyticsStats init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->_min = xmmword_10029F040;
    result->_std = 0.0;
    result->_count = 0;
    result->_mean = 0.0;
  }
  return result;
}

- (MOAnalyticsStats)initWithTimeSeries:(id)a3
{
  id v4;
  MOAnalyticsStats *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double min;
  double v15;
  double max;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = -[MOAnalyticsStats init](self, "init");
  if (v5)
  {
    v5->_count = (unint64_t)objc_msgSend(v4, "count");
    if (objc_msgSend(v4, "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v8 = 0.0;
      v9 = 0.0;
      if (v7)
      {
        v10 = v7;
        v11 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v6);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            min = v5->_min;
            objc_msgSend(v13, "value");
            if (min < v15)
              v15 = min;
            v5->_min = v15;
            max = v5->_max;
            objc_msgSend(v13, "value");
            if (max >= v17)
              v17 = max;
            v5->_max = v17;
            objc_msgSend(v13, "value");
            v9 = v9 + v18;
          }
          v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v10);
      }

      v5->_mean = v9 / (double)v5->_count;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v27;
        v8 = 0.0;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j), "value", (_QWORD)v26);
            v8 = v8 + (v24 - v5->_mean) * (v24 - v5->_mean);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v21);
      }

      v5->_std = v8 / (double)v5->_count;
    }
  }

  return v5;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)std
{
  return self->_std;
}

- (void)setStd:(double)a3
{
  self->_std = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end
