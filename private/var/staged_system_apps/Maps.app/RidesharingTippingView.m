@implementation RidesharingTippingView

- (RidesharingTippingView)initWithOptions:(id)a3 updateBlock:(id)a4
{
  id v6;
  id v7;
  RidesharingTippingView *v8;
  id v9;
  id updateBlock;
  void *v11;
  RidesharingTippingView *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingTippingView;
  v8 = -[RidesharingTippingView init](&v14, "init");
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    updateBlock = v8->_updateBlock;
    v8->_updateBlock = v9;

    if (v6)
      v11 = v6;
    else
      v11 = &__NSArray0__struct;
    -[RidesharingTippingView _commonInitWithOptions:](v8, "_commonInitWithOptions:", v11);
    v12 = v8;
  }

  return v8;
}

- (RidesharingTippingView)initWithCoder:(id)a3
{
  RidesharingTippingView *v3;
  RidesharingTippingView *v4;
  RidesharingTippingView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingView;
  v3 = -[RidesharingTippingView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[RidesharingTippingView _commonInitWithOptions:](v3, "_commonInitWithOptions:", &__NSArray0__struct);
    v5 = v4;
  }

  return v4;
}

- (void)_commonInitWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIStackView *v7;
  UIStackView *stackView;
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
  UITapGestureRecognizer *v21;
  UITapGestureRecognizer *tapGesture;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView layer](self, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 4.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView layer](self, "layer"));
  objc_msgSend(v6, "setMasksToBounds:", 1);

  v7 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v7;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 0.0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[RidesharingTippingView addSubview:](self, "addSubview:", self->_stackView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView leadingAnchor](self, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  -[RidesharingTippingView setTippingOptions:](self, "setTippingOptions:", v4);
  v21 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapped:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v21;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapGesture, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_tapGesture, "setNumberOfTouchesRequired:", 1);
  -[RidesharingTippingView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGesture);
}

- (void)tapped:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  RidesharingTippingView *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  RidesharingTippingView *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  if (objc_msgSend(v5, "count"))
  {
    for (i = 0; i < (unint64_t)objc_msgSend(v5, "count"); ++i)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
      v8 = objc_opt_class(RidesharingTippingOptionView);
      v9 = (objc_opt_isKindOfClass(v7, v8) & 1) != 0 ? v7 : 0;
      v10 = v9;

      if (!v10)
        break;
      objc_msgSend(v4, "locationInView:", v10);
      if (objc_msgSend(v10, "pointInside:withEvent:", 0))
      {
        if (objc_msgSend(v10, "isOther"))
        {
          v47 = self;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currencySymbol"));

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currencyCode"));

          v60 = 0u;
          v61 = 0u;
          v59 = 0u;
          v58 = 0u;
          v13 = v5;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v59;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(_QWORD *)v59 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "amount"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currencySymbol"));

                if (v20)
                {
                  v22 = objc_msgSend(v20, "copy");

                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "amount"));
                  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currencyCode"));

                  v21 = v22;
                  v48 = (void *)v24;
                  goto LABEL_22;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
              if (v15)
                continue;
              break;
            }
          }
          v21 = v45;
LABEL_22:

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ridesharing.feedback.tip.customTip.title"), CFSTR("localized string not found"), 0));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ridesharing.feedback.tip.customTip.message"), CFSTR("localized string not found"), 0));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v26, v28, 1));

          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_1005342D8;
          v55[3] = &unk_1011BA808;
          v30 = v10;
          v56 = v30;
          v46 = v21;
          v57 = v46;
          v31 = v29;
          objc_msgSend(v29, "addTextFieldWithConfigurationHandler:", v55);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("ridesharing.feedback.tip.customTip.cancel"), CFSTR("localized string not found"), 0));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v33, 1, 0));
          objc_msgSend(v31, "addAction:", v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ridesharing.feedback.tip.customTip.addTip"), CFSTR("localized string not found"), 0));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1005344E4;
          v49[3] = &unk_1011BA830;
          v37 = v31;
          v50 = v37;
          v7 = v30;
          v51 = v7;
          v38 = v48;
          v52 = v38;
          v53 = v47;
          v54 = v13;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v36, 0, v49));
          objc_msgSend(v37, "addAction:", v39);

          v40 = objc_claimAutoreleasedReturnValue(-[RidesharingTippingView delegate](v47, "delegate"));
          if (v40)
          {
            v41 = (void *)v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView delegate](v47, "delegate"));
            v43 = objc_opt_respondsToSelector(v42, "presentCustomTipAlert:");

            if ((v43 & 1) != 0)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingTippingView delegate](v47, "delegate"));
              objc_msgSend(v44, "presentCustomTipAlert:", v37);

            }
          }

        }
        else
        {
          -[RidesharingTippingView _selectedOption:fromOptions:](self, "_selectedOption:fromOptions:", v10, v5);
        }

        break;
      }

    }
  }

}

- (void)_selectedOption:(id)a3 fromOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void (**updateBlock)(id, void *);
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isSelected") ^ 1;
  v9 = objc_msgSend(v6, "isOther") | v8;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "setSelected:", 0, (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v6, "setSelected:", v9);
  updateBlock = (void (**)(id, void *))self->_updateBlock;
  if (updateBlock)
  {
    if ((v9 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "amount"));
      updateBlock[2](updateBlock, v16);

    }
    else
    {
      updateBlock[2](updateBlock, 0);
    }
  }

}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RidesharingTippingView\nOptions:%@"), v2));

  return v3;
}

- (void)setTippingOptions:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *tippingOptions;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  RidesharingTippingOptionView *v19;
  RidesharingTippingOptionView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_tippingOptions, "isEqualToArray:", v4))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1011BA870));
    tippingOptions = self->_tippingOptions;
    self->_tippingOptions = v6;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = self->_tippingOptions;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17);
          v19 = objc_alloc_init(RidesharingTippingOptionView);
          -[RidesharingTippingOptionView setAmount:](v19, "setAmount:", v18, (_QWORD)v21);
          -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v19);
          -[RidesharingTippingOptionView setNeedsDisplay](v19, "setNeedsDisplay");

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v15);
    }

    v20 = objc_alloc_init(RidesharingTippingOptionView);
    -[RidesharingTippingOptionView setOther:](v20, "setOther:", 1);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v20);
    -[RidesharingTippingOptionView setNeedsDisplay](v20, "setNeedsDisplay");

  }
}

- (RidesharingTippingViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSArray)tippingOptions
{
  return self->_tippingOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tippingOptions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_updateBlock, 0);
}

@end
