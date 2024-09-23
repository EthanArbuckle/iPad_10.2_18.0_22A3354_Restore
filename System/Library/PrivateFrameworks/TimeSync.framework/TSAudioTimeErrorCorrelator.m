@implementation TSAudioTimeErrorCorrelator

- (TSAudioTimeErrorCorrelator)initWithMaxCorrelationLength:(int64_t)a3 andUpscaleFactor:(int64_t)a4 forSamplingRate:(double)a5
{
  TSAudioTimeErrorCorrelator *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSAudioTimeErrorCorrelator;
  result = -[TSAudioTimeErrorCorrelator init](&v9, sel_init);
  if (result)
  {
    result->_samplingRate = a5;
    result->_maxCorrelationLength = a3;
    result->_upscaleFactor = a4;
  }
  return result;
}

- (void)_calculateUpsamplerCoefficients:(float *)a3 length:(int64_t *)a4
{
  int64_t upscaleFactor;
  uint64_t v8;
  uint64_t v9;
  float *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  long double v17;
  float v18;
  double v19;
  uint64_t v20;
  double v21;
  float *v22;
  double v23;
  float v24;
  float v25;
  float __B;

  if (a3 && a4)
  {
    upscaleFactor = self->_upscaleFactor;
    v8 = 200 * upscaleFactor;
    v9 = (200 * upscaleFactor) | 1;
    v10 = (float *)malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
    if (v10)
    {
      if (upscaleFactor < 0)
      {
        v21 = 0.0;
      }
      else
      {
        v11 = 0;
        v12 = (double)upscaleFactor;
        v13 = 200 * upscaleFactor;
        v14 = (double)v8;
        v15 = 1.0 / (v12 / 0.899999976);
        if (((v8 >> 1) | 1) <= 1)
          v16 = 1;
        else
          v16 = (v8 >> 1) | 1;
        do
        {
          v17 = cos((double)v11 * 6.28318531 / v14) * -0.5 + 0.42;
          v18 = v17 + cos((double)v11 * 12.5663706 / v14) * 0.08;
          v10[v11++] = v18;
          v10[v13--] = v18;
        }
        while (v16 != v11);
        v19 = v14 * -0.5 * v15;
        if (v9 <= 1)
          v20 = 1;
        else
          v20 = v9;
        v21 = 0.0;
        v22 = v10;
        do
        {
          v23 = 1.0;
          if (fabs(v19) >= 0.000001)
            v23 = sin(v19 * 3.14159265) / (v19 * 3.14159265);
          v24 = v23 * *v22;
          *v22++ = v24;
          v21 = v21 + v24;
          v19 = v15 + v19;
          --v20;
        }
        while (v20);
      }
      v25 = (double)self->_upscaleFactor / v21;
      __B = v25;
      vDSP_vsmul(v10, 1, &__B, v10, 1, v9);
    }
    *a3 = v10;
    *a4 = v9;
  }
}

- (id)correlationBlock
{
  return self->_correlationBlock;
}

- (void)setCorrelationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_correlationBlock, 0);
}

@end
