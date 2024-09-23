@implementation ExtensionsActionsFooterView

- (ExtensionsActionsFooterView)initWithCoder:(id)a3
{
  ExtensionsActionsFooterView *v3;
  ExtensionsActionsFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionsFooterView;
  v3 = -[ExtensionsActionsFooterView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsActionsFooterView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsActionsFooterView)initWithFrame:(CGRect)a3
{
  ExtensionsActionsFooterView *v3;
  ExtensionsActionsFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsActionsFooterView;
  v3 = -[ExtensionsActionsFooterView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsActionsFooterView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIStackView *v3;
  UIStackView *stackView;
  ExtensionsActionView *v5;
  ExtensionsActionView *openAppView;
  void *v7;

  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[ExtensionsActionsFooterView addSubview:](self, "addSubview:", self->_stackView);
  v5 = objc_alloc_init(ExtensionsActionView);
  openAppView = self->_openAppView;
  self->_openAppView = v5;

  -[ExtensionsActionView setTranslatesAutoresizingMaskIntoConstraints:](self->_openAppView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_constraintsForCenteringInView:](self->_stackView, "_maps_constraintsForCenteringInView:", self));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  -[ExtensionsActionsFooterView setActions:](self, "setActions:", &__NSArray0__struct);
}

- (void)setActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = sub_10039DCD4(a3, &stru_1011B29E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        if (*(ExtensionsActionView **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i) != self->_openAppView)
          -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v11);
        -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (char *)j + v14, (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      v14 += (uint64_t)j;
    }
    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsActionView superview](self->_openAppView, "superview"));
  if (!v17)
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_openAppView);

}

- (NSString)openAppButtonTitle
{
  return -[ExtensionsActionView buttonTitle](self->_openAppView, "buttonTitle");
}

- (void)setOpenAppButtonTitle:(id)a3
{
  -[ExtensionsActionView setButtonTitle:](self->_openAppView, "setButtonTitle:", a3);
}

- (id)didTapOpenAppButton
{
  return -[ExtensionsActionView didTapButton](self->_openAppView, "didTapButton");
}

- (void)setDidTapOpenAppButton:(id)a3
{
  -[ExtensionsActionView setDidTapButton:](self->_openAppView, "setDidTapButton:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
