@implementation CarCardStackViewController

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarCardStackViewController)initWithCarCardContentControllers:(id)a3 layout:(id *)a4
{
  id v6;
  CarCardStackViewController *v7;
  UIStackView *v8;
  UIStackView *cardContentStack;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CarCardView *v16;
  CarCardView *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CarCardStackViewController;
  v7 = -[CarCardStackViewController init](&v23, "init");
  if (v7)
  {
    v8 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    cardContentStack = v7->_cardContentStack;
    v7->_cardContentStack = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_cardContentStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v7->_cardContentStack, "setAxis:", a4->var0);
    -[UIStackView setDistribution:](v7->_cardContentStack, "setDistribution:", a4->var1);
    -[UIStackView setAlignment:](v7->_cardContentStack, "setAlignment:", a4->var2);
    -[UIStackView setSpacing:](v7->_cardContentStack, "setSpacing:", 8.0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
          v16 = [CarCardView alloc];
          v17 = -[CarCardView initWithContent:](v16, "initWithContent:", v15, (_QWORD)v19);
          -[UIStackView addArrangedSubview:](v7->_cardContentStack, "addArrangedSubview:", v17);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (NSArray)cardContentControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrangedSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("content")));

  return (NSArray *)v4;
}

- (NSArray)cardViews
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrangedSubviews"));

  return (NSArray *)v3;
}

- (void)addCardContentController:(id)a3
{
  id v4;
  void *v5;
  CarCardView *v6;

  v4 = a3;
  v6 = -[CarCardView initWithContent:]([CarCardView alloc], "initWithContent:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack"));
  objc_msgSend(v5, "addArrangedSubview:", v6);

}

- (void)insertCardContentController:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  CarCardView *v8;

  v6 = a3;
  v8 = -[CarCardView initWithContent:]([CarCardView alloc], "initWithContent:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack"));
  objc_msgSend(v7, "insertArrangedSubview:atIndex:", v8, a4);

}

- (void)removeCardContentController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedSubviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));

        if (v12 == v4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController cardContentStack](self, "cardContentStack"));
          objc_msgSend(v13, "_maps_removeArrangedSubview:", v11);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v21;
  _QWORD v22[4];

  v21.receiver = self;
  v21.super_class = (Class)CarCardStackViewController;
  -[CarCardStackViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_cardContentStack);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_cardContentStack, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v22[0] = v17;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_cardContentStack, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v22[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](self->_cardContentStack, "leftAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v22[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView rightAnchor](self->_cardContentStack, "rightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardStackViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v22[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{

  return 0;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIStackView)cardContentStack
{
  return self->_cardContentStack;
}

- (void)setCardContentStack:(id)a3
{
  objc_storeStrong((id *)&self->_cardContentStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardContentStack, 0);
}

@end
