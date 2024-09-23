@implementation WFWidgetGridView

- (WFWidgetGridView)initWithFamily:(int64_t)a3 widgetType:(int64_t)a4 cornerRadius:(double)a5 log:(id)a6
{
  id v11;
  WFWidgetGridView *v12;
  WFWidgetGridView *v13;
  WFWidgetGridView *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)WFWidgetGridView;
  v12 = -[WFWidgetGridView init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_family = a3;
    v12->_widgetType = a4;
    v12->_cornerRadius = a5;
    objc_storeStrong((id *)&v12->_log, a6);
    v14 = v13;
  }

  return v13;
}

- (void)disableAllCellsExceptCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFWidgetGridView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "workflowIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "workflowIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
          objc_msgSend(v10, "setEnabled:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)enableAllCells
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFWidgetGridView subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "workflowIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v7, "setEnabled:", 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)tintWithHomeScreenTintColor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  WFWidgetGridView *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WFWidgetGridView log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_DEFAULT, "<%p %@> Received home screen tint color %@", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFWidgetGridView subviews](self, "subviews", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v14, "setHomeScreenTintColor:", v5);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)cellForWorkflowWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFWidgetGridView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v10, "workflowIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

          v10 = 0;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)workflowIdentifiersForVisibleCells
{
  void *v2;
  void *v3;

  -[WFWidgetGridView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_1531);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutWithWorkflows:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  WFWidgetGridView *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  char v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  NSObject *v38;
  double v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  WFWidgetGridView *v46;
  double v47;
  double v48;
  WFWidgetCell *v49;
  void *v50;
  double v51;
  double v52;
  int64_t v53;
  int64_t v54;
  void *v55;
  char v56;
  BOOL v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  int v64;
  double size;
  void *v66;
  uint64_t v67;
  _QWORD v68[4];
  WFWidgetCell *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint8_t buf[4];
  WFWidgetGridView *v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  _BYTE v81[24];
  uint64_t v82;
  CGSize v83;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWidgetGridView lastKnownSize](self, "lastKnownSize");
  v9 = v8 == *(double *)(MEMORY[0x24BDBF148] + 8) && v7 == *MEMORY[0x24BDBF148];
  -[WFWidgetGridView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  -[WFWidgetGridView lastKnownSize](self, "lastKnownSize");
  v16 = v13 == v15 && v11 == v14;
  -[WFWidgetGridView workflows](self, "workflows");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v4;
  if (objc_msgSend(v4, "isEqualToArray:", v17) && v16)
  {
    -[WFWidgetGridView lastKnownContentSizeCategory](self, "lastKnownContentSizeCategory");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    v20 = v19;
    if (v18 == v19)
    {

      goto LABEL_68;
    }
    if (v19 && v18)
    {
      v21 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v21 & 1) != 0)
        goto LABEL_68;
      goto LABEL_17;
    }

  }
