@implementation TSFrequencyAnalysis

- (TSFrequencyAnalysis)initWithTimeErrorValues:(id)a3
{
  id v4;
  TSFrequencyAnalysis *v5;
  int64_t v6;
  int64_t v7;
  size_t v8;
  double *v9;
  double *v10;
  double *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double averagePeriod;
  int64_t v28;
  double *v29;
  id v30;
  double *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TSFrequencyAnalysis;
  v5 = -[TSFrequencyAnalysis init](&v36, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    v7 = v6 - 1;
    if (v6 < 1)
    {

      v5 = 0;
    }
    else
    {
      v8 = v6;
      v9 = (double *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
      v31 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
      v10 = (double *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
      v11 = v10;
      if (v10 && v9 && v31)
      {
        v28 = v7;
        v29 = v10;
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "timestamp");

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = v4;
        v14 = v4;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v18)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v9[v17 + i] = (double)(unint64_t)(objc_msgSend(v20, "timestamp") - v13);
              v31[v17 + i] = (double)objc_msgSend(v20, "error");
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            v17 += i;
          }
          while (v16);
        }

        v11 = v29;
        vDSP_vsubD(v9, 1, v9 + 1, 1, v29, 1, v28);
        vDSP_meanvD(v29, 1, &v5->_averagePeriod, v28);
        averagePeriod = v5->_averagePeriod;
        v5->_averageFrequency = 1000000000.0 / averagePeriod;
        __asm { FMOV            V2.2D, #2.0 }
        _Q2.f64[0] = (double)v28;
        *(float64x2_t *)&v5->_lowestFrequency = vdivq_f64((float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL), vmulq_n_f64(_Q2, averagePeriod));
        v4 = v30;
      }
      else
      {

        v5 = 0;
      }
      free(v9);
      free(v31);
      free(v11);
    }
  }

  return v5;
}

- (double)averagePeriod
{
  return self->_averagePeriod;
}

- (void)setAveragePeriod:(double)a3
{
  self->_averagePeriod = a3;
}

- (double)averageFrequency
{
  return self->_averageFrequency;
}

- (void)setAverageFrequency:(double)a3
{
  self->_averageFrequency = a3;
}

- (double)averageTimeError
{
  return self->_averageTimeError;
}

- (void)setAverageTimeError:(double)a3
{
  self->_averageTimeError = a3;
}

- (double)lowestFrequency
{
  return self->_lowestFrequency;
}

- (void)setLowestFrequency:(double)a3
{
  self->_lowestFrequency = a3;
}

- (double)highestFrequency
{
  return self->_highestFrequency;
}

- (void)setHighestFrequency:(double)a3
{
  self->_highestFrequency = a3;
}

@end
