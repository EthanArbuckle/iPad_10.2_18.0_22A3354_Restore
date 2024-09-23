@implementation NoiseModelDeviceParameters

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *elements;
  objc_super v4;

  elements = self->high_gain_threshold.elements;
  if (elements)
    free(elements);
  self->high_gain_threshold.elements = 0;
  self->high_gain_threshold.length = 0;
  v4.receiver = self;
  v4.super_class = (Class)NoiseModelDeviceParameters;
  -[NoiseModelDeviceParameters dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bands, 0);
}

- (NoiseModelDeviceParameters)init
{
  NoiseModelDeviceParameters *v2;
  NSMutableArray *v3;
  NSMutableArray *bands;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NoiseModelDeviceParameters;
  v2 = -[NoiseModelDeviceParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    bands = v2->bands;
    v2->bands = v3;

  }
  return v2;
}

@end
