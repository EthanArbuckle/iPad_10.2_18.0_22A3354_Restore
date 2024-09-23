@implementation VUIDebugMetricsEventListViewController

- (VUIDebugMetricsEventListViewController)initWithEvents:(id)a3
{
  id v5;
  VUIDebugMetricsEventListViewController *v6;
  uint64_t v7;
  NSArray *allEvents;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIDebugMetricsEventListViewController;
  v6 = -[VUIDebugMetricsEventListViewController initWithStyle:](&v10, sel_initWithStyle_, 0);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    allEvents = v6->_allEvents;
    v6->_allEvents = (NSArray *)v7;

    objc_storeStrong((id *)&v6->_visibleEvents, a3);
    -[VUIDebugMetricsEventListViewController setTitle:](v6, "setTitle:", CFSTR("Events"));
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIDebugMetricsEventListViewController;
  -[VUIDebugMetricsEventListViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Select"), 0, self, sel_toggleValidationMode);
  -[VUIDebugMetricsEventListViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 1);

  -[VUIDebugMetricsEventListViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v3);

  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsSelectionDuringEditing:", 0);

  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsMultipleSelectionDuringEditing:", 1);

  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("EventCell"));

}

- (void)toggleValidationMode
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  if (-[VUIDebugMetricsEventListViewController isEditing](self, "isEditing"))
  {
    -[VUIDebugMetricsEventListViewController finishValidation](self, "finishValidation");
    -[VUIDebugMetricsEventListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
    -[VUIDebugMetricsEventListViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Select");
  }
  else
  {
    -[VUIDebugMetricsEventListViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
    -[VUIDebugMetricsEventListViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Validate");
  }
  objc_msgSend(v4, "setTitle:", v6);

  -[VUIDebugMetricsEventListViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyle:", 2);

}

- (void)finishValidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  VUIDebugMetricsEventListViewController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_156);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          -[NSArray objectAtIndex:](self->_visibleEvents, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "row"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "rawEvent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_2;
    v16[3] = &unk_1E9FA4DA0;
    v17 = v7;
    v18 = v6;
    v19 = self;
    v14 = v6;
    v15 = v7;
    +[VUIDebugMetricsEventValidator validateEvents:forRuleset:withCompletion:](VUIDebugMetricsEventValidator, "validateEvents:forRuleset:withCompletion:", v14, CFSTR("com.apple.amp.ae.validator.manifest.Video.AllRulesets"), v16);

  }
}

uint64_t __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLong:", objc_msgSend(a2, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "numberWithLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compare:", v6);

  return v10;
}

void __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD block[6];
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v3 = 0;
    v18 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v4);
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v3 + v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", CFSTR("eventType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUIDebugMetricsEventValidator validationResults:fromIndex:](VUIDebugMetricsEventValidator, "validationResults:fromIndex:", v19, v3 + v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForKey:", CFSTR("passedRulesets"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        objc_msgSend(v8, "valueForKey:", CFSTR("filteredRulesets"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        objc_msgSend(v8, "valueForKey:", CFSTR("failedRulesets"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Validation Rulesets for %@: –  %lu Failed , %lu Passed , %lu N/A"), v7, v14, v10, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_3;
        block[3] = &unk_1E9FA4D78;
        block[4] = *(_QWORD *)(a1 + 48);
        block[5] = v5;
        v22 = v15;
        v23 = v14;
        v16 = v15;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        ++v4;
      }
      while (v20 != v4);
      v3 += v4;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

