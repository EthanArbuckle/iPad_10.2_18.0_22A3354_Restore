@implementation CarChromeContainingView

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];

  v24.receiver = self;
  v24.super_class = (Class)CarChromeContainingView;
  -[CarChromeContainingView willMoveToSuperview:](&v24, "willMoveToSuperview:", a3);
  v4 = objc_alloc_init((Class)UIFocusContainerGuide);
  -[CarChromeContainingView setFocusContainerGuide:](self, "setFocusContainerGuide:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  -[CarChromeContainingView addLayoutGuide:](self, "addLayoutGuide:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  objc_msgSend(v6, "setIdentifier:", CFSTR("CarChromeContainingViewFocusContentContainerGuide"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView topAnchor](self, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView leadingAnchor](self, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v25[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v25[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView focusContainerGuide](self, "focusContainerGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeContainingView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v25[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (UIFocusContainerGuide)focusContainerGuide
{
  return self->_focusContainerGuide;
}

- (void)setFocusContainerGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusContainerGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusContainerGuide, 0);
}

@end
