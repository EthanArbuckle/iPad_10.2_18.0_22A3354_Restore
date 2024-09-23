@implementation SXMapComponentAnnotation

- (SXMapComponentAnnotation)initWithMapItem:(id)a3
{
  id v5;
  SXMapComponentAnnotation *v6;
  SXMapComponentAnnotation *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXMapComponentAnnotation;
  v6 = -[MKPointAnnotation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    -[MKPointAnnotation setRepresentation:](v7, "setRepresentation:", 2);
    objc_msgSend(v5, "coordinate");
    -[MKPointAnnotation setCoordinate:](v7, "setCoordinate:");
    objc_msgSend(v5, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKShape setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (SXMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
