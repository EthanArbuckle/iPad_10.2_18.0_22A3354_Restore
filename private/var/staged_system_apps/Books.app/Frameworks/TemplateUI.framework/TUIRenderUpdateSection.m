@implementation TUIRenderUpdateSection

- (TUIRenderUpdateSection)initWithFrom:(id)a3 to:(id)a4
{
  id v7;
  id v8;
  TUIRenderUpdateSection *v9;
  TUIRenderUpdateSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIRenderUpdateSection;
  v9 = -[TUIRenderUpdateSection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_from, a3);
    objc_storeStrong((id *)&v10->_to, a4);
    -[TUIRenderUpdateSection _computeViewUpdate](v10, "_computeViewUpdate");
  }

  return v10;
}

- (void)_computeViewUpdate
{
  char *location;
  NSUInteger v4;
  NSUInteger length;
  char *v6;
  NSUInteger v7;
  NSRange v8;
  BOOL v10;
  NSRange v11;
  TUIRenderModelSection *from;
  int v13;
  TUIRenderModelSection *to;
  int v15;
  TUIRenderModelSection *v16;
  TUIRenderModelSection *v17;
  double v18;
  _BOOL4 v19;
  TUIRenderModelSection *v20;
  double v21;
  NSMutableIndexSet *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  BOOL v27;
  NSIndexSet *v28;
  NSIndexSet *viewUpdates;
  double v30;
  double v31;
  char v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  NSRange v35;

  location = (char *)-[TUIRenderModelSection viewRange](self->_from, "viewRange");
  length = v4;
  v6 = (char *)-[TUIRenderModelSection viewRange](self->_to, "viewRange");
  v8.location = (NSUInteger)v6;
  v8.length = v7;
  if (location == (char *)0x7FFFFFFFFFFFFFFFLL || v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (location == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      location = v6;
      length = v7;
      v10 = v6 == (char *)0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v10 = 0;
    }
    if (v10)
      goto LABEL_49;
  }
  else
  {
    v35.location = (NSUInteger)location;
    v35.length = length;
    v11 = NSUnionRange(v35, v8);
    location = (char *)v11.location;
    length = v11.length;
  }
  if (location != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    from = self->_from;
    if (from)
    {
      -[TUIRenderModelSection config](from, "config", v8.location, v8.length);
      v13 = v34;
    }
    else
    {
      v13 = 0;
    }
    to = self->_to;
    if (to)
    {
      -[TUIRenderModelSection config](to, "config");
      v15 = v33;
    }
    else
    {
      v15 = 0;
    }
    if (v13 == v15)
    {
      v16 = self->_from;
      if (v16)
      {
        -[TUIRenderModelSection config](v16, "config");
        if (v32)
        {
          v17 = self->_from;
          if (v17)
          {
            -[TUIRenderModelSection config](v17, "config");
            v18 = v31;
          }
          else
          {
            v18 = 0.0;
          }
          v20 = self->_to;
          if (v20)
          {
            -[TUIRenderModelSection config](v20, "config");
            v21 = v30;
          }
          else
          {
            v21 = 0.0;
          }
          v19 = v18 == v21;
        }
        else
        {
          v19 = 1;
        }
      }
      else
      {
        v19 = 1;
      }
    }
    else
    {
      v19 = 0;
    }
    if (location >= &location[length])
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      do
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](self->_from, "viewModelWithIndex:", location));
        v24 = objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection viewModelWithIndex:](self->_to, "viewModelWithIndex:", location));
        v25 = (void *)v24;
        if (v23)
          v26 = v19;
        else
          v26 = 0;
        v27 = !v26 || v24 == 0;
        if (v27 || (objc_msgSend(v23, "isEqualToRenderModel:", v24) & 1) == 0)
        {
          if (!v22)
            v22 = objc_opt_new(NSMutableIndexSet);
          -[NSMutableIndexSet addIndex:](v22, "addIndex:", location);
        }

        ++location;
        --length;
      }
      while (length);
    }
    v28 = (NSIndexSet *)-[NSMutableIndexSet copy](v22, "copy");
    viewUpdates = self->_viewUpdates;
    self->_viewUpdates = v28;

  }
LABEL_49:
  self->_hasInvalidationsToApply = -[NSIndexSet count](self->_viewUpdates, "count", v8.location, v8.length) != 0;
}

- (void)debugViewIdentifiersWithPackage:(id)a3
{
  id v4;
  NSIndexSet *viewUpdates;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  viewUpdates = self->_viewUpdates;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_158470;
  v7[3] = &unk_23F418;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSIndexSet enumerateIndexesUsingBlock:](viewUpdates, "enumerateIndexesUsingBlock:", v7);

}

- (void)applyToContext:(id)a3
{
  unint64_t v4;
  NSMutableArray *v5;
  NSIndexSet *viewUpdates;
  NSMutableArray *v7;
  id v8;
  _QWORD v9[4];
  NSMutableArray *v10;
  unint64_t v11;

  v8 = a3;
  if (-[NSIndexSet count](self->_viewUpdates, "count"))
  {
    v4 = -[TUIRenderModelSection section](self->_to, "section");
    v5 = objc_opt_new(NSMutableArray);
    viewUpdates = self->_viewUpdates;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1586A8;
    v9[3] = &unk_242E60;
    v10 = v5;
    v11 = v4;
    v7 = v5;
    -[NSIndexSet enumerateIndexesUsingBlock:](viewUpdates, "enumerateIndexesUsingBlock:", v9);
    objc_msgSend(v8, "invalidateIndexPaths:", v7);

  }
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  id v8;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v6, self);

  objc_msgSend(v7, "appendFormat:", CFSTR(" from=%@"), self->_from);
  objc_msgSend(v7, "appendFormat:", CFSTR(" to=%@"), self->_to);
  objc_msgSend(v7, "appendFormat:", CFSTR(" viewUpdates=%@"), self->_viewUpdates);
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  v8 = objc_msgSend(v7, "copy");

  return v8;
}

- (TUIRenderModelSection)from
{
  return self->_from;
}

- (TUIRenderModelSection)to
{
  return self->_to;
}

- (BOOL)hasChangesToApply
{
  return self->_hasChangesToApply;
}

- (BOOL)hasInvalidationsToApply
{
  return self->_hasInvalidationsToApply;
}

- (NSIndexSet)viewUpdates
{
  return self->_viewUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewUpdates, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end
