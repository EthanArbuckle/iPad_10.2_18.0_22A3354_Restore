@implementation PXMemoriesBlacklistPlaceAreaAccesoryViewSpec

- (PXMemoriesBlacklistPlaceAreaAccesoryViewSpec)init
{
  PXMemoriesBlacklistPlaceAreaAccesoryViewSpec *v2;
  PXMemoriesBlacklistPlaceAreaAccesoryViewSpec *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMemoriesBlacklistPlaceAreaAccesoryViewSpec;
  v2 = -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:](&v5, sel_initWithContentViewFrame_, 0.0, 0.0, 294.0, 100.0);
  v3 = v2;
  if (v2)
    -[PXMemoriesBlacklistAccessoryViewSpec setType:](v2, "setType:", 0);
  return v3;
}

+ (id)spec
{
  return objc_alloc_init(PXMemoriesBlacklistPlaceAreaAccesoryViewSpec);
}

@end
