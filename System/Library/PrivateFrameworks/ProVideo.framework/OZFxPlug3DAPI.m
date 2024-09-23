@implementation OZFxPlug3DAPI

- (void)_setCameraMatrix:(PCMatrix44Tmpl<double> *)a3
{
  char *v4;
  uint64_t i;
  uint64_t j;

  v4 = get3DAPIData();
  if (v4 != (char *)a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        *(double *)&v4[j * 8] = a3->var0[0][j];
      v4 += 32;
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToFilmMatrix:(PCMatrix44Tmpl<double> *)a3
{
  PCMatrix44Tmpl<double> *v4;
  uint64_t i;
  uint64_t j;

  v4 = (PCMatrix44Tmpl<double> *)(get3DAPIData() + 128);
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setLayerMatrix:(PCMatrix44Tmpl<double> *)a3
{
  PCMatrix44Tmpl<double> *v4;
  uint64_t i;
  uint64_t j;

  v4 = (PCMatrix44Tmpl<double> *)(get3DAPIData() + 256);
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToLayerMatrix:(PCMatrix44Tmpl<double> *)a3
{
  PCMatrix44Tmpl<double> *v4;
  uint64_t i;
  uint64_t j;

  v4 = (PCMatrix44Tmpl<double> *)(get3DAPIData() + 384);
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToObjectMatrix:(PCMatrix44Tmpl<double> *)a3
{
  PCMatrix44Tmpl<double> *v4;
  uint64_t i;
  uint64_t j;

  v4 = (PCMatrix44Tmpl<double> *)(get3DAPIData() + 512);
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToEyeMatrix:(PCMatrix44Tmpl<double> *)a3
{
  PCMatrix44Tmpl<double> *v4;
  uint64_t i;
  uint64_t j;

  v4 = (PCMatrix44Tmpl<double> *)(get3DAPIData() + 640);
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setIs3D:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_is3D);
}

- (void)_setFocalLength:(double)a3
{
  *((double *)get3DAPIData() + 96) = a3;
}

- (id)cameraMatrixAtTime:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData(), 128);
}

- (id)worldToFilmMatrix
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData() + 128, 128);
}

- (id)layerMatrixAtTime:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData() + 256, 128);
}

- (id)worldToLayerMatrix
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData() + 384, 128);
}

- (id)worldToObjectMatrix
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData() + 512, 128);
}

- (id)worldToEyeMatrix
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", get3DAPIData() + 640, 128);
}

- (BOOL)is3D
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_is3D);
  return v2 & 1;
}

- (BOOL)isUsingCamera
{
  return 1;
}

- (double)focalLengthAtTime:(double)a3
{
  return *((double *)get3DAPIData() + 96);
}

- (double)focalLengthAtFxTime:(id)a3
{
  double result;

  -[OZFxPlug3DAPI focalLengthAtTime:](self, "focalLengthAtTime:", a3.var1, 0.0);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A8250 == a3;
}

@end
