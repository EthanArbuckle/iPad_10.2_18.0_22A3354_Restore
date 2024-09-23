@implementation PXScoreLabViewController

- (PXScoreLabViewController)init
{
  PXScoreLabViewController *v2;
  PXScoreLabViewController *v3;
  NSArray *scoreNames;
  NSDictionary *keyPathByScoreName;
  NSDictionary *timestampKeyPathByPrefix;
  NSArray *assetFilterNames;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *assetPredicateByFilterName;
  id v15;
  NSDictionary *sceneIdentifierBySceneName;
  NSDictionary *v17;
  NSDictionary *v19;
  objc_super v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PXScoreLabViewController;
  v2 = -[PXScoreLabViewController init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    scoreNames = v2->_scoreNames;
    v2->_scoreNames = (NSArray *)&unk_1E53E9C30;

    keyPathByScoreName = v3->_keyPathByScoreName;
    v3->_keyPathByScoreName = (NSDictionary *)&unk_1E53F0D68;

    timestampKeyPathByPrefix = v3->_timestampKeyPathByPrefix;
    v3->_timestampKeyPathByPrefix = (NSDictionary *)&unk_1E53F0D90;

    assetFilterNames = v3->_assetFilterNames;
    v3->_assetFilterNames = (NSArray *)&unk_1E53E9C48;

    v21[0] = CFSTR("Portrait");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtypes & %d) != 0"), 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v21[1] = CFSTR("Live");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtypes & %d) != 0"), 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v9;
    v21[2] = CFSTR("HDR");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtypes & %d) != 0"), 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v10;
    v21[3] = CFSTR("Panorama");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtypes & %d) != 0"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v11;
    v21[4] = CFSTR("Video");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaType == %d"), 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v13 = objc_claimAutoreleasedReturnValue();
    assetPredicateByFilterName = v3->_assetPredicateByFilterName;
    v3->_assetPredicateByFilterName = (NSDictionary *)v13;

    v15 = objc_alloc_init(MEMORY[0x1E0D75250]);
    v19 = (NSDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "nodeCount"));
    PFSceneTaxonomyEnumerateTopologicallyOrderedNodes();
    sceneIdentifierBySceneName = v3->_sceneIdentifierBySceneName;
    v3->_sceneIdentifierBySceneName = v19;
    v17 = v19;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  UIPickerView *v10;
  UIPickerView *xScorePickerView;
  id v12;
  double v13;
  UITextField *v14;
  UITextField *xScoreSceneNameField;
  double v16;
  id v17;
  double v18;
  UIPickerView *v19;
  UIPickerView *graphTypePickerView;
  double v21;
  void *v22;
  id v23;
  double v24;
  UIPickerView *v25;
  UIPickerView *yScorePickerView;
  id v27;
  double v28;
  UITextField *v29;
  UITextField *yScoreSceneNameField;
  void *v31;
  id v32;
  double v33;
  UIPickerView *v34;
  UIPickerView *assetFilterPickerView;
  double v36;
  _PXScoreLabGraphView *v37;
  double v38;
  double v39;
  double v40;
  _PXScoreLabGraphView *v41;
  _PXScoreLabGraphView *graphView;
  double v43;
  PXRoundProgressView *v44;
  PXRoundProgressView *progressView;
  void *v46;
  void *v47;
  _QWORD block[6];
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PXScoreLabViewController;
  -[PXScoreLabViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[PXScoreLabViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PXScoreLabViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
  v6 = v5 + 60.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 24.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, v6, 130.0, 70.0);
  objc_msgSend(v47, "setFont:", v7);
  objc_msgSend(v47, "setText:", CFSTR("X Score:"));
  objc_msgSend(v47, "setTextAlignment:", 2);
  objc_msgSend(v47, "setAutoresizingMask:", 36);
  objc_msgSend(v3, "addSubview:", v47);
  v8 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  objc_msgSend(v3, "bounds");
  v10 = (UIPickerView *)objc_msgSend(v8, "initWithFrame:", 130.0, v6, v9 + -130.0, 70.0);
  xScorePickerView = self->_xScorePickerView;
  self->_xScorePickerView = v10;

  -[UIPickerView setDataSource:](self->_xScorePickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_xScorePickerView, "setDelegate:", self);
  -[UIPickerView setAutoresizingMask:](self->_xScorePickerView, "setAutoresizingMask:", 34);
  -[UIPickerView selectRow:inComponent:animated:](self->_xScorePickerView, "selectRow:inComponent:animated:", -[NSArray indexOfObject:](self->_scoreNames, "indexOfObject:", CFSTR("Pleasant Lighting")), 0, 0);
  objc_msgSend(v3, "addSubview:", self->_xScorePickerView);
  v12 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  objc_msgSend(v3, "bounds");
  v14 = (UITextField *)objc_msgSend(v12, "initWithFrame:", v13 + -100.0, v6 + 2.0, 100.0, 68.0);
  xScoreSceneNameField = self->_xScoreSceneNameField;
  self->_xScoreSceneNameField = v14;

  -[UITextField setDelegate:](self->_xScoreSceneNameField, "setDelegate:", self);
  -[UITextField setAutoresizingMask:](self->_xScoreSceneNameField, "setAutoresizingMask:", 33);
  -[UITextField setFont:](self->_xScoreSceneNameField, "setFont:", v7);
  -[UITextField setText:](self->_xScoreSceneNameField, "setText:", CFSTR("Dog"));
  objc_msgSend(v3, "addSubview:", self->_xScoreSceneNameField);
  v16 = v6 + 50.0;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, v16, 130.0, 70.0);
  objc_msgSend(v46, "setFont:", v7);
  objc_msgSend(v46, "setText:", CFSTR("Graph Type:"));
  objc_msgSend(v46, "setTextAlignment:", 2);
  objc_msgSend(v46, "setAutoresizingMask:", 36);
  objc_msgSend(v3, "addSubview:", v46);
  v17 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  objc_msgSend(v3, "bounds");
  v19 = (UIPickerView *)objc_msgSend(v17, "initWithFrame:", 130.0, v16, v18 + -130.0, 70.0);
  graphTypePickerView = self->_graphTypePickerView;
  self->_graphTypePickerView = v19;

  -[UIPickerView setDataSource:](self->_graphTypePickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_graphTypePickerView, "setDelegate:", self);
  -[UIPickerView setAutoresizingMask:](self->_graphTypePickerView, "setAutoresizingMask:", 34);
  objc_msgSend(v3, "addSubview:", self->_graphTypePickerView);
  v21 = v16 + 50.0;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, v21, 130.0, 70.0);
  objc_msgSend(v22, "setFont:", v7);
  objc_msgSend(v22, "setText:", CFSTR("Y Score:"));
  objc_msgSend(v22, "setTextAlignment:", 2);
  objc_msgSend(v22, "setAutoresizingMask:", 36);
  objc_msgSend(v3, "addSubview:", v22);
  v23 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  objc_msgSend(v3, "bounds");
  v25 = (UIPickerView *)objc_msgSend(v23, "initWithFrame:", 130.0, v21, v24 + -130.0, 70.0);
  yScorePickerView = self->_yScorePickerView;
  self->_yScorePickerView = v25;

  -[UIPickerView setDataSource:](self->_yScorePickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_yScorePickerView, "setDelegate:", self);
  -[UIPickerView setAutoresizingMask:](self->_yScorePickerView, "setAutoresizingMask:", 34);
  -[UIPickerView selectRow:inComponent:animated:](self->_yScorePickerView, "selectRow:inComponent:animated:", -[NSArray indexOfObject:](self->_scoreNames, "indexOfObject:", CFSTR("Pleasant Perspective")), 0, 0);
  objc_msgSend(v3, "addSubview:", self->_yScorePickerView);
  v27 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  objc_msgSend(v3, "bounds");
  v29 = (UITextField *)objc_msgSend(v27, "initWithFrame:", v28 + -100.0, v21 + 2.0, 100.0, 68.0);
  yScoreSceneNameField = self->_yScoreSceneNameField;
  self->_yScoreSceneNameField = v29;

  -[UITextField setDelegate:](self->_yScoreSceneNameField, "setDelegate:", self);
  -[UITextField setAutoresizingMask:](self->_yScoreSceneNameField, "setAutoresizingMask:", 33);
  -[UITextField setFont:](self->_yScoreSceneNameField, "setFont:", v7);
  -[UITextField setText:](self->_yScoreSceneNameField, "setText:", CFSTR("Beach"));
  objc_msgSend(v3, "addSubview:", self->_yScoreSceneNameField);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, v21 + 50.0, 130.0, 70.0);
  objc_msgSend(v31, "setFont:", v7);
  objc_msgSend(v31, "setText:", CFSTR("Asset Filter:"));
  objc_msgSend(v31, "setTextAlignment:", 2);
  objc_msgSend(v31, "setAutoresizingMask:", 36);
  objc_msgSend(v3, "addSubview:", v31);
  v32 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  objc_msgSend(v3, "bounds");
  v34 = (UIPickerView *)objc_msgSend(v32, "initWithFrame:", 130.0, v21 + 50.0, v33 + -130.0, 70.0);
  assetFilterPickerView = self->_assetFilterPickerView;
  self->_assetFilterPickerView = v34;

  -[UIPickerView setDataSource:](self->_assetFilterPickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_assetFilterPickerView, "setDelegate:", self);
  -[UIPickerView setAutoresizingMask:](self->_assetFilterPickerView, "setAutoresizingMask:", 34);
  -[UIPickerView selectRow:inComponent:animated:](self->_assetFilterPickerView, "selectRow:inComponent:animated:", -[NSArray indexOfObject:](self->_assetFilterNames, "indexOfObject:", CFSTR("All")), 0, 0);
  objc_msgSend(v3, "addSubview:", self->_assetFilterPickerView);
  v36 = v21 + 50.0 + 50.0;
  self->_redrawIsDisabled = 1;
  v37 = [_PXScoreLabGraphView alloc];
  objc_msgSend(v3, "bounds");
  v39 = v38;
  objc_msgSend(v3, "bounds");
  v41 = -[_PXScoreLabGraphView initWithFrame:](v37, "initWithFrame:", 0.0, v36, v39, v40 - v36);
  graphView = self->_graphView;
  self->_graphView = v41;

  -[_PXScoreLabGraphView setDelegate:](self->_graphView, "setDelegate:", self);
  -[_PXScoreLabGraphView setAutoresizingMask:](self->_graphView, "setAutoresizingMask:", 18);
  -[PXScoreLabViewController pickerView:didSelectRow:inComponent:](self, "pickerView:didSelectRow:inComponent:", self->_xScorePickerView, -[NSArray indexOfObject:](self->_scoreNames, "indexOfObject:", CFSTR("Pleasant Lighting")), 0);
  -[PXScoreLabViewController pickerView:didSelectRow:inComponent:](self, "pickerView:didSelectRow:inComponent:", self->_yScorePickerView, -[NSArray indexOfObject:](self->_scoreNames, "indexOfObject:", CFSTR("Pleasant Perspective")), 0);
  objc_msgSend(v3, "addSubview:", self->_graphView);
  objc_msgSend(v3, "bounds");
  v44 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 1, v43 + -10.0 + -36.0, v36 + 10.0, 36.0, 36.0);
  progressView = self->_progressView;
  self->_progressView = v44;

  -[PXRoundProgressView setAutoresizingMask:](self->_progressView, "setAutoresizingMask:", 45);
  objc_msgSend(v3, "addSubview:", self->_progressView);
  self->_redrawIsDisabled = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXScoreLabViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5144EB8;
  block[4] = self;
  block[5] = 0;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXScoreLabViewController;
  -[PXScoreLabViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PXScoreLabViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 1);

}

