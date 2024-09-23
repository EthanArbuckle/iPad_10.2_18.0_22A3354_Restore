@implementation TFFeedbackFormViewDataSource

- (TFFeedbackFormViewDataSource)initWithPresenter:(id)a3
{
  id v5;
  TFFeedbackFormViewDataSource *v6;
  TFFeedbackFormViewDataSource *v7;
  TFFeedbackFormCellUpdater *v8;
  TFFeedbackFormCellUpdater *cellUpdater;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackFormViewDataSource;
  v6 = -[TFFeedbackFormViewDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = objc_alloc_init(TFFeedbackFormCellUpdater);
    cellUpdater = v7->_cellUpdater;
    v7->_cellUpdater = v8;

  }
  return v7;
}

- (void)prepareTableViewForDataSource:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v4 = objc_opt_class();
  +[TFLinkableHeaderFooterView reuseIdentifier](TFLinkableHeaderFooterView, "reuseIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v5);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleEntryAtGroupIndex:entryIndex:", objc_msgSend(v6, "section"), objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[TFFeedbackEntryTypeCellProvider reuseIdentifierForEntryType:](TFFeedbackEntryTypeCellProvider, "reuseIdentifierForEntryType:", objc_msgSend(v9, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackFormViewDataSource cellUpdater](self, "cellUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "feedbackDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateCell:displayingEntry:contentDataSource:updateProxy:", v11, v9, v14, v15);

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[TFFeedbackFormViewDataSource presenter](self, "presenter", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfVisibleItemsInGroupAtIndex:", a4);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[TFFeedbackFormViewDataSource presenter](self, "presenter", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfEntryGroupsInForm");

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerTextForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[TFLinkableHeaderFooterView reuseIdentifier](TFLinkableHeaderFooterView, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "applyText:withTextLinkMap:isHeader:", v8, 0, 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerTextForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[TFLinkableHeaderFooterView reuseIdentifier](TFLinkableHeaderFooterView, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TFFeedbackFormViewDataSource presenter](self, "presenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "footerTextLinkMapForGroupAtIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyText:withTextLinkMap:isHeader:", v8, v12, 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v6 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerTextForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "bounds");
    +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v8, 1, v6, CGRectGetWidth(v12), 1.79769313e308);
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v6 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerTextForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "bounds");
    +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v8, 0, v6, CGRectGetWidth(v12), 1.79769313e308);
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v6 = a4;
  v7 = a3;
  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "visibleEntryAtGroupIndex:entryIndex:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackFormViewDataSource presenter](self, "presenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feedbackDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  +[TFFeedbackEntryTypeCellProvider cellSizeForEntry:dataSource:fittingSize:inTraitEnvironment:](TFFeedbackEntryTypeCellProvider, "cellSizeForEntry:dataSource:fittingSize:inTraitEnvironment:", v11, v13, v7, v14, 1.79769313e308);
  v16 = v15;

  return v16;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isSelectable"))
    v8 = v5;
  else
    v8 = 0;

  return v8;
}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (TFFeedbackFormCellUpdater)cellUpdater
{
  return self->_cellUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellUpdater, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
