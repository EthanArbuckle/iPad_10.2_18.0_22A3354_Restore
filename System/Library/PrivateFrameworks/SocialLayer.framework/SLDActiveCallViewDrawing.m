@implementation SLDActiveCallViewDrawing

- (SLDActiveCallViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9;
  id v10;
  SLDActiveCallViewDrawing *v11;
  SLDActiveCallViewDrawing *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDActiveCallViewDrawing;
  v11 = -[SLDActiveCallViewDrawing init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    objc_storeStrong((id *)&v12->_tag, a4);
    v12->_forRemote = a5;
    v12->_isRTL = objc_msgSend(v9, "layoutDirection") == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  SLDActiveCallViewRenderer *v6;
  void *v7;
  void *v8;
  SLDActiveCallViewRenderer *v9;
  SLDActiveCallViewRenderer *v10;

  if (-[SLDActiveCallViewDrawing forRemote](self, "forRemote", a4.x, a4.y))
  {
    v6 = [SLDActiveCallViewRenderer alloc];
    -[SLDActiveCallViewDrawing slotStyle](self, "slotStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDActiveCallViewDrawing tag](self, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SLDActiveCallViewRenderer initWithStyle:tag:](v6, "initWithStyle:tag:", v7, v8);

    v9 = v10;
    if (v10)
    {
      -[SLDActiveCallViewRenderer renderInContext:](v10, "renderInContext:", a3);
      v9 = v10;
    }

  }
}

- (CGSize)drawingSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SLDActiveCallViewDrawing tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxWidth");
  v4 = v3;

  v5 = 200.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDActiveCallViewSlotTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (BOOL)forRemote
{
  return self->_forRemote;
}

- (void)setForRemote:(BOOL)a3
{
  self->_forRemote = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

@end
