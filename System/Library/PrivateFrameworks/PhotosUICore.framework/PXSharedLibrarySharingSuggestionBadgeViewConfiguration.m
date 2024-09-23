@implementation PXSharedLibrarySharingSuggestionBadgeViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  self->_isFrozen = 1;
  return self;
}

- (void)setSideMargin:(double)a3
{
  void *v6;

  if (self->_isFrozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionBadgeView.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isFrozen"));

  }
  self->_sideMargin = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSharedLibrarySharingSuggestionBadgeViewConfiguration sideMargin](self, "sideMargin");
    v7 = v6;
    objc_msgSend(v5, "sideMargin");
    v9 = v8;

    v10 = v7 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)sideMargin
{
  return self->_sideMargin;
}

@end
