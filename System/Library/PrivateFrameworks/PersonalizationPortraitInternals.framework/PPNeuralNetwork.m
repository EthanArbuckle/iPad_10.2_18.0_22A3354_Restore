@implementation PPNeuralNetwork

- (PPNeuralNetwork)initWithData:(id)a3
{
  id v6;
  PPNeuralNetwork *v7;
  PPNeuralNetwork *v8;
  unsigned int *v9;
  unint64_t v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPNeuralNetwork;
  v7 = -[PPNeuralNetwork init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v10 = *v9;
    v8->_dataBytes = (const char *)v9;
    v8->_nlayers = v10;
    if (!(_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PPNeuralNetwork.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_nlayers > 0"));

    }
    v8->_layers = (const $278F8F5807AB85F6E7DDBD32FD86D511 *)(v9 + 1);
  }

  return v8;
}

- (unint64_t)inputSize
{
  return self->_layers->var0;
}

- (unint64_t)outputSize
{
  return self->_layers[self->_nlayers - 1].var1;
}

- (double)predictWithDoubles:(const double *)a3
{
  float *v5;
  uint64_t var0;
  float *v7;
  double v8;
  float v9;
  id v11;

  v5 = (float *)malloc_type_malloc(4 * self->_layers->var0, 0x100004052888210uLL);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  var0 = self->_layers->var0;
  if ((_DWORD)var0)
  {
    v7 = v5;
    do
    {
      v8 = *a3++;
      v9 = v8;
      *v7++ = v9;
      --var0;
    }
    while (var0);
  }
  return -[PPNeuralNetwork _predict:freeInputsAfterUse:](self, v5, 1);
}

- (double)predictWithFloats:(const float *)a3
{
  return -[PPNeuralNetwork _predict:freeInputsAfterUse:](self, (float *)a3, 0);
}

- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4
{
  float *v6;
  const $278F8F5807AB85F6E7DDBD32FD86D511 *v7;
  uint64_t var1;
  double v9;
  float *v10;
  uint64_t v11;
  float v12;
  float v13;
  int __N;

  v6 = -[PPNeuralNetwork _runOnInputs:freeInputsAfterUse:](self, (float *)a3, 0);
  v7 = &self->_layers[self->_nlayers];
  var1 = (int)v7[-1].var1;
  __N = v7[-1].var1;
  if (v7[-1].var6)
  {
    vvexpf(a4, v6, &__N);
    v9 = 0.0;
    if (__N >= 1)
    {
      v10 = a4;
      v11 = __N;
      do
      {
        v12 = *v10++;
        v9 = v9 + v12;
        --v11;
      }
      while (v11);
    }
    v13 = 1.0 / v9;
    cblas_sscal(__N, v13, a4, 1);
  }
  else
  {
    memcpy(a4, v6, 4 * var1);
  }
  free(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (float)_runOnInputs:(int)a3 freeInputsAfterUse:
{
  float *v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  float *v10;
  float *__Y;
  uint64_t v12;
  int v13;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  float *v17;
  uint64_t v18;
  float *v19;
  id v21;

  if (!a1)
    return 0;
  v3 = a2;
  if (!a1[3])
    return a2;
  v6 = 0;
  do
  {
    v7 = a1[4];
    v8 = v7 + 20 * v6;
    if (*(_BYTE *)(v8 + 17))
      v9 = *(_DWORD *)(v7 + 20 * v6);
    else
      v9 = 0;
    v10 = (float *)malloc_type_malloc(4 * (v9 + *(_DWORD *)(v8 + 4)), 0x100004052888210uLL);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v21);
    }
    __Y = v10;
    memcpy(v10, (const void *)(a1[2] + *(unsigned int *)(a1[4] + 20 * v6 + 12)), 4 * *(unsigned int *)(a1[4] + 20 * v6 + 4));
    cblas_sgemv(CblasRowMajor, CblasNoTrans, *(_DWORD *)(a1[4] + 20 * v6 + 4), *(_DWORD *)(a1[4] + 20 * v6), 1.0, (const float *)(a1[2] + *(unsigned int *)(a1[4] + 20 * v6 + 8)), *(_DWORD *)(a1[4] + 20 * v6), v3, 1, 1.0, __Y, 1);
    v12 = a1[4];
    v13 = *(unsigned __int8 *)(v12 + 20 * v6 + 16);
    if (*(_BYTE *)(v12 + 20 * v6 + 16))
    {
      if (v13 == 1)
      {
        v18 = *(unsigned int *)(v12 + 20 * v6 + 4);
        v19 = __Y;
        if ((_DWORD)v18)
        {
          do
          {
            *v19 = tanhf(*v19);
            ++v19;
            --v18;
          }
          while (v18);
        }
      }
      else if (v13 == 2)
      {
        v14 = *(unsigned int *)(v12 + 20 * v6 + 4);
        v15 = __Y;
        if ((_DWORD)v14)
        {
          do
          {
            *v15 = fmaxf(*v15, 0.0);
            ++v15;
            --v14;
          }
          while (v14);
        }
      }
    }
    else
    {
      v16 = *(unsigned int *)(v12 + 20 * v6 + 4);
      if ((_DWORD)v16)
      {
        v17 = __Y;
        do
        {
          *v17 = 1.0 / (float)(expf(-*v17) + 1.0);
          ++v17;
          --v16;
        }
        while (v16);
      }
    }
    if (*(_BYTE *)(v12 + 20 * v6 + 17))
      memcpy(&__Y[*(unsigned int *)(v12 + 20 * v6 + 4)], v3, 4 * *(unsigned int *)(v12 + 20 * v6));
    if (v6 || a3)
      free(v3);
    ++v6;
    v3 = __Y;
  }
  while (v6 < a1[3]);
  return __Y;
}

- (double)_predict:(int)a3 freeInputsAfterUse:
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  float *v10;
  float *v11;
  double v12;
  double v13;

  if (!a1)
    return 0.0;
  v6 = a1[4];
  v7 = a1[3] - 1;
  v8 = *(_DWORD *)(v6 + 20 * v7 + 4);
  if (v8 != 1 && (v8 != 2 || !*(_BYTE *)(v6 + 20 * v7 + 18)))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__predict_freeInputsAfterUse_, a1, CFSTR("PPNeuralNetwork.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_layers[_nlayers-1].outsz == 1 || (_layers[_nlayers-1].outsz == 2 && _layers[_nlayers-1].softmax)"));

  }
  v10 = -[PPNeuralNetwork _runOnInputs:freeInputsAfterUse:](a1, a2, a3);
  v11 = v10;
  v12 = *v10;
  if (*(_BYTE *)(a1[4] + 20 * a1[3] - 2))
  {
    v13 = exp(*v10);
    v12 = v13 / (v13 + exp(v11[1]));
  }
  free(v11);
  return v12;
}

@end
