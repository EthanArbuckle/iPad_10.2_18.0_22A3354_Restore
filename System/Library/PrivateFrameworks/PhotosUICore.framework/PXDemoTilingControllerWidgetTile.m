@implementation PXDemoTilingControllerWidgetTile

- (PXDemoTilingControllerWidgetTile)init
{
  PXDemoTilingControllerWidgetTile *v2;
  UIView *v3;
  UIView *mapView;
  UIView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXDemoTilingControllerWidgetTile;
  v2 = -[PXDemoTilingControllerWidgetTile init](&v8, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    mapView = v2->__mapView;
    v2->__mapView = v3;

    v5 = v2->__mapView;
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v2;
}

- (UIView)_mapView
{
  return self->__mapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mapView, 0);
}

@end
