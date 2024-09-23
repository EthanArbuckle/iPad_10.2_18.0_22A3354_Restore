@implementation PXMemoriesBlacklistPlaceLocationAccessoryViewSpec

- (PXMemoriesBlacklistPlaceLocationAccessoryViewSpec)initWithLocation:(id)a3 regionRadius:(double)a4
{
  id v7;
  PXMemoriesBlacklistPlaceLocationAccessoryViewSpec *v8;
  PXMemoriesBlacklistPlaceLocationAccessoryViewSpec *v9;
  double v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesBlacklistPlaceLocationAccessoryViewSpec;
  v8 = -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:](&v12, sel_initWithContentViewFrame_, 0.0, 0.0, 294.0, 100.0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a3);
    v10 = 5000.0;
    if (a4 >= 0.0)
      v10 = a4;
    v9->_regionRadius = v10;
    -[PXMemoriesBlacklistAccessoryViewSpec setType:](v9, "setType:", 1);
  }

  return v9;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)regionRadius
{
  return self->_regionRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

+ (id)specWithLocation:(id)a3 regionRadius:(double)a4
{
  id v5;
  PXMemoriesBlacklistPlaceLocationAccessoryViewSpec *v6;

  v5 = a3;
  v6 = -[PXMemoriesBlacklistPlaceLocationAccessoryViewSpec initWithLocation:regionRadius:]([PXMemoriesBlacklistPlaceLocationAccessoryViewSpec alloc], "initWithLocation:regionRadius:", v5, a4);

  return v6;
}

@end
