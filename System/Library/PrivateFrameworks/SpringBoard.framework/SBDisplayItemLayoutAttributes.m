@implementation SBDisplayItemLayoutAttributes

- (int64_t)lastInteractionTime
{
  return self->_lastInteractionTime;
}

- (id)attributesByModifyingLastInteractionTime:(int64_t)a3
{
  id v6;
  int64_t contentOrientation;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v14;
  uint64_t v15;
  _OWORD v16[3];
  int64_t v17;
  _OWORD v18[3];
  int64_t semanticSizeType;

  if (self->_lastInteractionTime == a3)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v18[0] = self->_attributedSize._private_opaqueSize;
  v18[1] = origin;
  v18[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16[1] = v14;
  v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v15) = positionIsSystemManaged;
  return (id)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, a3, sizingPolicy, v18, occlusionState, v16, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
}

- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7 occlusionState:(int64_t)a8 attributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a9 unoccludedPeekingCenter:(CGPoint)a10 positionIsSystemManaged:(BOOL)a11
{
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  SBDisplayItemLayoutAttributes *v21;
  SBDisplayItemLayoutAttributes *v22;
  CGSize private_opaqueSize;
  CGPoint origin;
  CGSize size;
  CGSize v26;
  CGPoint v27;
  CGSize v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v44;

  y = a10.y;
  x = a10.x;
  v18 = a7.y;
  v19 = a7.x;
  v44.receiver = self;
  v44.super_class = (Class)SBDisplayItemLayoutAttributes;
  v21 = -[SBDisplayItemLayoutAttributes init](&v44, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_contentOrientation = a3;
    v21->_lastInteractionTime = a4;
    v21->_sizingPolicy = a5;
    private_opaqueSize = a6->_private_opaqueSize;
    origin = a6->referenceBounds.origin;
    size = a6->referenceBounds.size;
    v21->_attributedSize.semanticSizeType = a6->semanticSizeType;
    v21->_attributedSize.referenceBounds.size = size;
    v21->_attributedSize.referenceBounds.origin = origin;
    v21->_attributedSize._private_opaqueSize = private_opaqueSize;
    v21->_normalizedCenter.x = v19;
    v21->_normalizedCenter.y = v18;
    v21->_occlusionState = a8;
    v26 = a9->_private_opaqueSize;
    v27 = a9->referenceBounds.origin;
    v28 = a9->referenceBounds.size;
    v21->_attributedUserSizeBeforeOverlapping.semanticSizeType = a9->semanticSizeType;
    v21->_attributedUserSizeBeforeOverlapping.referenceBounds.origin = v27;
    v21->_attributedUserSizeBeforeOverlapping.referenceBounds.size = v28;
    v21->_attributedUserSizeBeforeOverlapping._private_opaqueSize = v26;
    v21->_unoccludedPeekingCenter.x = x;
    v21->_unoccludedPeekingCenter.y = y;
    v21->_positionIsSystemManaged = a11;
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "appendInteger:", v22->_contentOrientation);
    v31 = (id)objc_msgSend(v29, "appendInteger:", v22->_lastInteractionTime);
    v32 = (id)objc_msgSend(v29, "appendInteger:", v22->_sizingPolicy);
    v33 = (id)objc_msgSend(v29, "appendCGSize:", v22->_attributedSize._private_opaqueSize.width, v22->_attributedSize._private_opaqueSize.height);
    v34 = (id)objc_msgSend(v29, "appendCGRect:", v22->_attributedSize.referenceBounds.origin.x, v22->_attributedSize.referenceBounds.origin.y, v22->_attributedSize.referenceBounds.size.width, v22->_attributedSize.referenceBounds.size.height);
    v35 = (id)objc_msgSend(v29, "appendInteger:", v22->_attributedSize.semanticSizeType);
    v36 = (id)objc_msgSend(v29, "appendCGPoint:", v22->_normalizedCenter.x, v22->_normalizedCenter.y);
    v37 = (id)objc_msgSend(v29, "appendInteger:", v22->_occlusionState);
    v38 = (id)objc_msgSend(v29, "appendCGSize:", v22->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width, v22->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height);
    v39 = (id)objc_msgSend(v29, "appendCGRect:", v22->_attributedUserSizeBeforeOverlapping.referenceBounds.origin.x, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.origin.y, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.size.width, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.size.height);
    v40 = (id)objc_msgSend(v29, "appendInteger:", v22->_attributedUserSizeBeforeOverlapping.semanticSizeType);
    v41 = (id)objc_msgSend(v29, "appendCGPoint:", v22->_unoccludedPeekingCenter.x, v22->_unoccludedPeekingCenter.y);
    v42 = (id)objc_msgSend(v29, "appendBool:", v22->_positionIsSystemManaged);
    v22->_hash = objc_msgSend(v29, "hash");

  }
  return v22;
}

