@implementation _UITextFormattingViewControllerEmphasisStyle

- (_UITextFormattingViewControllerEmphasisStyle)initWithStyleKey:(id)a3 title:(id)a4 color:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UITextFormattingViewControllerEmphasisStyle *v11;
  uint64_t v12;
  NSString *styleKey;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  UIColor *color;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UITextFormattingViewControllerEmphasisStyle;
  v11 = -[_UITextFormattingViewControllerEmphasisStyle init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    styleKey = v11->_styleKey;
    v11->_styleKey = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    color = v11->_color;
    v11->_color = (UIColor *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_UITextFormattingViewControllerEmphasisStyle styleKey](self, "styleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[_UITextFormattingViewControllerEmphasisStyle title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[_UITextFormattingViewControllerEmphasisStyle color](self, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UITextFormattingViewControllerEmphasisStyle *v4;
  _UITextFormattingViewControllerEmphasisStyle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (_UITextFormattingViewControllerEmphasisStyle *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UITextFormattingViewControllerEmphasisStyle styleKey](self, "styleKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextFormattingViewControllerEmphasisStyle styleKey](v5, "styleKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[_UITextFormattingViewControllerEmphasisStyle title](self, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextFormattingViewControllerEmphasisStyle title](v5, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_UITextFormattingViewControllerEmphasisStyle styleKey](self, "styleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_UITextFormattingViewControllerEmphasisStyle title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UITextFormattingViewControllerEmphasisStyle styleKey](self, "styleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_StyleKey"));

  -[_UITextFormattingViewControllerEmphasisStyle title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_Title"));

  -[_UITextFormattingViewControllerEmphasisStyle color](self, "color");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_Color"));

}

- (_UITextFormattingViewControllerEmphasisStyle)initWithCoder:(id)a3
{
  id v4;
  _UITextFormattingViewControllerEmphasisStyle *v5;
  void *v6;
  uint64_t v7;
  NSString *styleKey;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  UIColor *color;

  v4 = a3;
  v5 = -[_UITextFormattingViewControllerEmphasisStyle init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerEmphasisStyleClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_StyleKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    styleKey = v5->_styleKey;
    v5->_styleKey = (NSString *)v7;

    _UITextFormattingViewControllerEmphasisStyleClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_Title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    _UITextFormattingViewControllerEmphasisStyleClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_Color"));
    v13 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v13;

  }
  return v5;
}

- (NSString)styleKey
{
  return self->_styleKey;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styleKey, 0);
}

@end
