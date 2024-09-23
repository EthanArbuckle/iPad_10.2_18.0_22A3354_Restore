@implementation StockPlatterViewController

- (StockPlatterViewController)initWithStockTicker:(id)a3
{
  id v5;
  StockPlatterViewController *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  StockChartView *v36;
  void *v37;
  void *v38;
  StockChartView *v39;
  void *v40;
  void *v42;
  objc_super v43;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StockPlatterViewController.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stockTicker.length > 0"));

  }
  v43.receiver = self;
  v43.super_class = (Class)StockPlatterViewController;
  v6 = -[StockPlatterViewController init](&v43, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    +[StocksLayout layoutForSize:](StocksLayout, "layoutForSize:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockPlatterViewController setLayout:](v6, "setLayout:", v10);

    +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("chartInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
    else
      v13 = 4;
    v6->_chartInterval = v13;
    +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("rowDataType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
    else
      v16 = 1;
    v6->_rowDataType = v16;
    -[StockPlatterViewController layout](v6, "layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "chartDisplayMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[StockPlatterViewController layout](v6, "layout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chartViewFrame");
    v21 = v20;
    v23 = v22;

    objc_msgSend(v18, "intervalRowHeight");
    v25 = v23 - v24;
    objc_msgSend(v18, "setChartRenderingInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    objc_msgSend(v18, "setChartSize:", v21, v25);
    objc_msgSend(v18, "setGraphOverlapsYAxisLabels:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setXAxisKeylineColor:", v26);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAxisLabelsColor:", v27);

    v28 = (void *)objc_opt_new();
    -[StockPlatterViewController setStatusBarView:](v6, "setStatusBarView:", v28);

    v29 = objc_alloc(MEMORY[0x24BDF6E58]);
    v30 = (void *)objc_msgSend(v29, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[StockPlatterViewController setStocksTableView:](v6, "setStocksTableView:", v30);

    -[StockPlatterViewController stocksTableView](v6, "stocksTableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", v6);

    -[StockPlatterViewController stocksTableView](v6, "stocksTableView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDataSource:", v6);

    -[StockPlatterViewController stocksTableView](v6, "stocksTableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSeparatorStyle:", 0);

    -[StockPlatterViewController stocksTableView](v6, "stocksTableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setRowHeight:", 56.0);

    -[StockPlatterViewController stocksTableView](v6, "stocksTableView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kStockPlatterViewControllerCellType"));

    v36 = [StockChartView alloc];
    -[StockPlatterViewController layout](v6, "layout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "chartDisplayMode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[StockChartView initWithInitialDisplayMode:preferredChartInterval:stockChartViewDelegate:](v36, "initWithInitialDisplayMode:preferredChartInterval:stockChartViewDelegate:", v38, -[StockPlatterViewController chartInterval](v6, "chartInterval"), v6);
    -[StockPlatterViewController setChartView:](v6, "setChartView:", v39);

    -[StockPlatterViewController setStockTicker:](v6, "setStockTicker:", v5);
    -[StockPlatterViewController stockTicker](v6, "stockTicker");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockPlatterViewController _setupStockWithTicker:](v6, "_setupStockWithTicker:", v40);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[StockPlatterViewController _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)StockPlatterViewController;
  -[StockPlatterViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  objc_super v102;
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _BYTE v106[128];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v102.receiver = self;
  v102.super_class = (Class)StockPlatterViewController;
  -[StockPlatterViewController viewDidLoad](&v102, sel_viewDidLoad);
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[StockPlatterViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  -[StockPlatterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v3, v4, v6, v8);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[StockPlatterViewController preferredContentSize](self, "preferredContentSize");
  v13 = v12;
  v15 = v14;
  -[StockPlatterViewController chartView](self, "chartView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v3, v4, v13, v15);

  -[StockPlatterViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v18);

  -[StockPlatterViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "backgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController stocksTableView](self, "stocksTableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  -[StockPlatterViewController chartView](self, "chartView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v23;
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v24;
  -[StockPlatterViewController stocksTableView](self, "stocksTableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v99 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[StockPlatterViewController view](self, "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSubview:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    }
    while (v28);
  }

  v109[0] = CFSTR("chartView");
  -[StockPlatterViewController chartView](self, "chartView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v33;
  v109[1] = CFSTR("tableView");
  -[StockPlatterViewController stocksTableView](self, "stocksTableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v34;
  v109[2] = CFSTR("statusBarView");
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v107[0] = CFSTR("TableViewHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 56.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = CFSTR("StatusBarHeight");
  v108[0] = v37;
  v108[1] = &unk_24D75F118;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[tableView(TableViewHeight)][chartView][statusBarView(StatusBarHeight)]|"), 512, v38, v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[chartView]|"), 0, v38, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v41);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[tableView]|"), 0, v38, v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v42);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[statusBarView]|"), 0, v38, v36);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v43);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v40);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController setAttributionButton:](self, "setAttributionButton:", v44);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setExclusiveTouch:", 1);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController netPreferences](self, "netPreferences");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "logoButtonImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_flatImageWithColor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:forState:", v50, 0);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController netPreferences](self, "netPreferences");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "logoButtonImage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "_flatImageWithColor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setImage:forState:", v55, 1);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addTarget:action:forControlEvents:", self, sel__attributionButtonPressed_, 64);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "accessibilitySetIdentification:", CFSTR("YahooButton"));

  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addSubview:", v59);

  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sizeToFit");

  v61 = (void *)objc_opt_new();
  -[StockPlatterViewController setExchangeStatusLabel:](self, "setExchangeStatusLabel:", v61);

  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController style](self, "style");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "lightFontOfSize:", 12.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFont:", v64);

  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.549019608, 0.560784314, 0.576470588, 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTextColor:", v66);

  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setBackgroundColor:", v68);

  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setTextAlignment:", 1);

  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAdjustsFontSizeToFitWidth:", 1);

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  -[StockPlatterViewController attributionButton](self, "attributionButton", 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v71;
  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v72;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v95 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
        objc_msgSend(v78, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[StockPlatterViewController statusBarView](self, "statusBarView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addSubview:", v78);

      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v75);
  }

  v103[0] = CFSTR("attributionButton");
  -[StockPlatterViewController attributionButton](self, "attributionButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = CFSTR("exchangeStatusLabel");
  v104[0] = v80;
  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v81;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-AttribButtonLeftMargin-[attributionButton]"), 1024, &unk_24D7603C8, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[attributionButton]|"), 0, &unk_24D7603C8, v82);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v85);

  v86 = (void *)MEMORY[0x24BDD1628];
  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v87, 9, 0, v88, 9, 1.0, 0.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v89);

  v90 = (void *)MEMORY[0x24BDD1628];
  -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 10, 0, v92, 10, 1.0, 0.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v93);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v84);
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[StockPlatterViewController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listViewFrame");
  v5 = v4;
  -[StockPlatterViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chartViewFrame");
  v8 = v7 + 56.0;
  -[StockPlatterViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusViewFrame");
  v11 = v8 + v10;

  v12 = v5;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NetPreferences)netPreferences
{
  NetPreferences *netPreferences;
  NetPreferences *v4;
  NetPreferences *v5;

  netPreferences = self->_netPreferences;
  if (!netPreferences)
  {
    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v4 = (NetPreferences *)objc_claimAutoreleasedReturnValue();
    v5 = self->_netPreferences;
    self->_netPreferences = v4;

    netPreferences = self->_netPreferences;
  }
  return netPreferences;
}

- (StocksStyle)style
{
  StocksStyle *style;
  StocksStyle *v4;
  StocksStyle *v5;

  style = self->_style;
  if (!style)
  {
    v4 = (StocksStyle *)objc_opt_new();
    v5 = self->_style;
    self->_style = v4;

    style = self->_style;
  }
  return style;
}

- (StockManager)stockManager
{
  StockManager *stockManager;
  StockManager *v4;
  StockManager *v5;

  stockManager = self->_stockManager;
  if (!stockManager)
  {
    v4 = (StockManager *)objc_opt_new();
    v5 = self->_stockManager;
    self->_stockManager = v4;

    stockManager = self->_stockManager;
  }
  return stockManager;
}

- (StockUpdateManager)stockUpdateManager
{
  StockUpdateManager *stockUpdateManager;
  StockUpdateManager *v4;
  StockUpdateManager *v5;

  stockUpdateManager = self->_stockUpdateManager;
  if (!stockUpdateManager)
  {
    v4 = (StockUpdateManager *)objc_opt_new();
    v5 = self->_stockUpdateManager;
    self->_stockUpdateManager = v4;

    stockUpdateManager = self->_stockUpdateManager;
  }
  return stockUpdateManager;
}

- (ChartUpdater)chartUpdater
{
  ChartUpdater *chartUpdater;
  ChartUpdater *v4;
  ChartUpdater *v5;

  chartUpdater = self->_chartUpdater;
  if (!chartUpdater)
  {
    v4 = (ChartUpdater *)objc_opt_new();
    v5 = self->_chartUpdater;
    self->_chartUpdater = v4;

    chartUpdater = self->_chartUpdater;
  }
  return chartUpdater;
}

- (StockFetcher)stockFetcher
{
  StockFetcher *stockFetcher;
  StockFetcher *v4;
  StockFetcher *v5;

  stockFetcher = self->_stockFetcher;
  if (!stockFetcher)
  {
    v4 = (StockFetcher *)objc_opt_new();
    v5 = self->_stockFetcher;
    self->_stockFetcher = v4;

    stockFetcher = self->_stockFetcher;
  }
  return stockFetcher;
}

- (void)updateChartForInterval:(int64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  id location;
  _QWORD v36[4];
  id v37;

  v5 = a4;
  -[StockPlatterViewController stock](self, "stock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController stocksTableView](self, "stocksTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController chartView](self, "chartView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController chartUpdater](self, "chartUpdater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke;
  v36[3] = &unk_24D74C268;
  v11 = v5;
  v37 = v11;
  v12 = (void *)MEMORY[0x219A0B984](v36);
  StocksLogForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[StockPlatterViewController updateChartForInterval:completion:].cold.1((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

  objc_initWeak(&location, self);
  -[StockPlatterViewController stockUpdateManager](self, "stockUpdateManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockPlatterViewController stock](self, "stock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_77;
  v28[3] = &unk_24D74C2B8;
  v22 = v12;
  v33 = v22;
  objc_copyWeak(v34, &location);
  v34[1] = (id)a3;
  v23 = v8;
  v29 = v23;
  v24 = v6;
  v30 = v24;
  v25 = v7;
  v31 = v25;
  v26 = v9;
  v32 = v26;
  objc_msgSend(v20, "updateStockBasicWithCompletion:withCompletion:", v21, v28);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      StocksLogForCategory(3);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_cold_1((uint64_t)v3, v5);

      v4 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }

}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_77(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 80);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "setChartInterval:", v4);

    v6 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v6, "_updateExchangeData");

    objc_msgSend(*(id *)(a1 + 32), "setStock:", *(_QWORD *)(a1 + 40));
    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSections:withRowAnimation:", v8, 0);

    StocksLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_77_cold_1(a1 + 40, v9, v10, v11, v12, v13, v14, v15);

    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 80);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_79;
    v21[3] = &unk_24D74C290;
    v18 = *(void **)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v22 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 80);
    v23 = v19;
    v25 = v20;
    objc_msgSend(v18, "updateChartForStock:interval:withCompletion:", v16, v17, v21);

  }
}

