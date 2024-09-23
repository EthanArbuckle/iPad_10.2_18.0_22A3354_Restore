@implementation WKBokehInfiniteImpulseResponseFilter

- (WKBokehInfiniteImpulseResponseFilter)initWithCount:(unint64_t)a3 feedforwardCoefficients:(double *)a4 feedbackCoefficients:(double *)a5
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  double *v9;
  WKBokehInfiniteImpulseResponseFilter *v10;
  double v12;
  uint64_t i;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double *v17;
  double v18;
  WKBokehInfiniteImpulseResponseFilter *v19;
  WKBokehInfiniteImpulseResponseFilter *v20;
  size_t v21;
  Class *v22;
  double *ffC;
  unint64_t v24;
  uint64_t v25;
  Class isa;
  double *v27;
  double *inputHistory;
  objc_super v30;

  if (a3 <= 1)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("count < 2");
LABEL_19:
    objc_msgSend(v6, "raise:format:", v7, v8, a5);
    v10 = 0;
    goto LABEL_20;
  }
  v9 = a4;
  if (!a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("feedforwardCoefficients is NULL");
    goto LABEL_19;
  }
  v10 = (WKBokehInfiniteImpulseResponseFilter *)a5;
  if (a5)
  {
    v12 = 0.0;
    for (i = 1; i != a3; ++i)
      v12 = v12 + a5[i];
    v14 = a3;
    v15 = 0.0;
    v16 = a3;
    v17 = a4;
    do
    {
      v18 = *v17++;
      v15 = v15 + v18;
      --v16;
    }
    while (v16);
    if (fabs((v15 - v12) * (1.0 / *a5) + -1.0) > 0.00001)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("coefficients scale the output, (1.0 / fbC[0])(sum(ffC) - sum(fbC[1:])) should be 1.0"));
    v30.receiver = self;
    v30.super_class = (Class)WKBokehInfiniteImpulseResponseFilter;
    v19 = -[WKBokehInfiniteImpulseResponseFilter init](&v30, sel_init);
    v20 = v19;
    if (v19)
    {
      v19->_count = a3;
      v21 = 8 * a3;
      v19->_ffC = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v22 = (Class *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v20->_fbC = (double *)v22;
      ffC = v20->_ffC;
      v24 = v14;
      do
      {
        v25 = *(_QWORD *)v9++;
        *(_QWORD *)ffC++ = v25;
        isa = v10->super.isa;
        v10 = (WKBokehInfiniteImpulseResponseFilter *)((char *)v10 + 8);
        *v22++ = isa;
        --v24;
      }
      while (v24);
      v20->_inputHistory = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v27 = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v20->_outputHistory = v27;
      inputHistory = v20->_inputHistory;
      do
      {
        *inputHistory++ = 0.0;
        *v27++ = 0.0;
        --v14;
      }
      while (v14);
      v20->_zeroGradientThreshold = 0.001;
    }
    self = v20;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("feedbackCoefficients is NULL"));
  }
LABEL_20:

  return v10;
}

+ (id)lowpassFilterWithCoefficient:(double)a1
{
  const __CFString *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a1 <= 0.0)
  {
    v2 = CFSTR("coeff <= 0.0");
    goto LABEL_5;
  }
  if (a1 >= 1.0)
  {
    v2 = CFSTR("coeff >= 1.0");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v2);
  }
  v5[1] = 0;
  v4[0] = 0x3FF0000000000000;
  *(double *)&v4[1] = a1 + -1.0;
  *(double *)v5 = a1;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCount:feedforwardCoefficients:feedbackCoefficients:", 2, v5, v4);
}

+ (id)lowpassInertiaFilterWithCoefficient:(double)a1
{
  double v1;
  const __CFString *v2;
  float64x2_t v3;
  double v6;
  _QWORD v7[3];
  float64x2_t v8;
  double v9;
  float64x2_t v10;
  double v11;
  float64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1 = a1;
  if (a1 <= 0.0)
  {
    v2 = CFSTR("coeff <= 0.0");
    goto LABEL_5;
  }
  if (a1 >= 1.0)
  {
    v2 = CFSTR("coeff >= 1.0");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v2, *(_QWORD *)&a1);
    v1 = v6;
  }
  v9 = v1;
  v10 = vmulq_n_f64((float64x2_t)xmmword_1B8CE3C30, v1);
  v3 = vmulq_n_f64((float64x2_t)xmmword_1B8CE3C40, v1);
  v11 = v1 * 0.3;
  v12 = v3.f64[0];
  v7[0] = 0x3FF0000000000000;
  *(double *)&v7[1] = v1 + -1.0;
  *(double *)&v7[2] = v1 * 0.4;
  v8 = v3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCount:feedforwardCoefficients:feedbackCoefficients:", 5, &v9, v7);
}

