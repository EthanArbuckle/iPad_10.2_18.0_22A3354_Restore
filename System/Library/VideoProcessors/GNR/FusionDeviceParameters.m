@implementation FusionDeviceParameters

- (FusionDeviceParameters)init
{
  FusionDeviceParameters *v2;
  NSMutableArray *v3;
  NSMutableArray *bands;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FusionDeviceParameters;
  v2 = -[FusionDeviceParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    bands = v2->bands;
    v2->bands = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bands, 0);
}

@end
