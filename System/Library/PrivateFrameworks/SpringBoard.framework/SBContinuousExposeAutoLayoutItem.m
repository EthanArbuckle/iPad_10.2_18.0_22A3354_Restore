@implementation SBContinuousExposeAutoLayoutItem

- (SBContinuousExposeAutoLayoutItem)initWithDisplayItem:(id)a3
{
  id v6;
  char *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeAutoLayoutItem;
  v7 = -[SBContinuousExposeAutoLayoutItem init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBContinuousExposeAutoLayoutItem.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

    }
    objc_storeStrong((id *)v7 + 2, a3);
    *(_OWORD *)(v7 + 56) = SBInvalidPoint;
  }

  return (SBContinuousExposeAutoLayoutItem *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBContinuousExposeAutoLayoutItem _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBContinuousExposeAutoLayoutItem _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = [a3 alloc];
  v5 = (void *)-[SBDisplayItem copy](self->_displayItem, "copy");
  v6 = objc_msgSend(v4, "initWithDisplayItem:", v5);

  *(CGSize *)(v6 + 24) = self->_size;
  *(CGPoint *)(v6 + 40) = self->_position;
  *(CGPoint *)(v6 + 56) = self->_unoccludedPeekingPosition;
  *(CGPoint *)(v6 + 72) = self->_anchorPosition;
  *(CGPoint *)(v6 + 88) = self->_compactedPosition;
  *(_BYTE *)(v6 + 8) = self->_inDefaultPosition;
  *(_BYTE *)(v6 + 9) = self->_overlapped;
  *(_BYTE *)(v6 + 10) = self->_fullyOccluded;
  *(_BYTE *)(v6 + 11) = self->_partiallyCoveredByPeekingItem;
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  SBContinuousExposeAutoLayoutItem *v4;
  uint64_t v5;
  SBContinuousExposeAutoLayoutItem *v6;
  SBContinuousExposeAutoLayoutItem *v7;
  BOOL v8;
  SBContinuousExposeAutoLayoutItem *v9;
  objc_super v11;

  v4 = (SBContinuousExposeAutoLayoutItem *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeAutoLayoutItem;
    if (-[SBContinuousExposeAutoLayoutItem isEqual:](&v11, sel_isEqual_, v4))
    {
      v5 = objc_opt_class();
      v6 = v4;
      if (v5)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v9 = v7;

      if (!v9 || !-[SBDisplayItem isEqual:](self->_displayItem, "isEqual:", v9->_displayItem))
        goto LABEL_26;
      v8 = 0;
      if (self->_size.width != v9->_size.width)
        goto LABEL_27;
      if (self->_size.height != v9->_size.height)
        goto LABEL_27;
      v8 = 0;
      if (self->_position.x != v9->_position.x)
        goto LABEL_27;
      if (self->_position.y != v9->_position.y)
        goto LABEL_27;
      v8 = 0;
      if (self->_unoccludedPeekingPosition.x != v9->_unoccludedPeekingPosition.x)
        goto LABEL_27;
      if (self->_unoccludedPeekingPosition.y != v9->_unoccludedPeekingPosition.y)
        goto LABEL_27;
      v8 = 0;
      if (self->_anchorPosition.x != v9->_anchorPosition.x)
        goto LABEL_27;
      if (self->_anchorPosition.y != v9->_anchorPosition.y)
        goto LABEL_27;
      v8 = 0;
      if (self->_compactedPosition.x != v9->_compactedPosition.x
        || self->_compactedPosition.y != v9->_compactedPosition.y)
      {
        goto LABEL_27;
      }
      if (self->_inDefaultPosition == v9->_inDefaultPosition
        && self->_overlapped == v9->_overlapped
        && self->_fullyOccluded == v9->_fullyOccluded)
      {
        v8 = self->_partiallyCoveredByPeekingItem == v9->_partiallyCoveredByPeekingItem;
      }
      else
      {
LABEL_26:
        v8 = 0;
      }
LABEL_27:

      goto LABEL_28;
    }
    v8 = 0;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  v5 = (id)objc_msgSend(v3, "appendCGPoint:", self->_position.x, self->_position.y);
  v6 = (id)objc_msgSend(v3, "appendCGPoint:", self->_unoccludedPeekingPosition.x, self->_unoccludedPeekingPosition.y);
  v7 = (id)objc_msgSend(v3, "appendCGPoint:", self->_anchorPosition.x, self->_anchorPosition.y);
  v8 = (id)objc_msgSend(v3, "appendCGPoint:", self->_compactedPosition.x, self->_compactedPosition.y);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_inDefaultPosition);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_overlapped);
  v11 = (id)objc_msgSend(v3, "appendBool:", self->_fullyOccluded);
  v12 = (id)objc_msgSend(v3, "appendBool:", self->_partiallyCoveredByPeekingItem);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (id)description
{
  return -[SBContinuousExposeAutoLayoutItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBContinuousExposeAutoLayoutItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBContinuousExposeAutoLayoutItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBContinuousExposeAutoLayoutItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_displayItem, CFSTR("displayItem"));
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("size"), self->_size.width, self->_size.height);
  v7 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("position"), self->_position.x, self->_position.y);
  return v4;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGPoint)unoccludedPeekingPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_unoccludedPeekingPosition.x;
  y = self->_unoccludedPeekingPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnoccludedPeekingPosition:(CGPoint)a3
{
  self->_unoccludedPeekingPosition = a3;
}

- (CGPoint)anchorPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPosition.x;
  y = self->_anchorPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPosition:(CGPoint)a3
{
  self->_anchorPosition = a3;
}

- (CGPoint)compactedPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_compactedPosition.x;
  y = self->_compactedPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCompactedPosition:(CGPoint)a3
{
  self->_compactedPosition = a3;
}

- (BOOL)isInDefaultPosition
{
  return self->_inDefaultPosition;
}

- (void)setInDefaultPosition:(BOOL)a3
{
  self->_inDefaultPosition = a3;
}

- (BOOL)isOverlapped
{
  return self->_overlapped;
}

- (void)setOverlapped:(BOOL)a3
{
  self->_overlapped = a3;
}

- (BOOL)isFullyOccluded
{
  return self->_fullyOccluded;
}

- (void)setFullyOccluded:(BOOL)a3
{
  self->_fullyOccluded = a3;
}

- (BOOL)isPartiallyCoveredByPeekingItem
{
  return self->_partiallyCoveredByPeekingItem;
}

- (void)setPartiallyCoveredByPeekingItem:(BOOL)a3
{
  self->_partiallyCoveredByPeekingItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
