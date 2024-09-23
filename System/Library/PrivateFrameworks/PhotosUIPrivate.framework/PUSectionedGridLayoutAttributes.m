@implementation PUSectionedGridLayoutAttributes

- (PUSectionedGridLayoutAttributes)init
{
  PUSectionedGridLayoutAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v3, sel_init);
  result->_interactiveTransitionProgress = -1.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFloating:", self->_floating);
  objc_msgSend(v4, "setInteractiveTransitionProgress:", self->_interactiveTransitionProgress);
  objc_msgSend(v4, "setExists:", self->_exists);
  objc_msgSend(v4, "setExtendsTopContent:", self->_extendsTopContent);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int floating;
  double interactiveTransitionProgress;
  double v7;
  int exists;
  int extendsTopContent;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUSectionedGridLayoutAttributes;
  if (!-[UICollectionViewLayoutAttributes isEqual:](&v12, sel_isEqual_, v4))
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 1;
    goto LABEL_9;
  }
  floating = self->_floating;
  if (floating == objc_msgSend(v4, "floating")
    && (interactiveTransitionProgress = self->_interactiveTransitionProgress,
        objc_msgSend(v4, "interactiveTransitionProgress"),
        interactiveTransitionProgress == v7)
    && (exists = self->_exists, exists == objc_msgSend(v4, "exists")))
  {
    extendsTopContent = self->_extendsTopContent;
    v10 = extendsTopContent == objc_msgSend(v4, "extendsTopContent");
  }
  else
  {
LABEL_7:
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutAttributes;
  -[UICollectionViewLayoutAttributes description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("Y");
  if (self->_floating)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (!self->_extendsTopContent)
    v5 = CFSTR("N");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("floating = %@; interactiveTransitionProgress = %0.2f; extendsTopContent = %@"),
    v6,
    *(_QWORD *)&self->_interactiveTransitionProgress,
    v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)floating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (double)interactiveTransitionProgress
{
  return self->_interactiveTransitionProgress;
}

- (void)setInteractiveTransitionProgress:(double)a3
{
  self->_interactiveTransitionProgress = a3;
}

- (BOOL)extendsTopContent
{
  return self->_extendsTopContent;
}

- (void)setExtendsTopContent:(BOOL)a3
{
  self->_extendsTopContent = a3;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

@end
