@implementation TSAudioTimeErrorCorrelatorPostUpsampler

- (TSAudioTimeErrorCorrelatorPostUpsampler)initWithMaxCorrelationLength:(int64_t)a3 andUpscaleFactor:(int64_t)a4 forSamplingRate:(double)a5
{
  TSAudioTimeErrorCorrelatorPostUpsampler *v5;
  TSAudioTimeErrorCorrelatorPostUpsampler *v6;
  float **p_upsamplerFilterCoefficientsBuffer;
  int64_t *p_upsamplerFilterCoefficientsLength;
  float *v9;
  float *v10;
  float *channelABuffer;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSAudioTimeErrorCorrelatorPostUpsampler;
  v5 = -[TSAudioTimeErrorCorrelator initWithMaxCorrelationLength:andUpscaleFactor:forSamplingRate:](&v13, sel_initWithMaxCorrelationLength_andUpscaleFactor_forSamplingRate_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    p_upsamplerFilterCoefficientsBuffer = &v5->_upsamplerFilterCoefficientsBuffer;
    p_upsamplerFilterCoefficientsLength = &v5->_upsamplerFilterCoefficientsLength;
    -[TSAudioTimeErrorCorrelator _calculateUpsamplerCoefficients:length:](v5, "_calculateUpsamplerCoefficients:length:", &v5->_upsamplerFilterCoefficientsBuffer, &v5->_upsamplerFilterCoefficientsLength);
    v6->_channelABuffer = (float *)malloc_type_calloc(2 * v6->super._maxCorrelationLength, 4uLL, 0x100004052888210uLL);
    v6->_scratch1Buffer = (float *)malloc_type_calloc(v6->super._maxCorrelationLength, 4uLL, 0x100004052888210uLL);
    v6->_scratch2Buffer = (float *)malloc_type_calloc(*p_upsamplerFilterCoefficientsLength+ v6->super._maxCorrelationLength * v6->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v9 = (float *)malloc_type_calloc(v6->super._maxCorrelationLength * v6->super._upscaleFactor, 4uLL, 0x100004052888210uLL);
    v6->_correlationBuffer = v9;
    if (v6->_scratch1Buffer
      && v6->_scratch2Buffer
      && (v10 = v9, (channelABuffer = v6->_channelABuffer) != 0)
      && v10
      && *p_upsamplerFilterCoefficientsBuffer)
    {
      bzero(channelABuffer, 8 * v6->super._maxCorrelationLength);
      bzero(v6->_scratch1Buffer, 4 * v6->super._maxCorrelationLength);
      bzero(v6->_scratch2Buffer, 4 * (*p_upsamplerFilterCoefficientsLength + v6->super._maxCorrelationLength * v6->super._upscaleFactor));
      bzero(v6->_correlationBuffer, 4 * v6->super._upscaleFactor * v6->super._maxCorrelationLength);
      -[TSAudioTimeErrorCorrelatorPostUpsampler _makeBlock](v6, "_makeBlock");
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
  float *scratch1Buffer;
  float *scratch2Buffer;
  float *channelABuffer;
  float *correlationBuffer;
  float *upsamplerFilterCoefficientsBuffer;
  int64_t upsamplerFilterCoefficientsLength;
  double samplingRate;
  int64_t v9;
  _QWORD v10[4];
  __int128 v11;
  float *v12;
  float *v13;
  float *v14;
  int64_t v15;
  float *v16;
  uint64_t v17;
  float *v18;
  double v19;

  scratch1Buffer = self->_scratch1Buffer;
  scratch2Buffer = self->_scratch2Buffer;
  channelABuffer = self->_channelABuffer;
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
  v10[2] = __53__TSAudioTimeErrorCorrelatorPostUpsampler__makeBlock__block_invoke;
  v10[3] = &__block_descriptor_112_e18_d32__0r_f8r_f16q24l;
  v11 = *(_OWORD *)&self->super._maxCorrelationLength;
  v12 = channelABuffer;
  v13 = scratch1Buffer;
  v14 = scratch2Buffer;
  v15 = upsamplerFilterCoefficientsLength;
  v16 = correlationBuffer;
  v17 = v9 >> 1;
  v18 = upsamplerFilterCoefficientsBuffer;
  v19 = samplingRate;
  -[TSAudioTimeErrorCorrelator setCorrelationBlock:](self, "setCorrelationBlock:", v10);
}

void __53__TSAudioTimeErrorCorrelatorPostUpsampler__makeBlock__block_invoke(uint64_t a1, const float *__A, const float *a3, int64_t __N)
{
  int64_t v6;
  uint64_t v8;
  vDSP_Length v9;
  unint64_t v10;
  const float *v11;
  int *v12;
  float *v13;
  uint64_t v14;
  int v15;
  float v16;
  vDSP_Length __I;
  float __C;

  if (*(_QWORD *)(a1 + 32) < __N)
    __53__TSAudioTimeErrorCorrelatorPostUpsampler__makeBlock__block_invoke_cold_1();
  if (__A && a3)
  {
    v6 = __N;
    __C = 0.0;
    __I = 0;
    v8 = *(_QWORD *)(a1 + 40);
    vDSP_vabs(__A, 1, *(float **)(a1 + 48), 1, __N);
    vDSP_maxvi(__A, 1, &__C, &__I, v6);
    if (__C <= 0.05)
    {
      printf("insufficient channel A signal level %f\n");
    }
    else
    {
      vDSP_vabs(a3, 1, *(float **)(a1 + 48), 1, v6);
      vDSP_maxvi(a3, 1, &__C, &__I, v6);
      if (__C <= 0.05)
      {
        printf("insufficient channel B signal level %f\n");
      }
      else
      {
        v9 = v8 * v6;
        bzero(*(void **)(a1 + 48), 8 * *(_QWORD *)(a1 + 32));
        bzero(*(void **)(a1 + 56), 4 * *(_QWORD *)(a1 + 32));
        bzero(*(void **)(a1 + 64), 4 * (*(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 32) * *(_QWORD *)(a1 + 40)));
        bzero(*(void **)(a1 + 80), 4 * *(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32));
        if (v6 >= 0)
          v10 = v6;
        else
          v10 = v6 + 1;
        memcpy((void *)(*(_QWORD *)(a1 + 48) + 4 * (v10 >> 1)), __A, 4 * v6);
        vDSP_conv(*(const float **)(a1 + 48), 1, a3, 1, *(float **)(a1 + 56), 1, v6, v6);
        v11 = *(const float **)(a1 + 64);
        if (v6 >= 1)
        {
          v12 = *(int **)(a1 + 56);
          v13 = (float *)&v11[*(_QWORD *)(a1 + 88)];
          v14 = 4 * *(_QWORD *)(a1 + 40);
          do
          {
            v15 = *v12++;
            *(_DWORD *)v13 = v15;
            v13 = (float *)((char *)v13 + v14);
            --v6;
          }
          while (v6);
        }
        vDSP_conv(v11, 1, (const float *)(*(_QWORD *)(a1 + 96) + 4 * *(_QWORD *)(a1 + 72) - 4), -1, *(float **)(a1 + 80), 1, v9, *(_QWORD *)(a1 + 72));
        vDSP_maxvi(*(const float **)(a1 + 80), 1, &__C, &__I, v9);
        if (__I)
        {
          v16 = 0.0;
          vDSP_vabs(*(const float **)(a1 + 80), 1, *(float **)(a1 + 80), 1, v9);
          vDSP_meanv(*(const float **)(a1 + 80), 1, &v16, v9);
          if ((float)(__C / v16) < 2.0)
            printf("insufficient correlation maxValue/meanValue %f/%f %f index %ld\n");
        }
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  free(self->_scratch1Buffer);
  free(self->_scratch2Buffer);
  free(self->_channelABuffer);
  free(self->_correlationBuffer);
  free(self->_upsamplerFilterCoefficientsBuffer);
  v3.receiver = self;
  v3.super_class = (Class)TSAudioTimeErrorCorrelatorPostUpsampler;
  -[TSAudioTimeErrorCorrelatorPostUpsampler dealloc](&v3, sel_dealloc);
}

void __53__TSAudioTimeErrorCorrelatorPostUpsampler__makeBlock__block_invoke_cold_1()
{
  __assert_rtn("-[TSAudioTimeErrorCorrelatorPostUpsampler _makeBlock]_block_invoke", "TSAudioTimeErrorCalculator.m", 445, "correlationLength <= maxCorrelationLength");
}

@end
