@implementation VKCameraDelegateMediator

- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3
{
  unint64_t regionChangeCount;
  _BOOL8 v4;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v6;
  id WeakRetained;
  id v8;

  if (!self->_isChangingMapType)
  {
    regionChangeCount = self->_regionChangeCount;
    self->_regionChangeCount = regionChangeCount + 1;
    if (!regionChangeCount)
    {
      v4 = a3;
      p_cameraDelegate = &self->_cameraDelegate;
      WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
        objc_msgSend(v8, "mapLayerWillChangeRegionAnimated:", v4);

      }
    }
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  unint64_t regionChangeCount;
  unint64_t v4;
  _BOOL8 v5;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v7;
  id WeakRetained;
  id v9;

  if (!self->_isChangingMapType)
  {
    regionChangeCount = self->_regionChangeCount;
    if (regionChangeCount)
    {
      v4 = regionChangeCount - 1;
      self->_regionChangeCount = v4;
      if (!v4)
      {
        v5 = a3;
        p_cameraDelegate = &self->_cameraDelegate;
        WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          v9 = objc_loadWeakRetained((id *)p_cameraDelegate);
          objc_msgSend(v9, "mapLayerDidChangeRegionAnimated:", v5);

        }
      }
    }
  }
}

- (void)mapLayerCanEnter3DModeDidChange:(BOOL)a3
{
  _BOOL8 v3;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v5;
  id WeakRetained;
  id v7;

  v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v7, "mapLayerCanEnter3DModeDidChange:", v3);

  }
}

- (void)setIsChangingMapType:(BOOL)a3
{
  self->_isChangingMapType = a3;
}

- (void)setCameraDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraDelegate, a3);
}

- (void)mapLayerDidChangeVisibleRegion
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  if (!self->_isChangingMapType)
  {
    p_cameraDelegate = &self->_cameraDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
      objc_msgSend(v5, "mapLayerDidChangeVisibleRegion");

    }
  }
}

- (VKCameraDelegateMediator)init
{
  VKCameraDelegateMediator *v2;
  VKCameraDelegateMediator *v3;
  VKCameraDelegateMediator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCameraDelegateMediator;
  v2 = -[VKCameraDelegateMediator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_cameraDelegate, 0);
    v4 = v3;
  }

  return v3;
}

- (void)mapLayerWillPerformZoomBounceAnimation
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerWillPerformZoomBounceAnimation");

  }
}

- (void)mapLayerDidFinishInitialTrackingAnimation
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerDidFinishInitialTrackingAnimation");

  }
}

- (id)mapLayerPresentationForAnnotation:(id)a3
{
  id v4;
  VKMapViewCameraDelegate **p_cameraDelegate;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  v4 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v8, "mapLayerPresentationForAnnotation:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)mapLayerDidBecomePitched:(BOOL)a3
{
  _BOOL8 v3;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v5;
  id WeakRetained;
  id v7;

  v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v7, "mapLayerDidBecomePitched:", v3);

  }
}

- (void)mapLayerMuninAvailabilityDidChange:(int64_t)a3
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v5;
  id WeakRetained;
  id v7;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v7, "mapLayerMuninAvailabilityDidChange:", a3);

  }
}

- (void)mapLayerCanZoomInDidChange:(BOOL)a3
{
  _BOOL8 v3;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v5;
  id WeakRetained;
  id v7;

  v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v7, "mapLayerCanZoomInDidChange:", v3);

  }
}

- (void)mapLayerCanZoomOutDidChange:(BOOL)a3
{
  _BOOL8 v3;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v5;
  id WeakRetained;
  id v7;

  v3 = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v7, "mapLayerCanZoomOutDidChange:", v3);

  }
}

- (void)mapLayerNavigationCameraHasStartedPanning
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerNavigationCameraHasStartedPanning");

  }
}

- (void)mapLayerNavigationCameraHasStoppedPanning
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerNavigationCameraHasStoppedPanning");

  }
}

- (void)mapLayerNavigationCameraDidLeaveDefaultZoom
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerNavigationCameraDidLeaveDefaultZoom");

  }
}

- (void)mapLayerNavigationCameraDidReturnToDefaultZoom
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerNavigationCameraDidReturnToDefaultZoom");

  }
}

- (void)mapLayerWillAnimateToLocation:(id)a3
{
  double var1;
  double var0;
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v6;
  id WeakRetained;
  id v8;

  var1 = a3.var1;
  var0 = a3.var0;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v8, "mapLayerWillAnimateToLocation:", var0, var1);

  }
}

- (void)mapLayerWasUnableToAnimate
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  char v3;
  id WeakRetained;
  id v5;

  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_cameraDelegate);
    objc_msgSend(v5, "mapLayerWasUnableToAnimate");

  }
}

- (VKMapViewCameraDelegate)cameraDelegate
{
  return (VKMapViewCameraDelegate *)objc_loadWeakRetained((id *)&self->_cameraDelegate);
}

- (BOOL)isChangingMapType
{
  return self->_isChangingMapType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraDelegate);
}

@end
