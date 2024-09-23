@implementation _UIButtonBarLayoutMetrics

- (NSLayoutDimension)minimumSpaceGuide
{
  return self->_minimumSpaceGuide;
}

- (NSLayoutDimension)flexibleSpaceGuide
{
  return self->_flexibleSpaceGuide;
}

- (BOOL)allowsViewWrappers
{
  return self->_allowsViewWrappers;
}

- (NSLayoutDimension)verticalSizeGuide
{
  return self->_verticalSizeGuide;
}

- (id)_upcastIfReadOnly
{
  void *v5;

  if (!self->_locked)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarLayout.m"), 48, CFSTR("Attempt to upcast a locked metrics object"));

  }
  return self;
}

- (id)_copyWithModifications:(id)a3
{
  void (**v4)(id, _UIButtonBarLayoutMetrics *);
  _UIButtonBarLayoutMetrics *v5;

  v4 = (void (**)(id, _UIButtonBarLayoutMetrics *))a3;
  if (v4 || !self->_locked)
  {
    v5 = objc_alloc_init(_UIButtonBarLayoutMetrics);
    -[_UIButtonBarLayoutMetrics setVerticalSizeGuide:](v5, "setVerticalSizeGuide:", self->_verticalSizeGuide);
    -[_UIButtonBarLayoutMetrics setMinimumSpaceGuide:](v5, "setMinimumSpaceGuide:", self->_minimumSpaceGuide);
    -[_UIButtonBarLayoutMetrics setFlexibleSpaceGuide:](v5, "setFlexibleSpaceGuide:", self->_flexibleSpaceGuide);
    -[_UIButtonBarLayoutMetrics setGroupSizeGuide:](v5, "setGroupSizeGuide:", self->_groupSizeGuide);
    -[_UIButtonBarLayoutMetrics setAllowsViewWrappers:](v5, "setAllowsViewWrappers:", self->_allowsViewWrappers);
    if (v4)
      v4[2](v4, v5);
    v5->_locked = 1;
  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIButtonBarLayoutMetrics _copyWithModifications:](self, "_copyWithModifications:", 0);
}

- (void)setAllowsViewWrappers:(BOOL)a3
{
  self->_allowsViewWrappers = a3;
}

- (void)setVerticalSizeGuide:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSizeGuide, a3);
}

- (void)setMinimumSpaceGuide:(id)a3
{
  objc_storeStrong((id *)&self->_minimumSpaceGuide, a3);
}

- (void)setFlexibleSpaceGuide:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleSpaceGuide, a3);
}

- (void)setGroupSizeGuide:(id)a3
{
  objc_storeStrong((id *)&self->_groupSizeGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSizeGuide, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceGuide, 0);
  objc_storeStrong((id *)&self->_minimumSpaceGuide, 0);
  objc_storeStrong((id *)&self->_verticalSizeGuide, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarLayoutMetrics;
  -[_UIButtonBarLayoutMetrics description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" verticalSizeGuide=%p minimumSpaceGuide=%p flexibleSpaceGuide=%p"), self->_verticalSizeGuide, self->_minimumSpaceGuide, self->_flexibleSpaceGuide);
  if (self->_groupSizeGuide)
    objc_msgSend(v4, "appendFormat:", CFSTR(" groupSizeGuide=%p"), self->_groupSizeGuide);
  if (self->_allowsViewWrappers)
    objc_msgSend(v4, "appendString:", CFSTR(" allowsViewWrappers"));
  return (NSString *)v4;
}

- (NSLayoutDimension)groupSizeGuide
{
  return self->_groupSizeGuide;
}

@end
