@implementation VUIDebugMetricsEventValidatorTableViewController

- (VUIDebugMetricsEventValidatorTableViewController)initWithEvent:(id)a3
{
  id v5;
  VUIDebugMetricsEventValidatorTableViewController *v6;
  VUIDebugMetricsEventValidatorTableViewController *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIDebugMetricsEventValidatorTableViewController;
  v6 = -[VUIDebugMetricsEventValidatorTableViewController initWithStyle:](&v14, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    objc_initWeak(&location, v7);
    -[VUIDebugMetricsEventValidatorTableViewController tableView](v7, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("validateCell"));

    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__VUIDebugMetricsEventValidatorTableViewController_initWithEvent___block_invoke;
    v11[3] = &unk_1E9F9EF30;
    objc_copyWeak(&v12, &location);
    +[VUIDebugMetricsEventValidator validateEvents:forRuleset:withCompletion:](VUIDebugMetricsEventValidator, "validateEvents:forRuleset:withCompletion:", v9, CFSTR("com.apple.amp.ae.validator.manifest.Video.AllRulesets"), v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __66__VUIDebugMetricsEventValidatorTableViewController_initWithEvent___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  +[VUIDebugMetricsEventValidator validationResults:fromIndex:](VUIDebugMetricsEventValidator, "validationResults:fromIndex:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_reloadResults:", v4);
}

- (void)_reloadResults:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VUIDebugMetricsEventValidatorTableViewController__reloadResults___block_invoke;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__VUIDebugMetricsEventValidatorTableViewController__reloadResults___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id WeakRetained;
  uint64_t v33;
  id obj;
  id obja;
  id objb;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  _QWORD v50[4];
  _BYTE v51[128];
  _QWORD v52[4];
  _QWORD v53[4];
  _BYTE v54[128];
  _QWORD v55[4];
  _QWORD v56[4];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = a1;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("failedRulesets"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v46;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        v55[0] = CFSTR("title");
        objc_msgSend(v7, "valueForKey:", CFSTR("ruleset"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v8;
        v55[1] = CFSTR("failedRules");
        objc_msgSend(v7, "valueForKey:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v9;
        v55[2] = CFSTR("passedRules");
        objc_msgSend(v7, "valueForKey:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v10;
        v55[3] = CFSTR("filteredRules");
        objc_msgSend(v7, "valueForKey:", CFSTR("filteredRules"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v56[3] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v4);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(*(id *)(v33 + 32), "valueForKey:", CFSTR("passedRulesets"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  v14 = MEMORY[0x1E0C9AA60];
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v42;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obja);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
        v52[0] = CFSTR("title");
        objc_msgSend(v18, "valueForKey:", CFSTR("ruleset"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v19;
        v53[1] = v14;
        v52[1] = CFSTR("failedRules");
        v52[2] = CFSTR("passedRules");
        objc_msgSend(v18, "valueForKey:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v53[2] = v20;
        v52[3] = CFSTR("filteredRules");
        objc_msgSend(v18, "valueForKey:", CFSTR("filteredRules"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v53[3] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v22);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v15);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(v33 + 32), "valueForKey:", CFSTR("filteredRulesets"));
  objb = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(objb);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v26);
        v49[0] = CFSTR("title");
        objc_msgSend(v27, "valueForKey:", CFSTR("ruleset"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v28;
        v50[1] = v14;
        v49[1] = CFSTR("failedRules");
        v49[2] = CFSTR("passedRules");
        v50[2] = v14;
        v49[3] = CFSTR("filteredRules");
        objc_msgSend(v27, "valueForKey:", CFSTR("filteredRules"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v50[3] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v30);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v24);
  }

  objc_msgSend(WeakRetained, "setResults:", v2);
  objc_msgSend(WeakRetained, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[VUIDebugMetricsEventValidatorTableViewController results](self, "results", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;
  void *v7;
  void *v8;
  uint64_t v9;

  result = -[NSArray count](self->_results, "count", a3);
  if (result)
  {
    -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("failedRules"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    return v9 + 2;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  void *v58;
  id obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("validateCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "section");
  v9 = objc_msgSend(v6, "row");
  -[VUIDebugMetricsEventValidatorTableViewController results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("failedRules"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v9 == v13)
  {
    v57 = v6;
    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", CFSTR("Passed Rules"));

    v58 = v7;
    objc_msgSend(v7, "detailTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 0);

    -[VUIDebugMetricsEventValidatorTableViewController results](self, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("passedRules"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v19)
    {
      v20 = v19;
      v21 = &stru_1E9FF3598;
      v22 = *(_QWORD *)v66;
      do
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v66 != v22)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v23), "valueForKey:", CFSTR("ruleLabel"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\", "), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v26);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v20);
      goto LABEL_20;
    }
  }
  else
  {
    if (v9 != v13 + 1)
    {
      -[VUIDebugMetricsEventValidatorTableViewController results](self, "results");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", v8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "valueForKey:", CFSTR("failedRules"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", v9);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "valueForKey:", CFSTR("ruleLabel"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setText:", v42);

      objc_msgSend(v41, "valueForKey:", CFSTR("onFailMapList"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "count"))
      {
        objc_msgSend(v41, "valueForKey:", CFSTR("onFailMapList"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "description");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsSeparatedByCharactersInSet:", v48);
        obja = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(obja, "componentsJoinedByString:", &stru_1E9FF3598);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "valueForKey:", CFSTR("ruleResult"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v50, v49);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "detailTextLabel");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v52 = v42;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setTextColor:", v53);

        v42 = v52;
      }
      else
      {
        v21 = &stru_1E9FF3598;
      }

      goto LABEL_25;
    }
    v57 = v6;
    v58 = v7;
    objc_msgSend(v7, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", CFSTR("Filtered Rules"));

    -[VUIDebugMetricsEventValidatorTableViewController results](self, "results");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKey:", CFSTR("filteredRules"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v31)
    {
      v32 = v31;
      v21 = &stru_1E9FF3598;
      v33 = *(_QWORD *)v62;
      do
      {
        v34 = 0;
        v35 = v21;
        do
        {
          if (*(_QWORD *)v62 != v33)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v34), "valueForKey:", CFSTR("ruleLabel"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\", "), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v35, "stringByAppendingString:", v37);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v34;
          v35 = v21;
        }
        while (v32 != v34);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v32);
      goto LABEL_20;
    }
  }
  v21 = &stru_1E9FF3598;
LABEL_20:

  v6 = v57;
  v7 = v58;
LABEL_25:
  objc_msgSend(v7, "detailTextLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setNumberOfLines:", 0);

  if (!-[__CFString length](v21, "length"))
  {

    v21 = CFSTR("none");
  }
  objc_msgSend(v7, "detailTextLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setText:", v21);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VUIDebugMetricsEventValidatorTableViewController results](self, "results", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIDebugMetricsEventValidator removeGladiatorPrefix:](VUIDebugMetricsEventValidator, "removeGladiatorPrefix:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
