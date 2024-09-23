@implementation PAEKeyerAutokeySetupUtil

- (void)getDataFromDB
{
  void *v3;
  void *v4;
  id v5;
  PAEKeyerAutokeySetup *v6;
  void *v7;
  PAEKeyerHistogram *v8;
  PAEKeyerHistogram *v9;
  PAEKeyerHistogram *v10;
  __int128 v11;
  uint64_t v12;
  id v13;

  v3 = (void *)objc_msgSend(self->_apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v3)
  {
    v4 = v3;
    v13 = 0;
    objc_msgSend(v3, "getCustomParameterValue:fromParm:atFxTime:", &v13, 4, getFxTimeZero());
    v5 = v13;

    v6 = objc_alloc_init(PAEKeyerAutokeySetup);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v13, "initialSamples"), "mutableCopy");
    -[PAEKeyerAutokeySetup setInitialSamples:](v6, "setInitialSamples:", v7);

    v11 = *MEMORY[0x1E0CA2E68];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v10 = 0;
    objc_msgSend(v4, "getCustomParameterValue:fromParm:atFxTime:", &v10, 9, &v11);
    v8 = v10;

    v9 = v10;
    self->_autokeySetup = v6;
    self->_keyerHistogram = v9;

  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerAutokeySetupUtil;
  -[PAEKeyerAutokeySetupUtil dealloc](&v3, sel_dealloc);
}

- (PAEKeyerAutokeySetupUtil)initWithAPIManager:(id)a3
{
  PAEKeyerAutokeySetupUtil *v4;
  PAEKeyerAutokeySetupUtil *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEKeyerAutokeySetupUtil;
  v4 = -[PAEKeyerAutokeySetupUtil init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_apiManager = a3;
    -[PAEKeyerAutokeySetupUtil getDataFromDB](v4, "getDataFromDB");
  }
  return v5;
}

- (id)getInitialSamples
{
  return -[PAEKeyerAutokeySetup initialSamples](self->_autokeySetup, "initialSamples");
}

- (void)syncWithDB
{
  uint64_t v3;
  void *v4;
  PAEKeyerAutokeySetup *v5;
  void *v6;
  PAEKeyerHistogram *keyerHistogram;
  __int128 v8;
  uint64_t v9;

  v3 = objc_msgSend(self->_apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v3 && self->_autokeySetup)
  {
    v4 = (void *)v3;
    v5 = objc_alloc_init(PAEKeyerAutokeySetup);
    v6 = (void *)objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "mutableCopy");
    -[PAEKeyerAutokeySetup setInitialSamples:](v5, "setInitialSamples:", v6);

    keyerHistogram = self->_keyerHistogram;
    if (keyerHistogram)
    {
      v8 = *MEMORY[0x1E0CA2E68];
      v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v4, "setCustomParameterValue:toParm:atFxTime:", keyerHistogram, 9, &v8);
    }
    objc_msgSend(v4, "setCustomParameterValue:toParm:atFxTime:", v5, 4, getFxTimeZero());
  }
}

- (void)syncWithDBAsDefault
{
  uint64_t v3;
  void *v4;
  PAEKeyerAutokeySetup *v5;
  void *v6;
  PAEKeyerHistogram *keyerHistogram;

  v3 = objc_msgSend(self->_apiManager, "apiForProtocol:", &unk_1EF0A52B8);
  if (v3 && self->_autokeySetup)
  {
    v4 = (void *)v3;
    v5 = objc_alloc_init(PAEKeyerAutokeySetup);
    v6 = (void *)objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "mutableCopy");
    -[PAEKeyerAutokeySetup setInitialSamples:](v5, "setInitialSamples:", v6);

    keyerHistogram = self->_keyerHistogram;
    if (keyerHistogram)
      objc_msgSend(v4, "setCustomParameterDefaultValue:parmId:", keyerHistogram, 9);
    objc_msgSend(v4, "setCustomParameterDefaultValue:parmId:", v5, 4);
  }
}

- (int)getSamplesNb
{
  return (int)objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "count") / 3;
}

- (Vec3f)getInitialSample:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  float v11;
  float v12;
  float v13;
  Vec3f result;

  v4 = v3;
  v5 = 3 * a3;
  v6 = -[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples");
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5), "floatValue");
  v8 = v7;
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5 + 1), "floatValue");
  v10 = v9;
  objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v5 + 2), "floatValue");
  *(_DWORD *)v4 = v8;
  *(_DWORD *)(v4 + 4) = v10;
  *(float *)(v4 + 8) = v11;
  result.var0[2] = v13;
  result.var0[1] = v12;
  result.var0[0] = v11;
  return result;
}

- (Vec3f)getInitialSample:(int)a3 usingArray:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  float v12;
  float v13;
  float v14;
  Vec3f result;

  v6 = v4;
  v7 = 3 * a3;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3 * a3), "floatValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v7 + 1), "floatValue");
  v11 = v10;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v7 + 2), "floatValue");
  *(_DWORD *)v6 = v9;
  *(_DWORD *)(v6 + 4) = v11;
  *(float *)(v6 + 8) = v12;
  result.var0[2] = v14;
  result.var0[1] = v13;
  result.var0[0] = v12;
  return result;
}

- (void)delInitialSample:(int)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = 3 * a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v4);
  v6 = v4 - 1;
  do
  {
    objc_msgSend(v5, "addIndex:", v6 + 2);
    ++v6;
  }
  while (v6 <= v4);
  objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "removeObjectsAtIndexes:", v5);
}

- (void)clearInitialSamples
{
  objc_msgSend(-[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples"), "removeAllObjects");
}

- (void)addInitialSample:(Vec3f *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = -[PAEKeyerAutokeySetupUtil getInitialSamples](self, "getInitialSamples");
  *(float *)&v5 = a3->var0[0];
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5));
  *(float *)&v6 = a3->var0[1];
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6));
  *(float *)&v7 = a3->var0[2];
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7));
}

- (void)fillAutokeySamplesArray:(void *)a3
{
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v5 = -[PAEKeyerAutokeySetupUtil getSamplesNb](self, "getSamplesNb");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      if (self)
      {
        -[PAEKeyerAutokeySetupUtil getInitialSample:](self, "getInitialSample:", v7);
      }
      else
      {
        v11 = 0;
        v10 = 0;
      }
      v8 = *((_QWORD *)a3 + 1);
      if (v8 >= *((_QWORD *)a3 + 2))
      {
        v9 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)a3, &v10);
      }
      else
      {
        *(_QWORD *)v8 = v10;
        *(_DWORD *)(v8 + 8) = v11;
        v9 = v8 + 12;
      }
      *((_QWORD *)a3 + 1) = v9;
      v7 = (v7 + 1);
    }
    while (v6 != (_DWORD)v7);
  }
}

- (void)setHistogram:(void *)a3
{
  -[PAEKeyerHistogram setHistogram:](self->_keyerHistogram, "setHistogram:", a3);
}

- (void)getHistogram
{
  return -[PAEKeyerHistogram getHistogram](self->_keyerHistogram, "getHistogram");
}

- (void)setHistogramScale:(float)a3
{
  -[PAEKeyerHistogram setHistogramScale:](self->_keyerHistogram, "setHistogramScale:");
}

- (float)getHistogramScale
{
  float result;

  -[PAEKeyerHistogram getHistogramScale](self->_keyerHistogram, "getHistogramScale");
  return result;
}

@end
