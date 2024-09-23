@implementation STUIStatusBarIndicatorLocationItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    objc_msgSend(v7, "locationEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEnabled"))
    {
      objc_msgSend(v7, "locationEntry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "type") == 2;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarIndicatorLocationItem;
    v10 = -[STUIStatusBarItem canEnableDisplayItem:fromData:](&v14, sel_canEnableDisplayItem_fromData_, v6, v7);
  }

  return v10;
}

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CF0];
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarIndicatorLocationItem;
  v4 = a3;
  -[STUIStatusBarItem createDisplayItemForIdentifier:](&v12, sel_createDisplayItemForIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier", v12.receiver, v12.super_class);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("location.circle.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "alignmentRectInsets");
    UIEdgeInsetsAdd();
    objc_msgSend(v8, "imageWithAlignmentRectInsets:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUIStatusBarIndicatorLocationItem prominentImageView](self, "prominentImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

  }
  return v5;
}

- (STUIStatusBarIndicatorLocationItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  STUIStatusBarIndicatorLocationItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarIndicatorLocationItem;
  result = -[STUIStatusBarItem initWithIdentifier:statusBar:](&v5, sel_initWithIdentifier_statusBar_, a3, a4);
  if (result)
    result->_previousType = -1;
  return result;
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  id v4;
  id v5;
  void *v6;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSymbolScale:", 2);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t previousType;
  BOOL v15;
  BOOL v16;
  char v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  STUIStatusBarIndicatorLocationItem *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {

LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  v10 = objc_msgSend(v6, "dataChanged");

  if (!v10)
    goto LABEL_18;
  objc_msgSend(v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  previousType = self->_previousType;
  v15 = previousType == 2 && v13 == 0;
  if (v15
    || (!previousType ? (v16 = v13 == 2) : (v16 = 0),
        !v16 ? (v17 = 0) : (v17 = 1),
        v13 == previousType || previousType == -1 || (v17 & 1) != 0))
  {
    v20.receiver = self;
    v20.super_class = (Class)STUIStatusBarIndicatorLocationItem;
    -[STUIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke;
    v21[3] = &unk_1E8D633E0;
    v22 = v6;
    v23 = self;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_previousType = v13;
LABEL_19:

  return v18;
}

+ (STUIStatusBarIdentifier)prominentDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("prominentDisplayIdentifier"));
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarIndicatorLocationItem prominentImageView](self, "prominentImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarIndicatorLocationItem;
    -[STUIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (STUIStatusBarImageView)prominentImageView
{
  STUIStatusBarImageView *prominentImageView;

  prominentImageView = self->_prominentImageView;
  if (!prominentImageView)
  {
    -[STUIStatusBarIndicatorLocationItem _create_prominentImageView](self, "_create_prominentImageView");
    prominentImageView = self->_prominentImageView;
  }
  return prominentImageView;
}

- (void)_create_prominentImageView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *prominentImageView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  prominentImageView = self->_prominentImageView;
  self->_prominentImageView = v4;

}

+ (id)groupWithPriority:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "defaultDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "prominentDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "excludingPlacements:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v6;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](STUIStatusBarDisplayItemPlacementLocationGroup, "groupWithPriority:placements:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setRegularPlacement:", v6);
  objc_msgSend(v12, "setProminentPlacement:", v10);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentImageView, 0);
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
    return CFSTR("location");
  else
    return CFSTR("location.fill");
}

void __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2;
  v17[3] = &unk_1E8D62A38;
  v18 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3;
  v12[3] = &unk_1E8D63B80;
  v13 = *(id *)(a1 + 32);
  v14 = v18;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v10 = v7;
  v11 = v18;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v17, v12, 0.166666667);

}

uint64_t __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.66, 0.66);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.25);
}

void __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v9.receiver = *(id *)(a1 + 48);
    v9.super_class = (Class)STUIStatusBarIndicatorLocationItem;
    v5 = objc_msgSendSuper2(&v9, sel_applyUpdate_toDisplayItem_, v4, v3);
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4;
    v7[3] = &unk_1E8D62A38;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "animateWithDuration:animations:completion:", v7, *(_QWORD *)(a1 + 56), 0.166666667);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __64__STUIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setProminentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_prominentImageView, a3);
}

- (int64_t)previousType
{
  return self->_previousType;
}

- (void)setPreviousType:(int64_t)a3
{
  self->_previousType = a3;
}

@end
