@implementation PXPlacesMapModeController

- (PXPlacesMapModeController)initWithMapView:(id)a3 prefersRealisticElevationStyle:(BOOL)a4
{
  id v7;
  PXPlacesMapModeController *v8;
  PXPlacesMapModeController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapModeController;
  v8 = -[PXPlacesMapModeController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapView, a3);
    v9->_prefersRealisticElevationStyle = a4;
  }

  return v9;
}

- (PXPlacesMapModeController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapModeController.m"), 33, CFSTR("%s is not available as initializer"), "-[PXPlacesMapModeController init]");

  abort();
}

- (BOOL)togglePerspectiveIfPossible
{
  return -[PXPlacesMapModeController _toggle3DModeByAdjustingPitch:](self, "_toggle3DModeByAdjustingPitch:", 1);
}

- (BOOL)toggle3DModeIfPossible
{
  return -[PXPlacesMapModeController _toggle3DModeByAdjustingPitch:](self, "_toggle3DModeByAdjustingPitch:", 0);
}

- (void)setMapStyle:(unint64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  id v8;

  -[PXPlacesMapModeController mapView](self, "mapView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPlacesMapModeController is3DPerspectiveActive](self, "is3DPerspectiveActive");
  v6 = -[PXPlacesMapModeController prefersRealisticElevationStyle](self, "prefersRealisticElevationStyle");
  if (a3 > 2)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(**((Class **)&unk_1E51420F0 + a3)), "initWithElevationStyle:", v6 | v5);
  objc_msgSend(v8, "setPreferredConfiguration:", v7);

}

- (unint64_t)mapStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXPlacesMapModeController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = 2;
      else
        v4 = 0;
    }
  }

  return v4;
}

- (BOOL)is3DPerspectiveActive
{
  void *v2;
  double v3;
  BOOL v4;

  -[PXPlacesMapModeController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitch");
  v4 = v3 > 0.0;

  return v4;
}

- (BOOL)is3DPerspectiveActiveByCheckingPitch
{
  void *v2;
  char v3;

  -[PXPlacesMapModeController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_isPitched");

  return v3;
}

- (BOOL)supportsPerspectiveToggling
{
  void *v2;
  char v3;

  -[PXPlacesMapModeController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPitchEnabled");

  return v3;
}

- (BOOL)_toggle3DModeByAdjustingPitch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[PXPlacesMapModeController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPlacesMapModeController supportsPerspectiveToggling](self, "supportsPerspectiveToggling");
  if (v6)
  {
    v7 = -[PXPlacesMapModeController is3DPerspectiveActive](self, "is3DPerspectiveActive");
    if (-[PXPlacesMapModeController prefersRealisticElevationStyle](self, "prefersRealisticElevationStyle"))
    {
      objc_msgSend(v5, "preferredConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "preferredConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = !v7;
    }
    objc_msgSend(v8, "setElevationStyle:", v10);

    if (v3)
    {
      v11 = 45.0;
      if (v7)
        v11 = 0.0;
      objc_msgSend(v5, "setPitch:", v11);
    }
    else
    {
      -[PXPlacesMapModeController mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v7)
        objc_msgSend(v12, "_exit3DMode");
      else
        objc_msgSend(v12, "_enter3DMode");

    }
  }

  return v6;
}

- (PXPlacesMapView)mapView
{
  return self->_mapView;
}

- (BOOL)prefersRealisticElevationStyle
{
  return self->_prefersRealisticElevationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
