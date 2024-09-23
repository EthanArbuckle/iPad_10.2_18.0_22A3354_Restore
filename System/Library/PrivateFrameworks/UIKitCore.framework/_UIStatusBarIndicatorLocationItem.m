@implementation _UIStatusBarIndicatorLocationItem

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
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "prominentDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, 2);
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
  +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](_UIStatusBarDisplayItemPlacementLocationGroup, "groupWithPriority:placements:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setRegularPlacement:", v6);
  objc_msgSend(v12, "setProminentPlacement:", v10);

  return v12;
}

+ (_UIStatusBarIdentifier)prominentDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("prominentDisplayIdentifier"));
}

- (_UIStatusBarIndicatorLocationItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  _UIStatusBarIndicatorLocationItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarIndicatorLocationItem;
  result = -[_UIStatusBarItem initWithIdentifier:statusBar:](&v5, sel_initWithIdentifier_statusBar_, a3, a4);
  if (result)
    result->_previousType = -1;
  return result;
}

- (id)indicatorEntryKey
{
  return CFSTR("locationEntry");
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

- (_UIStatusBarImageView)prominentImageView
{
  _UIStatusBarImageView *prominentImageView;

  prominentImageView = self->_prominentImageView;
  if (!prominentImageView)
  {
    -[_UIStatusBarIndicatorLocationItem _create_prominentImageView](self, "_create_prominentImageView");
    prominentImageView = self->_prominentImageView;
  }
  return prominentImageView;
}

- (void)_create_prominentImageView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *prominentImageView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  prominentImageView = self->_prominentImageView;
  self->_prominentImageView = v4;

}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarIndicatorLocationItem;
  v4 = a3;
  -[_UIStatusBarItem createDisplayItemForIdentifier:](&v16, sel_createDisplayItemForIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier", v16.receiver, v16.super_class);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("location.circle.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "alignmentRectInsets");
    objc_msgSend(v8, "imageWithAlignmentRectInsets:", v9 + 0.0, v10 + 1.75, v11 + 0.0, v12 + 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarIndicatorLocationItem prominentImageView](self, "prominentImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

  }
  return v5;
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
    -[_UIStatusBarIndicatorLocationItem prominentImageView](self, "prominentImageView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    -[_UIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

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
    v14.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    v10 = -[_UIStatusBarItem canEnableDisplayItem:fromData:](&v14, sel_canEnableDisplayItem_fromData_, v6, v7);
  }

  return v10;
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
  _UIStatusBarIndicatorLocationItem *v23;

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
    v20.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    -[_UIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke;
    v21[3] = &unk_1E16E0278;
    v22 = v6;
    v23 = self;
    +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_previousType = v13;
LABEL_19:

  return v18;
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
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSymbolScale:", 2);
  }
  else
  {
    v6 = 0;
  }
  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentImageView, 0);
}

@end
