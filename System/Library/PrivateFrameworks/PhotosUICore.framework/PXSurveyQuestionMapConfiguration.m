@implementation PXSurveyQuestionMapConfiguration

- (PXSurveyQuestionMapConfiguration)initWithTitle:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  PXSurveyQuestionMapConfiguration *v9;
  uint64_t v10;
  NSString *title;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionMapConfiguration.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionMapConfiguration;
  v9 = -[PXSurveyQuestionMapConfiguration init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_storeStrong((id *)&v9->_location, a4);
    v9->_isStale = 0;
  }

  return v9;
}

- (PXSurveyQuestionMapConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionMapConfiguration.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionMapConfiguration init]");

  abort();
}

- (UIView)contentView
{
  MKMapView *mapView;
  void *v4;
  MKMapView *v5;
  MKMapView *v6;
  id v7;
  MKMapView *v8;

  mapView = self->_mapView;
  if (!mapView)
  {
    -[PXSurveyQuestionMapConfiguration location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MKMapView *)objc_alloc_init(MEMORY[0x1E0CC1870]);
    v6 = self->_mapView;
    self->_mapView = v5;

    -[MKMapView setMapType:](self->_mapView, "setMapType:", 0);
    -[MKMapView setScrollEnabled:](self->_mapView, "setScrollEnabled:", 0);
    v7 = objc_alloc_init(MEMORY[0x1E0CC1908]);
    objc_msgSend(v4, "coordinate");
    objc_msgSend(v7, "setCoordinate:");
    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v7);
    v8 = self->_mapView;
    objc_msgSend(v4, "coordinate");
    -[MKMapView setRegion:](v8, "setRegion:");

    mapView = self->_mapView;
  }
  return (UIView *)mapView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[MKMapView setFrame:](self->_mapView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