void __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSubhead3LabelStr:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubhead3LabelColor:", v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_visibleEvents, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *visibleEvents;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("EventCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  visibleEvents = self->_visibleEvents;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](visibleEvents, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEventTypeLabelStr:", v11);

  objc_msgSend(v10, "eventType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("page")) & 1) != 0)
    objc_msgSend(v10, "sortedPageKeys");
  else
    objc_msgSend(v10, "sortedPrimaryKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndex:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "isEqualToString:", CFSTR("impresions"));
  if (v14)
  {
    -[VUIDebugMetricsEventListViewController _formatKeyAndValue:fromEvent:](self, "_formatKeyAndValue:fromEvent:", v14, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v26 = (void *)v15;
  if (v15)
  {
    -[VUIDebugMetricsEventListViewController _formatKeyAndValue:fromEvent:](self, "_formatKeyAndValue:fromEvent:", v15, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v18, "setDateFormat:", CFSTR("h:mm:ss a"));
  objc_msgSend(v10, "eventDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eventTime: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_19;
    goto LABEL_18;
  }
  v21 = 0;
  if (v16)
LABEL_18:
    objc_msgSend(v7, "setSubhead1LabelStr:", v16);
LABEL_19:
  if (v17)
    objc_msgSend(v7, "setSubhead2LabelStr:", v17);
  v27 = v13;
  if (v21)
    objc_msgSend(v7, "setSubhead3LabelStr:", v21);
  objc_msgSend(v10, "pageContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugMetricsEventListViewController _imageFromPageContext:](self, "_imageFromPageContext:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTabImage:", v23);
  if (v23)
  {
    objc_msgSend(v7, "setTabName:", 0);
  }
  else
  {
    objc_msgSend(v10, "pageContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTabName:", v24);

  }
  return v7;
}

- (id)_formatKeyAndValue:(id)a3 fromEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("impressions")))
  {
    objc_msgSend(v5, "rawData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lu impressions"), v6, objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "rawData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@"), v6, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  VUIDebugMetricsEventViewController *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((-[VUIDebugMetricsEventListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_visibleEvents, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIDebugMetricsEventViewController initWithEvent:]([VUIDebugMetricsEventViewController alloc], "initWithEvent:", v5);
    -[VUIDebugMetricsEventListViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 110.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t k;
  uint64_t v35;
  _BOOL8 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v46;
  VUIDebugMetricsEventListViewController *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("all"));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v47 = self;
  -[VUIDebugMetricsEventListViewController allEvents](self, "allEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v12, "eventType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "eventType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v9);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[VUIDebugMetricsEventListViewController visibleEvents](v47, "visibleEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v21, "eventType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v6, "containsObject:", v22);

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v21, "eventType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v24);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v18);
  }

  v25 = (void *)objc_msgSend(v5, "copy");
  -[VUIDebugMetricsEventListViewController setButtonsInHeader:](v47, "setButtonsInHeader:", v25);

  v26 = (void *)objc_msgSend(v6, "copy");
  -[VUIDebugMetricsEventListViewController setButtonsInHeaderSelected:](v47, "setButtonsInHeaderSelected:", v26);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v27 = v5;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v49;
    v32 = *MEMORY[0x1E0C9D820];
    v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(v27);
        v35 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
        v36 = 1;
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1, v46);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTarget:action:forControlEvents:", v47, sel__buttonClicked_, 64);
        objc_msgSend(v37, "setTitle:forState:", v35, 0);
        if ((objc_msgSend(v6, "containsObject:", v35) & 1) == 0)
        {
          v38 = objc_msgSend(v27, "count") - 1;
          v36 = v38 == objc_msgSend(v6, "count");
        }
        objc_msgSend(v37, "setSelected:", v36);
        objc_msgSend(v37, "sizeThatFits:", v32, v33);
        objc_msgSend(v37, "setExclusiveTouch:", 1);
        objc_msgSend(v37, "setTag:", v30 + k);
        objc_msgSend(v46, "addObject:", v37);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      v30 += k;
    }
    while (v29);
  }

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v46);
  objc_msgSend(v39, "setAlignment:", 3);
  objc_msgSend(v39, "setDistribution:", 3);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v42 = v41;

  objc_msgSend(v39, "setFrame:", 48.0, 0.0, v42 + -96.0, 35.0);
  v43 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v44 = (void *)objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v44, "addSubview:", v39);

  return v44;
}

- (void)_buttonClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v18 = a3;
  -[VUIDebugMetricsEventListViewController buttonsInHeader](self, "buttonsInHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v18, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setSelected:", objc_msgSend(v18, "isSelected") ^ 1);
  -[VUIDebugMetricsEventListViewController buttonsInHeaderSelected](self, "buttonsInHeaderSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v18, "isSelected"))
    objc_msgSend(v7, "addObject:", v5);
  else
    objc_msgSend(v7, "removeObject:", v5);
  v8 = (void *)objc_msgSend(v7, "copy");
  -[VUIDebugMetricsEventListViewController setButtonsInHeaderSelected:](self, "setButtonsInHeaderSelected:", v8);

  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  v10 = objc_msgSend(v18, "tag");
  -[VUIDebugMetricsEventListViewController allEvents](self, "allEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VUIDebugMetricsEventListViewController allEvents](self, "allEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__VUIDebugMetricsEventListViewController__buttonClicked___block_invoke;
    v19[3] = &unk_1E9FA4DC8;
    v19[4] = self;
    objc_msgSend(v12, "indexesOfObjectsPassingTest:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectsAtIndexes:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  -[VUIDebugMetricsEventListViewController setVisibleEvents:](self, "setVisibleEvents:", v11);
  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadSections:withRowAnimation:", v16, 5);

  -[VUIDebugMetricsEventListViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endUpdates");

}

uint64_t __57__VUIDebugMetricsEventListViewController__buttonClicked___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "buttonsInHeaderSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

- (id)_imageFromPageContext:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("watchnow")) & 1) != 0)
  {
    v4 = CFSTR("play.circle.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("movies")) & 1) != 0)
  {
    v4 = CFSTR("film.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tv")) & 1) != 0)
  {
    v4 = CFSTR("tv.inset.filled");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("library")) & 1) != 0)
  {
    v4 = CFSTR("rectangle.stack.fill");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("search")))
  {
    v4 = CFSTR("magnifyingglass");
  }
  else
  {
    v4 = CFSTR("nil");
  }
  if (-[__CFString length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)visibleEvents
{
  return self->_visibleEvents;
}

- (void)setVisibleEvents:(id)a3
{
  objc_storeStrong((id *)&self->_visibleEvents, a3);
}

- (NSArray)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
  objc_storeStrong((id *)&self->_allEvents, a3);
}

- (NSArray)buttonsInHeader
{
  return self->_buttonsInHeader;
}

- (void)setButtonsInHeader:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsInHeader, a3);
}

- (NSArray)buttonsInHeaderSelected
{
  return self->_buttonsInHeaderSelected;
}

- (void)setButtonsInHeaderSelected:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsInHeaderSelected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsInHeaderSelected, 0);
  objc_storeStrong((id *)&self->_buttonsInHeader, 0);
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_visibleEvents, 0);
}

@end
