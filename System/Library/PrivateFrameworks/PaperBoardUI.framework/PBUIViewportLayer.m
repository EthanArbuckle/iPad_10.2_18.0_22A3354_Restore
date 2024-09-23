@implementation PBUIViewportLayer

- (PBUIViewportLayer)initWithScale:(double)a3
{
  PBUIViewportLayer *v3;
  uint64_t v4;
  CALayer *contentLayer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBUIViewportLayer;
  v3 = -[PBUIViewportLayer init](&v7, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    contentLayer = v3->_contentLayer;
    v3->_contentLayer = (CALayer *)v4;

    -[PBUIViewportLayer setName:](v3, "setName:", CFSTR("Viewport Layer"));
    -[CALayer setName:](v3->_contentLayer, "setName:", CFSTR("Scale Layer"));
    -[PBUIViewportLayer addSublayer:](v3, "addSublayer:", v3->_contentLayer);
  }
  return v3;
}

- (id)animationForKey:(id)a3
{
  return 0;
}

- (PBUIViewportLayer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIViewportLayer;
  return -[PBUIViewportLayer initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (PBUIViewportLayer)initWithLayer:(id)a3
{
  id v4;
  PBUIViewportLayer *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIViewportLayer;
  v5 = -[PBUIViewportLayer initWithLayer:](&v9, sel_initWithLayer_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("scale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_scale = v7;

  }
  return v5;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[PBUIViewportLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSublayers
{
  double scale;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CALayer *contentLayer;
  CALayer *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CATransform3D v20;
  CATransform3D v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PBUIViewportLayer;
  -[PBUIViewportLayer layoutSublayers](&v22, sel_layoutSublayers);
  memset(&v21, 0, sizeof(v21));
  scale = self->_scale;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v20.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v20.m33 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v20.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v20.m43 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v20.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v20.m13 = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v20.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v20.m23 = v7;
  CATransform3DScale(&v21, &v20, scale, scale, 1.0);
  contentLayer = self->_contentLayer;
  v20 = v21;
  -[CALayer setTransform:](contentLayer, "setTransform:", &v20);
  v9 = self->_contentLayer;
  -[PBUIViewportLayer bounds](self, "bounds");
  -[CALayer setFrame:](v9, "setFrame:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CALayer sublayers](self->_contentLayer, "sublayers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        -[CALayer bounds](self->_contentLayer, "bounds");
        objc_msgSend(v15, "setFrame:");
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v12);
  }

}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end
