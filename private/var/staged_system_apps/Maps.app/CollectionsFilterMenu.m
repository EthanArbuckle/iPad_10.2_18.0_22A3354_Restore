@implementation CollectionsFilterMenu

- (CollectionsFilterMenu)initWithFrame:(CGRect)a3
{
  CollectionsFilterMenu *v3;
  CollectionsFilterMenu *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CollectionsFilterMenu;
  v3 = -[CollectionsFilterMenu initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CollectionsFilterMenu setupSubviews](v3, "setupSubviews");
  return v4;
}

- (void)configureForAllCollectionsWithRoutingDelegate:(id)a3 withAllCollectionsResultFilters:(id)a4 withSelectedFilterIndex:(id)a5 selectedFilterResultsCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CollectionsFilterSizeController *v13;
  void *v14;
  id v15;

  self->_context = 1;
  v10 = a5;
  v11 = a4;
  -[CollectionsFilterMenu setAllCollectionsFilterRoutingDelegate:](self, "setAllCollectionsFilterRoutingDelegate:", a3);
  v12 = -[CollectionsFilterLogicController initForAllCollectionsViewUsingFilters:withSelectedFilterIndexPath:]([CollectionsFilterLogicController alloc], "initForAllCollectionsViewUsingFilters:withSelectedFilterIndexPath:", v11, v10);

  -[CollectionsFilterMenu setLogicController:](self, "setLogicController:", v12);
  v13 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", 1, 1);
  -[CollectionsFilterMenu setSizeProvider:](self, "setSizeProvider:", v13);

  -[CollectionsFilterMenu setupConstraints](self, "setupConstraints");
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuUsingSelectedIndexPath:usingCount:](self, "menuUsingSelectedIndexPath:usingCount:", v10, a6));

  objc_msgSend(v15, "setMenu:", v14);
}

- (void)configureForPublisherWithRoutingDelegate:(id)a3 withPublishersResultFilters:(id)a4 withSelectedFilterIndex:(id)a5 selectedFilterResultsCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CollectionsFilterSizeController *v13;
  void *v14;
  id v15;

  self->_context = 0;
  v10 = a5;
  v11 = a4;
  -[CollectionsFilterMenu setPublisherFilterRoutingDelegate:](self, "setPublisherFilterRoutingDelegate:", a3);
  v12 = -[CollectionsFilterLogicController initForPublisherViewUsingFilters:withSelectedFilterIndexPath:]([CollectionsFilterLogicController alloc], "initForPublisherViewUsingFilters:withSelectedFilterIndexPath:", v11, v10);

  -[CollectionsFilterMenu setLogicController:](self, "setLogicController:", v12);
  v13 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", 1, 0);
  -[CollectionsFilterMenu setSizeProvider:](self, "setSizeProvider:", v13);

  -[CollectionsFilterMenu setupConstraints](self, "setupConstraints");
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuUsingSelectedIndexPath:usingCount:](self, "menuUsingSelectedIndexPath:usingCount:", v10, a6));

  objc_msgSend(v15, "setMenu:", v14);
}

