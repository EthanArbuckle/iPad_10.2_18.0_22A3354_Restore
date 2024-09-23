@implementation PUCurationActionSignalBrowserViewController

- (void)viewDidLoad
{
  void *v3;
  PUCurationTraitContainer *v4;
  PUCurationTraitContainer *v5;
  PUCurationTraitContainer *v6;
  PUCurationTraitContainer *v7;
  PUCurationTraitContainer *v8;
  PUCurationTraitContainer *v9;
  PUCurationTraitContainer *v10;
  PUCurationTraitContainer *v11;
  PUCurationTraitContainer *v12;
  PUCurationTraitContainer *v13;
  NSArray *v14;
  NSArray *availableActions;
  PUCurationTraitContainer *v16;
  PUCurationTraitContainer *v17;
  PUCurationTraitContainer *v18;
  PUCurationTraitContainer *v19;
  PUCurationTraitContainer *v20;
  PUCurationTraitContainer *v21;
  PUCurationTraitContainer *v22;
  PUCurationTraitContainer *v23;
  PUCurationTraitContainer *v24;
  PUCurationTraitContainer *v26;
  PUCurationTraitContainer *v27;
  objc_super v28;
  _QWORD v29[23];

  v29[21] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PUCurationActionSignalBrowserViewController;
  -[PUCurationActionSignalBrowserViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PUCurationActionSignalBrowserViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("actionCellIdentifier"));

  v27 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("None"), 0, 0.95, 0.655, 0.5);
  v29[0] = v27;
  v26 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Other Actions"), 1, 0.671, 0.415, 0.3);
  v29[1] = v26;
  v24 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Walking"), 2, 0.785, 0.635, 0.533);
  v29[2] = v24;
  v23 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Clapping"), 3, 0.92, 0.726, 0.6);
  v29[3] = v23;
  v22 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Jumping /Leaping"), 4, 0.5, 0.406, 0.25);
  v29[4] = v22;
  v21 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Running /Jogging"), 5, 0.65, 0.532, 0.376);
  v29[5] = v21;
  v20 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Kissing"), 6, 0.9, 0.327, 0.2);
  v29[6] = v20;
  v19 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Hugging"), 7, 0.828, 0.533, 0.45);
  v29[7] = v19;
  v18 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Dancing"), 8, 0.55, 0.428, 0.35);
  v29[8] = v18;
  v17 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Crawling (Baby Only)"), 9, 0.868, 0.765, 0.683);
  v29[9] = v17;
  v16 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Playing Musical Instrument"), 11, 0.9, 0.327, 0.2);
  v29[10] = v16;
  v4 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Throwing an object"), 13, 0.82, 0.383, 0.25);
  v29[11] = v4;
  v5 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Kicking an object"), 14, 0.85, 0.324, 0.2);
  v29[12] = v5;
  v6 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Catching an object"), 15, 0.75, 0.429, 0.3);
  v29[13] = v6;
  v7 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Riding by straddling object (e.g. bike, horse)"), 17, 0.888, 0.743, 0.638);
  v29[14] = v7;
  v8 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Playing on a swing"), 18, 0.55, 0.495, 0.42);
  v29[15] = v8;
  v9 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Swimming"), 19, 0.45, 0.36, 0.2);
  v29[16] = v9;
  v10 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Playing on a slide"), 20, 0.7, 0.583, 0.43);
  v29[17] = v10;
  v11 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Swinging (Sports Equipment)"), 21, 0.7, 0.42, 0.3);
  v29[18] = v11;
  v12 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Skating (Ice Skating or Inline Skating)"), 22, 0.75, 0.429, 0.3);
  v29[19] = v12;
  v13 = -[PUCurationTraitContainer initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:]([PUCurationTraitContainer alloc], "initWithLabel:traitValue:highPrecision:operatingPoint:highRecall:", CFSTR("Playing Soccer / Futsal"), 25, 0.72, 0.59, 0.5);
  v29[20] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 21);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableActions = self->_availableActions;
  self->_availableActions = v14;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUCurationActionSignalBrowserViewController availableActions](self, "availableActions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("actionCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionSignalBrowserViewController availableActions](self, "availableActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "actionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  PUCurationActionPeopleBrowserViewController *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[PUCurationActionSignalBrowserViewController availableActions](self, "availableActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[PUCurationActionPeopleBrowserViewController initWithTraitContainer:]([PUCurationActionPeopleBrowserViewController alloc], "initWithTraitContainer:", v10);
  -[PUCurationActionSignalBrowserViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
  objc_storeStrong((id *)&self->_availableActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActions, 0);
}

@end
