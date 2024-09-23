@implementation SLDCollaborationFooterDrawing

- (SLDCollaborationFooterDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9;
  id v10;
  SLDCollaborationFooterDrawing *v11;
  SLDCollaborationFooterDrawing *v12;
  SLDCollaborationFooterSlotTag *v13;
  NSObject *p_super;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SLDCollaborationFooterDrawing;
  v11 = -[SLDCollaborationFooterDrawing init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
    {
      v13 = (SLDCollaborationFooterSlotTag *)v10;
      p_super = &v12->_tag->super.super.super;
      v12->_tag = v13;
    }
    else
    {
      SLDaemonLogHandle();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[SLDCollaborationFooterDrawing initWithStyle:tag:forRemote:].cold.1((uint64_t)v12, (uint64_t)v10, p_super);
    }

    v12->_forRemote = a5;
    v12->_isRTL = objc_msgSend(v9, "layoutDirection") == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  SLDCollaborationFooterRenderer *v6;
  void *v7;
  void *v8;
  SLDCollaborationFooterRenderer *v9;
  SLDCollaborationFooterRenderer *v10;

  if (-[SLDCollaborationFooterDrawing forRemote](self, "forRemote", a4.x, a4.y))
  {
    v6 = [SLDCollaborationFooterRenderer alloc];
    -[SLDCollaborationFooterDrawing slotStyle](self, "slotStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDCollaborationFooterDrawing tag](self, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SLDCollaborationFooterRenderer initWithStyle:tag:](v6, "initWithStyle:tag:", v7, v8);

    v9 = v10;
    if (v10)
    {
      -[SLDCollaborationFooterRenderer renderInContext:](v10, "renderInContext:", a3);
      v9 = v10;
    }

  }
}

- (CGSize)drawingSize
{
  SLDCollaborationFooterMetrics *v3;
  void *v4;
  void *v5;
  SLDCollaborationFooterMetrics *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = [SLDCollaborationFooterMetrics alloc];
  -[SLDCollaborationFooterDrawing slotStyle](self, "slotStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCollaborationFooterDrawing tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLDCollaborationFooterMetrics initWithSlotStyle:tag:](v3, "initWithSlotStyle:tag:", v4, v5);

  -[SLDCollaborationFooterDrawing tag](self, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxWidth");
  v9 = v8;
  -[SLDCollaborationFooterMetrics expectedHeight](v6, "expectedHeight");
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
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

- (SLDCollaborationFooterSlotTag)tag
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

- (void)initWithStyle:(uint64_t)a1 tag:(uint64_t)a2 forRemote:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "[SLDCollaborationFooterDrawing %p] Tried to initialize with a tag of the wrong type: %@", (uint8_t *)&v3, 0x16u);
}

@end
