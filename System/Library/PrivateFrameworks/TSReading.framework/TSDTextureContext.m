@implementation TSDTextureContext

+ (id)context
{
  return objc_alloc_init(TSDTextureContext);
}

+ (TSDTextureContext)contextWithSession:(id)a3
{
  TSDTextureContext *v4;

  v4 = objc_alloc_init(TSDTextureContext);
  -[TSDTextureContext setSession:](v4, "setSession:", a3);
  return v4;
}

+ (TSDTextureContext)contextWithTextureContext:(id)a3
{
  return (TSDTextureContext *)(id)objc_msgSend(a3, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDTextureContext *v4;

  v4 = -[TSDTextureContext init](+[TSDTextureContext allocWithZone:](TSDTextureContext, "allocWithZone:", a3), "init");
  -[TSDTextureContext setSession:](v4, "setSession:", -[TSDTextureContext session](self, "session"));
  -[TSDTextureContext setIsMagicMove:](v4, "setIsMagicMove:", -[TSDTextureContext isMagicMove](self, "isMagicMove"));
  -[TSDTextureContext setShouldAddFinal:](v4, "setShouldAddFinal:", -[TSDTextureContext shouldAddFinal](self, "shouldAddFinal"));
  -[TSDTextureContext setShouldAddMagicMoveObjectOnly:](v4, "setShouldAddMagicMoveObjectOnly:", -[TSDTextureContext shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly"));
  -[TSDTextureContext setShouldAddReversedFinal:](v4, "setShouldAddReversedFinal:", -[TSDTextureContext shouldAddReversedFinal](self, "shouldAddReversedFinal"));
  -[TSDTextureContext setShouldDistortToFit:](v4, "setShouldDistortToFit:", -[TSDTextureContext shouldDistortToFit](self, "shouldDistortToFit"));
  -[TSDTextureContext setShouldNotAddContainedReps:](v4, "setShouldNotAddContainedReps:", -[TSDTextureContext shouldNotAddContainedReps](self, "shouldNotAddContainedReps"));
  -[TSDTextureContext setShouldNotAddShapeAttributes:](v4, "setShouldNotAddShapeAttributes:", -[TSDTextureContext shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes"));
  -[TSDTextureContext setShouldNotAddText:](v4, "setShouldNotAddText:", -[TSDTextureContext shouldNotAddText](self, "shouldNotAddText"));
  -[TSDTextureContext setShouldNotCacheTexture:](v4, "setShouldNotCacheTexture:", -[TSDTextureContext shouldNotCacheTexture](self, "shouldNotCacheTexture"));
  -[TSDTextureContext setShouldSeparateReflection:](v4, "setShouldSeparateReflection:", -[TSDTextureContext shouldSeparateReflection](self, "shouldSeparateReflection"));
  -[TSDTextureContext setShouldSeparateShadow:](v4, "setShouldSeparateShadow:", -[TSDTextureContext shouldSeparateShadow](self, "shouldSeparateShadow"));
  -[TSDTextureContext setShouldSeparateStroke:](v4, "setShouldSeparateStroke:", -[TSDTextureContext shouldSeparateStroke](self, "shouldSeparateStroke"));
  -[TSDTextureContext setShouldSeparateText:](v4, "setShouldSeparateText:", -[TSDTextureContext shouldSeparateText](self, "shouldSeparateText"));
  -[TSDTextureContext setShouldForceTextureGeneration:](v4, "setShouldForceTextureGeneration:", -[TSDTextureContext shouldForceTextureGeneration](self, "shouldForceTextureGeneration"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  TSDAnimationSession *v5;
  int v6;
  int v7;
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
  BOOL v20;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[TSDTextureContext session](self, "session");
  if (v5 != (TSDAnimationSession *)objc_msgSend(a3, "session"))
    return 0;
  v6 = -[TSDTextureContext isMagicMove](self, "isMagicMove");
  if (v6 != objc_msgSend(a3, "isMagicMove"))
    return 0;
  v7 = -[TSDTextureContext shouldAddFinal](self, "shouldAddFinal");
  if (v7 != objc_msgSend(a3, "shouldAddFinal"))
    return 0;
  v8 = -[TSDTextureContext shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly");
  if (v8 != objc_msgSend(a3, "shouldAddMagicMoveObjectOnly"))
    return 0;
  v9 = -[TSDTextureContext shouldAddReversedFinal](self, "shouldAddReversedFinal");
  if (v9 != objc_msgSend(a3, "shouldAddReversedFinal"))
    return 0;
  v10 = -[TSDTextureContext shouldDistortToFit](self, "shouldDistortToFit");
  if (v10 != objc_msgSend(a3, "shouldDistortToFit"))
    return 0;
  v11 = -[TSDTextureContext shouldNotAddContainedReps](self, "shouldNotAddContainedReps");
  if (v11 != objc_msgSend(a3, "shouldNotAddContainedReps"))
    return 0;
  v12 = -[TSDTextureContext shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes");
  if (v12 != objc_msgSend(a3, "shouldNotAddShapeAttributes"))
    return 0;
  v13 = -[TSDTextureContext shouldNotAddText](self, "shouldNotAddText");
  if (v13 != objc_msgSend(a3, "shouldNotAddText"))
    return 0;
  v14 = -[TSDTextureContext shouldNotCacheTexture](self, "shouldNotCacheTexture");
  if (v14 != objc_msgSend(a3, "shouldNotCacheTexture"))
    return 0;
  v15 = -[TSDTextureContext shouldSeparateReflection](self, "shouldSeparateReflection");
  if (v15 != objc_msgSend(a3, "shouldSeparateReflection"))
    return 0;
  v16 = -[TSDTextureContext shouldSeparateShadow](self, "shouldSeparateShadow");
  if (v16 != objc_msgSend(a3, "shouldSeparateShadow"))
    return 0;
  v17 = -[TSDTextureContext shouldSeparateStroke](self, "shouldSeparateStroke");
  if (v17 != objc_msgSend(a3, "shouldSeparateStroke"))
    return 0;
  v18 = -[TSDTextureContext shouldSeparateText](self, "shouldSeparateText");
  if (v18 != objc_msgSend(a3, "shouldSeparateText"))
    return 0;
  v20 = -[TSDTextureContext shouldForceTextureGeneration](self, "shouldForceTextureGeneration");
  return v20 ^ objc_msgSend(a3, "shouldForceTextureGeneration") ^ 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v3 = (void *)objc_opt_new();
  if (-[TSDTextureContext isMagicMove](self, "isMagicMove"))
    objc_msgSend(v3, "addObject:", CFSTR("isMagicMove"));
  if (-[TSDTextureContext shouldAddFinal](self, "shouldAddFinal"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddFinal"));
  if (-[TSDTextureContext shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddMagicMoveObjectOnly"));
  if (-[TSDTextureContext shouldAddReversedFinal](self, "shouldAddReversedFinal"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldAddReversedFinal"));
  if (-[TSDTextureContext shouldDistortToFit](self, "shouldDistortToFit"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldDistortToFit"));
  if (-[TSDTextureContext shouldForceTextureGeneration](self, "shouldForceTextureGeneration"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldForceTextureGeneration"));
  if (-[TSDTextureContext shouldNotAddContainedReps](self, "shouldNotAddContainedReps"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddContainedReps"));
  if (-[TSDTextureContext shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddShapeAttributes"));
  if (-[TSDTextureContext shouldNotAddText](self, "shouldNotAddText"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotAddText"));
  if (-[TSDTextureContext shouldNotCacheTexture](self, "shouldNotCacheTexture"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldNotCacheTexture"));
  if (-[TSDTextureContext shouldSeparateReflection](self, "shouldSeparateReflection"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateReflection"));
  if (-[TSDTextureContext shouldSeparateShadow](self, "shouldSeparateShadow"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateShadow"));
  if (-[TSDTextureContext shouldSeparateStroke](self, "shouldSeparateStroke"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateStroke"));
  if (-[TSDTextureContext shouldSeparateText](self, "shouldSeparateText"))
    objc_msgSend(v3, "addObject:", CFSTR("shouldSeparateText"));
  v6.receiver = self;
  v6.super_class = (Class)TSDTextureContext;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: {%@}"), -[TSDTextureContext description](&v6, sel_description), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
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

  v3 = -[TSDTextureContext session](self, "session");
  v4 = -[TSDTextureContext isMagicMove](self, "isMagicMove");
  v5 = -[TSDTextureContext shouldAddFinal](self, "shouldAddFinal");
  v6 = 2;
  if (!v5)
    v6 = 0;
  v7 = v6 | v4;
  if (-[TSDTextureContext shouldAddMagicMoveObjectOnly](self, "shouldAddMagicMoveObjectOnly"))
    v8 = 4;
  else
    v8 = 0;
  v9 = -[TSDTextureContext shouldAddReversedFinal](self, "shouldAddReversedFinal");
  v10 = 8;
  if (!v9)
    v10 = 0;
  v11 = v7 | v8 | v10;
  if (-[TSDTextureContext shouldDistortToFit](self, "shouldDistortToFit"))
    v12 = 16;
  else
    v12 = 0;
  v13 = -[TSDTextureContext shouldForceTextureGeneration](self, "shouldForceTextureGeneration");
  v14 = 32;
  if (!v13)
    v14 = 0;
  v15 = v12 | v14;
  v16 = -[TSDTextureContext shouldNotAddContainedReps](self, "shouldNotAddContainedReps");
  v17 = 64;
  if (!v16)
    v17 = 0;
  v18 = v11 | v15 | v17;
  if (-[TSDTextureContext shouldNotAddShapeAttributes](self, "shouldNotAddShapeAttributes"))
    v19 = 128;
  else
    v19 = 0;
  v20 = -[TSDTextureContext shouldNotAddText](self, "shouldNotAddText");
  v21 = 256;
  if (!v20)
    v21 = 0;
  v22 = v19 | v21;
  v23 = -[TSDTextureContext shouldNotCacheTexture](self, "shouldNotCacheTexture");
  v24 = 512;
  if (!v23)
    v24 = 0;
  v25 = v22 | v24;
  v26 = -[TSDTextureContext shouldSeparateReflection](self, "shouldSeparateReflection");
  v27 = 1024;
  if (!v26)
    v27 = 0;
  v28 = v18 | v25 | v27;
  if (-[TSDTextureContext shouldSeparateShadow](self, "shouldSeparateShadow"))
    v29 = 2048;
  else
    v29 = 0;
  v30 = -[TSDTextureContext shouldSeparateStroke](self, "shouldSeparateStroke");
  v31 = 4096;
  if (!v30)
    v31 = 0;
  v32 = v29 | v31;
  v33 = -[TSDTextureContext shouldSeparateText](self, "shouldSeparateText");
  v34 = 0x2000;
  if (!v33)
    v34 = 0;
  return (v28 | v32 | v34) ^ v3;
}

- (void)reset
{
  self->_session = 0;
  *(_QWORD *)&self->_isMagicMove = 0;
  *(_QWORD *)&self->_shouldNotAddText = 0;
}

- (TSDAnimationSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  self->_session = (TSDAnimationSession *)a3;
}

- (BOOL)isMagicMove
{
  return self->_isMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->_isMagicMove = a3;
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

- (BOOL)shouldAddReversedFinal
{
  return self->_shouldAddReversedFinal;
}

- (void)setShouldAddReversedFinal:(BOOL)a3
{
  self->_shouldAddReversedFinal = a3;
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

- (BOOL)shouldNotCacheTexture
{
  return self->_shouldNotCacheTexture;
}

- (void)setShouldNotCacheTexture:(BOOL)a3
{
  self->_shouldNotCacheTexture = a3;
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

@end
