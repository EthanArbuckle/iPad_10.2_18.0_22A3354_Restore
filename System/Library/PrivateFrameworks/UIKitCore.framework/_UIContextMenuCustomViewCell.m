@implementation _UIContextMenuCustomViewCell

- (_UIContextMenuCustomViewCell)initWithFrame:(CGRect)a3
{
  _UIContextMenuCustomViewCell *v3;
  _UIContextMenuCustomViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuCustomViewCell;
  v3 = -[_UIContextMenuCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UICollectionViewCell _setFocusStyle:](v3, "_setFocusStyle:", 0);
    -[UICollectionViewCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

  }
  return v4;
}

+ (Class)_contentViewClass
{
  return +[UICollectionViewCell _contentViewClass](UICollectionViewCell, "_contentViewClass");
}

- (id)actionView
{
  return 0;
}

- (void)setCustomContentView:(id)a3
{
  UIView *v5;
  UIView **p_customContentView;
  UIView *customContentView;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  if (customContentView != v5)
  {
    v11 = v5;
    -[UIView removeFromSuperview](customContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customContentView, a3);
    -[UICollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *p_customContentView;
      objc_msgSend(v8, "addSubview:", v10);
      objc_msgSend(v9, "_addBoundsMatchingConstraintsForView:", v10);
    }

    v5 = v11;
  }

}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContentView, 0);
}

@end
