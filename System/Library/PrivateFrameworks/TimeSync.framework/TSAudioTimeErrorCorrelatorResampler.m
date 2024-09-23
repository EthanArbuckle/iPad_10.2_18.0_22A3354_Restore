@implementation TSAudioTimeErrorCorrelatorResampler

- (TSAudioTimeErrorCorrelatorResampler)initWithMaxCorrelationLength:(int64_t)a3 andUpscaleFactor:(int64_t)a4 forSamplingRate:(double)a5
{
  TSAudioTimeErrorCorrelatorResampler *v5;
  TSAudioTimeErrorCorrelatorResampler *v6;
  float **p_upsamplerFilterCoefficientsBuffer;
  int64_t *p_upsamplerFilterCoefficientsLength;
  float *v9;
  float *scratchBuffer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSAudioTimeErrorCorrelatorResampler;
  v5 = -[TSAudioTimeErrorCorrelator initWithMaxCorrelationLength:andUpscaleFactor:forSamplingRate:](&v12, sel_initWithMaxCorrelationLength_andUpscaleFactor_forSamplingRate_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    p_upsamplerFilterCoefficientsBuffer = &v5->_upsamplerFilterCoefficientsBuffer;
    p_upsamplerFilterCoefficientsLength = &v5->_upsamplerFilterCoefficientsLength;
    -[TSAudioTimeErrorCorrelator _calculateUpsamplerCoefficients:length:](v5, "_calculateUpsamplerCoefficients:length:", &v5->_upsamplerFilterCoefficientsBuffer, &v5->_upsamplerFilterCoefficientsLength);
    v6->_scratchBuffer = (float *)malloc_type_calloc(*p_upsamplerFilterCoefficientsLength+ v6->super._maxCorrelationLength * v6->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v6->_channelABuffer = (float *)malloc_type_calloc(2 * v6->super._upscaleFactor * v6->super._maxCorrelationLength, 4uLL, 0x100004052888210uLL);
    v6->_channelBBuffer = (float *)malloc_type_calloc(v6->super._maxCorrelationLength * v6->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v9 = (float *)malloc_type_calloc(v6->super._maxCorrelationLength * v6->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v6->_correlationBuffer = v9;
    scratchBuffer = v6->_scratchBuffer;
    if (scratchBuffer && v6->_channelABuffer && v6->_channelBBuffer && v9 && *p_upsamplerFilterCoefficientsBuffer)
    {
      bzero(scratchBuffer, *p_upsamplerFilterCoefficientsLength + 4 * v6->super._upscaleFactor * v6->super._maxCorrelationLength);
      bzero(v6->_channelABuffer, 8 * v6->super._upscaleFactor * v6->super._maxCorrelationLength);
      bzero(v6->_channelBBuffer, 4 * v6->super._upscaleFactor * v6->super._maxCorrelationLength);
      bzero(v6->_correlationBuffer, 4 * v6->super._upscaleFactor * v6->super._maxCorrelationLength);
      -[TSAudioTimeErrorCorrelatorResampler _makeBlock](v6, "_makeBlock");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)_makeBlock
{
  float *scratchBuffer;
  float *channelABuffer;
  float *channelBBuffer;
  float *correlationBuffer;
  float *upsamplerFilterCoefficientsBuffer;
  int64_t upsamplerFilterCoefficientsLength;
  double samplingRate;
  int64_t v9;
  _QWORD v10[4];
  __int128 v11;
  float *v12;
  float *v13;
  int64_t v14;
  float *v15;
  float *v16;
  uint64_t v17;
  float *v18;
  double v19;

  scratchBuffer = self->_scratchBuffer;
  channelABuffer = self->_channelABuffer;
  channelBBuffer = self->_channelBBuffer;
  correlationBuffer = self->_correlationBuffer;
  upsamplerFilterCoefficientsBuffer = self->_upsamplerFilterCoefficientsBuffer;
  upsamplerFilterCoefficientsLength = self->_upsamplerFilterCoefficientsLength;
  samplingRate = self->super._samplingRate;
  if (upsamplerFilterCoefficientsLength >= 0)
    v9 = self->_upsamplerFilterCoefficientsLength;
  else
    v9 = upsamplerFilterCoefficientsLength + 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__TSAudioTimeErrorCorrelatorResampler__makeBlock__block_invoke;
  v10[3] = &__block_descriptor_112_e18_d32__0r_f8r_f16q24l;
  v11 = *(_OWORD *)&self->super._maxCorrelationLength;
  v12 = channelABuffer;
  v13 = scratchBuffer;
  v14 = upsamplerFilterCoefficientsLength;
  v15 = channelBBuffer;
  v16 = correlationBuffer;
  v17 = v9 >> 1;
  v18 = upsamplerFilterCoefficientsBuffer;
  v19 = samplingRate;
  -[TSAudioTimeErrorCorrelator setCorrelationBlock:](self, "setCorrelationBlock:", v10);
}

void __49__TSAudioTimeErrorCorrelatorResampler__makeBlock__block_invoke(uint64_t a1, const float *__A, const float *a3, int64_t __N)
{
  const float *v4;
  const float *v5;
  int64_t v6;
  uint64_t v8;
  int64_t v9;
  const float *v10;
  float *v11;
  uint64_t v12;
  int64_t v13;
  float v14;
  uint64_t v15;
  const float *v16;
  float *v17;
  uint64_t v18;
  float v19;
  vDSP_Length __I;
  float __C;

  if (*(_QWORD *)(a1 + 32) < __N)
    __49__TSAudioTimeErrorCorrelatorResampler__makeBlock__block_invoke_cold_1();
  v4 = __A;
  if (__A)
  {
    v5 = a3;
    if (a3)
    {
      v6 = __N;
      __C = 0.0;
      __I = 0;
      v8 = *(_QWORD *)(a1 + 40);
      vDSP_vabs(__A, 1, *(float **)(a1 + 48), 1, __N);
      vDSP_maxvi(v4, 1, &__C, &__I, v6);
      if (__C <= 0.05)
      {
        printf("insufficient channel A signal level %f\n", __C);
      }
      else
      {
        vDSP_vabs(v5, 1, *(float **)(a1 + 48), 1, v6);
        vDSP_maxvi(v5, 1, &__C, &__I, v6);
        if (__C <= 0.05)
        {
          printf("insufficient channel B signal level %f\n", __C);
        }
        else
        {
          v9 = v8 * v6;
          bzero(*(void **)(a1 + 56), *(_QWORD *)(a1 + 64) + 4 * *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32));
          bzero(*(void **)(a1 + 48), 8 * *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32));
          bzero(*(void **)(a1 + 72), 4 * *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32));
          bzero(*(void **)(a1 + 80), 4 * *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32));
          v10 = *(const float **)(a1 + 56);
          if (v6 >= 1)
          {
            v11 = (float *)&v10[*(_QWORD *)(a1 + 88)];
            v12 = 4 * *(_QWORD *)(a1 + 40);
            v13 = v6;
            do
            {
              v14 = *v4++;
              *v11 = v14;
              v11 = (float *)((char *)v11 + v12);
              --v13;
            }
            while (v13);
          }
          if (v9 >= 0)
            v15 = v9;
          else
            v15 = v9 + 1;
          vDSP_conv(v10, 1, (const float *)(*(_QWORD *)(a1 + 96) + 4 * *(_QWORD *)(a1 + 64) - 4), -1, (float *)(*(_QWORD *)(a1 + 48) + 4 * (v15 >> 1)), 1, v9, *(_QWORD *)(a1 + 64));
          v16 = *(const float **)(a1 + 56);
          if (v6 >= 1)
          {
            v17 = (float *)&v16[*(_QWORD *)(a1 + 88)];
            v18 = 4 * *(_QWORD *)(a1 + 40);
            do
            {
              v19 = *v5++;
              *v17 = v19;
              v17 = (float *)((char *)v17 + v18);
              --v6;
            }
            while (v6);
          }
          vDSP_conv(v16, 1, (const float *)(*(_QWORD *)(a1 + 96) + 4 * *(_QWORD *)(a1 + 64) - 4), -1, *(float **)(a1 + 72), 1, v9, *(_QWORD *)(a1 + 64));
          vDSP_conv(*(const float **)(a1 + 48), 1, *(const float **)(a1 + 72), 1, *(float **)(a1 + 80), 1, v9, v9);
          vDSP_maxvi(*(const float **)(a1 + 80), 1, &__C, &__I, v9);
        }
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  free(self->_scratchBuffer);
  free(self->_channelABuffer);
  free(self->_channelBBuffer);
  free(self->_correlationBuffer);
  free(self->_upsamplerFilterCoefficientsBuffer);
  v3.receiver = self;
  v3.super_class = (Class)TSAudioTimeErrorCorrelatorResampler;
  -[TSAudioTimeErrorCorrelatorResampler dealloc](&v3, sel_dealloc);
}

void __49__TSAudioTimeErrorCorrelatorResampler__makeBlock__block_invoke_cold_1()
{
  __assert_rtn("-[TSAudioTimeErrorCorrelatorResampler _makeBlock]_block_invoke", "TSAudioTimeErrorCalculator.m", 306, "correlationLength <= maxCorrelationLength");
}

@end
