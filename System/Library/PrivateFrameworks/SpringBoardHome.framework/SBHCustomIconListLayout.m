@implementation SBHCustomIconListLayout

- (SBHCustomIconListLayout)initWithBaseListLayout:(id)a3
{
  id v5;
  SBHCustomIconListLayout *v6;
  SBHCustomIconListLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconListLayout;
  v6 = -[SBHCustomIconListLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseListLayout, a3);

  return v7;
}

- (SBHCustomIconListLayout)init
{
  return -[SBHCustomIconListLayout initWithBaseListLayout:](self, "initWithBaseListLayout:", 0);
}

- (void)setListLayout:(id)a3 forSelector:(SEL)a4
{
  NSMapTable *overriddenSelectors;
  NSMapTable *v7;
  NSMapTable *v8;
  id v9;

  v9 = a3;
  overriddenSelectors = self->_overriddenSelectors;
  if (!overriddenSelectors)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 770, 0, 0);
    v8 = self->_overriddenSelectors;
    self->_overriddenSelectors = v7;

    overriddenSelectors = self->_overriddenSelectors;
  }
  -[NSMapTable setObject:forKey:](overriddenSelectors, "setObject:forKey:", v9, sel_getName(a4));

}

- (void)removeListLayoutForSelector:(SEL)a3
{
  -[NSMapTable removeObjectForKey:](self->_overriddenSelectors, "removeObjectForKey:", sel_getName(a3));
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  -[NSMapTable objectForKey:](self->_overriddenSelectors, "objectForKey:", sel_getName(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHCustomIconListLayout baseListLayout](self, "baseListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBHCustomIconListLayout;
    -[SBHCustomIconListLayout forwardingTargetForSelector:](&v10, sel_forwardingTargetForSelector_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconListLayout;
  if (-[SBHCustomIconListLayout respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_overriddenSelectors, "objectForKey:", sel_getName(a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = objc_opt_respondsToSelector();
    }
    else
    {
      -[SBHCustomIconListLayout baseListLayout](self, "baseListLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

    }
  }
  return v5 & 1;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  void *v6;
  double v7;
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
  UIEdgeInsets result;

  -[NSMapTable objectForKey:](self->_overriddenSelectors, "objectForKey:", sel_getName(a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SBHCustomIconListLayout baseListLayout](self, "baseListLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, a2, a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  void *v6;
  id v7;

  -[NSMapTable objectForKey:](self->_overriddenSelectors, "objectForKey:", sel_getName(a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SBHCustomIconListLayout baseListLayout](self, "baseListLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, a2, a3);

  return (unint64_t)v7;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  void *v6;
  id v7;

  -[NSMapTable objectForKey:](self->_overriddenSelectors, "objectForKey:", sel_getName(a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SBHCustomIconListLayout baseListLayout](self, "baseListLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, a2, a3);

  return (unint64_t)v7;
}

- (SBIconListLayout)baseListLayout
{
  return self->_baseListLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseListLayout, 0);
  objc_storeStrong((id *)&self->_overriddenSelectors, 0);
}

@end
