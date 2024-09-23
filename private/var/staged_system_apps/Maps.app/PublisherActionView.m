@implementation PublisherActionView

- (PublisherActionView)initWithFrame:(CGRect)a3
{
  PublisherActionView *v3;
  PublisherActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PublisherActionView;
  v3 = -[PublisherActionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PublisherActionView setupSubviews](v3, "setupSubviews");
    -[PublisherActionView setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)configureWithActionManager:(id)a3 publishersResultFilters:(id)a4 routingDelegate:(id)a5 selectedFilterIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
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

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[PublisherActionView setActionManager:](self, "setActionManager:", a3);
  -[PublisherActionView createActions](self, "createActions");
  v13 = objc_msgSend(v10, "count");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v15 = v14;
  if ((unint64_t)v13 < 2)
  {

    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView bottomAnchor](self, "bottomAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -10.0));
      v23 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
      objc_msgSend(v22, "removeFromSuperview");

      -[PublisherActionView setFilterCarousel:](self, "setFilterCarousel:", 0);
    }
  }
  else
  {
    objc_msgSend(v14, "configureWithContext:withRoutingDelegate:withPublishersResultFilters:withSelectedFilterIndex:", 0, v11, v10, v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
    objc_msgSend(v16, "displayFilters");

  }
}

- (void)setupSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CollectionsFilterCarouselView *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PublisherActionView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_msgSend(objc_alloc((Class)MUPlaceCardActionsRowView), "initWithStyle:", 2 * (sub_1002A8AA0(self) == 5));
  -[PublisherActionView setActionRowView:](self, "setActionRowView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  objc_msgSend(v6, "setInsetsLayoutMarginsFromSafeArea:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  objc_msgSend(v7, "setLayoutMargins:", 0.0, 6.0, 0.0, 6.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  -[PublisherActionView addSubview:](self, "addSubview:", v9);

  v10 = -[CollectionsFilterCarouselView initWithFrame:]([CollectionsFilterCarouselView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PublisherActionView setFilterCarousel:](self, "setFilterCarousel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  -[PublisherActionView addSubview:](self, "addSubview:", v12);

}

- (void)setupConstraints
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[7];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView topAnchor](self, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0));
  v33[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView leadingAnchor](self, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 10.0));
  v33[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -10.0));
  v33[2] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 16.0));
  v33[3] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView leadingAnchor](self, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v33[4] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v33[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v33[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)createActions
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionManager](self, "actionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView actionRowView](self, "actionRowView"));
  objc_msgSend(v3, "setActionManager:", v4);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PublisherActionView layoutIfNeeded](self, "layoutIfNeeded");
  v20.receiver = self;
  v20.super_class = (Class)PublisherActionView;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[PublisherActionView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));

  if (v16)
  {
    +[CollectionsFilterCarouselView defaultHeightForDisplayStyle:inContext:](CollectionsFilterCarouselView, "defaultHeightForDisplayStyle:inContext:", 0, 0);
    v15 = v15 + v17;
  }
  v18 = v13;
  v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)titleForFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherActionView filterCarousel](self, "filterCarousel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleForFilterAtIndexPath:", v4));

  return v6;
}

- (PublisherHeaderViewActionManager)actionManager
{
  return (PublisherHeaderViewActionManager *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (void)setActionManager:(id)a3
{
  objc_storeWeak((id *)&self->_actionManager, a3);
}

- (MUPlaceCardActionsRowView)actionRowView
{
  return self->_actionRowView;
}

- (void)setActionRowView:(id)a3
{
  objc_storeStrong((id *)&self->_actionRowView, a3);
}

- (CollectionsFilterCarouselView)filterCarousel
{
  return self->_filterCarousel;
}

- (void)setFilterCarousel:(id)a3
{
  objc_storeStrong((id *)&self->_filterCarousel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_filterCarousel, 0);
  objc_storeStrong((id *)&self->_actionRowView, 0);
  objc_destroyWeak((id *)&self->_actionManager);
}

@end
