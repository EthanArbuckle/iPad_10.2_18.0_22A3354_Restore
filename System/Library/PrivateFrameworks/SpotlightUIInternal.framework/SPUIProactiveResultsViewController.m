@implementation SPUIProactiveResultsViewController

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  objc_super v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
    v9 = 1;
  else
    v9 = v5;
  v10.receiver = self;
  v10.super_class = (Class)SPUIProactiveResultsViewController;
  -[SearchUIResultsViewController updateWithResultSections:resetScrollPoint:animated:](&v10, sel_updateWithResultSections_resetScrollPoint_animated_, v8, v6, v9);

}

- (unint64_t)refreshResultsWithContext:(id)a3 allowPartialUpdates:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint8_t v40[16];
  uint8_t buf[16];

  v6 = a3;
  -[SPUIResultsViewController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SPUIResultsViewController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SPUIResultsViewController model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4
        || (-[SearchUIResultsViewController sections](self, "sections"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            !v12))
      {
        v35 = MEMORY[0x24BEB0818];
        v36 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
        if (!v36)
        {
          SPUIInitLogging();
          v36 = *(NSObject **)(v35 + 40);
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E078000, v36, OS_LOG_TYPE_DEFAULT, "Fetching full proactive results.", buf, 2u);
        }
        objc_msgSend(v10, "updateWithQueryContext:", v6);
      }
      else
      {
        v13 = MEMORY[0x24BEB0818];
        v14 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
        if (!v14)
        {
          SPUIInitLogging();
          v14 = *(NSObject **)(v13 + 40);
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_22E078000, v14, OS_LOG_TYPE_DEFAULT, "Refreshing proactive results.", v40, 2u);
        }
        objc_msgSend(v10, "refreshWithQueryContext:", v6);
      }
      objc_msgSend(v10, "queryTask");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "query");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v38, "queryIdent");

    }
    else
    {
      v25 = MEMORY[0x24BEB0818];
      v26 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
      if (!v26)
      {
        SPUIInitLogging();
        v26 = *(NSObject **)(v25 + 40);
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[SPUIProactiveResultsViewController refreshResultsWithContext:allowPartialUpdates:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
      -[SPUIResultsViewController model](self, "model");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "updateWithQueryContext:", v6);

      v24 = 0;
    }
  }
  else
  {
    v15 = MEMORY[0x24BEB0818];
    v16 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
    if (!v16)
    {
      SPUIInitLogging();
      v16 = *(NSObject **)(v15 + 40);
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SPUIProactiveResultsViewController refreshResultsWithContext:allowPartialUpdates:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v24 = -1;
  }

  return v24;
}

void __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BE85288];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke_2;
  v5[3] = &unk_24F9D5EE8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v4, "performAnimatableChanges:", v5);
  objc_msgSend(v3, "invalidate");
  objc_destroyWeak(&v6);

}

- (SPUIProactiveResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPUIProactiveResultsViewController;
  return -[SPUIResultsViewController initWithSearchModel:searchEntity:](&v5, sel_initWithSearchModel_searchEntity_, a3, a4);
}

void __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "footerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)searchAgentUpdatedResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  -[SearchUIResultsViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[SearchUIResultsViewController footerView](self, "footerView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SearchUIResultsViewController sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v4, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 < v12)
    {
      -[SearchUIResultsViewController footerView](self, "footerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 0.0);

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SPUIProactiveResultsViewController;
  -[SPUIResultsViewController searchAgentUpdatedResults:](&v17, sel_searchAgentUpdatedResults_, v4);
  if (objc_msgSend(v4, "queryPartiallyComplete"))
  {
    objc_msgSend(v4, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      if (!v6)
      {
        -[SPUIProactiveResultsViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layoutBelowIfNeeded");

      }
    }
  }
  -[SPUIProactiveResultsViewController fadeInFooterView](self, "fadeInFooterView");

}

- (void)setFooterView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  -[SPUIProactiveResultsViewController footerTransitionTimer](self, "footerTransitionTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
    objc_msgSend(v4, "setAlpha:", 0.0);
  -[SearchUIResultsViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    objc_msgSend(v4, "setAlpha:", 0.0);
  v11.receiver = self;
  v11.super_class = (Class)SPUIProactiveResultsViewController;
  -[SearchUIResultsViewController setFooterView:](&v11, sel_setFooterView_, v4);
  -[SearchUIResultsViewController sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[SPUIProactiveResultsViewController fadeInFooterView](self, "fadeInFooterView");

}

- (void)fadeInFooterView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  -[SearchUIResultsViewController footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 < 1.0)
  {
    -[SPUIProactiveResultsViewController footerTransitionTimer](self, "footerTransitionTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x24BDBCF40];
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __54__SPUIProactiveResultsViewController_fadeInFooterView__block_invoke;
    v12 = &unk_24F9D5F38;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v9, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIProactiveResultsViewController setFooterTransitionTimer:](self, "setFooterTransitionTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (NSTimer)footerTransitionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setFooterTransitionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (BOOL)searchAgentHasWindow:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "applicationState") == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTransitionTimer, 0);
}

- (void)refreshResultsWithContext:(uint64_t)a3 allowPartialUpdates:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E078000, a1, a3, "Warning: proactive model of value 'nil' cannot be refreshed!", a5, a6, a7, a8, 0);
}

- (void)refreshResultsWithContext:(uint64_t)a3 allowPartialUpdates:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E078000, a1, a3, "Warning: proactive model of type other than SPUISearchModelZKW is not supported!", a5, a6, a7, a8, 0);
}

@end
