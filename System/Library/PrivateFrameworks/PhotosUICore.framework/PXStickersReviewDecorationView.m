@implementation PXStickersReviewDecorationView

- (PXStickersReviewDecorationView)initWithFrame:(CGRect)a3
{
  PXStickersReviewDecorationView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PXStickersReviewDecorationView;
  v3 = -[PXStickersReviewDecorationView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel layer](v3->_label, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 4.0);

    -[UILabel layer](v3->_label, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[PXStickersReviewDecorationView addSubview:](v3, "addSubview:", v3->_label);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStickersReviewDecorationView leadingAnchor](v3, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStickersReviewDecorationView bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v16);

  }
  return v3;
}

- (float)_scoreForAssetReference:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStickersReviewDecorationView.m"), 57, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStickersReviewDecorationView _scoreForAssetReference:]", v8);

  abort();
}

- (void)setUserData:(id)a3
{
  NSCopying *v6;
  NSCopying *v7;
  float v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSCopying *v14;

  v6 = (NSCopying *)a3;
  if (self->_userData != v6)
  {
    v14 = v6;
    objc_storeStrong((id *)&self->_userData, a3);
    v7 = v14;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCopying px_descriptionForAssertionMessage](v7, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStickersReviewDecorationView.m"), 72, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("userData"), v12, v13);

      }
    }
    -[PXStickersReviewDecorationView _scoreForAssetReference:](self, "_scoreForAssetReference:", v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %.2f "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_label, "setText:", v9);

    v6 = v14;
  }

}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (NSCopying)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
