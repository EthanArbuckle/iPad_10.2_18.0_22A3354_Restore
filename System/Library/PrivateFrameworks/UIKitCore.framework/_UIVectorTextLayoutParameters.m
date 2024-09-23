@implementation _UIVectorTextLayoutParameters

+ (id)parametersSuitableForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTraitCollection:", v5);

  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "setWithinSize:", v7, v9);
  return v4;
}

- (_UIVectorTextLayoutParameters)initWithParameters:(id)a3
{
  id v4;
  _UIVectorTextLayoutParameters *v5;
  _UIVectorTextLayoutParameters *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIVectorTextLayoutParameters;
  v5 = -[_UIVectorTextLayoutParameters init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIVectorTextLayoutParameters _copyFromParameters:](v5, "_copyFromParameters:", v4);

  return v6;
}

- (void)_copyFromParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVectorTextLayoutParameters setAttributedText:](self, "setAttributedText:", v5);

  -[_UIVectorTextLayoutParameters setNumberOfLines:](self, "setNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
  objc_msgSend(v4, "withinSize");
  -[_UIVectorTextLayoutParameters setWithinSize:](self, "setWithinSize:");
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVectorTextLayoutParameters setTraitCollection:](self, "setTraitCollection:", v6);

  v7 = objc_msgSend(v4, "lineBreakMode");
  -[_UIVectorTextLayoutParameters setLineBreakMode:](self, "setLineBreakMode:", v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParameters:", self);
}

- (BOOL)isEqualToParameters:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = -[_UIVectorTextLayoutParameters numberOfLines](self, "numberOfLines");
  if (v5 != objc_msgSend(v4, "numberOfLines"))
    goto LABEL_7;
  v6 = -[_UIVectorTextLayoutParameters lineBreakMode](self, "lineBreakMode");
  if (v6 == objc_msgSend(v4, "lineBreakMode")
    && (-[_UIVectorTextLayoutParameters withinSize](self, "withinSize"),
        v8 = v7,
        objc_msgSend(v4, "withinSize"),
        v8 == v9)
    && (-[_UIVectorTextLayoutParameters withinSize](self, "withinSize"),
        v11 = v10,
        objc_msgSend(v4, "withinSize"),
        v11 == v12))
  {
    -[_UIVectorTextLayoutParameters attributedText](self, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributedText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToAttributedString:", v14);

  }
  else
  {
LABEL_7:
    v15 = 0;
  }

  return v15;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (CGSize)withinSize
{
  double width;
  double height;
  CGSize result;

  width = self->_withinSize.width;
  height = self->_withinSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWithinSize:(CGSize)a3
{
  self->_withinSize = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
