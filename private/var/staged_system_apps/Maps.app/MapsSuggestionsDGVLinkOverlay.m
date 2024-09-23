@implementation MapsSuggestionsDGVLinkOverlay

- (MapsSuggestionsDGVLinkOverlay)initWithFromAnnotation:(id)a3 toAnnotation:(id)a4 index:(unint64_t)a5
{
  id v8;
  id v9;
  MapsSuggestionsDGVLinkOverlay *v10;
  MapsSuggestionsDGVLinkOverlay *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  MapsSuggestionsDGVLinkOverlay *v18;
  objc_super v20;
  CLLocationCoordinate2D v21[2];

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsDGVLinkOverlay;
  v10 = -[MapsSuggestionsDGVLinkOverlay init](&v20, "init");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v8, "coordinate");
    v13 = v12;
    objc_msgSend(v8, "coordinate");
    v21[0] = CLLocationCoordinate2DMake(v13, v14);
    objc_msgSend(v9, "coordinate");
    v16 = v15;
    objc_msgSend(v9, "coordinate");
    v21[1] = CLLocationCoordinate2DMake(v16, v17);
    -[MapsSuggestionsDGVLinkOverlay setIndex:](v11, "setIndex:", a5);
    v18 = (MapsSuggestionsDGVLinkOverlay *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsDGVLinkOverlay polylineWithCoordinates:count:](MapsSuggestionsDGVLinkOverlay, "polylineWithCoordinates:count:", v21, 2));

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