+ (double)defaultHeightForDisplayStyle:(int64_t)a3 inContext:(int64_t)a4
{
  CollectionsFilterSizeController *v4;
  double v5;
  double v6;

  v4 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", a3, a4);
  -[CollectionsFilterSizeController defaultHeight](v4, "defaultHeight");
  v6 = v5;

  return v6;
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CollectionsFilterMenu setStackView:](self, "setStackView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  objc_msgSend(v5, "setAxis:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  objc_msgSend(v6, "setDistribution:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  objc_msgSend(v7, "setAlignment:", 1);

  -[CollectionsFilterMenu addMenuButton](self, "addMenuButton");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  -[CollectionsFilterMenu addSubview:](self, "addSubview:", v8);

}

- (void)addMenuButton
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
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRightImageButton buttonWithType:](MapsRightImageButton, "buttonWithType:", 0));
  -[CollectionsFilterMenu setMenuButton:](self, "setMenuButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v6, "setFont:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.up.chevron.down"), v9));
  objc_msgSend(v7, "setImage:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v11, "setContextMenuInteractionEnabled:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v12, "setShowsMenuAsPrimaryAction:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v14, "setTitleColorProvider:", &stru_1011B8250);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("CollectionsFilterMenuButton"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v18, "_setContinuousCornerRadius:", 4.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v20, "setMasksToBounds:", 1);

  v22 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  objc_msgSend(v22, "addArrangedSubview:", v21);

}

- (void)setupConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu sizeProvider](self, "sizeProvider"));
  objc_msgSend(v3, "insetForFilterAtIndex:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu topAnchor](self, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, v5));
  v29[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu leadingAnchor](self, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, v7));
  v29[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:constant:", v15, -v11));
  v29[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu stackView](self, "stackView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu bottomAnchor](self, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v9));
  v29[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (id)menuUsingSelectedIndexPath:(id)a3 usingCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100490490;
  v20 = sub_1004904A0;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filterAtIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filterTitle"));
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterViewModels"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004904A8;
  v15[3] = &unk_1011B82A0;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a4;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v17[5]));
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (void)filterSelectedAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t context;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedFilterIndexPath"));

  v6 = v25;
  if (v5 != v25)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filterAtIndexPath:", v25));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filterTitle"));
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    context = self->_context;
    if (context == 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeToSelectedAllCollectionsFilterAtIndexPath:", v25));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allCollectionsAddressFilter"));
      if (v18)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu allCollectionsFilterRoutingDelegate](self, "allCollectionsFilterRoutingDelegate"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allCollectionsAddressFilter"));
        goto LABEL_8;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allCollectionsKeywordFilter"));

      if (v22)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu allCollectionsFilterRoutingDelegate](self, "allCollectionsFilterRoutingDelegate"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allCollectionsKeywordFilter"));
        goto LABEL_13;
      }
    }
    else
    {
      if (context)
      {
LABEL_16:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuButton](self, "menuButton"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu menuUsingSelectedIndexPath:usingCount:](self, "menuUsingSelectedIndexPath:usingCount:", v25, 0));
        objc_msgSend(v23, "setMenu:", v24);

        v6 = v25;
        goto LABEL_17;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeToSelectedFilterAtIndexPath:", v25));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addressFilter"));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu publisherFilterRoutingDelegate](self, "publisherFilterRoutingDelegate"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addressFilter"));
LABEL_8:
        v19 = (void *)v16;
        objc_msgSend(v15, "didRouteToAddressFilter:atIndexPath:", v16, v25);
LABEL_14:

        goto LABEL_15;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keywordFilter"));

      if (v20)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu publisherFilterRoutingDelegate](self, "publisherFilterRoutingDelegate"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keywordFilter"));
LABEL_13:
        v19 = (void *)v21;
        objc_msgSend(v15, "didRouteToKeywordFilter:atIndexPath:", v21, v25);
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

- (id)titleForFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterMenu logicController](self, "logicController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filterAtIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filterTitle"));
  return v7;
}

- (CollectionsFilterDataProvider)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (CollectionsFilterSizeProvider)sizeProvider
{
  return self->_sizeProvider;
}

- (void)setSizeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sizeProvider, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (MapsRightImageButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (CollectionsFilterRoutingDelegate)publisherFilterRoutingDelegate
{
  return (CollectionsFilterRoutingDelegate *)objc_loadWeakRetained((id *)&self->_publisherFilterRoutingDelegate);
}

- (void)setPublisherFilterRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_publisherFilterRoutingDelegate, a3);
}

- (AllCollectinsFilterRoutingDelegate)allCollectionsFilterRoutingDelegate
{
  return (AllCollectinsFilterRoutingDelegate *)objc_loadWeakRetained((id *)&self->_allCollectionsFilterRoutingDelegate);
}

- (void)setAllCollectionsFilterRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_allCollectionsFilterRoutingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allCollectionsFilterRoutingDelegate);
  objc_destroyWeak((id *)&self->_publisherFilterRoutingDelegate);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_sizeProvider, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
}

@end
