@implementation GEOComposedRoute(VKExtras)

- (uint64_t)shouldRequestWGS84Elevations
{
  CachedShouldRequestWGS84Elevations *v2;
  CachedShouldRequestWGS84Elevations *v3;
  uint64_t v4;
  CachedShouldRequestWGS84Elevations *v5;

  objc_getAssociatedObject(a1, &-[GEOComposedRoute(VKExtras) shouldRequestWGS84Elevations]::singletonCachedValue);
  v2 = (CachedShouldRequestWGS84Elevations *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = -[CachedShouldRequestWGS84Elevations value](v2, "value");
  }
  else
  {
    v5 = objc_alloc_init(CachedShouldRequestWGS84Elevations);
    objc_setAssociatedObject(a1, &-[GEOComposedRoute(VKExtras) shouldRequestWGS84Elevations]::singletonCachedValue, v5, (void *)0x301);
    v4 = -[CachedShouldRequestWGS84Elevations value](v5, "value");
    v3 = v5;
  }

  return v4;
}

- (BOOL)routeRequiresElevationCorrection
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (objc_msgSend(a1, "elevationModel")
    || !objc_msgSend(a1, "shouldRequestWGS84Elevations"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTileSetForTileType:scale:", 92, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (double)_applyAltitudeCorrectionIfNecessary:()VKExtras
{
  double result;
  void *v5;
  md::GeoidModel *v6;
  unint64_t Undulation;
  double v8;

  if (objc_msgSend(a1, "routeRequiresElevationCorrection"))
  {
    +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (md::GeoidModel *)objc_msgSend(v5, "undulationModel");

    if (v6)
    {
      Undulation = md::GeoidModel::getUndulation(v6, *a3, a3[1]);
      v8 = *(float *)&Undulation;
      if (!HIDWORD(Undulation))
        v8 = 0.0;
      result = v8 + a3[2];
      a3[2] = result;
    }
  }
  return result;
}

- (double)pointWithAltitudeCorrectionAtRouteCoordinate:()VKExtras
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];

  objc_msgSend(a1, "pointAtRouteCoordinate:");
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = v4;
  objc_msgSend(a1, "_applyAltitudeCorrectionIfNecessary:", v6);
  return *(double *)v6;
}

- (double)pointWithAltitudeCorrectionAtIndex:()VKExtras
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];

  objc_msgSend(a1, "pointAt:");
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = v4;
  objc_msgSend(a1, "_applyAltitudeCorrectionIfNecessary:", v6);
  return *(double *)v6;
}

@end