uint64_t __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_79(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  StocksLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_79_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

  if (!*(_QWORD *)(a1 + 32))
    NSLog(CFSTR("ChartView is nil!"));
  objc_msgSend(*(id *)(a1 + 40), "chartDataForInterval:", *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setChartData:", v12);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_setupStockWithTicker:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[StockPlatterViewController stockFetcher](self, "stockFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__StockPlatterViewController__setupStockWithTicker___block_invoke;
  v6[3] = &unk_24D74C2E0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchStockWithSymbol:completionHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __52__StockPlatterViewController__setupStockWithTicker___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "setStockFetcher:", 0);

    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "setStock:", v3);

    objc_msgSend(v3, "setTransient:", 1);
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "updateChartForInterval:completion:", objc_msgSend(v6, "chartInterval"), 0);

  }
}

- (void)_updateExchangeData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[StockPlatterViewController stock](self, "stock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "marketStatusDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[StockPlatterViewController exchangeStatusLabel](self, "exchangeStatusLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

  }
  -[StockPlatterViewController statusBarView](self, "statusBarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)_cleanup
{
  void *v3;

  +[ChartLabelInfoManager clearSharedManager](ChartLabelInfoManager, "clearSharedManager");
  +[GraphRenderer clearSharedRenderer](GraphRenderer, "clearSharedRenderer");
  +[NetPreferences clearSharedPreferences](NetPreferences, "clearSharedPreferences");
  +[StocksPreferences clearSharedPreferences](StocksPreferences, "clearSharedPreferences");
  +[StockManager clearSharedManager](StockManager, "clearSharedManager");
  -[StockPlatterViewController setNetPreferences:](self, "setNetPreferences:", 0);
  -[StockPlatterViewController chartUpdater](self, "chartUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAndInvalidate");

  -[StockPlatterViewController setChartUpdater:](self, "setChartUpdater:", 0);
  -[StockPlatterViewController setStockUpdateManager:](self, "setStockUpdateManager:", 0);
  -[StockPlatterViewController setStockManager:](self, "setStockManager:", 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("kStockPlatterViewControllerCellType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRowDataType:", -[StockPlatterViewController rowDataType](self, "rowDataType"));
  objc_msgSend(v8, "setShowsRowSeparator:", 0);
  -[StockPlatterViewController stock](self, "stock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStock:", v9);

  objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);
  return v8;
}

- (BOOL)stockChartViewIsCurrentChartView:(id)a3
{
  return 1;
}

- (void)_attributionButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[StockPlatterViewController stock](self, "stock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[StockPlatterViewController netPreferences](self, "netPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockPlatterViewController stock](self, "stock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullQuoteURLOverrideForStock:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:options:completionHandler:", v8, MEMORY[0x24BDBD1B8], 0);

  }
}

