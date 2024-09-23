@implementation VFXAuthoringEnvironment

- (VFXAuthoringEnvironment)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return self;
}

- (id)_initWithEngineContext:(__CFXEngineContext *)a3
{
  VFXAuthoringEnvironment *v4;
  VFXAuthoringEnvironment *v5;
  NSArray **p_selectedNodes;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[28];
  _OWORD v15[2];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VFXAuthoringEnvironment;
  v4 = -[VFXAuthoringEnvironment init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    p_selectedNodes = &v4->_selectedNodes;
    LOBYTE(v4->_gridUnit) = 0;
    *(_QWORD *)&v4->_consoleLineCount = sub_1B181D5C8();
    v5->_engineContext = a3;
    v5->_statisticsInfo.fpsString = (__CFString *)-1;
    *p_selectedNodes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    memset(v15, 0, 28);
    sub_1B181EB54(v15);
    WORD4(v15[0]) = 1;
    BYTE10(v15[0]) = 4;
    LODWORD(v15[0]) = 0;
    *(_OWORD *)v14 = v15[0];
    *(_OWORD *)&v14[12] = *(_OWORD *)((char *)v15 + 12);
    v5->_depthOnCullOnStates = (__CFXRasterizerStates *)sub_1B181EC70((uint64_t)v14);
    LODWORD(v15[0]) = 2;
    *(_OWORD *)v14 = v15[0];
    *(_OWORD *)&v14[12] = *(_OWORD *)((char *)v15 + 12);
    v5->_depthOnCullOffStates = (__CFXRasterizerStates *)sub_1B181EC70((uint64_t)v14);
    BYTE8(v15[0]) = 0;
    BYTE10(v15[0]) = 1;
    LODWORD(v15[0]) = 0;
    *(_OWORD *)v14 = v15[0];
    *(_OWORD *)&v14[12] = *(_OWORD *)((char *)v15 + 12);
    v5->_depthOffCullOnStates = (__CFXRasterizerStates *)sub_1B181EC70((uint64_t)v14);
    LODWORD(v15[0]) = 2;
    *(_OWORD *)v14 = v15[0];
    *(_OWORD *)&v14[12] = *(_OWORD *)((char *)v15 + 12);
    v5->_depthOffCullOffStates = (__CFXRasterizerStates *)sub_1B181EC70((uint64_t)v14);
    objc_msgSend_authoringEnvironment2(v5, v7, v8, v9);
    objc_msgSend_update(v5, v10, v11, v12);
  }
  return v5;
}

+ (id)rendererForWorldRenderer:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend_renderer(a3, v4, v5, v6);
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown VFXWorldRenderer conforming class"), v5, v6, v7, v8, v9, v10, v12);
    return 0;
  }
  return a3;
}

+ (id)authoringEnvironmentForWorldRenderer:(id)a3
{
  return (id)objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(a1, a2, (uint64_t)a3, 1);
}

+ (id)authoringEnvironmentForWorldRenderer:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;

  v4 = a4;
  v6 = (void *)objc_msgSend_rendererForWorldRenderer_(a1, a2, (uint64_t)a3, a4);
  v10 = objc_msgSend__engineContext(v6, v7, v8, v9);
  v17 = sub_1B1814484(v10, v4, v11, v12, v13, v14, v15, v16);
  v18 = (_BYTE *)v17;
  if (v17)
  {
    *(_QWORD *)(v17 + 16) = a3;
    objc_opt_class();
    v18[24] = objc_opt_isKindOfClass() & 1;
  }
  return v18;
}

- (VFXWorldRenderer)worldRenderer
{
  return self->_worldRenderer;
}

- (id)renderer
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_opt_class();
  return (id)objc_msgSend_rendererForWorldRenderer_(v3, v4, (uint64_t)self->_worldRenderer, v5);
}

- (__n128)viewMatrix
{
  uint64_t v1;
  __int128 *v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    v2 = (__int128 *)sub_1B1815A5C(v1, 1);
  else
    v2 = &VFXMatrix4Identity;
  return (__n128)*v2;
}

- (void)debugOptionsDidChange:(unint64_t)a3
{
  uint64_t v3;

  objc_msgSend_debugOptionsDidChange_(self[1].super.isa, a2, a3, v3);
}

- (BOOL)selectionIsReadonly
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_manipulator(self[1].super.isa, a2, v2, v3);
  return objc_msgSend_readonly(v4, v5, v6, v7);
}

- (void)setSelectionIsReadonly:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend_manipulator(self[1].super.isa, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setReadonly_, v4, v6);
}