LABEL_17:
  -[WFWidgetGridView setWorkflows:](self, "setWorkflows:", v66);
  v67 = objc_msgSend(v66, "count");
  -[WFWidgetGridView bounds](self, "bounds");
  v23 = v22;
  size = v24;
  -[WFWidgetGridView setLastKnownSize:](self, "setLastKnownSize:", v24, v22);
  -[WFWidgetGridView setLastKnownContentSizeCategory:](self, "setLastKnownContentSizeCategory:", v6);
  -[WFWidgetGridView log](self, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x212B97348](-[WFWidgetGridView family](self, "family"));
    v26 = (WFWidgetGridView *)objc_claimAutoreleasedReturnValue();
    v83.width = size;
    v83.height = v23;
    NSStringFromCGSize(v83);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v75 = v26;
    v76 = 2114;
    v77 = *(double *)&v27;
    v78 = 2048;
    v79 = *(double *)&v67;
    _os_log_impl(&dword_20CE0F000, v25, OS_LOG_TYPE_DEFAULT, "Starting a %{public}@ layout in bounds: %{public}@, item count: %lu", buf, 0x20u);

  }
  v62 = v6;
  if (-[WFWidgetGridView widgetType](self, "widgetType") == 2)
  {
    v28 = -[WFWidgetGridView family](self, "family");
    v29 = v28;
    switch(v28)
    {
      case 1:
        v30 = 0;
        v64 = 1;
        v31 = 8.0;
        v32 = 2;
        break;
      case 2:
      case 4:
        v64 = 0;
        v30 = 1;
        v31 = 8.0;
        v32 = v28;
        break;
      case 3:
        v64 = 0;
        v30 = 1;
        v31 = 8.0;
        v29 = 2;
        v32 = 4;
        break;
      default:
        v30 = 0;
        v32 = 1;
        v31 = 0.0;
        goto LABEL_25;
    }
  }
  else
  {
    v31 = 0.0;
    if (-[WFWidgetGridView widgetType](self, "widgetType") == 1)
      -[WFWidgetGridView family](self, "family");
    v30 = 0;
    v32 = 1;
LABEL_25:
    v64 = 1;
    v29 = 1;
  }
  v33 = (size - v31 * (double)(v29 + 1)) / (double)v29;
  v34 = (v23 - v31) / (double)v32;
  -[WFWidgetGridView traitCollection](self, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "layoutDirection");

  if (v36 == 1)
    v37 = v33 + v31 * 2.0;
  else
    v37 = v31;
  if (-[WFWidgetGridView family](self, "family") == 1)
    v37 = v31;
  -[WFWidgetGridView log](self, "log");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    v75 = (WFWidgetGridView *)v32;
    v76 = 2048;
    v77 = *(double *)&v29;
    v78 = 2048;
    v79 = v31;
    v80 = 1024;
    *(_DWORD *)v81 = v36 == 1;
    *(_WORD *)&v81[4] = 2048;
    *(double *)&v81[6] = v37;
    *(_WORD *)&v81[14] = 2048;
    *(double *)&v81[16] = v31;
    _os_log_impl(&dword_20CE0F000, v38, OS_LOG_TYPE_DEFAULT, "Grid will layout with %li rows, %li columns, %f padding, isRTL: %i. Starting at %f, %f", buf, 0x3Au);
  }
  v39 = v34 - v31;

  -[WFWidgetGridView log](self, "log");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetGridView homeScreenTintColor](self, "homeScreenTintColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v75 = self;
    v76 = 2112;
    v77 = *(double *)&v42;
    v78 = 2112;
    v79 = *(double *)&v43;
    _os_log_impl(&dword_20CE0F000, v40, OS_LOG_TYPE_DEFAULT, "<%p %@> Configuring cells with home screen tint color %@", buf, 0x20u);

  }
  v44 = v9 || v16;
  v45 = v29 * v32;

  v46 = 0;
  v47 = v31 + v39;
  v63 = v30 ^ 1;
  v48 = v31;
  do
  {
    -[WFWidgetGridView cellAtIndex:](self, "cellAtIndex:", v46);
    v49 = (WFWidgetCell *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v49 = objc_alloc_init(WFWidgetCell);
      -[WFWidgetCell setDelegate:](v49, "setDelegate:", self);
    }
    if ((uint64_t)v46 >= v67)
    {
      v50 = 0;
    }
    else
    {
      objc_msgSend(v66, "objectAtIndex:", v46);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFWidgetGridView cornerRadius](self, "cornerRadius");
    v52 = v51 - v31;
    v53 = -[WFWidgetGridView widgetType](self, "widgetType");
    v54 = -[WFWidgetGridView family](self, "family");
    -[WFWidgetGridView homeScreenTintColor](self, "homeScreenTintColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell configureWithWorkflow:cornerRadius:widgetType:family:homeScreenTintColor:](v49, "configureWithWorkflow:cornerRadius:widgetType:family:homeScreenTintColor:", v50, v53, v54, v55, v52);

    if (v46)
    {
      if (v36 == 1)
      {
        if (v64)
        {
          v48 = v47 + v48;
          v37 = v31;
        }
        else
        {
          v57 = v37 - v33 - v31 == v31;
          if (v37 - v33 - v31 == v31)
            v37 = v31;
          else
            v37 = v33 + v31 * 2.0;
          if (!v57)
            v48 = v47 + v48;
        }
      }
      else
      {
        if (v31 + v33 + v37 >= size)
          v56 = 1;
        else
          v56 = v63;
        if ((v56 & 1) != 0)
          v37 = v31;
        else
          v37 = v31 + v33 + v37;
        if ((v56 & 1) != 0)
          v48 = v47 + v48;
      }
    }
    if (!-[WFWidgetGridView cellExistsAtIndex:](self, "cellExistsAtIndex:", v46))
      -[WFWidgetGridView addSubview:](self, "addSubview:", v49);
    -[WFWidgetGridView log](self, "log");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = -[WFWidgetCell enabled](v49, "enabled");
      *(_DWORD *)buf = 134219264;
      v75 = v46;
      v76 = 2048;
      v77 = v37;
      v78 = 2048;
      v79 = v48;
      v80 = 2048;
      *(double *)v81 = v33;
      *(_WORD *)&v81[8] = 2048;
      *(double *)&v81[10] = v39;
      *(_WORD *)&v81[18] = 1024;
      *(_DWORD *)&v81[20] = v59;
      _os_log_impl(&dword_20CE0F000, v58, OS_LOG_TYPE_DEFAULT, "Placing cell %li at {%f, %f}, w: %f, h: %f, cell enabled: %i", buf, 0x3Au);
    }

    if (v44)
    {
      -[WFWidgetCell setFrame:](v49, "setFrame:", v37, v48, v33, v39);
    }
    else
    {
      v60 = (void *)MEMORY[0x24BEBDB00];
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __40__WFWidgetGridView_layoutWithWorkflows___block_invoke;
      v68[3] = &unk_24C5AB778;
      v69 = v49;
      v70 = v37;
      v71 = v48;
      v72 = v33;
      v73 = v39;
      objc_msgSend(v60, "animateWithDuration:animations:", v68, 0.3);

    }
    v46 = (WFWidgetGridView *)((char *)v46 + 1);
  }
  while ((WFWidgetGridView *)v45 != v46);
  -[WFWidgetGridView delegate](self, "delegate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "gridViewDidFinishLayout:", self);

  v6 = v62;
LABEL_68:

}

