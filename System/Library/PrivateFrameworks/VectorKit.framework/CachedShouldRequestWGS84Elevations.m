@implementation CachedShouldRequestWGS84Elevations

- (CachedShouldRequestWGS84Elevations)init
{
  CachedShouldRequestWGS84Elevations *v2;
  id v3;
  uint64_t v4;
  id subscription;
  CachedShouldRequestWGS84Elevations *v6;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CachedShouldRequestWGS84Elevations;
  v2 = -[CachedShouldRequestWGS84Elevations init](&v10, sel_init);
  if (v2)
  {
    v2->_shouldRequestWGS84Elevations = GEOConfigGetBOOL();
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v8, &location);
    _GEOConfigAddBlockListenerForKey();
    v4 = objc_claimAutoreleasedReturnValue();
    subscription = v2->_subscription;
    v2->_subscription = (id)v4;

    v6 = v2;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)CachedShouldRequestWGS84Elevations;
  -[CachedShouldRequestWGS84Elevations dealloc](&v3, sel_dealloc);
}

- (BOOL)value
{
  return self->_shouldRequestWGS84Elevations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subscription, 0);
}

void __42__CachedShouldRequestWGS84Elevations_init__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    WeakRetained[8] = GEOConfigGetBOOL();
    WeakRetained = v2;
  }

}

@end
