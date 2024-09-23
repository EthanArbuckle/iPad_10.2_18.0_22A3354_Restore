@implementation UIDynamicsDebug

- (UIDynamicsDebug)initWithAnimator:(id)a3
{
  id v5;
  UIDynamicsDebug *v6;
  UIDynamicsDebug *v7;
  BOOL *p_showPhysics;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDynamicsDebug.mm"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animator"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIDynamicsDebug;
  v6 = -[UIDynamicsDebug init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    p_showPhysics = &v6->_showPhysics;
    objc_storeWeak((id *)&v6->_animator, v5);
    *(_WORD *)p_showPhysics = 257;
    v7->_showFields = 1;
  }

  return v7;
}

- (UIDynamicsDebug)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIDynamicsDebug init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Don't call %@."), v4);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDynamicsDebug _teardownDebugView](self, "_teardownDebugView");
  v3.receiver = self;
  v3.super_class = (Class)UIDynamicsDebug;
  -[UIDynamicsDebug dealloc](&v3, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[UIDynamicsDebug animator](self, "animator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_referenceSystemType");

  if (v6)
  {
    self->_enabled = v3;
    if (v3)
    {
      -[UIDynamicsDebug _setupDebugViewIfNeccessary](self, "_setupDebugViewIfNeccessary");
    }
    else if (self->_debugView)
    {
      -[UIDynamicsDebug _teardownDebugView](self, "_teardownDebugView");
    }
  }
  else
  {
    NSLog(CFSTR("*** Dynamics Debug requires a concrete (View or CollectionView) based reference system"));
  }
}

- (void)captureDebugInformation
{
  BOOL *p_enabled;
  void *v4;
  void *v5;
  float64x2_t v6;
  float64x2_t v12;
  float32x2_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat Height;
  CGFloat Width;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float32x2_t v26;
  float v27;
  float v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  p_enabled = &self->_enabled;
  if (self->_enabled)
  {
    -[GLKView frame](self->_debugView, "frame");
    Width = CGRectGetWidth(v29);
    objc_msgSend(*((id *)p_enabled + 2), "frame");
    Height = CGRectGetHeight(v30);
    objc_msgSend(*((id *)p_enabled + 2), "frame");
    v16 = CGRectGetWidth(v31);
    objc_msgSend(*((id *)p_enabled + 2), "frame");
    v15 = CGRectGetHeight(v32);
    -[UIDynamicsDebug animator](self, "animator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_world");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKGet_PTM_RATIO();
    v6.f64[0] = Width;
    v6.f64[1] = Height;
    __asm { FMOV            V1.2D, #0.5 }
    *(float32x2_t *)&_Q1.f64[0] = vcvt_f32_f64(vdivq_f64((float64x2_t)xmmword_1866798D0, vmulq_f64(v6, _Q1)));
    v12.f64[0] = v15;
    v12.f64[1] = v16;
    __asm { FMOV            V2.2D, #-0.5 }
    *(float32x2_t *)&_Q2.f64[0] = vcvt_f32_f64(vmulq_f64(v12, _Q2));
    v14 = vmul_f32(*(float32x2_t *)&_Q2.f64[0], 0);
    v19 = LODWORD(_Q1.f64[0]);
    v21 = 0;
    v22 = HIDWORD(_Q1.f64[0]);
    v20 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 1065353216;
    v26 = vadd_f32(vadd_f32(v14, vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&_Q2.f64[0]), *(float32x2_t *)&_Q1.f64[0])), 0);
    v27 = vaddv_f32(v14) + 0.0;
    v28 = v27 + 1.0;
    objc_msgSend(v5, "debugDraw:matrix:showsPhysics:showsOutlineInterior:showsFields:", &v19, p_enabled[1], p_enabled[2], p_enabled[3]);

  }
}

