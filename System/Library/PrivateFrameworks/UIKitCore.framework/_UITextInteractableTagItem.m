@implementation _UITextInteractableTagItem

- (BOOL)isTagItem
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITextInteractableTagItem;
  if (-[_UITextInteractableItem isEqual:](&v12, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "tag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractableTagItem tag](self, "tag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_itemRepresentationWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  -[_UITextInteractableTagItem tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextItem _itemWithTag:range:](UITextItem, "_itemWithTag:range:", v5, location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_showsPreviewByDefault
{
  return 0;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
