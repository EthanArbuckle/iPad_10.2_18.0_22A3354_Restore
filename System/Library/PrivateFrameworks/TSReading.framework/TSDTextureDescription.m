@implementation TSDTextureDescription

+ (TSDTextureDescription)descriptionWithSession:(id)a3
{
  id v3;
  TSDTextureDescription *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(TSDTextureDescription);
  -[TSDTextureDescription setSession:](v4, "setSession:", v3);
  -[TSDTextureDescription setStage:](v4, "setStage:", 0);
  -[TSDTextureDescription setDeliveryStyle:](v4, "setDeliveryStyle:", 0);
  -[TSDTextureDescription setByGlyphStyle:](v4, "setByGlyphStyle:", 0);
  v5 = objc_msgSend(v3, "shouldForceTextureGeneration");

  -[TSDTextureDescription setShouldForceTextureGeneration:](v4, "setShouldForceTextureGeneration:", v5);
  return v4;
}

+ (TSDTextureDescription)descriptionWithTextureDescription:(id)a3
{
  return (TSDTextureDescription *)(id)objc_msgSend(a3, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDTextureDescription *v4;
  void *v5;

  v4 = -[TSDTextureDescription init](+[TSDTextureDescription allocWithZone:](TSDTextureDescription, "allocWithZone:", a3), "init");
  -[TSDTextureDescription session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDTextureDescription setSession:](v4, "setSession:", v5);

  -[TSDTextureDescription setIsMagicMove:](v4, "setIsMagicMove:", -[TSDTextureDescription isMagicMove](self, "isMagicMove"));
  -[TSDTextureDescription setIncludesActionBuilds:](v4, "setIncludesActionBuilds:", -[TSDTextureDescription includesActionBuilds](self, "includesActionBuilds"));
  -[TSDTextureDescription setShouldAddFinal:](v4, "setShouldAddFinal:", -[TSDTextureDescription shouldAddFinal](self, "shouldAddFinal"));
  -[TSDTextureDescription setShouldAddMagicMoveObjectOnly:](v4, "setShouldAddMagicMoveObjectOnly:", -[TSDTextureDescription shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly"));
  -[TSDTextureDescription setShouldAddMasks:](v4, "setShouldAddMasks:", -[TSDTextureDescription shouldAddMasks](self, "shouldAddMasks"));
  -[TSDTextureDescription setShouldDistortToFit:](v4, "setShouldDistortToFit:", -[TSDTextureDescription shouldDistortToFit](self, "shouldDistortToFit"));
  -[TSDTextureDescription setShouldNotAddContainedReps:](v4, "setShouldNotAddContainedReps:", -[TSDTextureDescription shouldNotAddContainedReps](self, "shouldNotAddContainedReps"));
  -[TSDTextureDescription setShouldNotAddShapeAttributes:](v4, "setShouldNotAddShapeAttributes:", -[TSDTextureDescription shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes"));
  -[TSDTextureDescription setShouldNotAddText:](v4, "setShouldNotAddText:", -[TSDTextureDescription shouldNotAddText](self, "shouldNotAddText"));
  -[TSDTextureDescription setShouldSeparateReflection:](v4, "setShouldSeparateReflection:", -[TSDTextureDescription shouldSeparateReflection](self, "shouldSeparateReflection"));
  -[TSDTextureDescription setShouldSeparateShadow:](v4, "setShouldSeparateShadow:", -[TSDTextureDescription shouldSeparateShadow](self, "shouldSeparateShadow"));
  -[TSDTextureDescription setShouldSeparateStroke:](v4, "setShouldSeparateStroke:", -[TSDTextureDescription shouldSeparateStroke](self, "shouldSeparateStroke"));
  -[TSDTextureDescription setShouldAddParameterizedStroke:](v4, "setShouldAddParameterizedStroke:", -[TSDTextureDescription shouldAddParameterizedStroke](self, "shouldAddParameterizedStroke"));
  -[TSDTextureDescription setShouldSeparateGroupedTextures:](v4, "setShouldSeparateGroupedTextures:", -[TSDTextureDescription shouldSeparateGroupedTextures](self, "shouldSeparateGroupedTextures"));
  -[TSDTextureDescription setShouldReverseStrokeDrawing:](v4, "setShouldReverseStrokeDrawing:", -[TSDTextureDescription shouldReverseStrokeDrawing](self, "shouldReverseStrokeDrawing"));
  -[TSDTextureDescription setShouldSeparateText:](v4, "setShouldSeparateText:", -[TSDTextureDescription shouldSeparateText](self, "shouldSeparateText"));
  -[TSDTextureDescription setShouldForceTextureGeneration:](v4, "setShouldForceTextureGeneration:", -[TSDTextureDescription shouldForceTextureGeneration](self, "shouldForceTextureGeneration"));
  -[TSDTextureDescription setShouldIgnoreScaleInSourceImage:](v4, "setShouldIgnoreScaleInSourceImage:", -[TSDTextureDescription shouldIgnoreScaleInSourceImage](self, "shouldIgnoreScaleInSourceImage"));
  -[TSDTextureDescription setStage:](v4, "setStage:", -[TSDTextureDescription stage](self, "stage"));
  -[TSDTextureDescription setDeliveryStyle:](v4, "setDeliveryStyle:", -[TSDTextureDescription deliveryStyle](self, "deliveryStyle"));
  -[TSDTextureDescription setByGlyphStyle:](v4, "setByGlyphStyle:", -[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  BOOL v29;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[TSDTextureDescription session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
      goto LABEL_26;
    v8 = -[TSDTextureDescription isMagicMove](self, "isMagicMove");
    if (v8 != objc_msgSend(v5, "isMagicMove"))
      goto LABEL_26;
    v9 = -[TSDTextureDescription includesActionBuilds](self, "includesActionBuilds");
    if (v9 != objc_msgSend(v5, "includesActionBuilds"))
      goto LABEL_26;
    v10 = -[TSDTextureDescription shouldAddFinal](self, "shouldAddFinal");
    if (v10 != objc_msgSend(v5, "shouldAddFinal"))
      goto LABEL_26;
    v11 = -[TSDTextureDescription shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly");
    if (v11 != objc_msgSend(v5, "shouldAddMagicMoveObjectOnly"))
      goto LABEL_26;
    v12 = -[TSDTextureDescription shouldAddMasks](self, "shouldAddMasks");
    if (v12 != objc_msgSend(v5, "shouldAddMasks"))
      goto LABEL_26;
    v13 = -[TSDTextureDescription shouldDistortToFit](self, "shouldDistortToFit");
    if (v13 != objc_msgSend(v5, "shouldDistortToFit"))
      goto LABEL_26;
    v14 = -[TSDTextureDescription shouldNotAddContainedReps](self, "shouldNotAddContainedReps");
    if (v14 != objc_msgSend(v5, "shouldNotAddContainedReps"))
      goto LABEL_26;
    v15 = -[TSDTextureDescription shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes");
    if (v15 != objc_msgSend(v5, "shouldNotAddShapeAttributes"))
      goto LABEL_26;
    v16 = -[TSDTextureDescription shouldNotAddText](self, "shouldNotAddText");
    if (v16 != objc_msgSend(v5, "shouldNotAddText"))
      goto LABEL_26;
    v17 = -[TSDTextureDescription shouldSeparateReflection](self, "shouldSeparateReflection");
    if (v17 != objc_msgSend(v5, "shouldSeparateReflection"))
      goto LABEL_26;
    v18 = -[TSDTextureDescription shouldSeparateShadow](self, "shouldSeparateShadow");
    if (v18 != objc_msgSend(v5, "shouldSeparateShadow"))
      goto LABEL_26;
    v19 = -[TSDTextureDescription shouldSeparateStroke](self, "shouldSeparateStroke");
    if (v19 != objc_msgSend(v5, "shouldSeparateStroke"))
      goto LABEL_26;
    v20 = -[TSDTextureDescription shouldAddParameterizedStroke](self, "shouldAddParameterizedStroke");
    if (v20 != objc_msgSend(v5, "shouldAddParameterizedStroke"))
      goto LABEL_26;
    v21 = -[TSDTextureDescription shouldSeparateGroupedTextures](self, "shouldSeparateGroupedTextures");
    if (v21 == objc_msgSend(v5, "shouldSeparateGroupedTextures")
      && (v22 = -[TSDTextureDescription shouldReverseStrokeDrawing](self, "shouldReverseStrokeDrawing"),
          v22 == objc_msgSend(v5, "shouldReverseStrokeDrawing"))
      && (v23 = -[TSDTextureDescription shouldSeparateText](self, "shouldSeparateText"),
          v23 == objc_msgSend(v5, "shouldSeparateText"))
      && (v24 = -[TSDTextureDescription shouldForceTextureGeneration](self, "shouldForceTextureGeneration"),
          v24 == objc_msgSend(v5, "shouldForceTextureGeneration"))
      && (v25 = -[TSDTextureDescription shouldIgnoreScaleInSourceImage](self, "shouldIgnoreScaleInSourceImage"),
          v25 == objc_msgSend(v5, "shouldIgnoreScaleInSourceImage"))
      && (v26 = -[TSDTextureDescription stage](self, "stage"), v26 == objc_msgSend(v5, "stage"))
      && (v27 = -[TSDTextureDescription deliveryStyle](self, "deliveryStyle"), v27 == objc_msgSend(v5, "deliveryStyle")))
    {
      v28 = -[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle");
      v29 = v28 == objc_msgSend(v5, "byGlyphStyle");
    }
    else
    {
LABEL_26:
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)objc_opt_new();
  if (-[TSDTextureDescription isMagicMove](self, "isMagicMove"))
    objc_msgSend(v3, "addObject:", CFSTR("isMagicMove"));
  if (-[TSDTextureDescription includesActionBuilds](self, "includesActionBuilds"))
    objc_msgSend(v3, "addObject:", CFSTR("_includesActionBuilds"));
  if (-[TSDTextureDescription shouldAddFinal](self, "shouldAddFinal"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddFinal"));
  if (-[TSDTextureDescription shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddMagicMoveObjectOnly"));
  if (-[TSDTextureDescription shouldAddMasks](self, "shouldAddMasks"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddMasks"));
  if (-[TSDTextureDescription shouldDistortToFit](self, "shouldDistortToFit"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldDistortToFit"));
  if (-[TSDTextureDescription shouldForceTextureGeneration](self, "shouldForceTextureGeneration"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldForceTextureGeneration"));
  if (-[TSDTextureDescription shouldNotAddContainedReps](self, "shouldNotAddContainedReps"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddContainedReps"));
  if (-[TSDTextureDescription shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddShapeAttributes"));
  if (-[TSDTextureDescription shouldNotAddText](self, "shouldNotAddText"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddText"));
  if (-[TSDTextureDescription shouldSeparateReflection](self, "shouldSeparateReflection"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateReflection"));
  if (-[TSDTextureDescription shouldSeparateShadow](self, "shouldSeparateShadow"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateShadow"));
  if (-[TSDTextureDescription shouldSeparateStroke](self, "shouldSeparateStroke"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateStroke"));
  if (-[TSDTextureDescription shouldAddParameterizedStroke](self, "shouldAddParameterizedStroke"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddParameterizedStroke"));
  if (-[TSDTextureDescription shouldSeparateGroupedTextures](self, "shouldSeparateGroupedTextures"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateGroupedTextures"));
  if (-[TSDTextureDescription shouldReverseStrokeDrawing](self, "shouldReverseStrokeDrawing"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldReverseStrokeDrawing"));
  if (-[TSDTextureDescription shouldSeparateText](self, "shouldSeparateText"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateText"));
  if (-[TSDTextureDescription shouldIgnoreScaleInSourceImage](self, "shouldIgnoreScaleInSourceImage"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldIgnoreScaleInSourceImage"));
  if (-[TSDTextureDescription deliveryStyle](self, "deliveryStyle"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tds: %ld"), -[TSDTextureDescription deliveryStyle](self, "deliveryStyle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("glyph: %ld"), -[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stage: %ld"), -[TSDTextureDescription stage](self, "stage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[TSDTextureDescription session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[TSDTextureDescription session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("session: %p"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  v16.receiver = self;
  v16.super_class = (Class)TSDTextureDescription;
  -[TSDTextureDescription description](&v16, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: {%@}"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _BOOL4 v46;
  uint64_t v47;
  unint64_t v48;

  -[TSDTextureDescription session](self, "session");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[TSDTextureDescription isMagicMove](self, "isMagicMove");
  v5 = -[TSDTextureDescription shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly");
  v6 = 2;
  if (!v5)
    v6 = 0;
  v7 = v6 | v4;
  if (-[TSDTextureDescription shouldDistortToFit](self, "shouldDistortToFit"))
    v8 = 4;
  else
    v8 = 0;
  v9 = -[TSDTextureDescription shouldForceTextureGeneration](self, "shouldForceTextureGeneration");
  v10 = 8;
  if (!v9)
    v10 = 0;
  v11 = v7 | v8 | v10;
  if (-[TSDTextureDescription shouldNotAddContainedReps](self, "shouldNotAddContainedReps"))
    v12 = 16;
  else
    v12 = 0;
  v13 = -[TSDTextureDescription shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes");
  v14 = 32;
  if (!v13)
    v14 = 0;
  v15 = v12 | v14;
  v16 = -[TSDTextureDescription shouldNotAddText](self, "shouldNotAddText");
  v17 = 64;
  if (!v16)
    v17 = 0;
  v18 = v11 | v15 | v17;
  if (-[TSDTextureDescription shouldSeparateReflection](self, "shouldSeparateReflection"))
    v19 = 128;
  else
    v19 = 0;
  v20 = -[TSDTextureDescription shouldSeparateShadow](self, "shouldSeparateShadow");
  v21 = 256;
  if (!v20)
    v21 = 0;
  v22 = v19 | v21;
  v23 = -[TSDTextureDescription shouldSeparateStroke](self, "shouldSeparateStroke");
  v24 = 512;
  if (!v23)
    v24 = 0;
  v25 = v22 | v24;
  v26 = -[TSDTextureDescription shouldAddParameterizedStroke](self, "shouldAddParameterizedStroke");
  v27 = 1024;
  if (!v26)
    v27 = 0;
  v28 = v18 | v25 | v27;
  if (-[TSDTextureDescription shouldReverseStrokeDrawing](self, "shouldReverseStrokeDrawing"))
    v29 = 2048;
  else
    v29 = 0;
  v30 = -[TSDTextureDescription shouldSeparateText](self, "shouldSeparateText");
  v31 = 4096;
  if (!v30)
    v31 = 0;
  v32 = v29 | v31;
  v33 = -[TSDTextureDescription shouldIgnoreScaleInSourceImage](self, "shouldIgnoreScaleInSourceImage");
  v34 = 0x2000;
  if (!v33)
    v34 = 0;
  v35 = v32 | v34;
  v36 = -[TSDTextureDescription shouldAddMasks](self, "shouldAddMasks");
  v37 = 0x4000;
  if (!v36)
    v37 = 0;
  v38 = v35 | v37;
  v39 = -[TSDTextureDescription shouldAddFinal](self, "shouldAddFinal");
  v40 = 0x8000;
  if (!v39)
    v40 = 0;
  v41 = v28 | v38 | v40;
  v42 = -[TSDTextureDescription includesActionBuilds](self, "includesActionBuilds");
  v43 = 0x10000;
  if (!v42)
    v43 = 0;
  v44 = v41 | v43 | (-[TSDTextureDescription deliveryStyle](self, "deliveryStyle") << 17);
  v45 = v44 | ((unint64_t)-[TSDTextureDescription byGlyphStyle](self, "byGlyphStyle") << 19);
  v46 = -[TSDTextureDescription shouldSeparateGroupedTextures](self, "shouldSeparateGroupedTextures");
  v47 = 0x200000;
  if (!v46)
    v47 = 0;
  v48 = (v45 | v47 | (-[TSDTextureDescription stage](self, "stage") << 22)) ^ v3;

  return v48;
}

- (void)reset
{
  objc_storeWeak((id *)&self->_session, 0);
  self->_byGlyphStyle = 0;
  *(_QWORD *)&self->_isMagicMove = 0;
  *(_QWORD *)&self->_shouldSeparateReflection = 0;
  *(_WORD *)&self->_shouldDistortToFit = 0;
  self->_stage = 0;
  self->_deliveryStyle = 0;
}

- (TSDAnimationSession)session
{
  return (TSDAnimationSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (BOOL)isMagicMove
{
  return self->_isMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->_isMagicMove = a3;
}

- (BOOL)includesActionBuilds
{
  return self->_includesActionBuilds;
}

- (void)setIncludesActionBuilds:(BOOL)a3
{
  self->_includesActionBuilds = a3;
}

- (BOOL)shouldAddFinal
{
  return self->_shouldAddFinal;
}

- (void)setShouldAddFinal:(BOOL)a3
{
  self->_shouldAddFinal = a3;
}

- (BOOL)shouldAddMagicMoveObjectOnly
{
  return self->_shouldAddMagicMoveObjectOnly;
}

- (void)setShouldAddMagicMoveObjectOnly:(BOOL)a3
{
  self->_shouldAddMagicMoveObjectOnly = a3;
}

- (BOOL)shouldAddMasks
{
  return self->_shouldAddMasks;
}

- (void)setShouldAddMasks:(BOOL)a3
{
  self->_shouldAddMasks = a3;
}

- (BOOL)shouldDistortToFit
{
  return self->_shouldDistortToFit;
}

- (void)setShouldDistortToFit:(BOOL)a3
{
  self->_shouldDistortToFit = a3;
}

- (BOOL)shouldNotAddContainedReps
{
  return self->_shouldNotAddContainedReps;
}

- (void)setShouldNotAddContainedReps:(BOOL)a3
{
  self->_shouldNotAddContainedReps = a3;
}

- (BOOL)shouldNotAddShapeAttributes
{
  return self->_shouldAddNoShapeAttributes;
}

- (void)setShouldNotAddShapeAttributes:(BOOL)a3
{
  self->_shouldAddNoShapeAttributes = a3;
}

- (BOOL)shouldNotAddText
{
  return self->_shouldNotAddText;
}

- (void)setShouldNotAddText:(BOOL)a3
{
  self->_shouldNotAddText = a3;
}

- (BOOL)shouldSeparateReflection
{
  return self->_shouldSeparateReflection;
}

- (void)setShouldSeparateReflection:(BOOL)a3
{
  self->_shouldSeparateReflection = a3;
}

- (BOOL)shouldSeparateShadow
{
  return self->_shouldSeparateShadow;
}

- (void)setShouldSeparateShadow:(BOOL)a3
{
  self->_shouldSeparateShadow = a3;
}

- (BOOL)shouldSeparateStroke
{
  return self->_shouldSeparateStroke;
}

- (void)setShouldSeparateStroke:(BOOL)a3
{
  self->_shouldSeparateStroke = a3;
}

- (BOOL)shouldAddParameterizedStroke
{
  return self->_shouldAddParameterizedStroke;
}

- (void)setShouldAddParameterizedStroke:(BOOL)a3
{
  self->_shouldAddParameterizedStroke = a3;
}

- (BOOL)shouldReverseStrokeDrawing
{
  return self->_shouldReverseStrokeDrawing;
}

- (void)setShouldReverseStrokeDrawing:(BOOL)a3
{
  self->_shouldReverseStrokeDrawing = a3;
}

- (BOOL)shouldSeparateGroupedTextures
{
  return self->_shouldSeparateGroupedTextures;
}

- (void)setShouldSeparateGroupedTextures:(BOOL)a3
{
  self->_shouldSeparateGroupedTextures = a3;
}

- (BOOL)shouldSeparateText
{
  return self->_shouldSeparateText;
}

- (void)setShouldSeparateText:(BOOL)a3
{
  self->_shouldSeparateText = a3;
}

- (BOOL)shouldForceTextureGeneration
{
  return self->_shouldForceTextureGeneration;
}

- (void)setShouldForceTextureGeneration:(BOOL)a3
{
  self->_shouldForceTextureGeneration = a3;
}

- (BOOL)shouldIgnoreScaleInSourceImage
{
  return self->_shouldIgnoreScaleInSourceImage;
}

- (void)setShouldIgnoreScaleInSourceImage:(BOOL)a3
{
  self->_shouldIgnoreScaleInSourceImage = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)deliveryStyle
{
  return self->_deliveryStyle;
}

- (void)setDeliveryStyle:(unint64_t)a3
{
  self->_deliveryStyle = a3;
}

- (int)byGlyphStyle
{
  return self->_byGlyphStyle;
}

- (void)setByGlyphStyle:(int)a3
{
  self->_byGlyphStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

@end
