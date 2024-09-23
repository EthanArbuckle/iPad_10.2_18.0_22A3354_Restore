@implementation _WTTextEffect

- (_WTTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  id v6;
  id v7;
  _WTTextEffect *v8;
  _WTTextEffect *v9;
  _WTTextEffect *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_WTTextEffect;
  v8 = -[_WTTextEffect init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_WTTextEffect setChunk:](v8, "setChunk:", v6);
    -[_WTTextEffect setEffectView:](v9, "setEffectView:", v7);
    -[_WTTextEffect setHidesOriginal:](v9, "setHidesOriginal:", 1);
    v10 = v9;
  }

  return v9;
}

- (double)invalidationAnimationDuration
{
  return 0.25;
}

- (void)updateEffectWith:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationFrame");
  self->_firstSnapshotRect.origin.x = v6;
  self->_firstSnapshotRect.origin.y = v7;
  self->_firstSnapshotRect.size.width = v8;
  self->_firstSnapshotRect.size.height = v9;

  self->_effectPresentationRect = self->_firstSnapshotRect;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "presentationFrame", (_QWORD)v19);
        v25.origin.x = v15;
        v25.origin.y = v16;
        v25.size.width = v17;
        v25.size.height = v18;
        self->_effectPresentationRect = CGRectUnion(self->_effectPresentationRect, v25);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)invalidate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  _QWORD v9[5];

  v3 = a3;
  -[_WTTextEffect timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v6 = 0.0;
  if (v3)
    -[_WTTextEffect invalidationAnimationDuration](self, "invalidationAnimationDuration", 0.0);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28___WTTextEffect_invalidate___block_invoke;
  v9[3] = &unk_251C07238;
  v9[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v9);
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)_applyToFill:(id)a3 colors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y;
  double x;
  id v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  char v17;
  id v18;

  y = a5.y;
  x = a5.x;
  v18 = a3;
  v13 = a4;
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_WTTextEffect _applyToFill:nonlocatedColors:center:startRadius:endRadius:](self, "_applyToFill:nonlocatedColors:center:startRadius:endRadius:", v18, v13, x, y, a6, a7);
  }
  else
  {
    objc_msgSend(v13, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
      -[_WTTextEffect _applyToFill:locatedColors:center:startRadius:endRadius:](self, "_applyToFill:locatedColors:center:startRadius:endRadius:", v18, v13, x, y, a6, a7);
  }

}

- (void)_applyToFill:(id)a3 nonlocatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y;
  double x;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  id v18;
  int v19;
  int v20;
  int v21;
  int v22;
  _QWORD v23[2];

  y = a5.y;
  x = a5.x;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v13, "count");
  v15 = &v23[-2 * v14];
  if (v14)
  {
    v16 = 0;
    v17 = v15 + 1;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "CGColor");
      RBColorFromCGColor();
      *(v17 - 2) = v19;
      *(v17 - 1) = v20;
      *v17 = v21;
      v17[1] = v22;
      v17 += 4;

      ++v16;
    }
    while (v14 != v16);
  }
  objc_msgSend(v12, "setRadialGradientCenter:startRadius:endRadius:stopCount:colors:locations:flags:", v14, v15, 0, 0, x, y, a6, a7);

}

- (void)_applyToFill:(id)a3 locatedColors:(id)a4 center:(CGPoint)a5 startRadius:(double)a6 endRadius:(double)a7
{
  double y;
  double x;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  _DWORD *v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  y = a5.y;
  x = a5.x;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v13, "count");
  v15 = &v26[-2 * v14];
  v16 = (char *)v26 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v14)
  {
    v17 = 0;
    v18 = v15 + 1;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "color");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "CGColor");
      RBColorFromCGColor();
      *(v18 - 2) = v21;
      *(v18 - 1) = v22;
      *v18 = v23;
      v18[1] = v24;
      v18 += 4;

      objc_msgSend(v19, "location");
      *(_QWORD *)&v16[8 * v17] = v25;

      ++v17;
    }
    while (v14 != v17);
  }
  objc_msgSend(v12, "setRadialGradientCenter:startRadius:endRadius:stopCount:colors:locations:flags:", v14, v15, v16, 0, x, y, a6, a7);

}

- (double)sweepRadius
{
  double width;
  double height;
  long double v4;
  long double v5;

  width = self->_firstSnapshotRect.size.width;
  height = self->_firstSnapshotRect.size.height;
  v4 = atan((height + height) / width);
  v5 = cos(1.57079633 - v4);
  return sqrt(width * 0.5 * (width * 0.5) + height * height) / (v5 + v5);
}

- (CGRect)effectVisibilityFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_effectPresentationRect.origin.x;
  y = self->_effectPresentationRect.origin.y;
  width = self->_effectPresentationRect.size.width;
  height = self->_effectPresentationRect.size.height;
  if (height < 400.0)
    height = 400.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)needsSetup
{
  void *v2;
  BOOL v3;

  -[_WTTextEffect rootLayer](self, "rootLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (double)sweepDuration
{
  double v2;
  double v3;
  double v4;

  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  v3 = v2 / 800.0 * 2.2;
  v4 = 2.5;
  if (v3 <= 2.5)
    v4 = v2 / 800.0 * 2.2;
  if (v3 >= 1.5)
    return v4;
  else
    return 1.5;
}

- (_WTTextChunk)chunk
{
  return (_WTTextChunk *)objc_getProperty(self, a2, 80, 1);
}

- (void)setChunk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (_WTTextEffectView)effectView
{
  return (_WTTextEffectView *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)hidesOriginal
{
  return self->_hidesOriginal;
}

- (void)setHidesOriginal:(BOOL)a3
{
  self->_hidesOriginal = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (id)preCompletion
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setPreCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (CALayer)rootLayer
{
  return (CALayer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRootLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong(&self->_preCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_chunk, 0);
}

@end
