@implementation PKPaymentPassDetailWrapperSectionController

- (PKPaymentPassDetailWrapperSectionController)init
{

  return 0;
}

- (PKPaymentPassDetailWrapperSectionController)initWithViewController:(id)a3
{
  id v4;
  PKPaymentPassDetailWrapperSectionController *v5;
  PKPaymentPassDetailWrapperSectionController *v6;
  NSArray *v7;
  unint64_t i;
  void *v9;
  NSArray *sectionIdentifiers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailWrapperSectionController;
  v5 = -[PKPaymentPassDetailWrapperSectionController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 54);
    for (i = 0; i != 54; ++i)
    {
      PKPassDetailSectionTypeToString(i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v7, "addObject:", v9);

    }
    sectionIdentifiers = v6->_sectionIdentifiers;
    v6->_sectionIdentifiers = v7;

  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  int64_t v10;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  v10 = objc_msgSend(WeakRetained, "tableView:numberOfRowsInSectionCase:", v7, v9);
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v12 = PKPassDetailSectionTypeFromString(v8);

  objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:section:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id WeakRetained;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v11 = PKPassDetailSectionTypeFromString(v8);

  objc_msgSend(WeakRetained, "tableView:didSelectRowAtIndexPath:section:", v10, v9, v11);
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  PKPaymentPassDetailViewController **p_viewController;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  p_viewController = &self->_viewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v6 = PKPassDetailSectionTypeFromString(v4);

  objc_msgSend(WeakRetained, "titleForHeaderInSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  PKPaymentPassDetailViewController **p_viewController;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  p_viewController = &self->_viewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v6 = PKPassDetailSectionTypeFromString(v4);

  objc_msgSend(WeakRetained, "titleForFooterInSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  objc_msgSend(WeakRetained, "tableView:viewForHeaderInSectionCase:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  objc_msgSend(WeakRetained, "tableView:viewForFooterInSectionCase:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  double v13;
  double v14;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v12 = PKPassDetailSectionTypeFromString(v8);

  objc_msgSend(WeakRetained, "tableView:heightForRowAtIndexPath:section:", v10, v9, v12);
  v14 = v13;

  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  double v11;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  objc_msgSend(WeakRetained, "tableView:heightForHeaderInSectionCase:", v7, v9);
  v11 = v10;

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  double v11;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  objc_msgSend(WeakRetained, "tableView:heightForFooterInSectionCase:", v7, v9);
  v11 = v10;

  return v11;
}

- (double)estimatedHeightForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  double v11;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  objc_msgSend(WeakRetained, "estimatedHeightForRowAtIndexPath:section:", v7, v9);
  v11 = v10;

  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v12 = PKPassDetailSectionTypeFromString(v8);

  LOBYTE(v8) = objc_msgSend(WeakRetained, "tableView:canEditRowAtIndexPath:section:", v10, v9, v12);
  return (char)v8;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  int64_t v10;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  v10 = objc_msgSend(WeakRetained, "editingStyleForRowAtIndexPath:section:", v7, v9);
  return v10;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  PKPaymentPassDetailViewController **p_viewController;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;

  p_viewController = &self->_viewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v9 = PKPassDetailSectionTypeFromString(v6);

  LOBYTE(v6) = objc_msgSend(WeakRetained, "shouldHighlightRowAtIndexPath:section:", v7, v9);
  return (char)v6;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  PKPaymentPassDetailViewController **p_viewController;
  id v4;
  id WeakRetained;
  uint64_t v6;

  p_viewController = &self->_viewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v6 = PKPassDetailSectionTypeFromString(v4);

  LOBYTE(v4) = objc_msgSend(WeakRetained, "shouldDrawTopSeparator:", v6);
  return (char)v4;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  PKPaymentPassDetailViewController **p_viewController;
  id v4;
  id WeakRetained;
  uint64_t v6;

  p_viewController = &self->_viewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v6 = PKPassDetailSectionTypeFromString(v4);

  LOBYTE(v4) = objc_msgSend(WeakRetained, "shouldDrawBottomSeparator:", v6);
  return (char)v4;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v12 = PKPassDetailSectionTypeFromString(v8);

  objc_msgSend(WeakRetained, "tableView:leadingSwipeActionsConfigurationForRowAtIndexPath:section:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  PKPaymentPassDetailViewController **p_viewController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;

  p_viewController = &self->_viewController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v12 = PKPassDetailSectionTypeFromString(v8);

  objc_msgSend(WeakRetained, "tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:section:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6
{
  double y;
  double x;
  PKPaymentPassDetailViewController **p_viewController;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;

  y = a5.y;
  x = a5.x;
  p_viewController = &self->_viewController;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  v15 = PKPassDetailSectionTypeFromString(v11);

  objc_msgSend(WeakRetained, "tableView:contextMenuConfigurationForRowAtIndexPath:point:section:", v13, v12, v15, x, y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)setSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
