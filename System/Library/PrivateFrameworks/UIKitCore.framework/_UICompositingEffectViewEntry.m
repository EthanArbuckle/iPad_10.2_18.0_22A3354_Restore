@implementation _UICompositingEffectViewEntry

- (void)addEffectToView:(id)a3
{
  NSString *filterType;
  id v4;

  filterType = self->_filterType;
  objc_msgSend(a3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", filterType);

}

- (void)removeEffectFromView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id v4;
  NSString *filterType;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICompositingEffectViewEntry;
  if (-[_UIVisualEffectViewEntry isSameTypeOfEffect:](&v9, sel_isSameTypeOfEffect_, v4))
  {
    filterType = self->_filterType;
    objc_msgSend(v4, "filterType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](filterType, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICompositingEffectViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" compositingMode=%@"), self->_filterType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end