- (void)setNeedsDisplay
{
  BOOL *p_enabled;
  void *v3;

  p_enabled = &self->_enabled;
  if (self->_enabled)
  {
    -[GLKView superview](self->_debugView, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", *((_QWORD *)p_enabled + 2));

    objc_msgSend(*((id *)p_enabled + 2), "setNeedsDisplay");
  }
}

- (void)_setupDebugViewIfNeccessary
{
  GLKBaseEffect **p_effect;
  void *v4;
  GLKBaseEffect *v5;
  uint64_t v6;
  GLKBaseEffect *v7;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  GLKBaseEffect *v12;
  void *v13;
  id v14;
  uint64_t v15;
  GLKBaseEffect *v16;
  unsigned int *p_vertexBuffer;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  p_effect = &self->_effect;
  if (!self->_debugView)
  {
    -[UIDynamicsDebug animator](self, "animator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = p_effect[1];
    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD0958]), "initWithAPI:", 2);
      v7 = p_effect[1];
      p_effect[1] = (GLKBaseEffect *)v6;

      v5 = p_effect[1];
    }
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v5);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v8 = (void *)_MergedGlobals_1023;
    v30 = _MergedGlobals_1023;
    if (!_MergedGlobals_1023)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = ___ZL15getGLKViewClassv_block_invoke;
      v25 = &unk_1E16C4AB8;
      v26 = &v27;
      ___ZL15getGLKViewClassv_block_invoke((uint64_t)&v22);
      v8 = (void *)v28[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v27, 8);
    v10 = [v9 alloc];
    objc_msgSend(v4, "_referenceSystemBounds");
    v11 = objc_msgSend(v10, "initWithFrame:context:", p_effect[1]);
    v12 = p_effect[4];
    p_effect[4] = (GLKBaseEffect *)v11;

    -[GLKBaseEffect setUserInteractionEnabled:](p_effect[4], "setUserInteractionEnabled:", 0);
    -[GLKBaseEffect setOpaque:](p_effect[4], "setOpaque:", 0);
    -[GLKBaseEffect setEnableSetNeedsDisplay:](p_effect[4], "setEnableSetNeedsDisplay:", 1);
    -[GLKBaseEffect setDrawableColorFormat:](p_effect[4], "setDrawableColorFormat:", 0);
    -[GLKBaseEffect setDrawableDepthFormat:](p_effect[4], "setDrawableDepthFormat:", 2);
    -[GLKBaseEffect setDrawableStencilFormat:](p_effect[4], "setDrawableStencilFormat:", 1);
    -[GLKBaseEffect setDelegate:](p_effect[4], "setDelegate:", self);
    -[GLKBaseEffect setAutoresizingMask:](p_effect[4], "setAutoresizingMask:", 18);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v13 = (void *)qword_1ECD7D818;
    v30 = qword_1ECD7D818;
    if (!qword_1ECD7D818)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = ___ZL21getGLKBaseEffectClassv_block_invoke;
      v25 = &unk_1E16C4AB8;
      v26 = &v27;
      ___ZL21getGLKBaseEffectClassv_block_invoke((uint64_t)&v22);
      v13 = (void *)v28[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v27, 8);
    v15 = objc_opt_new();
    v16 = *p_effect;
    *p_effect = (GLKBaseEffect *)v15;

    p_vertexBuffer = &self->_vertexBuffer;
    glGenBuffers(1, p_vertexBuffer);
    glBindBuffer(0x8892u, *p_vertexBuffer);
    glBufferData(0x8892u, 504000, 0, 0x88E8u);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, 0x1406u, 0, 12, 0);
    glEnableVertexAttribArray(2u);
    glVertexAttribPointer(2u, 4, 0x1401u, 1u, 12, (const GLvoid *)8);
    glBlendColor(0.0, 0.0, 0.0, 1.0);
    glBlendFunc(1u, 0x303u);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    *(float *)&v19 = v19;
    glLineWidth(*(GLfloat *)&v19);

    if (objc_msgSend(v4, "_referenceSystemType") == 1)
    {
      objc_msgSend(v4, "referenceView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", p_effect[4]);
    }
    else
    {
      objc_msgSend(v4, "_referenceSystem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "collectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", p_effect[4]);

    }
  }
}

- (void)_teardownDebugView
{
  GLKBaseEffect **p_effect;
  GLKBaseEffect *v4;
  GLKBaseEffect *v5;

  p_effect = &self->_effect;
  objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", self->_ctx);
  glDeleteBuffers(1, &self->_vertexBuffer);
  -[GLKBaseEffect removeFromSuperview](p_effect[4], "removeFromSuperview");
  v4 = p_effect[4];
  p_effect[4] = 0;

  v5 = *p_effect;
  *p_effect = 0;

  objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", 0);
}