- (SBDisplayItemLayoutAttributes)init
{
  __int128 v2;
  _QWORD v4[2];
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v4[0] = 0;
  v4[1] = 0;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = v2;
  v7 = 0;
  return -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:](self, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:", 0, 0, 0, v4, 0.0, 0.0);
}

- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7
{
  __int128 v7;
  CGPoint origin;
  uint64_t v10;
  _OWORD v11[3];
  int64_t semanticSizeType;
  _QWORD v13[2];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v13[0] = 0;
  v13[1] = 0;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *MEMORY[0x1E0C9D648];
  v15 = v7;
  v16 = 0;
  origin = a6->referenceBounds.origin;
  v11[0] = a6->_private_opaqueSize;
  v11[1] = origin;
  v11[2] = a6->referenceBounds.size;
  semanticSizeType = a6->semanticSizeType;
  LOBYTE(v10) = 0;
  return -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](self, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", a3, a4, a5, v11, 0, v13, a7.x, a7.y, 0.0, 0.0, v10);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDisplayItemLayoutAttributes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  int64_t lastInteractionTime;
  id v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  CGPoint origin;
  void *v13;
  id v14;
  unint64_t v15;
  const __CFString *v16;
  CGPoint v17;
  void *v18;
  id v19;
  CGSize private_opaqueSize;
  CGPoint v22;
  CGSize size;
  int64_t semanticSizeType;

  -[SBDisplayItemLayoutAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("contentOrientation"));

  lastInteractionTime = self->_lastInteractionTime;
  if (lastInteractionTime)
    v7 = (id)objc_msgSend(v4, "appendInteger:withName:", lastInteractionTime, CFSTR("lastInteractionTime"));
  else
    objc_msgSend(v4, "appendString:withName:", CFSTR("never"), CFSTR("lastInteractionTime"));
  NSStringFromDisplayItemSizingPolicy(self->_sizingPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("sizingPolicy"));

  v10 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = self->_attributedSize._private_opaqueSize.width == *MEMORY[0x1E0C9D820]
     && self->_attributedSize._private_opaqueSize.height == v9;
  if (v11 && !self->_attributedSize.semanticSizeType)
  {
    objc_msgSend(v4, "appendString:withName:", CFSTR("unspecified"), CFSTR("size"));
  }
  else
  {
    origin = self->_attributedSize.referenceBounds.origin;
    private_opaqueSize = self->_attributedSize._private_opaqueSize;
    v22 = origin;
    size = self->_attributedSize.referenceBounds.size;
    semanticSizeType = self->_attributedSize.semanticSizeType;
    SBDisplayItemAttributedSizeDescription((uint64_t)&private_opaqueSize);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v13, CFSTR("size"));

  }
  if (self->_normalizedCenter.x == 0.0 && self->_normalizedCenter.y == 0.0)
    objc_msgSend(v4, "appendString:withName:", CFSTR("unspecified"), CFSTR("center"));
  else
    v14 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("center"));
  v15 = self->_occlusionState - 1;
  if (v15 > 2)
    v16 = CFSTR("unknown");
  else
    v16 = off_1E8EAC648[v15];
  objc_msgSend(v4, "appendString:withName:", v16, CFSTR("occlusionState"));
  if (self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width == v10
    && self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height == v9
    && !self->_attributedUserSizeBeforeOverlapping.semanticSizeType)
  {
    objc_msgSend(v4, "appendString:withName:", CFSTR("unspecified"), CFSTR("userConfiguredSizeBeforeOverlapping"));
  }
  else
  {
    v17 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    private_opaqueSize = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v22 = v17;
    size = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    SBDisplayItemAttributedSizeDescription((uint64_t)&private_opaqueSize);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v18, CFSTR("userConfiguredSizeBeforeOverlapping"));

  }
  if (self->_unoccludedPeekingCenter.x == 0.0 && self->_unoccludedPeekingCenter.y == 0.0)
    objc_msgSend(v4, "appendString:withName:", CFSTR("unspecified"), CFSTR("unoccludedPeekingCenter"));
  else
    v19 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("unoccludedPeekingCenter"));
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)attributesByModifyingContentOrientation:(int64_t)a3
{
  id v6;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v14;
  uint64_t v15;
  _OWORD v16[3];
  int64_t v17;
  _OWORD v18[3];
  int64_t semanticSizeType;

  if (self->_contentOrientation == a3)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v18[0] = self->_attributedSize._private_opaqueSize;
  v18[1] = origin;
  v18[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16[1] = v14;
  v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v15) = positionIsSystemManaged;
  return (id)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", a3, lastInteractionTime, sizingPolicy, v18, occlusionState, v16, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

- (id)attributesByModifyingSizingPolicy:(int64_t)a3
{
  id v6;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v14;
  uint64_t v15;
  _OWORD v16[3];
  int64_t v17;
  _OWORD v18[3];
  int64_t semanticSizeType;

  if (self->_sizingPolicy == a3)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v18[0] = self->_attributedSize._private_opaqueSize;
  v18[1] = origin;
  v18[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16[1] = v14;
  v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v15) = positionIsSystemManaged;
  return (id)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, a3, v18, occlusionState, v16, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
}

- (SBDisplayItemAttributedSize)attributedSize
{
  CGPoint v3;

  v3 = *(CGPoint *)&self[1].semanticSizeType;
  retstr->_private_opaqueSize = self[1].referenceBounds.size;
  retstr->referenceBounds.origin = v3;
  retstr->referenceBounds.size = *(CGSize *)&self[2]._private_opaqueSize.height;
  retstr->semanticSizeType = *(_QWORD *)&self[2].referenceBounds.origin.y;
  return self;
}

+ (CGPoint)normalizedPointForPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x / CGRectGetWidth(a4);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v10 = v8 / CGRectGetHeight(v13);
  v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  CGPoint v12;
  uint64_t v14;
  _OWORD v15[3];
  int64_t v16;
  _OWORD v17[3];
  int64_t semanticSizeType;

  v4 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v17[0] = self->_attributedSize._private_opaqueSize;
  v17[1] = origin;
  v17[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  origin.x = self->_normalizedCenter.y;
  v12 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v15[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v15[1] = v12;
  v15[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v16 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v14) = positionIsSystemManaged;
  return (id)objc_msgSend(v4, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v17, occlusionState, v15, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v14);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  SBDisplayItemLayoutAttributes *v4;
  CGPoint origin;
  CGPoint v6;
  BOOL v7;
  CGPoint v8;
  CGPoint v9;
  CGSize v11;
  CGPoint v12;
  CGSize v13;
  int64_t v14;
  CGSize private_opaqueSize;
  CGPoint v16;
  CGSize size;
  int64_t semanticSizeType;

  v4 = (SBDisplayItemLayoutAttributes *)a3;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  if (self->_lastInteractionTime != v4->_lastInteractionTime)
    goto LABEL_13;
  if (self->_sizingPolicy != v4->_sizingPolicy)
    goto LABEL_13;
  origin = self->_attributedSize.referenceBounds.origin;
  private_opaqueSize = self->_attributedSize._private_opaqueSize;
  v16 = origin;
  size = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  v6 = v4->_attributedSize.referenceBounds.origin;
  v11 = v4->_attributedSize._private_opaqueSize;
  v12 = v6;
  v13 = v4->_attributedSize.referenceBounds.size;
  v14 = v4->_attributedSize.semanticSizeType;
  if (!SBEqualDisplayItemAttributedSizes((uint64_t)&private_opaqueSize, (uint64_t)&v11))
    goto LABEL_13;
  v7 = 0;
  if (self->_normalizedCenter.x != v4->_normalizedCenter.x || self->_normalizedCenter.y != v4->_normalizedCenter.y)
    goto LABEL_15;
  if (self->_occlusionState != v4->_occlusionState)
    goto LABEL_13;
  v8 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  private_opaqueSize = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16 = v8;
  size = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  v9 = v4->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v11 = v4->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v12 = v9;
  v13 = v4->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v14 = v4->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  if (!SBEqualDisplayItemAttributedSizes((uint64_t)&private_opaqueSize, (uint64_t)&v11))
  {
LABEL_13:
    v7 = 0;
    goto LABEL_15;
  }
  v7 = 0;
  if (self->_unoccludedPeekingCenter.x == v4->_unoccludedPeekingCenter.x
    && self->_unoccludedPeekingCenter.y == v4->_unoccludedPeekingCenter.y)
  {
    v7 = self->_positionIsSystemManaged == v4->_positionIsSystemManaged;
  }
LABEL_15:

  return v7;
}

- (id)description
{
  return -[SBDisplayItemLayoutAttributes descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (CGSize)sizeInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5
{
  CGPoint origin;
  double v6;
  double v7;
  _OWORD v8[3];
  int64_t semanticSizeType;
  CGSize result;

  origin = self->_attributedSize.referenceBounds.origin;
  v8[0] = self->_attributedSize._private_opaqueSize;
  v8[1] = origin;
  v8[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  -[SBDisplayItemLayoutAttributes _sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:](self, "_sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)centerInBounds:(CGRect)a3
{
  double height;
  double width;
  double x;
  double y;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
  {
    x = width * self->_normalizedCenter.x;
    y = height * self->_normalizedCenter.y;
  }
  else
  {
    x = self->_normalizedCenter.x;
    y = self->_normalizedCenter.y;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)userSizeBeforeOverlappingInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5
{
  CGPoint origin;
  double v6;
  double v7;
  _OWORD v8[3];
  int64_t semanticSizeType;
  CGSize result;

  origin = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v8[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v8[1] = origin;
  v8[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  -[SBDisplayItemLayoutAttributes _sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:](self, "_sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)attributesByModifyingAttributedSize:(SBDisplayItemAttributedSize *)a3
{
  BOOL v5;
  id v7;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v16;
  uint64_t v17;
  _OWORD v18[3];
  int64_t v19;
  _OWORD v20[3];
  int64_t semanticSizeType;

  v5 = a3->_private_opaqueSize.width == self->_attributedSize._private_opaqueSize.width
    && a3->_private_opaqueSize.height == self->_attributedSize._private_opaqueSize.height;
  if (v5
    && CGRectEqualToRect(a3->referenceBounds, self->_attributedSize.referenceBounds)
    && a3->semanticSizeType == self->_attributedSize.semanticSizeType)
  {
    return self;
  }
  v7 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = a3->referenceBounds.origin;
  v20[0] = a3->_private_opaqueSize;
  v20[1] = origin;
  v20[2] = a3->referenceBounds.size;
  semanticSizeType = a3->semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v16 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v18[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v18[1] = v16;
  v18[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v19 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v17) = positionIsSystemManaged;
  return (id)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
}

- (id)attributesByModifyingNormalizedCenter:(CGPoint)a3
{
  double y;
  double x;
  id v7;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  CGPoint v14;
  SBDisplayItemLayoutAttributes *v15;
  uint64_t v17;
  _OWORD v18[3];
  int64_t v19;
  _OWORD v20[3];
  int64_t semanticSizeType;

  y = a3.y;
  x = a3.x;
  if (a3.x == self->_normalizedCenter.x && a3.y == self->_normalizedCenter.y)
  {
    v15 = self;
  }
  else
  {
    v7 = objc_alloc((Class)objc_opt_class());
    contentOrientation = self->_contentOrientation;
    lastInteractionTime = self->_lastInteractionTime;
    sizingPolicy = self->_sizingPolicy;
    occlusionState = self->_occlusionState;
    positionIsSystemManaged = self->_positionIsSystemManaged;
    origin = self->_attributedSize.referenceBounds.origin;
    v20[0] = self->_attributedSize._private_opaqueSize;
    v20[1] = origin;
    v20[2] = self->_attributedSize.referenceBounds.size;
    semanticSizeType = self->_attributedSize.semanticSizeType;
    v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v18[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v18[1] = v14;
    v18[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    v19 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v17) = positionIsSystemManaged;
    v15 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
  }
  return v15;
}

- (id)attributesByModifyingOcclusionState:(int64_t)a3
{
  id v6;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v14;
  uint64_t v15;
  _OWORD v16[3];
  int64_t v17;
  _OWORD v18[3];
  int64_t semanticSizeType;

  if (self->_occlusionState == a3)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v18[0] = self->_attributedSize._private_opaqueSize;
  v18[1] = origin;
  v18[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16[1] = v14;
  v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v15) = positionIsSystemManaged;
  return (id)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v18, a3, v16, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
}

- (id)attributesByModifyingAttributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a3
{
  BOOL v5;
  id v7;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double x;
  double y;
  CGPoint v16;
  uint64_t v17;
  _OWORD v18[3];
  int64_t v19;
  _OWORD v20[3];
  int64_t semanticSizeType;

  v5 = a3->_private_opaqueSize.width == self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width
    && a3->_private_opaqueSize.height == self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height;
  if (v5
    && CGRectEqualToRect(a3->referenceBounds, self->_attributedUserSizeBeforeOverlapping.referenceBounds)
    && a3->semanticSizeType == self->_attributedUserSizeBeforeOverlapping.semanticSizeType)
  {
    return self;
  }
  v7 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  positionIsSystemManaged = self->_positionIsSystemManaged;
  origin = self->_attributedSize.referenceBounds.origin;
  v20[0] = self->_attributedSize._private_opaqueSize;
  v20[1] = origin;
  v20[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v16 = a3->referenceBounds.origin;
  v18[0] = a3->_private_opaqueSize;
  v18[1] = v16;
  v18[2] = a3->referenceBounds.size;
  v19 = a3->semanticSizeType;
  LOBYTE(v17) = positionIsSystemManaged;
  return (id)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
}

- (id)attributesByModifyingUnoccludedPeekingCenter:(CGPoint)a3
{
  double y;
  double x;
  id v7;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  BOOL positionIsSystemManaged;
  CGPoint origin;
  double v14;
  CGPoint v15;
  SBDisplayItemLayoutAttributes *v16;
  uint64_t v18;
  _OWORD v19[3];
  int64_t v20;
  _OWORD v21[3];
  int64_t semanticSizeType;

  y = a3.y;
  x = a3.x;
  if (a3.x == self->_unoccludedPeekingCenter.x && a3.y == self->_unoccludedPeekingCenter.y)
  {
    v16 = self;
  }
  else
  {
    v7 = objc_alloc((Class)objc_opt_class());
    contentOrientation = self->_contentOrientation;
    lastInteractionTime = self->_lastInteractionTime;
    sizingPolicy = self->_sizingPolicy;
    occlusionState = self->_occlusionState;
    positionIsSystemManaged = self->_positionIsSystemManaged;
    origin = self->_attributedSize.referenceBounds.origin;
    v21[0] = self->_attributedSize._private_opaqueSize;
    v21[1] = origin;
    v21[2] = self->_attributedSize.referenceBounds.size;
    semanticSizeType = self->_attributedSize.semanticSizeType;
    v14 = self->_normalizedCenter.x;
    origin.x = self->_normalizedCenter.y;
    v15 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v19[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v19[1] = v15;
    v19[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    v20 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v18) = positionIsSystemManaged;
    v16 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v21, occlusionState, v19, v14, origin.x, x, y, v18);
  }
  return v16;
}

- (id)attributesByModifyingPositionIsSystemManaged:(BOOL)a3
{
  id v6;
  int64_t contentOrientation;
  int64_t lastInteractionTime;
  int64_t sizingPolicy;
  int64_t occlusionState;
  CGPoint origin;
  double x;
  double y;
  CGPoint v14;
  uint64_t v15;
  _OWORD v16[3];
  int64_t v17;
  _OWORD v18[3];
  int64_t semanticSizeType;

  if (self->_positionIsSystemManaged == a3)
    return self;
  v6 = objc_alloc((Class)objc_opt_class());
  contentOrientation = self->_contentOrientation;
  lastInteractionTime = self->_lastInteractionTime;
  sizingPolicy = self->_sizingPolicy;
  occlusionState = self->_occlusionState;
  origin = self->_attributedSize.referenceBounds.origin;
  v18[0] = self->_attributedSize._private_opaqueSize;
  v18[1] = origin;
  v18[2] = self->_attributedSize.referenceBounds.size;
  semanticSizeType = self->_attributedSize.semanticSizeType;
  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v16[1] = v14;
  v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v15) = a3;
  return (id)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v18, occlusionState, v16, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
}

- (SBDisplayItemLayoutAttributes)initWithPlistRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SBDisplayItemLayoutAttributes *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CGFloat width;
  CGFloat height;
  uint64_t v19;
  void *v20;
  const __CFDictionary *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  const __CFDictionary *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFDictionary *v34;
  CGFloat v35;
  _BOOL4 v36;
  CGFloat v37;
  uint64_t v38;
  void *v39;
  const __CFDictionary *v40;
  CGFloat v41;
  CGFloat v42;
  uint64_t v43;
  void *v44;
  const __CFDictionary *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t v59;
  const __CFDictionary *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  SBDisplayItemLayoutAttributes *v67;
  double v68;
  double v69;
  double y;
  double x;
  _QWORD v72[7];
  _QWORD v73[7];
  CGRect v74;
  CGSize v75;
  CGPoint point;
  CGRect rect;
  CGSize size;
  CGRect v79;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v67 = self;
    v7 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("contentOrientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v9;
    if (v9)
      v64 = objc_msgSend(v9, "integerValue");
    else
      v64 = 0;
    v11 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("lastInteractionTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v13;
    if (v13)
      v62 = objc_msgSend(v13, "integerValue");
    else
      v62 = 0;
    v14 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("sizingPolicy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v16;
    if (v16)
      v61 = objc_msgSend(v16, "integerValue");
    else
      v61 = 0;
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v19 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("size"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v19, v20);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    size.width = 0.0;
    size.height = 0.0;
    if (v21 && CGSizeMakeWithDictionaryRepresentation(v21, &size))
    {
      width = size.width;
      height = size.height;
    }
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v26 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("referenceBounds"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v26, v27);
    v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    memset(&rect, 0, sizeof(rect));
    y = v23;
    x = v22;
    v68 = v25;
    v69 = v24;
    if (v28)
    {
      y = v23;
      x = v22;
      v68 = v25;
      v69 = v24;
      if (CGRectMakeWithDictionaryRepresentation(v28, &rect))
      {
        y = rect.origin.y;
        x = rect.origin.x;
        v68 = rect.size.height;
        v69 = rect.size.width;
      }
    }
    v60 = v28;
    v29 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("semanticSizeType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      v59 = objc_msgSend(v31, "integerValue");
    else
      v59 = 0;
    v32 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("center"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v32, v33);
    v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    point.x = 0.0;
    point.y = 0.0;
    v35 = 0.0;
    if (v34)
    {
      v36 = CGPointMakeWithDictionaryRepresentation(v34, &point);
      v37 = 0.0;
      if (v36)
      {
        v35 = point.x;
        v37 = point.y;
      }
    }
    else
    {
      v37 = 0.0;
    }
    v57 = v37;
    v58 = v35;
    v38 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("userConfiguredSizeBeforeOverlapping"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v38, v39);
    v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v75.width = 0.0;
    v75.height = 0.0;
    v41 = width;
    v42 = height;
    if (v21 && CGSizeMakeWithDictionaryRepresentation(v40, &v75))
    {
      width = v75.width;
      height = v75.height;
    }
    v43 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("referenceBoundsBeforeOverlapping"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v43, v44);
    v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    memset(&v74, 0, sizeof(v74));
    if (v45 && CGRectMakeWithDictionaryRepresentation(v45, &v74))
    {
      v22 = v74.origin.x;
      v23 = v74.origin.y;
      v24 = v74.size.width;
      v25 = v74.size.height;
    }
    v79.origin.x = v22;
    v79.origin.y = v23;
    v79.size.width = v24;
    v79.size.height = v25;
    if (CGRectIsEmpty(v79))
    {
      v22 = x;
      v23 = y;
      v24 = v69;
      v25 = v68;
    }
    v46 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("semanticSizeTypeBeforeOverlapping"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      v49 = objc_msgSend(v48, "integerValue");
    else
      v49 = 0;
    v50 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("positionIsSystemManaged"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = *MEMORY[0x1E0C9D538];
    v54 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    *(CGFloat *)v73 = v41;
    *(CGFloat *)&v73[1] = v42;
    *(double *)&v73[2] = x;
    *(double *)&v73[3] = y;
    *(double *)&v73[4] = v69;
    *(double *)&v73[5] = v68;
    v73[6] = v59;
    *(CGFloat *)v72 = width;
    *(CGFloat *)&v72[1] = height;
    *(double *)&v72[2] = v22;
    *(double *)&v72[3] = v23;
    *(double *)&v72[4] = v24;
    *(double *)&v72[5] = v25;
    v72[6] = v49;
    LOBYTE(v56) = 0;
    self = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v67, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v64, v62, v61, v73, 0, v72, v58, v57, v53, v54, v56);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)plistRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  void *v11;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("contentOrientation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastInteractionTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lastInteractionTime"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sizingPolicy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sizingPolicy"));
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_attributedSize._private_opaqueSize);
  if (DictionaryRepresentation)
  {
    v8 = DictionaryRepresentation;
    objc_msgSend(v3, "setObject:forKey:", DictionaryRepresentation, CFSTR("size"));
    CFRelease(v8);
  }
  v9 = CGRectCreateDictionaryRepresentation(self->_attributedSize.referenceBounds);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("referenceBounds"));
    CFRelease(v10);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attributedSize.semanticSizeType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("semanticSizeType"));
  v12 = CGPointCreateDictionaryRepresentation(self->_normalizedCenter);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("center"));
    CFRelease(v13);
  }
  v14 = CGSizeCreateDictionaryRepresentation(self->_attributedUserSizeBeforeOverlapping._private_opaqueSize);
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("userConfiguredSizeBeforeOverlapping"));
    CFRelease(v15);
  }
  v16 = CGRectCreateDictionaryRepresentation(self->_attributedUserSizeBeforeOverlapping.referenceBounds);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("referenceBoundsBeforeOverlapping"));
    CFRelease(v17);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attributedUserSizeBeforeOverlapping.semanticSizeType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("semanticSizeTypeBeforeOverlapping"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_positionIsSystemManaged);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("positionIsSystemManaged"));

  return v3;
}

+ (SBDisplayItemLayoutAttributes)layoutAttributesWithProtobufRepresentation:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _BOOL4 IsEmpty;
  double v13;
  double v14;
  SBDisplayItemLayoutAttributes *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  BOOL IsSystem;
  uint64_t v23;
  double v24;
  double v25;
  _QWORD v26[7];
  _QWORD v27[7];
  CGRect v28;

  if (!a3)
    return (SBDisplayItemLayoutAttributes *)0;
  v3 = a3;
  v25 = -[SBPBDisplayItemLayoutAttributes sizeWidth]((uint64_t)v3);
  v24 = -[SBPBDisplayItemLayoutAttributes sizeHeight]((uint64_t)v3);
  v4 = -[SBPBDisplayItemLayoutAttributes referenceBoundsWidthForSize]((uint64_t)v3);
  v5 = -[SBPBDisplayItemLayoutAttributes referenceBoundsHeightForSize]((uint64_t)v3);
  v6 = (int)-[SBPBDisplayItemLayoutAttributes semanticSizeTypeForSize]((uint64_t)v3);
  v7 = -[SBPBDisplayItemLayoutAttributes userSizeBeforeOverlappingInBoundsWidth]((uint64_t)v3);
  v8 = -[SBPBDisplayItemLayoutAttributes userSizeBeforeOverlappingInBoundsHeight]((uint64_t)v3);
  v9 = -[SBPBDisplayItemLayoutAttributes referenceBoundsWidthBeforeOverlapping]((uint64_t)v3);
  v10 = -[SBPBDisplayItemLayoutAttributes referenceBoundsHeightBeforeOverlapping]((uint64_t)v3);
  v11 = (int)-[SBPBDisplayItemLayoutAttributes semanticSizeTypeBeforeOverlapping]((uint64_t)v3);
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v9;
  v28.size.height = v10;
  IsEmpty = CGRectIsEmpty(v28);
  if (IsEmpty)
    v13 = v4;
  else
    v13 = v9;
  if (IsEmpty)
    v14 = v5;
  else
    v14 = v10;
  v15 = [SBDisplayItemLayoutAttributes alloc];
  v16 = -[SBPBDisplayItemLayoutAttributes contentOrientation]((uint64_t)v3);
  v17 = -[SBPBDisplayItemLayoutAttributes lastInteractionTime]((uint64_t)v3);
  v18 = -[SBPBDisplayItemLayoutAttributes sizingPolicy]((uint64_t)v3);
  v19 = -[SBPBDisplayItemLayoutAttributes centerX]((uint64_t)v3);
  v20 = -[SBPBDisplayItemLayoutAttributes centerY]((uint64_t)v3);
  IsSystem = -[SBPBDisplayItemLayoutAttributes positionIsSystemManaged]((_BOOL8)v3);

  *(double *)v27 = v25;
  *(double *)&v27[1] = v24;
  v27[2] = 0;
  v27[3] = 0;
  *(double *)&v27[4] = v4;
  *(double *)&v27[5] = v5;
  v27[6] = v6;
  *(double *)v26 = v7;
  *(double *)&v26[1] = v8;
  v26[2] = 0;
  v26[3] = 0;
  *(double *)&v26[4] = v13;
  *(double *)&v26[5] = v14;
  v26[6] = v11;
  LOBYTE(v23) = IsSystem;
  return -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v15, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v16, v17, v18, v27, 0, v26, v19, v20, 0.0, 0.0, v23);
}

- (id)protobufRepresentation
{
  SBPBDisplayItemLayoutAttributes *v3;

  v3 = objc_alloc_init(SBPBDisplayItemLayoutAttributes);
  -[SBPBDisplayItemLayoutAttributes setContentOrientation:]((uint64_t)v3, self->_contentOrientation);
  -[SBPBDisplayItemLayoutAttributes setLastInteractionTime:]((uint64_t)v3, self->_lastInteractionTime);
  -[SBPBDisplayItemLayoutAttributes setSizingPolicy:]((uint64_t)v3, self->_sizingPolicy);
  -[SBPBDisplayItemLayoutAttributes setSizeWidth:]((uint64_t)v3, self->_attributedSize._private_opaqueSize.width);
  -[SBPBDisplayItemLayoutAttributes setSizeHeight:]((uint64_t)v3, self->_attributedSize._private_opaqueSize.height);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsWidthForSize:]((uint64_t)v3, self->_attributedSize.referenceBounds.size.width);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsHeightForSize:]((uint64_t)v3, self->_attributedSize.referenceBounds.size.height);
  -[SBPBDisplayItemLayoutAttributes setSemanticSizeTypeForSize:]((uint64_t)v3, self->_attributedSize.semanticSizeType);
  -[SBPBDisplayItemLayoutAttributes setCenterX:]((uint64_t)v3, self->_normalizedCenter.x);
  -[SBPBDisplayItemLayoutAttributes setCenterY:]((uint64_t)v3, self->_normalizedCenter.y);
  -[SBPBDisplayItemLayoutAttributes setUserSizeBeforeOverlappingInBoundsWidth:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width);
  -[SBPBDisplayItemLayoutAttributes setUserSizeBeforeOverlappingInBoundsHeight:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsWidthBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.referenceBounds.size.width);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsHeightBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.referenceBounds.size.height);
  -[SBPBDisplayItemLayoutAttributes setSemanticSizeTypeBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.semanticSizeType);
  -[SBPBDisplayItemLayoutAttributes setPositionIsSystemManaged:]((uint64_t)v3, self->_positionIsSystemManaged);
  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDisplayItemLayoutAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)_sizeForAttributedSize:(SBDisplayItemAttributedSize *)a3 inBounds:(CGRect)a4 defaultSize:(CGSize)a5 screenEdgePadding:(double)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v8 = a4.size.height;
  v9 = a4.size.width;
  v11 = a4.size.height;
  v12 = a4.size.width;
  if (!CGRectIsEmpty(a3->referenceBounds))
  {
    v12 = a3->referenceBounds.size.width;
    v11 = a3->referenceBounds.size.height;
  }
  if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
  {
    v13 = v12 * a3->_private_opaqueSize.width;
    v14 = v11 * a3->_private_opaqueSize.height;
  }
  else
  {
    v13 = a3->_private_opaqueSize.width;
    v14 = a3->_private_opaqueSize.height;
  }
  if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
  {
    switch(a3->semanticSizeType)
    {
      case 1:
        width = v9;
        goto LABEL_27;
      case 2:
        width = v13;
        goto LABEL_21;
      case 3:
        width = v9;
LABEL_21:
        v14 = v8;
        goto LABEL_27;
      case 4:
        goto LABEL_27;
      case 5:
        width = v13;
        goto LABEL_23;
      case 6:
LABEL_23:
        v14 = height;
        break;
      case 7:
        width = v9 + a6 * -2.0;
        break;
      case 8:
        v14 = v8 + a6 * -2.0;
        goto LABEL_26;
      case 9:
        width = v9 - a6 * 2.0;
        v14 = v8 - a6 * 2.0;
        break;
      default:
        goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!BSFloatLessThanFloat()
    || !BSFloatGreaterThanFloat()
    || !BSFloatGreaterThanFloat())
  {
LABEL_26:
    width = v13;
LABEL_27:
    v15 = fmax(width, 0.0);
    if (v9 <= v15)
      v15 = v9;
    v16 = fmax(v14, 0.0);
    if (v8 <= v16)
      v16 = v8;
    goto LABEL_33;
  }
  v15 = fmax(v13, 0.0);
  if (width <= v15)
    v15 = width;
  v16 = fmax(v14, 0.0);
  if (height <= v16)
    v16 = height;
LABEL_33:
  result.height = v16;
  result.width = v15;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (CGPoint)normalizedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)occlusionState
{
  return self->_occlusionState;
}

- (SBDisplayItemAttributedSize)attributedUserSizeBeforeOverlapping
{
  CGPoint v3;

  v3 = *(CGPoint *)&self[2].semanticSizeType;
  retstr->_private_opaqueSize = self[2].referenceBounds.size;
  retstr->referenceBounds.origin = v3;
  retstr->referenceBounds.size = *(CGSize *)&self[3]._private_opaqueSize.height;
  retstr->semanticSizeType = *(_QWORD *)&self[3].referenceBounds.origin.y;
  return self;
}

- (CGPoint)unoccludedPeekingCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_unoccludedPeekingCenter.x;
  y = self->_unoccludedPeekingCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isPositionSystemManaged
{
  return self->_positionIsSystemManaged;
}

@end
