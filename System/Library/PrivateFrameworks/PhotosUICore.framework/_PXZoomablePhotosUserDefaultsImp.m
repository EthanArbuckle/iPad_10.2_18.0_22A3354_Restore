@implementation _PXZoomablePhotosUserDefaultsImp

- (PXUserDefaults)defaults
{
  return self->_defaults;
}

- (_PXZoomablePhotosUserDefaultsImp)initWithUserDefaults:(id)a3
{
  id v5;
  _PXZoomablePhotosUserDefaultsImp *v6;
  _PXZoomablePhotosUserDefaultsImp *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXZoomablePhotosUserDefaultsImp;
  v6 = -[_PXZoomablePhotosUserDefaultsImp init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaults, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
