@implementation WFReverseCircleOverlay

- ($87AA8D00A04278A3139823EF00364AAC)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $87AA8D00A04278A3139823EF00364AAC result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- ($87AA8D00A04278A3139823EF00364AAC)innerCircleBoundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  $87AA8D00A04278A3139823EF00364AAC result;

  v6.receiver = self;
  v6.super_class = (Class)WFReverseCircleOverlay;
  -[MKCircle boundingMapRect](&v6, sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- ($87AA8D00A04278A3139823EF00364AAC)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  $87AA8D00A04278A3139823EF00364AAC result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setBoundingRect:(id)a3
{
  self->_boundingRect = ($6715D5B16E8D9A48ADAE754BDF911BAD)a3;
}

+ (id)circleWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 boundingMapRect:(id)a5
{
  double var1;
  double var0;
  double v7;
  double v8;
  void *v9;

  var1 = a5.var1.var1;
  var0 = a5.var1.var0;
  v7 = a5.var0.var1;
  v8 = a5.var0.var0;
  +[MKCircle circleWithCenterCoordinate:radius:](WFReverseCircleOverlay, "circleWithCenterCoordinate:radius:", a3.latitude, a3.longitude, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoundingRect:", v8, v7, var0, var1);
  return v9;
}

@end
