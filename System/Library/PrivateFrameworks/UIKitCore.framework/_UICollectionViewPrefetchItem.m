@implementation _UICollectionViewPrefetchItem

- (id)initWithAttributes:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_UICollectionViewPrefetchItem;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 2, a2);
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UICollectionViewLayoutAttributes *v6;
  UICollectionReusableView *view;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_attributes;
    view = self->_view;
  }
  else
  {
    v6 = 0;
    view = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@ - %@ needsLayoutAttrsUpdate: %d, needsPreferredAttrsUpdate: %d, needsReconfigure: %d>"),
    v5,
    self,
    v6,
    view,
    *(_BYTE *)&self->_flags & 1,
    (*(_BYTE *)&self->_flags >> 1) & 1,
    (*(_BYTE *)&self->_flags >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
