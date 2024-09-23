@implementation _UIGlyphPathBoundsIntersectionViewData

- (_UIGlyphPathBoundsIntersectionViewData)init
{
  _UIGlyphPathBoundsIntersectionViewData *v2;
  _UIGlyphPathBoundsIntersectionViewData *v3;
  CGPoint v4;
  CGSize v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIGlyphPathBoundsIntersectionViewData;
  v2 = -[_UIGlyphPathBoundsIntersectionViewData init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (CGPoint)*MEMORY[0x1E0C9D648];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_availableBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_availableBounds.size = v5;
    v2->_glyphPathBounds.origin = v4;
    v2->_glyphPathBounds.size = v5;
    objc_storeWeak((id *)&v2->_clippingView, 0);
  }
  return v3;
}

- (id)_frameDebugDescription:(CGRect)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g, %g; %g, %g)"),
               *(_QWORD *)&a3.origin.x,
               *(_QWORD *)&a3.origin.y,
               *(_QWORD *)&a3.size.width,
               *(_QWORD *)&a3.size.height);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGlyphPathBoundsIntersectionViewData _frameDebugDescription:](self, "_frameDebugDescription:", self->_availableBounds.origin.x, self->_availableBounds.origin.y, self->_availableBounds.size.width, self->_availableBounds.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGlyphPathBoundsIntersectionViewData _frameDebugDescription:](self, "_frameDebugDescription:", self->_glyphPathBounds.origin.x, self->_glyphPathBounds.origin.y, self->_glyphPathBounds.size.width, self->_glyphPathBounds.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  objc_msgSend(WeakRetained, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p availableBounds: %@, glyphPathBounds: %@, clippingView: %@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)availableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_availableBounds.origin.x;
  y = self->_availableBounds.origin.y;
  width = self->_availableBounds.size.width;
  height = self->_availableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvailableBounds:(CGRect)a3
{
  self->_availableBounds = a3;
}

- (CGRect)glyphPathBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_glyphPathBounds.origin.x;
  y = self->_glyphPathBounds.origin.y;
  width = self->_glyphPathBounds.size.width;
  height = self->_glyphPathBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGlyphPathBounds:(CGRect)a3
{
  self->_glyphPathBounds = a3;
}

- (UIView)clippingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clippingView);
}

- (void)setClippingView:(id)a3
{
  objc_storeWeak((id *)&self->_clippingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clippingView);
}

@end
