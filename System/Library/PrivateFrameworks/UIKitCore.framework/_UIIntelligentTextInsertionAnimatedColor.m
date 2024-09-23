@implementation _UIIntelligentTextInsertionAnimatedColor

- (_UIIntelligentTextInsertionAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4
{
  _UIIntelligentTextInsertionAnimatedColor *v4;
  uint64_t v5;
  _UIColorPalette *sheenPalette;
  uint64_t v7;
  _UIColorPalette *foregroundPalette;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIIntelligentTextInsertionAnimatedColor;
  v4 = -[_UIAnimatedColor initWithBounds:invalidationHandler:](&v11, sel_initWithBounds_invalidationHandler_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    +[_UIColorPalette textAssistantReplacementSheenPalette](_UIColorPalette, "textAssistantReplacementSheenPalette");
    v5 = objc_claimAutoreleasedReturnValue();
    sheenPalette = v4->_sheenPalette;
    v4->_sheenPalette = (_UIColorPalette *)v5;

    +[_UIColorPalette textAssistantReplacementBuildInPalette](_UIColorPalette, "textAssistantReplacementBuildInPalette");
    v7 = objc_claimAutoreleasedReturnValue();
    foregroundPalette = v4->_foregroundPalette;
    v4->_foregroundPalette = (_UIColorPalette *)v7;

    +[UIColor labelColor](UIColor, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIIntelligentTextInsertionAnimatedColor setResolvedColor:](v4, "setResolvedColor:", v9);

  }
  return v4;
}

- (void)setResolvedColor:(id)a3
{
  id v5;
  _UIColorPalette *v6;
  void *v7;
  void *v8;
  _UIColorPalette *v9;
  _UIColorPalette *resolvedBackgroundPalette;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_resolvedColor, a3);
  v5 = a3;
  v6 = [_UIColorPalette alloc];
  v11[0] = v5;
  +[UIColor clearColor](UIColor, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIColorPalette initWithColors:locations:colorSpaceName:](v6, "initWithColors:locations:colorSpaceName:", v8, &unk_1E1A94BC8, 0);
  resolvedBackgroundPalette = self->_resolvedBackgroundPalette;
  self->_resolvedBackgroundPalette = v9;

}

- (void)_drawPalette:(id)a3 boundingRect:(CGRect)a4 usingContext:(CGContext *)a5 progress:(double)a6
{
  double height;
  double width;
  CGGradient *v10;
  CGPoint v11;
  CGPoint v12;

  height = a4.size.height;
  width = a4.size.width;
  v10 = (CGGradient *)objc_msgSend(a3, "gradientRepresentation", a4.origin.x, a4.origin.y);
  v11.x = (width + width) * a6 - width;
  v12.x = width * 4.0 * a6;
  v12.y = height * 4.0 * a6;
  v11.y = 0.0;
  CGContextDrawLinearGradient(a5, v10, v11, v12, 3u);
}

- (void)drawRect:(CGRect)a3 usingContext:(CGContext *)a4 progress:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _UIColorPalette *v12;
  _UIColorPalette **v13;
  _UIColorPalette *v14;
  uint64_t i;
  _UIColorPalette *v16;
  _QWORD v17[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17[3] = *MEMORY[0x1E0C80C00];
  v12 = self->_resolvedBackgroundPalette;
  v16 = v12;
  v17[0] = self->_foregroundPalette;
  v17[1] = self->_sheenPalette;
  v17[2] = 0;
  if (v12)
  {
    v13 = (_UIColorPalette **)v17;
    do
    {
      -[_UIIntelligentTextInsertionAnimatedColor _drawPalette:boundingRect:usingContext:progress:](self, "_drawPalette:boundingRect:usingContext:progress:", v12, a4, x, y, width, height, a5);
      v14 = *v13++;
      v12 = v14;
    }
    while (v14);
  }
  for (i = 3; i != -1; --i)

}

- (UIColor)resolvedColor
{
  return self->_resolvedColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedColor, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundPalette, 0);
  objc_storeStrong((id *)&self->_foregroundPalette, 0);
  objc_storeStrong((id *)&self->_sheenPalette, 0);
}

@end
