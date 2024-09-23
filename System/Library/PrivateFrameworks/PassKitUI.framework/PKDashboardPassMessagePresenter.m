@implementation PKDashboardPassMessagePresenter

- (PKDashboardPassMessagePresenter)initWithPassGroupView:(id)a3
{
  id v5;
  PKDashboardPassMessagePresenter *v6;
  PKDashboardPassMessagePresenter *v7;
  PKDashboardMessagesView *v8;
  uint64_t v9;
  PKDashboardMessagesView *sampleMessageView;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardPassMessagePresenter;
  v6 = -[PKDashboardPassMessagePresenter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupView, a3);
    v8 = [PKDashboardMessagesView alloc];
    v9 = -[PKDashboardMessagesView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleMessageView = v7->_sampleMessageView;
    v7->_sampleMessageView = (PKDashboardMessagesView *)v9;

  }
  return v7;
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
  v3 = CFSTR("passMessagePresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_identifierForItem:(id)a3
{
  return CFSTR("passMessagePresenter");
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKDashboardPassMessagePresenter _identifierForItem:](self, "_identifierForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDashboardPassMessagePresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v12, v10, v9, v8);
  return v12;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardMessagesView *sampleMessageView;
  id v8;
  void *v9;
  PKDashboardMessagesView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleMessageView = self->_sampleMessageView;
  v8 = a4;
  objc_msgSend(a3, "messages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessagesView updateWithMessages:currentIndex:](sampleMessageView, "updateWithMessages:currentIndex:", v9, 0);

  v10 = self->_sampleMessageView;
  objc_msgSend(v8, "bounds");
  v12 = v11;

  -[PKDashboardMessagesView sizeThatFits:](v10, "sizeThatFits:", v12, 3.40282347e38);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v8;
  PKDashboardMessagesView *v9;
  PKDashboardMessagesView *v10;
  void *v11;
  void *v12;
  NSString *currentIdentifier;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  objc_msgSend(v19, "hostedContentView");
  v9 = (PKDashboardMessagesView *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [PKDashboardMessagesView alloc];
    v9 = -[PKDashboardMessagesView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PKDashboardMessagesView setDelegate:](v9, "setDelegate:", self);
    objc_msgSend(v19, "setHostedContentView:", v9);
  }
  objc_msgSend(v8, "messages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  currentIdentifier = self->_currentIdentifier;
  if (currentIdentifier)
  {
    v14 = -[PKDashboardPassMessagePresenter _indexForIdentifier:inMessages:](self, "_indexForIdentifier:inMessages:", currentIdentifier, v11);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(v12, "count");
      if (v15 - 1 < self->_currentIndex)
        self->_currentIndex = v15 - 1;
    }
    else
    {
      self->_currentIndex = v14;
    }
  }
  else
  {
    objc_msgSend(v11, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_currentIdentifier;
    self->_currentIdentifier = v17;

    self->_currentIndex = 0;
  }
  objc_msgSend(v19, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D58]);
  -[PKDashboardMessagesView updateWithMessages:currentIndex:](v9, "updateWithMessages:currentIndex:", v12, self->_currentIndex);

}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKDashboardMessagesView *v11;
  PKDashboardMessagesView *v12;
  PKDashboardMessagesView *sampleMessageView;

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
      v11 = [PKDashboardMessagesView alloc];
      v12 = -[PKDashboardMessagesView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      sampleMessageView = self->_sampleMessageView;
      self->_sampleMessageView = v12;

    }
  }
}

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  id v7;
  id v8;
  NSString *currentIdentifier;
  unint64_t v10;
  id v11;

  objc_storeStrong((id *)&self->_currentIdentifier, a4);
  v7 = a4;
  v8 = a3;
  currentIdentifier = self->_currentIdentifier;
  objc_msgSend(v8, "messages");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[PKDashboardPassMessagePresenter _indexForIdentifier:inMessages:](self, "_indexForIdentifier:inMessages:", currentIdentifier, v11);
  self->_currentIndex = v10;

}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  id v5;
  void *v6;
  NSMutableDictionary *viewEventEnqueued;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  char v16;

  v5 = a4;
  if (objc_msgSend(v5, "type") == 2
    && (objc_msgSend(v5, "identifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    viewEventEnqueued = self->_viewEventEnqueued;
    if (!viewEventEnqueued)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_viewEventEnqueued;
      self->_viewEventEnqueued = v8;

      viewEventEnqueued = self->_viewEventEnqueued;
    }
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](viewEventEnqueued, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_viewEventEnqueued;
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

    }
    v16 = v12 ^ 1;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (unint64_t)_indexForIdentifier:(id)a3 inMessages:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKDashboardPassMessagePresenter__indexForIdentifier_inMessages___block_invoke;
  v9[3] = &unk_1E3E72470;
  v10 = v5;
  v6 = v5;
  v7 = objc_msgSend(a4, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __66__PKDashboardPassMessagePresenter__indexForIdentifier_inMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewEventEnqueued, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tablesViews, 0);
  objc_storeStrong((id *)&self->_sampleMessageView, 0);
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