- (uint64_t)setLowpassInertiaFilterCoefficient:(uint64_t)result
{
  float64x2_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v2 = vmulq_n_f64((float64x2_t)xmmword_1B8CE3C40, a2);
    v3 = *(_QWORD *)(result + 16);
    *(double *)v3 = a2;
    *(float64x2_t *)(v3 + 8) = vmulq_n_f64((float64x2_t)xmmword_1B8CE3C30, a2);
    *(double *)(v3 + 24) = a2 * 0.3;
    *(float64_t *)(v3 + 32) = v2.f64[0];
    v4 = *(_QWORD *)(result + 24);
    *(_QWORD *)v4 = 0x3FF0000000000000;
    *(double *)(v4 + 8) = a2 + -1.0;
    *(double *)(v4 + 16) = a2 * 0.4;
    *(float64x2_t *)(v4 + 24) = v2;
  }
  return result;
}

- (double)filterWithInput:(_QWORD *)a1
{
  double *v4;
  unint64_t v5;
  double v6;
  double v7;
  double *v8;
  double *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;

  if (!a1)
    return 0.0;
  v4 = (double *)a1[4];
  memmove(v4 + 1, v4, 8 * a1[1] - 8);
  *v4 = a2;
  v5 = a1[1];
  v6 = 0.0;
  v7 = 0.0;
  if (v5 >= 2)
  {
    v8 = (double *)a1[5];
    v9 = (double *)(a1[3] + 8);
    v10 = v5 - 1;
    do
    {
      v11 = *v8++;
      v12 = v11;
      v13 = *v9++;
      v7 = v7 + v12 * v13;
      --v10;
    }
    while (v10);
  }
  if (v5)
  {
    v14 = (double *)a1[4];
    v15 = (double *)a1[2];
    v6 = 0.0;
    v16 = a1[1];
    do
    {
      v17 = *v14++;
      v18 = v17;
      v19 = *v15++;
      v6 = v6 + v18 * v19;
      --v16;
    }
    while (v16);
  }
  v20 = (v6 - v7) * (1.0 / *(double *)a1[3]);
  v21 = (double *)a1[5];
  memmove(v21 + 1, v21, 8 * v5 - 8);
  *v21 = v20;
  return v20;
}

- (double)output
{
  if (a1)
    return **(double **)(a1 + 40);
  else
    return 0.0;
}

- (double)outputGradient
{
  if (a1)
    return **(double **)(a1 + 40) - *(double *)(*(_QWORD *)(a1 + 40) + 8);
  else
    return 0.0;
}

- (BOOL)zeroGradient
{
  if (result)
    return vabdd_f64(**(double **)(result + 40), *(double *)(*(_QWORD *)(result + 40) + 8)) < *(double *)(result + 48);
  return result;
}

- (_QWORD)resetToValue:(_QWORD *)result
{
  uint64_t v2;
  double *v3;
  uint64_t v4;
  double *v5;

  if (result)
  {
    v2 = result[1];
    if (v2)
    {
      v3 = (double *)result[4];
      v4 = result[1];
      do
      {
        *v3++ = a2;
        --v4;
      }
      while (v4);
      v5 = (double *)result[5];
      do
      {
        *v5++ = a2;
        --v2;
      }
      while (v2);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_ffC);
  free(self->_fbC);
  free(self->_inputHistory);
  free(self->_outputHistory);
  v3.receiver = self;
  v3.super_class = (Class)WKBokehInfiniteImpulseResponseFilter;
  -[WKBokehInfiniteImpulseResponseFilter dealloc](&v3, sel_dealloc);
}

- (double)zeroGradientThreshold
{
  if (a1)
    return *(double *)(a1 + 48);
  else
    return 0.0;
}

- (uint64_t)setZeroGradientThreshold:(uint64_t)result
{
  if (result)
    *(double *)(result + 48) = a2;
  return result;
}

@end
