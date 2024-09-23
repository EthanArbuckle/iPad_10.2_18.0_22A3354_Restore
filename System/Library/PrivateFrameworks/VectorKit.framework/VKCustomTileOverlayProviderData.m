@implementation VKCustomTileOverlayProviderData

- (VKCustomTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6
{
  VKCustomTileOverlayProviderData *v10;
  VKCustomTileOverlayProviderData *v11;
  VKCustomTileOverlayProviderData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKCustomTileOverlayProviderData;
  v10 = -[VKCustomTileOverlayProviderData init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    *(_WORD *)&v10->_forceNativeDisplayRate = 0;
    v10->_providerID = a3;
    v10->_tileSize = a4;
    v10->_minimumZ = a5;
    v10->_maximumZ = a6;
    v10->_desiredDisplayRate = 0;
    v10->_alpha = 1.0;
    v12 = v10;
  }

  return v11;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  id WeakRetained;

  self->_alpha = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "customTileOverlayDidChangeAlpha:", self);

}

- (unint64_t)desiredDisplayRate
{
  return self->_desiredDisplayRate;
}

- (void)setDesiredDisplayRate:(unint64_t)a3
{
  id WeakRetained;

  self->_desiredDisplayRate = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "customTileOverlayDidChangeDisplayRate:", self);

}

- (BOOL)forceNativeDisplayRate
{
  return self->_forceNativeDisplayRate;
}

- (void)setForceNativeDisplayRate:(BOOL)a3
{
  id WeakRetained;

  self->_forceNativeDisplayRate = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "customTileOverlayDidChangeDisplayRate:", self);

}

- (BOOL)forceContinuousLayout
{
  return self->_forceContinuousLayout;
}

- (void)setForceContinuousLayout:(BOOL)a3
{
  id WeakRetained;

  self->_forceContinuousLayout = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "customTileOverlayDidChangeDisplayRate:", self);

}

- (VKCustomTileOverlayProviderDelegate)delegate
{
  return (VKCustomTileOverlayProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)providerID
{
  return self->_providerID;
}

- (unsigned)tileSize
{
  return self->_tileSize;
}

- (unsigned)minimumZ
{
  return self->_minimumZ;
}

- (unsigned)maximumZ
{
  return self->_maximumZ;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
