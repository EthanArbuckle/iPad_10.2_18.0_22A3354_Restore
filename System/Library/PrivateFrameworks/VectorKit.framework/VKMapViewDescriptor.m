@implementation VKMapViewDescriptor

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (int64_t)carDisplayType
{
  return self->_carDisplayType;
}

- (unsigned)mapsUsage
{
  return self->_mapsUsage;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (int64_t)mapViewPurpose
{
  return self->_mapViewPurpose;
}

- (unsigned)mapKitUsage
{
  return self->_mapKitUsage;
}

- (unsigned)mapKitClientMode
{
  return self->_mapKitClientMode;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)allowsAntialiasing
{
  return self->_allowsAntialiasing;
}

- (void)setCarDisplayType:(int64_t)a3
{
  self->_carDisplayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
}

+ (id)descriptorWithShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;

  v8 = a8;
  v11 = a4;
  v12 = a3;
  v14 = a6;
  v15 = objc_alloc_init((Class)a1);
  objc_msgSend(v15, "setShouldRasterize:", v12);
  objc_msgSend(v15, "setInBackground:", v11);
  objc_msgSend(v15, "setContentScale:", a5);
  objc_msgSend(v15, "setAuditToken:", v14);
  objc_msgSend(v15, "setMapViewPurpose:", a7);
  objc_msgSend(v15, "setAllowsAntialiasing:", v8);

  return v15;
}

- (void)setShouldRasterize:(BOOL)a3
{
  self->_shouldRasterize = a3;
}

- (void)setMapViewPurpose:(int64_t)a3
{
  self->_mapViewPurpose = a3;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void)setAllowsAntialiasing:(BOOL)a3
{
  self->_allowsAntialiasing = a3;
}

- (VKMapViewDescriptor)init
{
  VKMapViewDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKMapViewDescriptor;
  result = -[VKMapViewDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_shouldRasterize = 1;
    *(_WORD *)&result->_mapKitUsage = 256;
    result->_mapKitClientMode = 0;
  }
  return result;
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  self->_mapKitUsage = a3;
}

- (void)setMapsUsage:(unsigned __int8)a3
{
  self->_mapsUsage = a3;
}

- (void)setMapKitClientMode:(unsigned __int8)a3
{
  self->_mapKitClientMode = a3;
}

@end
