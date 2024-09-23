@implementation PXPlacesMapContainerConfiguration

- (PXPlacesMapContainerConfiguration)initWithConfiguration:(id)a3
{
  void (**v4)(id, id);
  char *v5;
  PXPlacesMapContainerConfiguration *v6;
  __int128 v7;
  objc_super v9;

  v4 = (void (**)(id, id))a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapContainerConfiguration;
  v5 = -[PXPlacesMapContainerConfiguration init](&v9, sel_init);
  v6 = (PXPlacesMapContainerConfiguration *)v5;
  if (v5)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CC1568] + 16);
    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E0CC1568];
    *(_OWORD *)(v5 + 40) = v7;
    v4[2](v4, v5);
  }

  return v6;
}

- (PXPlacesMapContainerConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapContainerConfiguration.m"), 43, CFSTR("%s is not available as initializer"), "-[PXPlacesMapContainerConfiguration init]");

  abort();
}

- (BOOL)gridViewEnabled
{
  return self->gridViewEnabled;
}

- (void)setGridViewEnabled:(BOOL)a3
{
  self->gridViewEnabled = a3;
}

- ($FF1229205817863B52D17A627F035FCE)initialCoordinateRegion
{
  return self;
}

- (void)setInitialCoordinateRegion:(id *)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double v5;
  double v6;

  self->_initialCoordinateRegion.center.latitude = v3;
  self->_initialCoordinateRegion.center.longitude = v4;
  self->_initialCoordinateRegion.span.latitudeDelta = v5;
  self->_initialCoordinateRegion.span.longitudeDelta = v6;
}

- (NSString)localizedNavigationItemTitle
{
  return self->localizedNavigationItemTitle;
}

- (void)setLocalizedNavigationItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->localizedNavigationItemTitle, a3);
}

- (BOOL)enableNearbyAssetsAffordance
{
  return self->enableNearbyAssetsAffordance;
}

- (void)setEnableNearbyAssetsAffordance:(BOOL)a3
{
  self->enableNearbyAssetsAffordance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->localizedNavigationItemTitle, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPlacesMapContainerConfiguration.m"), 39, CFSTR("%s is not available as initializer"), "+[PXPlacesMapContainerConfiguration new]");

  abort();
}

@end
