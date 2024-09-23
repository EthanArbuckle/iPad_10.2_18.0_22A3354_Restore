@implementation RouteTileLoadingDebugOverlay

- (RouteTileLoadingDebugOverlay)init
{
  RouteTileLoadingDebugOverlay *v2;
  GEOTileKeyList *v3;
  GEOTileKeyList *loadedKeys;
  GEOTileKeyList *v5;
  GEOTileKeyList *cachedKeys;
  GEOTileKeyList *v7;
  GEOTileKeyList *failedKeys;
  RouteTileLoadingDebugOverlay *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RouteTileLoadingDebugOverlay;
  v2 = -[RouteTileLoadingDebugOverlay init](&v11, "init");
  if (v2)
  {
    v3 = (GEOTileKeyList *)objc_msgSend(objc_alloc((Class)GEOTileKeyList), "initWithCapacity:", 1000);
    loadedKeys = v2->_loadedKeys;
    v2->_loadedKeys = v3;

    v5 = (GEOTileKeyList *)objc_msgSend(objc_alloc((Class)GEOTileKeyList), "initWithCapacity:", 1000);
    cachedKeys = v2->_cachedKeys;
    v2->_cachedKeys = v5;

    v7 = (GEOTileKeyList *)objc_msgSend(objc_alloc((Class)GEOTileKeyList), "initWithCapacity:", 100);
    failedKeys = v2->_failedKeys;
    v2->_failedKeys = v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    v9 = v2;
  }

  return v2;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v4;
  CLLocationCoordinate2D result;

  v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  longitude = v4.longitude;
  latitude = v4.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = MKMapRectWorld.origin.x;
  y = MKMapRectWorld.origin.y;
  width = MKMapRectWorld.size.width;
  height = MKMapRectWorld.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)addLoadedTileKey:(uint64_t)a3
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 8), "addKey:", a3);
  objc_msgSend(*(id *)(a1 + 24), "removeKey:", a3);
  os_unfair_lock_unlock(v5);
}

- (void)addCachedTileKey:(uint64_t)a3
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 16), "addKey:", a3);
  objc_msgSend(*(id *)(a1 + 24), "removeKey:", a3);
  os_unfair_lock_unlock(v5);
}

- (void)addFailedKey:(uint64_t)a3
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 24), "addKey:", a3);
  os_unfair_lock_unlock(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedKeys, 0);
  objc_storeStrong((id *)&self->_cachedKeys, 0);
  objc_storeStrong((id *)&self->_loadedKeys, 0);
}

@end
