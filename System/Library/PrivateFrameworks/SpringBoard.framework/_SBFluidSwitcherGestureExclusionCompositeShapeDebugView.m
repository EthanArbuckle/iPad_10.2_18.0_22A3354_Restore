@implementation _SBFluidSwitcherGestureExclusionCompositeShapeDebugView

- (void)drawRect:(CGRect)a3
{
  void *v4;
  CGContext *CurrentContext;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_SBFluidSwitcherGestureExclusionCompositeShapeDebugView;
  -[_SBFluidSwitcherGestureExclusionCompositeShapeDebugView drawRect:](&v15, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_compositeShape)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFill");

    CurrentContext = UIGraphicsGetCurrentContext();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SBFluidSwitcherGestureExclusionCompositeShape rects](self->_compositeShape, "rects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "CGRectValue");
          CGContextFillRect(CurrentContext, v18);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

- (SBFluidSwitcherGestureExclusionCompositeShape)compositeShape
{
  return self->_compositeShape;
}

- (void)setCompositeShape:(id)a3
{
  objc_storeStrong((id *)&self->_compositeShape, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeShape, 0);
}

@end
