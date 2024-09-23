@implementation SearchHomeDataDownloaderCacheKey

- (SearchHomeDataDownloaderCacheKey)initWithMapRect:(id)a3 mapType:(unint64_t)a4 time:(double)a5 lprPowerType:(id)a6
{
  double var1;
  double var0;
  double v11;
  double v12;
  SearchHomeDataDownloaderCacheKey *result;
  objc_super v14;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v11 = a3.var0.var1;
  v12 = a3.var0.var0;
  v14.receiver = self;
  v14.super_class = (Class)SearchHomeDataDownloaderCacheKey;
  result = -[SearchHomeDataDownloaderCacheKey init](&v14, "init");
  if (result)
  {
    result->_mapRect.origin.x = v12;
    result->_mapRect.origin.y = v11;
    result->_mapRect.size.width = var0;
    result->_mapRect.size.height = var1;
    result->_mapType = a4;
    result->_timestamp = a5;
    result->_lprPowerType = (NSString *)a6;
  }
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

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
  self->_mapRect = ($99E9129AA7BA404914A9E870D54E0AD8)a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)lprPowerType
{
  return self->_lprPowerType;
}

- (void)setLprPowerType:(id)a3
{
  self->_lprPowerType = (NSString *)a3;
}

@end
