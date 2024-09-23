@implementation PXPhotosMapContainerViewConfiguration

- (PXPhotosMapContainerViewConfiguration)initWithMapView:(id)a3 mapOptionsViewDelegate:(id)a4 enableUserTrackingButton:(BOOL)a5 perspectiveButtonState:(unint64_t)a6 mapStyle:(unint64_t)a7
{
  id v13;
  id v14;
  PXPhotosMapContainerViewConfiguration *v15;
  PXPhotosMapContainerViewConfiguration *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosMapContainerViewConfiguration;
  v15 = -[PXPhotosMapContainerViewConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapView, a3);
    objc_storeWeak((id *)&v16->_mapOptionsViewDelegate, v14);
    v16->_enableUserTrackingButton = a5;
    v16->_perspectiveButtonState = a6;
    v16->_mapStyle = a7;
  }

  return v16;
}

- (PXPhotosMapContainerViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapContainerViewConfiguration.m"), 35, CFSTR("%s is not available as initializer"), "-[PXPhotosMapContainerViewConfiguration init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosMapContainerViewConfiguration *v4;
  void *v5;
  void *v6;
  PXPhotosMapContainerViewConfiguration *v7;

  v4 = [PXPhotosMapContainerViewConfiguration alloc];
  -[PXPhotosMapContainerViewConfiguration mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapContainerViewConfiguration mapOptionsViewDelegate](self, "mapOptionsViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPhotosMapContainerViewConfiguration initWithMapView:mapOptionsViewDelegate:enableUserTrackingButton:perspectiveButtonState:mapStyle:](v4, "initWithMapView:mapOptionsViewDelegate:enableUserTrackingButton:perspectiveButtonState:mapStyle:", v5, v6, -[PXPhotosMapContainerViewConfiguration enableUserTrackingButton](self, "enableUserTrackingButton"), -[PXPhotosMapContainerViewConfiguration perspectiveButtonState](self, "perspectiveButtonState"), -[PXPhotosMapContainerViewConfiguration mapStyle](self, "mapStyle"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXPhotosMapContainerViewConfiguration *v4;
  uint64_t v5;
  BOOL v6;
  PXPhotosMapContainerViewConfiguration *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  unint64_t v11;
  unint64_t v12;

  v4 = (PXPhotosMapContainerViewConfiguration *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[PXPhotosMapContainerViewConfiguration mapView](self, "mapView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosMapContainerViewConfiguration mapView](v7, "mapView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9)
        && (v10 = -[PXPhotosMapContainerViewConfiguration enableUserTrackingButton](self, "enableUserTrackingButton"),
            v10 == -[PXPhotosMapContainerViewConfiguration enableUserTrackingButton](v7, "enableUserTrackingButton"))
        && (v11 = -[PXPhotosMapContainerViewConfiguration perspectiveButtonState](self, "perspectiveButtonState"),
            v11 == -[PXPhotosMapContainerViewConfiguration perspectiveButtonState](v7, "perspectiveButtonState")))
      {
        v12 = -[PXPhotosMapContainerViewConfiguration mapStyle](self, "mapStyle");
        v6 = v12 == -[PXPhotosMapContainerViewConfiguration mapStyle](v7, "mapStyle");
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXPhotosMapContainerViewConfiguration mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (PXGSingleViewLayout)weakLayout
{
  return (PXGSingleViewLayout *)objc_loadWeakRetained((id *)&self->weakLayout);
}

- (void)setWeakLayout:(id)a3
{
  objc_storeWeak((id *)&self->weakLayout, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (PXMapOptionsViewDelegate)mapOptionsViewDelegate
{
  return (PXMapOptionsViewDelegate *)objc_loadWeakRetained((id *)&self->_mapOptionsViewDelegate);
}

- (BOOL)enableUserTrackingButton
{
  return self->_enableUserTrackingButton;
}

- (unint64_t)perspectiveButtonState
{
  return self->_perspectiveButtonState;
}

- (unint64_t)mapStyle
{
  return self->_mapStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapOptionsViewDelegate);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->weakLayout);
}

@end
