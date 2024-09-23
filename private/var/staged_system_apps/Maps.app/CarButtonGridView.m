@implementation CarButtonGridView

- (CarButtonGridView)initWithFrame:(CGRect)a3
{
  CarButtonGridView *v3;
  CarButtonGridView *v4;
  NSMutableArray *v5;
  NSMutableArray *buttonArray;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];

  v31.receiver = self;
  v31.super_class = (Class)CarButtonGridView;
  v3 = -[CarButtonGridView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarButtonGridView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarButtonGridView"));
    v5 = objc_opt_new(NSMutableArray);
    buttonArray = v4->_buttonArray;
    v4->_buttonArray = v5;

    v7 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CarButtonGridView setButtonStack:](v4, "setButtonStack:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    objc_msgSend(v9, "setAxis:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    objc_msgSend(v10, "setDistribution:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    objc_msgSend(v11, "setSpacing:", 20.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    -[CarButtonGridView addSubview:](v4, "addSubview:", v12);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView leadingAnchor](v4, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v32[0] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView trailingAnchor](v4, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v32[1] = v23;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView topAnchor](v4, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v32[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](v4, "buttonStack"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView bottomAnchor](v4, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v32[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);
  }
  return v4;
}

- (NSArray)buttons
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonArray](self, "buttonArray"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addButton:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonArray](self, "buttonArray"));
  v5 = objc_msgSend(v4, "containsObject:", v14);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonArray](self, "buttonArray"));
    objc_msgSend(v6, "addObject:", v14);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](self, "buttonStack"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrangedSubviews"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

    if (!v9
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrangedSubviews")),
          v11 = objc_msgSend(v10, "count"),
          v10,
          (unint64_t)v11 >= 2))
    {
      v12 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

      objc_msgSend(v12, "setAxis:", 0);
      objc_msgSend(v12, "setDistribution:", 1);
      objc_msgSend(v12, "setSpacing:", 20.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](self, "buttonStack"));
      objc_msgSend(v13, "addArrangedSubview:", v12);

      v9 = v12;
    }
    objc_msgSend(v9, "addArrangedSubview:", v14);
    -[CarButtonGridView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)resetButtons
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonArray](self, "buttonArray"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarButtonGridView buttonStack](self, "buttonStack"));
  objc_msgSend(v4, "_maps_setArrangedSubviews:", &__NSArray0__struct);

  -[CarButtonGridView setNeedsLayout](self, "setNeedsLayout");
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStack, a3);
}

- (NSMutableArray)buttonArray
{
  return self->_buttonArray;
}

- (void)setButtonArray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArray, 0);
  objc_storeStrong((id *)&self->_buttonStack, 0);
}

@end
