@implementation _BCUIHoverRegionBuilder

- (_BCUIHoverRegionBuilder)init
{
  _BCUIHoverRegionBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *bounds;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BCUIHoverRegionBuilder;
  v2 = -[_BCUIHoverRegionBuilder init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    bounds = v2->_bounds;
    v2->_bounds = v3;

  }
  return v2;
}

- (void)addRegionWithRect:(CGRect)a3
{
  NSMutableArray *bounds;
  id v4;

  bounds = self->_bounds;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  -[NSMutableArray addObject:](bounds, "addObject:", v4);

}

- (NSMutableArray)bounds
{
  return self->_bounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