- (void)setStockFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_stockFetcher, a3);
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
  objc_storeStrong((id *)&self->_stock, a3);
}

- (int64_t)chartInterval
{
  return self->_chartInterval;
}

- (void)setChartInterval:(int64_t)a3
{
  self->_chartInterval = a3;
}

- (UITableView)stocksTableView
{
  return self->_stocksTableView;
}

- (void)setStocksTableView:(id)a3
{
  objc_storeStrong((id *)&self->_stocksTableView, a3);
}

- (UIView)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarView, a3);
}

- (void)setNetPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_netPreferences, a3);
}

- (void)setStockUpdateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stockUpdateManager, a3);
}

- (StockChartView)chartView
{
  return self->_chartView;
}

- (void)setChartView:(id)a3
{
  objc_storeStrong((id *)&self->_chartView, a3);
}

- (void)setChartUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_chartUpdater, a3);
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (StocksLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void)setStockManager:(id)a3
{
  objc_storeStrong((id *)&self->_stockManager, a3);
}

- (UIButton)attributionButton
{
  return self->_attributionButton;
}

- (void)setAttributionButton:(id)a3
{
  objc_storeStrong((id *)&self->_attributionButton, a3);
}

- (UILabel)exchangeStatusLabel
{
  return self->_exchangeStatusLabel;
}

- (void)setExchangeStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_exchangeStatusLabel, a3);
}

- (NSString)stockTicker
{
  return self->_stockTicker;
}

- (void)setStockTicker:(id)a3
{
  objc_storeStrong((id *)&self->_stockTicker, a3);
}

- (int64_t)rowDataType
{
  return self->_rowDataType;
}

- (void)setRowDataType:(int64_t)a3
{
  self->_rowDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stockTicker, 0);
  objc_storeStrong((id *)&self->_exchangeStatusLabel, 0);
  objc_storeStrong((id *)&self->_attributionButton, 0);
  objc_storeStrong((id *)&self->_stockManager, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_chartUpdater, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_stockUpdateManager, 0);
  objc_storeStrong((id *)&self->_netPreferences, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_stocksTableView, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_stockFetcher, 0);
}

- (void)updateChartForInterval:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "Kicking off basic stock update for Stock %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "ERROR POPULATING PLATTER: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_77_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "Executing chart update for Stock %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __64__StockPlatterViewController_updateChartForInterval_completion___block_invoke_79_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "Stocks Chart Data Retrieved; Updating ChartView %@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_3();
}

@end
