@implementation TUIButtonAttributes

- (TUIButtonAttributes)initWithTitle:(id)a3 image:(id)a4
{
  id v7;
  id v8;
  TUIButtonAttributes *v9;
  TUIButtonAttributes *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIButtonAttributes;
  v9 = -[TUIButtonAttributes init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_image, a4);
  }

  return v10;
}

- (id)attributesForButtonType:(unint64_t)a3
{
  TUIButtonAttributes *v4;
  NSAttributedString *v5;
  TUIButtonAttributes *v6;

  v4 = self;
  v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[NSAttributedString tui_attributedTitleForButtonType:](v4->_title, "tui_attributedTitleForButtonType:", a3));
  if (v5 != v4->_title)
  {
    v6 = -[TUIButtonAttributes initWithTitle:image:]([TUIButtonAttributes alloc], "initWithTitle:image:", v5, v4->_image);

    v4 = v6;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (self != a3)
  {
    v5 = a3;
    v6 = objc_opt_class(TUIButtonAttributes);
    v7 = TUIDynamicCast(v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  return self == a3;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
