@implementation PVInstructionGraphSourceNode

- (PVInstructionGraphSourceNode)init
{
  PVInstructionGraphSourceNode *v2;
  PVInstructionGraphSourceNode *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PVInstructionGraphSourceNode;
  v2 = -[PVInstructionGraphNode init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v2->_timedMetadataGroup = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_transform.b = v5;
    *(_OWORD *)&v2->_transform.d = v4;
    v6 = *(void **)&v2->_textureWrapMode;
    *(_QWORD *)&v2->_textureWrapMode = 0;

    *(_DWORD *)&v3->_isOverlayTrack = 0;
  }
  return v3;
}

- (id)getAllSourceNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
}

- (BOOL)isPortrait
{
  float v2;

  -[PVInstructionGraphSourceNode transform](self, "transform", 0, 0);
  v2 = atan2(0.0, 0.0);
  return fabsf(fabsf(v2) + -3.1416) >= 0.00001 && v2 != 0.0;
}

- (HGRef<HGNode>)applyWrapModeToInput:(HGRef<HGNode>)a3
{
  HGTextureWrap **v3;
  HGTextureWrap **v6;
  HGTextureWrap *v7;
  HGRef<HGNode> v8;
  HGTextureWrap *v9;
  char *v10;

  v6 = v3;
  v7 = *(HGTextureWrap **)a3.var0;
  *v3 = *(HGTextureWrap **)a3.var0;
  if (v7)
    (*(void (**)(HGTextureWrap *, SEL))(*(_QWORD *)v7 + 16))(v7, a2);
  v8.var0 = (HGNode *)-[PVInstructionGraphSourceNode textureWrapMode](self, "textureWrapMode");
  if (LODWORD(v8.var0) == 1)
  {
    v9 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v9);
    (*(void (**)(HGTextureWrap *, _QWORD, _QWORD))(*(_QWORD *)v9 + 120))(v9, 0, *(_QWORD *)a3.var0);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v9, (const char *)1, v10);
    if (v7 != v9)
    {
      if (v7)
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v7 + 24))(v7);
      *v6 = v9;
      (*(void (**)(HGTextureWrap *))(*(_QWORD *)v9 + 16))(v9);
    }
    return (HGRef<HGNode>)(*(uint64_t (**)(HGTextureWrap *))(*(_QWORD *)v9 + 24))(v9);
  }
  return v8;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGAffineTransform transform;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("class");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("sourceTransform");
  -[PVInstructionGraphSourceNode transform](self, "transform");
  NSStringFromCGAffineTransform(&transform);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("isPortrait");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PVInstructionGraphSourceNode isPortrait](self, "isPortrait"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_timedMetadataGroup = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.b = v4;
  *(_OWORD *)&self->_transform.d = v3;
}

- (PVTransformAnimation)transformAnimation
{
  return *(PVTransformAnimation **)&self->_textureWrapMode;
}

- (void)setTransformAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_textureWrapMode, a3);
}

- (int)transformAnimationContentMode
{
  return *((_DWORD *)&self->super._isDebugDrawingEnabled + 1);
}

- (void)setTransformAnimationContentMode:(int)a3
{
  *((_DWORD *)&self->super._isDebugDrawingEnabled + 1) = a3;
}

- (int)textureWrapMode
{
  return *(_DWORD *)&self->_isOverlayTrack;
}

- (void)setTextureWrapMode:(int)a3
{
  *(_DWORD *)&self->_isOverlayTrack = a3;
}

- (AVTimedMetadataGroup)timedMetadataGroup
{
  return (AVTimedMetadataGroup *)self->_transformAnimation;
}

- (void)setTimedMetadataGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transformAnimation, a3);
}

- (BOOL)isOverlayTrack
{
  return *(&self->super._isDebugDrawingEnabled + 1);
}

- (void)setIsOverlayTrack:(BOOL)a3
{
  *(&self->super._isDebugDrawingEnabled + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformAnimation, 0);
  objc_storeStrong((id *)&self->_textureWrapMode, 0);
}

@end
