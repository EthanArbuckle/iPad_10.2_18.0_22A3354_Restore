@implementation PKPayLaterInstallmentsMonthPresenter

- (PKPayLaterInstallmentsMonthPresenter)init
{
  PKPayLaterInstallmentsMonthPresenter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sizeByItem;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterInstallmentsMonthPresenter;
  v2 = -[PKPayLaterInstallmentsMonthPresenter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizeByItem = v2->_sizeByItem;
    v2->_sizeByItem = v3;

  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("PKPayLaterInstallmentsMonthPresenterCellIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  PKCalendarMonthView *v10;
  PKCalendarMonthView *v11;
  PKCalendarMonthView *v12;
  id v13;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKPayLaterInstallmentsMonthPresenterCellIdentifier"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostedContentView");
  v10 = (PKCalendarMonthView *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    v12 = objc_alloc_init(PKCalendarMonthView);
    objc_msgSend(v9, "setHostedContentView:", v12);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v8;
  else
    v13 = 0;
  -[PKPayLaterInstallmentsMonthPresenter _configureView:item:](self, "_configureView:item:", v12, v13);

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PKCalendarMonthView *sampleView;
  PKCalendarMonthView *v22;
  PKCalendarMonthView *v23;
  PKCalendarMonthView *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSMutableDictionary *sizeByItem;
  void *v31;
  double v32;
  double v33;
  CGSize result;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v10, "installmentsMonth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_sizeByItem, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CGSizeValue");
  v15 = v14;
  v17 = v16;

  v18 = *MEMORY[0x1E0C9D820];
  v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == v15 && v19 == v17)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      v22 = objc_alloc_init(PKCalendarMonthView);
      v23 = self->_sampleView;
      self->_sampleView = v22;

      sampleView = self->_sampleView;
    }
    -[PKPayLaterInstallmentsMonthPresenter _configureView:item:](self, "_configureView:item:", sampleView, v10, v18, v19);
    v24 = self->_sampleView;
    objc_msgSend(v8, "bounds");
    v26 = v25;
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    -[PKCalendarMonthView sizeThatFits:](v24, "sizeThatFits:", v26 + v27 * -2.0, 3.40282347e38);
    v15 = v28;
    v17 = v29;
    sizeByItem = self->_sizeByItem;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](sizeByItem, "setObject:forKey:", v31, v12);

  }
  v32 = v15;
  v33 = v17;
  result.height = v33;
  result.width = v32;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKCalendarMonthView *v11;
  PKCalendarMonthView *sampleView;
  NSMutableDictionary *v13;
  NSMutableDictionary *sizeByItem;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      v11 = objc_alloc_init(PKCalendarMonthView);
      sampleView = self->_sampleView;
      self->_sampleView = v11;

      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      sizeByItem = self->_sizeByItem;
      self->_sizeByItem = v13;

    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v12;
  else
    v7 = 0;
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  objc_msgSend(v9, "hostedContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  -[PKPayLaterInstallmentsMonthPresenter _configureView:item:](self, "_configureView:item:", v11, v8);

}

- (void)_configureView:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  PKPayLaterCalendarMonthHeaderView *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPayLaterCalendarMonthHeaderView *v11;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    v7 = [PKPayLaterCalendarMonthHeaderView alloc];
    objc_msgSend(v5, "installmentsMonth");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPayLaterCalendarMonthHeaderView initWithInstallmentsMonth:](v7, "initWithInstallmentsMonth:", v8);

    objc_msgSend(v5, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "configureWithDataSource:appearance:headerView:", v9, v10, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeByItem, 0);
  objc_storeStrong((id *)&self->_sampleView, 0);
}

@end