- (void)glkView:(id)a3 drawInRect:(CGRect)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  $A877878DFF39760B48109CD9A53FA93E *v9;
  uint64_t v10;
  unint64_t v11;
  int16x4_t v12;
  float *v13;
  $A877878DFF39760B48109CD9A53FA93E *v14;
  float64x2_t v15;
  unint64_t v16;
  float v17;
  int v18;
  float v19;
  int v20;
  uint8x8_t v21;
  int v22;
  int16x8_t v23;
  float v24;
  int v25;
  float v26;
  float v27;
  int v28;
  float32x2_t v29;
  int16x8_t v30;
  $A877878DFF39760B48109CD9A53FA93E v31;

  -[UIDynamicsDebug animator](self, "animator", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_world");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "debugDrawPacket");

  v9 = *($A877878DFF39760B48109CD9A53FA93E **)v7;
  v8 = *(char **)(v7 + 8);
  v10 = *(_QWORD *)(v7 + 24);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4100u);
  if (v8 != (char *)v9)
  {
    v11 = (v8 - (char *)v9) >> 3;
    -[GLKBaseEffect prepareToDraw](self->_effect, "prepareToDraw");
    if (v11 >= 0xA410)
      v11 = 42000;
    if (v11)
    {
      v13 = (float *)(v10 + 8);
      v14 = &self->_vertices[1];
      v12.i32[0] = 1.0;
      v15 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      v16 = v11;
      do
      {
        v17 = v13[1];
        v18 = LODWORD(v17);
        if ((LODWORD(v17) & 0x7FFFFFFFu) > 0x3F800000)
          v17 = 1.0;
        if (v18 < 0)
          v17 = 0.0;
        v19 = *(v13 - 2);
        v20 = LODWORD(v19);
        if ((LODWORD(v19) & 0x7FFFFFFFu) > 0x3F800000)
          v19 = 1.0;
        if (v20 < 0)
          v19 = 0.0;
        *(double *)&v21 = (float)(v17 * v19) * 255.0;
        v22 = *(_QWORD *)&v21;
        v21.i32[0] = LODWORD(v14->position.x);
        v23 = (int16x8_t)vmovl_u8(v21);
        v23.i16[0] = v22;
        LOBYTE(v14->position.x) = v22;
        v24 = *(v13 - 1);
        v25 = LODWORD(v24);
        if ((LODWORD(v24) & 0x7FFFFFFFu) > 0x3F800000)
          v24 = 1.0;
        if (v25 < 0)
          v24 = 0.0;
        v23.i16[1] = (int)((float)(v17 * v24) * 255.0);
        LODWORD(v14->position.x) = vmovn_s16(v23).u32[0];
        v26 = *v13;
        v13 += 4;
        v27 = v26;
        v28 = LODWORD(v26);
        if ((LODWORD(v26) & 0x7FFFFFFFu) > 0x3F800000)
          v27 = 1.0;
        if (v28 < 0)
          v27 = 0.0;
        v29.f32[0] = v17 * v27;
        v29.f32[1] = v17;
        v30 = (int16x8_t)vcvtq_s64_f64(vmulq_f64(vcvtq_f64_f32(v29), v15));
        *(int32x2_t *)v30.i8 = vzip1_s32(*(int32x2_t *)v23.i8, (int32x2_t)vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v30), v12));
        LODWORD(v14->position.x) = vmovn_s16(v30).u32[0];
        v31 = *v9++;
        v14[-1] = v31;
        v14 = ($A877878DFF39760B48109CD9A53FA93E *)((char *)v14 + 12);
        --v16;
      }
      while (v16);
    }
    glBufferSubData(0x8892u, 0, 12 * v11, self->_vertices);
    glDrawArrays(1u, 0, v11);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)showPhysics
{
  return self->_showPhysics;
}

- (void)setShowPhysics:(BOOL)a3
{
  self->_showPhysics = a3;
}

- (BOOL)showOutlineInterior
{
  return self->_showOutlineInterior;
}

- (void)setShowOutlineInterior:(BOOL)a3
{
  self->_showOutlineInterior = a3;
}

- (BOOL)showFields
{
  return self->_showFields;
}

- (void)setShowFields:(BOOL)a3
{
  self->_showFields = a3;
}

- (UIDynamicAnimator)animator
{
  return (UIDynamicAnimator *)objc_loadWeakRetained((id *)&self->_animator);
}

- (void)setAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_animator, a3);
}

- (GLKView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
  objc_storeStrong((id *)&self->_debugView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_animator);
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end