- (void)setEditingSpace:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_editingSpace != a3)
  {
    self->_editingSpace = a3;
    v4 = objc_msgSend_manipulator(self, a2, a3, v3);
    MEMORY[0x1E0DE7D20](v4, sel_editingSpaceChanged, v5, v6);
  }
}

- (void)setSelectionTransformMode:(int64_t)a3
{
  self->_selectionTransformMode = a3;
}

- (void)_setupAuthoringEnv2:(id)a3
{
  if (!self[1].super.isa)
    self[1].super.isa = (Class)(id)objc_msgSend_authoringEnvironmentForWorld_createIfNeeded_(VFXAuthoringEnvironment2, a2, (uint64_t)a3, 1);
}

- (void)setupAuthoringEnv2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v9;
  id *v10;
  uint64_t v11;

  if (!self[1].super.isa)
  {
    v9 = (id *)sub_1B1813884((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    v10 = sub_1B193E758(v9);
    if (v10)
      MEMORY[0x1E0DE7D20](self, sel__setupAuthoringEnv2_, v10, v11);
  }
}

- (id)authoringEnvironment2
{
  uint64_t v2;
  uint64_t v3;
  VFXAuthoringEnvironment *v4;
  Class isa;

  v4 = self + 1;
  isa = self[1].super.isa;
  if (!isa)
  {
    objc_msgSend_setupAuthoringEnv2(self, a2, v2, v3);
    return v4->super.isa;
  }
  return isa;
}

- (void)update
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (void *)sub_1B1813BC4((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v8)
    objc_msgSend_showsAuthoringEnvironment(v8, v9, v10, v11);
}

- (void)worldDidChange:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (void *)objc_msgSend_authoringEnvironment2(self, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_manipulator(v6, v7, v8, v9);
  objc_msgSend__setAuthoringEnvironment_(v10, v11, 0, v12);

  self[1].super.isa = 0;
  MEMORY[0x1E0DE7D20](self, sel__setupAuthoringEnv2_, a3, v13);
}

- (VFXNode)authoringOverlayLayer
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_authoringEnvironment2(self, a2, v2, v3);
  return (VFXNode *)objc_msgSend_authoringOverlayLayer(v4, v5, v6, v7);
}

- (VFXManipulator)manipulator
{
  uint64_t v2;
  uint64_t v3;

  return (VFXManipulator *)objc_msgSend_manipulator(self[1].super.isa, a2, v2, v3);
}

- (NSArray)selectedNodes
{
  return *(NSArray **)&self->_isOrbiting;
}

- (id)selectedItems
{
  return self->_selectedNodes;
}

- (void)beginEditingNodes:(id)a3
{
  uint64_t v3;
  NSArray **p_selectedNodes;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];

  p_selectedNodes = &self->_selectedNodes;
  v7 = (void *)objc_msgSend_authoringEnvironment2(self, a2, (uint64_t)a3, v3);
  v11 = (void *)objc_msgSend_manipulator(v7, v8, v9, v10);
  objc_msgSend__setAuthoringEnvironment_(v11, v12, (uint64_t)self, v13);
  objc_msgSend_selectNodes_(p_selectedNodes[126], v14, (uint64_t)a3, v15);
  objc_sync_enter(self);
  v23 = sub_1B1813884((uint64_t)self->_engineContext, v16, v17, v18, v19, v20, v21, v22);
  sub_1B17FEDE8((uint64_t)p_selectedNodes[1], v23, 0, v24, v25, v26, v27, v28);

  v32 = objc_msgSend_copy(a3, v29, v30, v31);
  p_selectedNodes[1] = (NSArray *)v32;
  sub_1B17FEDE8(v32, v23, 1, v33, v34, v35, v36, v37);
  v38 = (void *)MEMORY[0x1E0C99DE8];
  v42 = objc_msgSend_count(a3, v39, v40, v41);
  v45 = objc_msgSend_arrayWithCapacity_(v38, v43, v42, v44);
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = sub_1B17FF0B4;
  v67[3] = &unk_1E63D6788;
  v67[4] = v45;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, v46, (uint64_t)v67, v47);

  v48 = objc_alloc(MEMORY[0x1E0C99E10]);
  *p_selectedNodes = (NSArray *)objc_msgSend_initWithArray_(v48, v49, v45, v50);
  v58 = (const void *)sub_1B1813884((uint64_t)self->_engineContext, v51, v52, v53, v54, v55, v56, v57);
  sub_1B194F874(CFSTR("kCFXNotificationEngineContextInvalidatePasses"), v58, 0, 1u);
  objc_sync_exit(self);
  if (objc_msgSend_count(*p_selectedNodes, v59, v60, v61))
    objc_msgSend_setTargets_(v11, v62, (uint64_t)*p_selectedNodes, v63);
  else
    objc_msgSend_setTargets_(v11, v62, 0, v63);
  objc_msgSend__setNeedsDisplay(self->_worldRenderer, v64, v65, v66);
}

