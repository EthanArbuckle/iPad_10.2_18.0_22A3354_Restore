@implementation PXPlacesMapViewPort

- (PXPlacesMapViewPort)initWithMapRect:(id)a3 andViewSize:(CGSize)a4 zoomLevel:(double)a5 pitch:(double)a6
{
  CGFloat height;
  double width;
  double var1;
  double var0;
  double v12;
  double v13;
  PXPlacesMapViewPort *result;
  double v15;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v12 = a3.var0.var1;
  v13 = a3.var0.var0;
  v16.receiver = self;
  v16.super_class = (Class)PXPlacesMapViewPort;
  result = -[PXPlacesMapViewPort init](&v16, sel_init);
  if (result)
  {
    result->_mapRect.origin.y = v12;
    result->_mapRect.size.width = var0;
    result->_mapRect.size.height = var1;
    result->_viewSize.height = height;
    result->_mapRect.origin.x = v13;
    result->_zoomLevel = a5;
    result->_pitch = a6;
    v15 = var0 / width;
    if (width <= 0.0)
      v15 = 0.0;
    result->_scale = v15;
    result->_viewSize.width = width;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXPlacesMapViewPort mapRect](self, "mapRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "mapRect");
    v18 = v7 == v17 && v9 == v14;
    if (v18 && (v11 == v15 ? (v19 = v13 == v16) : (v19 = 0), v19))
    {
      -[PXPlacesMapViewPort viewSize](self, "viewSize");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v5, "viewSize");
      v20 = v24 == v26 && v22 == v25;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPlacesMapViewPort *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PXPlacesMapViewPort *v20;

  v4 = [PXPlacesMapViewPort alloc];
  -[PXPlacesMapViewPort mapRect](self, "mapRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXPlacesMapViewPort viewSize](self, "viewSize");
  v14 = v13;
  v16 = v15;
  -[PXPlacesMapViewPort zoomLevel](self, "zoomLevel");
  v18 = v17;
  -[PXPlacesMapViewPort pitch](self, "pitch");
  v20 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:](v4, "initWithMapRect:andViewSize:zoomLevel:pitch:", v6, v8, v10, v12, v14, v16, v18, v19);
  -[PXPlacesMapViewPort scale](self, "scale");
  -[PXPlacesMapViewPort setScale:](v20, "setScale:");
  return v20;
}

- (id)viewPortsBySplitingAt180thMerdian
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  id v19;
  _QWORD v20[3];
  MKMapRect v21;
  MKMapRect v22;
  MKMapRect v23;
  MKMapRect v24;

  v20[2] = *MEMORY[0x1E0C80C00];
  -[PXPlacesMapViewPort mapRect](self, "mapRect");
  if (MKMapRectSpans180thMeridian(v21))
  {
    -[PXPlacesMapViewPort mapRect](self, "mapRect");
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    v23 = MKMapRectIntersection(v22, *MEMORY[0x1E0CC1670]);
    v7 = v23.origin.x;
    v8 = v23.origin.y;
    v9 = v23.size.width;
    v10 = v23.size.height;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v24 = MKMapRectRemainder(v23);
    v11 = v24.origin.x;
    v12 = v24.origin.y;
    v13 = v24.size.width;
    v14 = v24.size.height;
    v15 = -[PXPlacesMapViewPort copyWithZone:](self, "copyWithZone:", 0);
    objc_msgSend(v15, "setMapRect:", v7, v8, v9, v10);
    v16 = -[PXPlacesMapViewPort copyWithZone:](self, "copyWithZone:", 0);
    objc_msgSend(v16, "setMapRect:", v11, v12, v13, v14);
    v20[0] = v15;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = -[PXPlacesMapViewPort copyWithZone:](self, "copyWithZone:", 0);
    v19 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)mapRect
{
  double x;
  double y;
  double width;
  double height;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  x = self->_mapRect.origin.x;
  y = self->_mapRect.origin.y;
  width = self->_mapRect.size.width;
  height = self->_mapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setMapRect:(id)a3
{
  self->_mapRect = ($14856638CADB89CDFC2B2EA2E4D627B4)a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end
