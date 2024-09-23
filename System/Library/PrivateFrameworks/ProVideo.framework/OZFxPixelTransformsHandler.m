@implementation OZFxPixelTransformsHandler

- (OZFxPixelTransformsHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZFxPixelTransformsHandler;
  return -[OZFxPixelTransformsHandler init](&v3, sel_init);
}

- (void)setAgent:(const void *)a3
{
  *(_QWORD *)getPixelTransformsAPIData() = a3;
}

- (void)setPreTransform:(const void *)a3
{
  char *v4;
  uint64_t i;
  uint64_t j;

  v4 = getPixelTransformsAPIData() + 8;
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 32; j += 8)
        *(_QWORD *)&v4[j] = *(_QWORD *)((char *)a3 + j);
      v4 += 32;
      a3 = (char *)a3 + 32;
    }
  }
}

- (void)setPostTransform:(const void *)a3
{
  char *v4;
  uint64_t i;
  uint64_t j;

  v4 = getPixelTransformsAPIData() + 136;
  if (v4 != a3)
  {
    for (i = 0; i != 4; ++i)
    {
      for (j = 0; j != 32; j += 8)
        *(_QWORD *)&v4[j] = *(_QWORD *)((char *)a3 + j);
      v4 += 32;
      a3 = (char *)a3 + 32;
    }
  }
}

- (PCMatrix44Tmpl<double>)pixelTransform
{
  char *PixelTransformsAPIData;

  PixelTransformsAPIData = getPixelTransformsAPIData();
  return (PCMatrix44Tmpl<double> *)OZFxPixelTransformsAPIData::pixelTransform((OZFxPixelTransformsAPIData *)PixelTransformsAPIData, (uint64_t)retstr);
}

- (PCMatrix44Tmpl<double>)inversePixelTransform
{
  char *PixelTransformsAPIData;
  PCMatrix44Tmpl<double> *result;

  PixelTransformsAPIData = getPixelTransformsAPIData();
  OZFxPixelTransformsAPIData::inversePixelTransform((OZFxPixelTransformsAPIData *)PixelTransformsAPIData, (uint64_t)retstr);
  return result;
}

- (PCMatrix44Tmpl<double>)destinationPixelTransform
{
  char *PixelTransformsAPIData;

  PixelTransformsAPIData = getPixelTransformsAPIData();
  return (PCMatrix44Tmpl<double> *)OZFxPixelTransformsAPIData::destinationPixelTransform((OZFxPixelTransformsAPIData *)PixelTransformsAPIData, (uint64_t)retstr);
}

- (PCMatrix44Tmpl<double>)destinationInversePixelTransform
{
  char *PixelTransformsAPIData;
  PCMatrix44Tmpl<double> *result;

  PixelTransformsAPIData = getPixelTransformsAPIData();
  OZFxPixelTransformsAPIData::destinationInversePixelTransform((OZFxPixelTransformsAPIData *)PixelTransformsAPIData, (uint64_t)retstr);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return a4 < 2 && &unk_1EF0A3A58 == a3;
}

@end