- (void)redrawGraph
{
  if (!self->_redrawIsDisabled)
  {
    -[PXRoundProgressView prepareForReuse](self->_progressView, "prepareForReuse");
    -[PXRoundProgressView setHidden:](self->_progressView, "setHidden:", 0);
    -[_PXScoreLabGraphView reloadData](self->_graphView, "reloadData");
  }
}

- (id)valueGetterForScoreKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_timestampKeyPathByPrefix, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke;
    aBlock[3] = &unk_1E512E668;
    v9 = &v17;
    v17 = v7;
    v18 = v4;
    v10 = v4;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke_2;
    v14[3] = &unk_1E5147850;
    v9 = &v15;
    v15 = v4;
    v12 = v4;
    v11 = _Block_copy(v14);
  }

  return v11;
}

- (id)valueGetterForSceneIdentifier:(unint64_t)a3
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXScoreLabViewController_valueGetterForSceneIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___NSNumber_16__0__PHAsset_8l;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

- (unint64_t)identifierForSceneName:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("junk")))
  {
    if ((objc_msgSend(v4, "hasSuffix:", CFSTR("screenshot")) & 1) != 0)
    {
      v5 = 2147483632;
    }
    else
    {
      v5 = 2147483633;
      if ((objc_msgSend(v4, "hasSuffix:", CFSTR("framing")) & 1) == 0)
      {
        if ((objc_msgSend(v4, "hasSuffix:", CFSTR("lighting")) & 1) != 0)
        {
          v5 = 2147483634;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("blurry")) & 1) != 0)
        {
          v5 = 2147483635;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("drink")) & 1) != 0)
        {
          v5 = 2147483636;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("other")) & 1) != 0)
        {
          v5 = 2147483637;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("medical reference")) & 1) != 0)
        {
          v5 = 2147483638;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("negative-internal")) & 1) != 0)
        {
          v5 = 2147483639;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("document")) & 1) != 0)
        {
          v5 = 2147483640;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("repair reference")) & 1) != 0)
        {
          v5 = 2147483641;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("shopping reference")) & 1) != 0)
        {
          v5 = 2147483642;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("utility reference")) & 1) != 0)
        {
          v5 = 2147483643;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("negative")) & 1) != 0)
        {
          v5 = 2147483644;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("memorable")) & 1) != 0)
        {
          v5 = 2147483645;
        }
        else if ((objc_msgSend(v4, "hasSuffix:", CFSTR("quality")) & 1) != 0)
        {
          v5 = 2147483646;
        }
        else if (objc_msgSend(v4, "hasSuffix:", CFSTR("legacy")))
        {
          v5 = 0x7FFFFFFFLL;
        }
        else
        {
          v5 = 0;
        }
      }
    }
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_sceneIdentifierBySceneName, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "unsignedIntValue");

  }
  return v5;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  UIPickerView *v5;
  UIPickerView *v6;
  int64_t v7;
  int *v8;

  v5 = (UIPickerView *)a3;
  v6 = v5;
  if (self->_xScorePickerView == v5 || self->_yScorePickerView == v5)
  {
    v8 = &OBJC_IVAR___PXScoreLabViewController__scoreNames;
LABEL_7:
    v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "count");
    goto LABEL_8;
  }
  if (self->_graphTypePickerView == v5)
  {
    v7 = 3;
    goto LABEL_8;
  }
  if (self->_assetFilterPickerView == v5)
  {
    v8 = &OBJC_IVAR___PXScoreLabViewController__assetFilterNames;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  UIPickerView *v7;
  UIPickerView *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_xScorePickerView == v7 || self->_yScorePickerView == v7)
  {
    v10 = 1032;
LABEL_7:
    v11 = *(Class *)((char *)&self->super.super.super.isa + v10);
LABEL_8:
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (self->_graphTypePickerView == v7)
  {
    v11 = &unk_1E53E9C60;
    goto LABEL_8;
  }
  if (self->_assetFilterPickerView == v7)
  {
    v10 = 1056;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIPickerView *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  UIPickerView *v14;

  v7 = (UIPickerView *)a3;
  if (self->_xScorePickerView == v7)
  {
    v14 = v7;
    -[NSArray objectAtIndexedSubscript:](self->_scoreNames, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_keyPathByScoreName, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UITextField setHidden:](self->_xScoreSceneNameField, "setHidden:", 1);
      -[PXScoreLabViewController valueGetterForScoreKeyPath:](self, "valueGetterForScoreKeyPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXScoreLabGraphView setXScoreValueGetter:](self->_graphView, "setXScoreValueGetter:", v10);
LABEL_17:

      goto LABEL_18;
    }
    if (!objc_msgSend(v8, "hasPrefix:", CFSTR("Scene")))
      goto LABEL_19;
    v13 = 976;
LABEL_26:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v13), "setHidden:", 0);
    -[PXScoreLabViewController sceneNameChanged:](self, "sceneNameChanged:", *(Class *)((char *)&self->super.super.super.isa + v13));
    goto LABEL_19;
  }
  if (self->_graphTypePickerView == v7)
  {
    v14 = v7;
    -[_PXScoreLabGraphView setGraphType:](self->_graphView, "setGraphType:", a4);
    if (a4 == 1)
      v11 = 0.25;
    else
      v11 = 1.0;
    -[UIPickerView setUserInteractionEnabled:](self->_xScorePickerView, "setUserInteractionEnabled:", a4 != 1);
    -[UIPickerView setAlpha:](self->_xScorePickerView, "setAlpha:", v11);
    if (a4)
      v12 = 1.0;
    else
      v12 = 0.25;
    -[UIPickerView setUserInteractionEnabled:](self->_yScorePickerView, "setUserInteractionEnabled:", a4 != 0);
    -[UIPickerView setAlpha:](self->_yScorePickerView, "setAlpha:", v12);
    -[PXScoreLabViewController redrawGraph](self, "redrawGraph");
    goto LABEL_20;
  }
  if (self->_yScorePickerView == v7)
  {
    v14 = v7;
    -[NSArray objectAtIndexedSubscript:](self->_scoreNames, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_keyPathByScoreName, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UITextField setHidden:](self->_yScoreSceneNameField, "setHidden:", 1);
      -[PXScoreLabViewController valueGetterForScoreKeyPath:](self, "valueGetterForScoreKeyPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXScoreLabGraphView setYScoreValueGetter:](self->_graphView, "setYScoreValueGetter:", v10);
      goto LABEL_17;
    }
    if (!objc_msgSend(v8, "hasPrefix:", CFSTR("Scene")))
      goto LABEL_19;
    v13 = 1000;
    goto LABEL_26;
  }
  if (self->_assetFilterPickerView == v7)
  {
    v14 = v7;
    -[NSArray objectAtIndexedSubscript:](self->_assetFilterNames, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_assetPredicateByFilterName, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXScoreLabGraphView setAssetPredicate:](self->_graphView, "setAssetPredicate:", v9);
LABEL_18:
    -[PXScoreLabViewController redrawGraph](self, "redrawGraph");
LABEL_19:

LABEL_20:
    v7 = v14;
  }

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "blackColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "endEditing:", 0);
  return 1;
}

