@implementation PUModelTileTransform

- (PUModelTileTransform)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUModelTileTransform.m"), 15, CFSTR("please use a designated initializer"));

  return -[PUModelTileTransform initWithNoUserInput](self, "initWithNoUserInput");
}

- (PUModelTileTransform)initWithNoUserInput
{
  PUModelTileTransform *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUModelTileTransform;
  result = -[PUModelTileTransform init](&v3, sel_init);
  if (result)
    result->_scale = 1.0;
  return result;
}

- (PUModelTileTransform)initWithNormalizedTranslation:(CGPoint)a3 overscroll:(CGPoint)a4 scale:(double)a5 userInputOriginIdentifier:(id)a6 isZoomedOut:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  id v14;
  PUModelTileTransform *v15;
  PUModelTileTransform *v16;
  uint64_t v17;
  NSString *userInputOriginIdentifier;
  objc_super v20;

  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PUModelTileTransform;
  v15 = -[PUModelTileTransform init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_hasUserInput = 1;
    v15->_normalizedTranslation.x = v12;
    v15->_normalizedTranslation.y = v11;
    v15->_overscroll.x = x;
    v15->_overscroll.y = y;
    v15->_scale = a5;
    v17 = objc_msgSend(v14, "copy");
    userInputOriginIdentifier = v16->_userInputOriginIdentifier;
    v16->_userInputOriginIdentifier = (NSString *)v17;

    v16->_isZoomedOut = a7;
  }

  return v16;
}

- (id)copyWithScale:(double)a3 normalizedTranslation:(CGPoint)a4
{
  double y;
  double x;
  PUModelTileTransform *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  PUModelTileTransform *v14;

  y = a4.y;
  x = a4.x;
  v8 = [PUModelTileTransform alloc];
  -[PUModelTileTransform overscroll](self, "overscroll");
  v10 = v9;
  v12 = v11;
  -[PUModelTileTransform userInputOriginIdentifier](self, "userInputOriginIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUModelTileTransform initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:](v8, "initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:", v13, -[PUModelTileTransform isZoomedOut](self, "isZoomedOut"), x, y, v10, v12, a3);

  return v14;
}

- (unint64_t)hash
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;

  if (!-[PUModelTileTransform hasUserInput](self, "hasUserInput"))
    return 0;
  -[PUModelTileTransform normalizedTranslation](self, "normalizedTranslation");
  v4 = (uint64_t)(v3 * 100.0);
  -[PUModelTileTransform normalizedTranslation](self, "normalizedTranslation");
  v6 = (uint64_t)(v5 * 100.0);
  -[PUModelTileTransform overscroll](self, "overscroll");
  v8 = (uint64_t)v7;
  -[PUModelTileTransform overscroll](self, "overscroll");
  v10 = (uint64_t)v9;
  -[PUModelTileTransform scale](self, "scale");
  return v4 ^ v6 ^ v8 ^ v10 ^ (uint64_t)(v11 * 100.0) ^ 0x2A;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PUModelTileTransform hasUserInput](self, "hasUserInput");
    if (v6 == objc_msgSend(v5, "hasUserInput"))
    {
      -[PUModelTileTransform normalizedTranslation](self, "normalizedTranslation");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v5, "normalizedTranslation");
      v7 = 0;
      if (v9 == v13 && v11 == v12)
      {
        -[PUModelTileTransform overscroll](self, "overscroll");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v5, "overscroll");
        v7 = 0;
        if (v15 == v19 && v17 == v18)
        {
          -[PUModelTileTransform scale](self, "scale");
          v21 = v20;
          objc_msgSend(v5, "scale");
          v7 = v21 == v22;
        }
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasUserZoomedIn
{
  _BOOL4 v3;
  double v4;

  v3 = -[PUModelTileTransform hasUserInput](self, "hasUserInput");
  if (v3)
  {
    -[PUModelTileTransform scale](self, "scale");
    LOBYTE(v3) = v4 > 1.0;
  }
  return v3;
}

- (BOOL)hasUserZoomedOut
{
  _BOOL4 v3;
  double v4;

  v3 = -[PUModelTileTransform hasUserInput](self, "hasUserInput");
  if (v3)
  {
    -[PUModelTileTransform scale](self, "scale");
    LOBYTE(v3) = v4 < 1.0;
  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL8 hasUserInput;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  hasUserInput = self->_hasUserInput;
  NSStringFromCGPoint(self->_normalizedTranslation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_overscroll);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p hasUserInput:%i referencePoint:%@ overScroll:%@ scale:%f>"), v4, self, hasUserInput, v6, v7, *(_QWORD *)&self->_scale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasUserInput
{
  return self->_hasUserInput;
}

- (double)scale
{
  return self->_scale;
}

- (CGPoint)normalizedTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedTranslation.x;
  y = self->_normalizedTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)overscroll
{
  double x;
  double y;
  CGPoint result;

  x = self->_overscroll.x;
  y = self->_overscroll.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)userInputOriginIdentifier
{
  return self->_userInputOriginIdentifier;
}

- (BOOL)isZoomedOut
{
  return self->_isZoomedOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInputOriginIdentifier, 0);
}

@end
