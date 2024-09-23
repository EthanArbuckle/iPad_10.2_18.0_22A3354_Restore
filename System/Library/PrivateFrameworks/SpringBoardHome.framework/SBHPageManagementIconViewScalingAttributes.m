@implementation SBHPageManagementIconViewScalingAttributes

- (SBHPageManagementIconViewScalingAttributes)initWithMinificationFilter:(id)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 allowsEdgeAntialiasing:(BOOL)a6
{
  id v10;
  SBHPageManagementIconViewScalingAttributes *v11;
  uint64_t v12;
  NSString *minificationFilter;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHPageManagementIconViewScalingAttributes;
  v11 = -[SBHPageManagementIconViewScalingAttributes init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    minificationFilter = v11->_minificationFilter;
    v11->_minificationFilter = (NSString *)v12;

    v11->_shouldRasterize = a4;
    v11->_rasterizationScale = a5;
    v11->_allowsEdgeAntialiasing = a6;
  }

  return v11;
}

- (NSString)minificationFilter
{
  return self->_minificationFilter;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minificationFilter, 0);
}

@end