- (BOOL)cellExistsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[WFWidgetGridView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[WFWidgetGridView subviews](self, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") - 1 >= a3;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)cellAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[WFWidgetGridView cellExistsAtIndex:](self, "cellExistsAtIndex:"))
  {
    -[WFWidgetGridView subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)widgetCellWasTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWidgetGridView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridView:didTapCell:", self, v4);

}

- (void)widgetCellDidTransitionToState:(int64_t)a3
{
  id v5;

  if (a3 == 3 || !a3)
    -[WFWidgetGridView enableAllCells](self, "enableAllCells");
  -[WFWidgetGridView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridView:cellDidTransitionToRunningState:", self, a3);

}

- (WFWidgetGridViewDelegate)delegate
{
  return (WFWidgetGridViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)workflows
{
  return self->_workflows;
}

- (void)setWorkflows:(id)a3
{
  objc_storeStrong((id *)&self->_workflows, a3);
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setHomeScreenTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
}

- (CGSize)lastKnownSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastKnownSize.width;
  height = self->_lastKnownSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastKnownSize:(CGSize)a3
{
  self->_lastKnownSize = a3;
}

- (int64_t)family
{
  return self->_family;
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSString)lastKnownContentSizeCategory
{
  return self->_lastKnownContentSizeCategory;
}

- (void)setLastKnownContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownContentSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_workflows, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __40__WFWidgetGridView_layoutWithWorkflows___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __54__WFWidgetGridView_workflowIdentifiersForVisibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "workflowIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
