@implementation _TUIElementMenuBuilder

- (void)addMenuItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *children;
  _TUIMenuItemContainer *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    if (!self->_children)
    {
      v5 = objc_opt_new(NSMutableArray);
      children = self->_children;
      self->_children = v5;

    }
    v7 = -[_TUIMenuItemContainer initWithModel:]([_TUIMenuItemContainer alloc], "initWithModel:", v8);
    -[NSMutableArray addObject:](self->_children, "addObject:", v7);

    v4 = v8;
  }

}

- (void)addModel:(id)a3
{
  id v4;
  NSMutableArray *children;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    children = self->_children;
    v8 = v4;
    if (!children)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_children;
      self->_children = v6;

      children = self->_children;
    }
    -[NSMutableArray addObject:](children, "addObject:", v8);
    v4 = v8;
  }

}

- (id)finalizeMenuItem
{
  TUIMenuContainer *v3;

  if (-[NSMutableArray count](self->_children, "count"))
    v3 = -[TUIMenuContainer initWithTitle:imageModel:isInline:]([TUIMenuContainer alloc], "initWithTitle:imageModel:isInline:", self->_title, self->_imageModel, self->_isInline);
  else
    v3 = 0;
  -[TUIMenuContainer updateModelChildren:](v3, "updateModelChildren:", self->_children);
  return v3;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  objc_msgSend(a3, "updateModelChildren:", self->_children, a4);
}

- (void)finalizeModelsWithParent:(id)a3
{
  objc_msgSend(a3, "updateModelChildren:", self->_children);
}

- (void)addText:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *title;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("title")))
  {
    v8 = (NSString *)objc_msgSend(v10, "copy");
    title = self->_title;
    self->_title = v8;

  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isEqualToString:", CFSTR("image")))
    objc_storeStrong((id *)&self->_imageModel, a3);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
  objc_storeStrong((id *)&self->_imageModel, a3);
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