- (void)saveInitialSelection
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (void *)objc_msgSend_selectedItems(self, v3, v4, v5);
  v10 = (void *)objc_msgSend_set(v6, v7, v8, v9);
  self->_selection = (NSMutableOrderedSet *)objc_msgSend_copy(v10, v11, v12, v13);
}

- (void)beginOrbiting
{
  LOBYTE(self->_gridUnit) = 1;
}

- (void)endOrbiting
{
  LOBYTE(self->_gridUnit) = 0;
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  float *p_waitDisplayLinkTime;
  CGFloat y;
  CGFloat x;
  float v7;
  unint64_t v8;
  double v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  _BOOL4 v13;
  uint64_t v14;
  _BOOL4 v15;
  float v17;
  uint64_t v18;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  p_waitDisplayLinkTime = &self->_statisticsInfo.waitDisplayLinkTime;
  if (!LOBYTE(self->_statisticsInfo.waitDisplayLinkTime))
    goto LABEL_13;
  y = a3.y;
  x = a3.x;
  v18 = 0;
  sub_1B17FFBC8(0, &v18, 0, CFSTR("$1$"), 0, (uint64_t)&self->_boldTextInfo, 0, 0);
  v17 = *(float *)&v18;
  v7 = *((_BYTE *)p_waitDisplayLinkTime + 1)
     ? (float)((float)(self->_normalTextInfo.lineHeight * 7.0) + 14.0) + 3.0
     : 3.0;
  v8 = sub_1B1815AC8((__n128 *)self->_engineContext).n128_u64[0];
  v21.origin.y = (float)(v7 + *((float *)&v8 + 1));
  v21.size.height = v17;
  v21.origin.x = (float)(*(float *)&v8 + 7.0);
  v21.size.width = v17;
  v22 = CGRectInset(v21, -10.0, -10.0);
  v9 = v22.origin.x;
  v10 = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v19.x = x;
  v19.y = y;
  v13 = CGRectContainsPoint(v22, v19);
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    v23.origin.x = v9 + (float)(v17 + 5.0);
    v23.origin.y = v10;
    v23.size.width = width;
    v23.size.height = height;
    v20.x = x;
    v20.y = y;
    v15 = CGRectContainsPoint(v23, v20);
    if (!v15)
      return v15;
    v14 = 1;
  }
  *((_QWORD *)p_waitDisplayLinkTime + 2) = v14;
  if (!*(_BYTE *)p_waitDisplayLinkTime)
  {
LABEL_13:
    LOBYTE(v15) = 0;
    return v15;
  }
  if (v13)
    *((_BYTE *)p_waitDisplayLinkTime + 1) ^= 1u;
  *((_QWORD *)p_waitDisplayLinkTime + 2) = -1;
  LOBYTE(v15) = 1;
  return v15;
}

- (void)drawLineFromPoint:(VFXAuthoringEnvironment *)self toPoint:(SEL)a2 color:(id)a3
{
  float32x4_t v3;
  float32x4_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  _QWORD v14[2];

  v12 = v3;
  v13 = v4;
  v14[0] = sub_1B18BCF20(a3, 0);
  v14[1] = v6;
  sub_1B17FA4D4((uint64_t)self, 0, (float *)v14, v7, v8, v9, v10, v11, v12, v13);
}

- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5
{
  uint64_t v7;
  float64x2_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat x;
  CGFloat y;
  _QWORD v16[2];

  x = a4.x;
  y = a4.y;
  v16[0] = sub_1B18BCF20(a5, 0);
  v16[1] = v7;
  v8.f64[0] = x;
  v8.f64[1] = y;
  sub_1B17FCDC4((uint64_t)self, (const __CFString *)a3, (uint64_t)v16, v9, v10, v11, v12, v13, COERCE_DOUBLE(vcvt_f32_f64(v8)));
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  NSMutableOrderedSet **p_selection;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  __CFXImage *texture;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *symbolRects;
  float *characterWidth_typography;
  __CFXImage *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  float *v18;
  __CFXFXProgram *wireframeProgram;
  __CFXFXProgram *colorOnlyProgram;
  __CFXFXProgram *colorAndTextureProgram;
  __CFXFXProgram *noColorProgram;
  __CFXFXProgram *lightProbesProgram;
  NSMutableOrderedSet *v24;
  NSMutableOrderedSet *v25;
  NSMutableOrderedSet *v26;
  objc_super v27;

  p_selection = &self->_selection;
  v6 = (void *)objc_msgSend_authoringEnvironment2(self, a2, v2, v3);
  v10 = (void *)objc_msgSend_manipulator(v6, v7, v8, v9);
  objc_msgSend__setAuthoringEnvironment_(v10, v11, 0, v12);
  sub_1B181EE08(self->_depthOnCullOnStates);
  sub_1B181EE08(self->_depthOnCullOffStates);
  sub_1B181EE08(self->_depthOffCullOnStates);
  sub_1B181EE08(self->_depthOffCullOffStates);

  sub_1B17FF6A8(self, (uint64_t)&self->_logsInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_dynamicLinesInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_dynamicLinesNoDepthTestInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_overlayDynamicLinesInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_overlayDynamicTriangleInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_dynamicTrianglesInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_lightProbesInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_textInfo);
  sub_1B17FF6A8(self, (uint64_t)&self->_boldLogsInfo);
  texture = self->_normalTextInfo.textureInfo.texture;
  if (texture)
  {
    CFRelease(texture);
    self->_normalTextInfo.textureInfo.texture = 0;
  }
  symbolRects = self->_normalTextInfo.symbolRects;
  if (symbolRects)
    free(symbolRects);
  characterWidth_typography = self->_normalTextInfo.characterWidth_typography;
  if (characterWidth_typography)
    free(characterWidth_typography);
  v16 = self->_boldTextInfo.textureInfo.texture;
  if (v16)
  {
    CFRelease(v16);
    self->_boldTextInfo.textureInfo.texture = 0;
  }
  v17 = self->_boldTextInfo.symbolRects;
  if (v17)
    free(v17);
  v18 = self->_boldTextInfo.characterWidth_typography;
  if (v18)
    free(v18);
  wireframeProgram = self->_wireframeProgram;
  if (wireframeProgram)
  {
    CFRelease(wireframeProgram);
    self->_wireframeProgram = 0;
  }
  colorOnlyProgram = self->_colorOnlyProgram;
  if (colorOnlyProgram)
  {
    CFRelease(colorOnlyProgram);
    self->_colorOnlyProgram = 0;
  }
  colorAndTextureProgram = self->_colorAndTextureProgram;
  if (colorAndTextureProgram)
  {
    CFRelease(colorAndTextureProgram);
    self->_colorAndTextureProgram = 0;
  }
  noColorProgram = self->_noColorProgram;
  if (noColorProgram)
  {
    CFRelease(noColorProgram);
    self->_noColorProgram = 0;
  }
  lightProbesProgram = self->_lightProbesProgram;
  if (lightProbesProgram)
  {
    CFRelease(lightProbesProgram);
    self->_lightProbesProgram = 0;
  }
  v24 = p_selection[12];
  if (v24)
  {
    CFRelease(v24);
    p_selection[12] = 0;
  }
  v25 = p_selection[11];
  if (v25)
  {
    CFRelease(v25);
    p_selection[11] = 0;
  }
  v26 = p_selection[10];
  if (v26)
  {
    CFRelease(v26);
    p_selection[10] = 0;
  }
  sub_1B181D604((uint64_t)p_selection[5]);

  v27.receiver = self;
  v27.super_class = (Class)VFXAuthoringEnvironment;
  -[VFXAuthoringEnvironment dealloc](&v27, sel_dealloc);
}

- (BOOL)isEditingSubComponent
{
  return 0;
}

- (BOOL)shouldSnapOnGrid
{
  return self->_shouldSnapOnGrid;
}

- (void)setShouldSnapOnGrid:(BOOL)a3
{
  self->_shouldSnapOnGrid = a3;
}

- (BOOL)shouldSnapToAlign
{
  return self->_shouldSnapToAlign;
}

- (void)setShouldSnapToAlign:(BOOL)a3
{
  self->_shouldSnapToAlign = a3;
}

- (float)gridUnit
{
  return *(float *)&self->_wireframeRenderer;
}

- (int64_t)editingSpace
{
  return self->_editingSpace;
}

- (int64_t)selectionTransformMode
{
  return self->_selectionTransformMode;
}

- (VFXAuthoringEnvironmentDelegate)delegate
{
  return (VFXAuthoringEnvironmentDelegate *)self->_authEnv2;
}

- (void)setDelegate:(id)a3
{
  self->_authEnv2 = (VFXAuthoringEnvironment2 *)a3;
}

- (BOOL)graphicalSelectionEnabled
{
  return self->_graphicalSelectionEnabled;
}

- (void)setGraphicalSelectionEnabled:(BOOL)a3
{
  self->_graphicalSelectionEnabled = a3;
}

- (BOOL)surroundToSelect
{
  return BYTE1(self->_initialSelection);
}

- (void)setSurroundToSelect:(BOOL)a3
{
  BYTE1(self->_initialSelection) = a3;
}

@end