- (void)sceneNameChanged:(id)a3
{
  UITextField *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  _PXScoreLabGraphView *graphView;
  UITextField *v9;

  v4 = (UITextField *)a3;
  if (self->_xScoreSceneNameField == v4 || self->_yScoreSceneNameField == v4)
  {
    v9 = v4;
    -[UITextField text](v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXScoreLabViewController identifierForSceneName:](self, "identifierForSceneName:", v5);
    if (v6)
    {
      -[PXScoreLabViewController valueGetterForSceneIdentifier:](self, "valueGetterForSceneIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      graphView = self->_graphView;
      if (self->_xScoreSceneNameField == v9)
        -[_PXScoreLabGraphView setXScoreValueGetter:](graphView, "setXScoreValueGetter:", v7);
      else
        -[_PXScoreLabGraphView setYScoreValueGetter:](graphView, "setYScoreValueGetter:", v7);
      -[PXScoreLabViewController redrawGraph](self, "redrawGraph");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setTextColor:](v9, "setTextColor:", v7);
    }

    v4 = v9;
  }

}

- (void)scoreLabGraphView:(id)a3 reloadProgressed:(double)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PXScoreLabViewController_scoreLabGraphView_reloadProgressed___block_invoke;
  v4[3] = &unk_1E5144EB8;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (void)scoreLabGraphViewDidFinishReloading:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXScoreLabViewController_scoreLabGraphViewDidFinishReloading___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifierBySceneName, 0);
  objc_storeStrong((id *)&self->_assetPredicateByFilterName, 0);
  objc_storeStrong((id *)&self->_assetFilterNames, 0);
  objc_storeStrong((id *)&self->_timestampKeyPathByPrefix, 0);
  objc_storeStrong((id *)&self->_keyPathByScoreName, 0);
  objc_storeStrong((id *)&self->_scoreNames, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_assetFilterPickerView, 0);
  objc_storeStrong((id *)&self->_yScoreSceneNameField, 0);
  objc_storeStrong((id *)&self->_yScorePickerView, 0);
  objc_storeStrong((id *)&self->_graphTypePickerView, 0);
  objc_storeStrong((id *)&self->_xScoreSceneNameField, 0);
  objc_storeStrong((id *)&self->_xScorePickerView, 0);
}

uint64_t __64__PXScoreLabViewController_scoreLabGraphViewDidFinishReloading___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setHidden:", 1);
}

uint64_t __63__PXScoreLabViewController_scoreLabGraphView_reloadProgressed___block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setProgress:", v1);
}

id __58__PXScoreLabViewController_valueGetterForSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "sceneClassifications");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "extendedSceneIdentifier", (_QWORD)v14) == *(_QWORD *)(a1 + 32))
          {
            v12 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "confidence");
            objc_msgSend(v12, "numberWithDouble:");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "valueForKeyPath:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__PXScoreLabViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pickerView:didSelectRow:inComponent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __32__PXScoreLabViewController_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PFSceneTaxonomyNodeName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", PFSceneTaxonomyNodeExtendedSceneClassId());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v2);

  }
  return 0;
}

@end
