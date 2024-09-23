@implementation SearchUIFlightCardSectionView

- (SearchUIFlightCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SearchUIFlightCardSectionView *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)SearchUIFlightCardSectionView;
  v9 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v19, sel_initWithRowModel_feedbackDelegate_, v7, v6);

  if (v9)
  {
    -[SearchUICardSectionView contentView](v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v9);

    -[SearchUIFlightCardSectionView setLastSelectedLegIndex:](v9, "setLastSelectedLegIndex:", objc_msgSend(v8, "selectedLegIndex"));
    v11 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v8, "flight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithSFFlight:leg:style:delegate:", v12, objc_msgSend(v8, "selectedLegIndex"), 3, v9);
    -[SearchUIFlightCardSectionView setFlightViewController:](v9, "setFlightViewController:", v13);

    -[SearchUIFlightCardSectionView flightViewController](v9, "flightViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNoBackground");

    -[SearchUICardSectionView contentView](v9, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIFlightCardSectionView flightViewController](v9, "flightViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addArrangedSubview:", v17);

  }
  return v9;
}

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIFlightCardSectionView;
  -[SearchUICardSectionView updateChevronVisible:leaveSpaceForChevron:](&v4, sel_updateChevronVisible_leaveSpaceForChevron_, 0, 0);
}

- (void)flightController:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate", a3, a4, a5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SearchUICardSectionView section](self, "section");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateViewControllerTitle:", v11);

  }
  if (-[SearchUIFlightCardSectionView lastSelectedLegIndex](self, "lastSelectedLegIndex") != a4
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D8C220]);
    -[SearchUICardSectionView section](self, "section");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SearchUIFlightCardSectionView lastSelectedLegIndex](self, "lastSelectedLegIndex") < a4)
      v14 = 15;
    else
      v14 = 16;
    v15 = (void *)objc_msgSend(v12, "initWithCardSection:destination:triggerEvent:actionCardType:", v13, 0, v14, 1);

    -[SearchUICardSectionView rowModel](self, "rowModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQueryId:", objc_msgSend(v16, "queryId"));

    objc_msgSend(v17, "didEngageCardSection:", v15);
  }
  -[SearchUIFlightCardSectionView setLastSelectedLegIndex:](self, "setLastSelectedLegIndex:", a4);

}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  objc_msgSend(a3, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v6;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (FUFlightViewController)flightViewController
{
  return self->_flightViewController;
}

- (void)setFlightViewController:(id)a3
{
  objc_storeStrong((id *)&self->_flightViewController, a3);
}

- (unint64_t)lastSelectedLegIndex
{
  return self->_lastSelectedLegIndex;
}

- (void)setLastSelectedLegIndex:(unint64_t)a3
{
  self->_lastSelectedLegIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flightViewController, 0);
}

@end
