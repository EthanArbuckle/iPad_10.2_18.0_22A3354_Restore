@implementation PUSingleAssetLayoutTransitionCoordinator

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return -[PUSingleAssetLayoutTransitionCoordinator _layoutInfoWithDefaultDisappearance:](self, "_layoutInfoWithDefaultDisappearance:", a4);
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return -[PUSingleAssetLayoutTransitionCoordinator _layoutInfoWithDefaultDisappearance:](self, "_layoutInfoWithDefaultDisappearance:", a4);
}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUSingleAssetLayoutTransitionCoordinator fixedCoordinateSystem](self, "fixedCoordinateSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutInfoWithCoordinateSystem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutInfoWithZPosition:", *(double *)&PUTilingLayoutBackgroundZPosition + *(double *)&PUTilingLayoutBackgroundZPosition);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (void)setFixedCoordinateSystem:(id)a3
{
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, 0);
}

@end
