@implementation SLDHighlightPillDrawing

- (SLDHighlightPillDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9;
  id v10;
  SLDHighlightPillDrawing *v11;
  SLDHighlightPillDrawing *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightPillDrawing;
  v11 = -[SLDHighlightPillDrawing init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
      objc_storeStrong((id *)&v12->_tag, a4);
    v12->_forRemote = a5;
    v12->_isRTL = objc_msgSend(v9, "layoutDirection") == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  SLDHighlightPillRenderer *v6;
  void *v7;
  void *v8;
  SLDHighlightPillRenderer *v9;
  SLDHighlightPillRenderer *v10;

  if (-[SLDHighlightPillDrawing forRemote](self, "forRemote", a4.x, a4.y))
  {
    v6 = [SLDHighlightPillRenderer alloc];
    -[SLDHighlightPillDrawing slotStyle](self, "slotStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDHighlightPillDrawing tag](self, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SLDHighlightPillRenderer initWithStyle:tag:](v6, "initWithStyle:tag:", v7, v8);

    v9 = v10;
    if (v10)
    {
      -[SLDHighlightPillRenderer renderInContext:](v10, "renderInContext:", a3);
      v9 = v10;
    }

  }
}

- (CGSize)drawingSize
{
  SLHighlightPillMetrics *v3;
  void *v4;
  void *v5;
  SLHighlightPillMetrics *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v3 = [SLHighlightPillMetrics alloc];
  -[SLDHighlightPillDrawing slotStyle](self, "slotStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDHighlightPillDrawing tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLHighlightPillMetrics initWithSlotStyle:tag:](v3, "initWithSlotStyle:tag:", v4, v5);

  -[SLHighlightPillMetrics pillSize](v6, "pillSize");
  v8 = v7;
  v10 = v9;
  -[SLDHighlightPillDrawing tag](self, "tag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maxWidth");
  v13 = v12;

  if (v8 > v13)
  {
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SLDHighlightPillDrawing drawingSize].cold.1(self, v14, v8);

    -[SLDHighlightPillDrawing tag](self, "tag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxWidth");
    v8 = v16;

  }
  v17 = v8;
  v18 = v10;
  result.height = v18;
  result.width = v17;
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

- (SLDHighlightPillSlotTag)tag
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

- (void)drawingSize
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxWidth");
  v8 = 134218496;
  v9 = a1;
  v10 = 2048;
  v11 = v7;
  v12 = 2048;
  v13 = a3;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLDHighlightPillSlotDrawer: %p] client specified a max width smaller than the min size to fit the non-flexible contents. This will result in incorrect layout. maxWidth: %f, non-flexible item width: %f", (uint8_t *)&v8, 0x20u);

}

@end
