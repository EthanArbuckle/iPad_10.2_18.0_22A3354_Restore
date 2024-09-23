@implementation SearchResultDebugPolygon

- (SearchResultDebugPolygon)init
{
  SearchResultDebugPolygon *v2;
  uint64_t v3;
  UIColor *strokeColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchResultDebugPolygon;
  v2 = -[SearchResultDebugPolygon init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;

  }
  return v2;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
