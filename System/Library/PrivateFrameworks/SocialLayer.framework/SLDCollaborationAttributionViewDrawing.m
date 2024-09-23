@implementation SLDCollaborationAttributionViewDrawing

- (SLDCollaborationAttributionViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9;
  id v10;
  SLDCollaborationAttributionViewDrawing *v11;
  SLDCollaborationAttributionViewDrawing *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationAttributionViewDrawing;
  v11 = -[SLDCollaborationAttributionViewDrawing init](&v14, sel_init);
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
  void *v6;
  int v7;
  SLDCollaborationAttributionViewRenderer *v8;
  void *v9;
  void *v10;
  SLDCollaborationAttributionViewRenderer *v11;
  SLDCollaborationAttributionViewRenderer *v12;

  if (-[SLDCollaborationAttributionViewDrawing forRemote](self, "forRemote", a4.x, a4.y)
    || (-[SLDCollaborationAttributionViewDrawing tag](self, "tag"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isPlaceholder"),
        v6,
        v7))
  {
    v8 = [SLDCollaborationAttributionViewRenderer alloc];
    -[SLDCollaborationAttributionViewDrawing slotStyle](self, "slotStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDCollaborationAttributionViewDrawing tag](self, "tag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SLDCollaborationAttributionViewRenderer initWithStyle:tag:](v8, "initWithStyle:tag:", v9, v10);

    v11 = v12;
    if (v12)
    {
      -[SLDCollaborationAttributionViewRenderer renderInContext:](v12, "renderInContext:", a3);
      v11 = v12;
    }

  }
}

- (CGSize)drawingSize
{
  SLCollaborationAttributionViewMetricsProvider *v3;
  void *v4;
  void *v5;
  SLCollaborationAttributionViewMetricsProvider *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = [SLCollaborationAttributionViewMetricsProvider alloc];
  -[SLDCollaborationAttributionViewDrawing slotStyle](self, "slotStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationAttributionViewDrawing tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLCollaborationAttributionViewMetricsProvider initWithSlotStyle:tag:](v3, "initWithSlotStyle:tag:", v4, v5);

  -[SLCollaborationAttributionViewMetricsProvider drawingSize](v6, "drawingSize");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
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

- (SLDCollaborationAttributionViewSlotTag)tag
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
