@implementation UIPickerView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (dyld_program_sdk_at_least() & 1) == 0)
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", &__block_literal_global_435);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPickerView;
  -[UIView setBackgroundColor:](&v3, sel_setBackgroundColor_, a3);
}

+ (CGSize)sizeThatFits:(CGSize)a3 forTraits:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:forTraitCollection:", v6, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)sizeForMainScreenTraitsThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sizeThatFits:forTraits:", v7, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)defaultSizeForTraits:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = a3;
  +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSizeForTraitCollection:", v3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)defaultSizeForMainScreenTraits
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultSizeForTraits:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)defaultSize
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = dyld_program_sdk_at_least();
  v4 = (void *)objc_opt_class();
  v5 = v4;
  if (v3)
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultSizeForTraits:", v6);
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    objc_msgSend(v4, "defaultSizeForMainScreenTraits");
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_setUsesDynamicRowHeight:(BOOL)a3
{
  int v3;
  int v5;
  int v6;

  v3 = a3;
  v5 = -[UIPickerView _usesDynamicRowHeight](self, "_usesDynamicRowHeight");
  if (v3)
    v6 = 0x10000;
  else
    v6 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFEFFFF | v6);
  if (v5 != v3)
    -[UIPickerView reloadAllComponents](self, "reloadAllComponents");
}

- (BOOL)_usesDynamicRowHeight
{
  int v2;
  BOOL v3;
  int v5;

  if ((*((_BYTE *)&self->_pickerViewFlags + 2) & 1) != 0)
    return 1;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v5 = _UIInternalPreference_PickerViewForceDynamicRowHeight,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_PickerViewForceDynamicRowHeight))
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v3 = v2 < v5;
      if (v2 < v5)
        break;
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_PickerViewForceDynamicRowHeight, (uint64_t)CFSTR("PickerViewForceDynamicRowHeight"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v5 = _UIInternalPreference_PickerViewForceDynamicRowHeight;
    }
    while (v2 != _UIInternalPreference_PickerViewForceDynamicRowHeight);
  }
  return byte_1EDDA8224 && v3;
}

- (double)_rowHeightForDefaultFont
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[UIPickerView _style](self, "_style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerCellFontWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CTFontGetLanguageAwareOutsets();
  objc_msgSend(v5, "ascender", 0, 0);
  objc_msgSend(v5, "descender");
  UICeilToViewScale(self);
  v7 = v6;

  return v7;
}

- (double)_tableRowHeight
{
  double result;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[UIPickerView _usesDynamicRowHeight](self, "_usesDynamicRowHeight"))
  {
    -[UIPickerView _rowHeightForDefaultFont](self, "_rowHeightForDefaultFont");
  }
  else
  {
    -[UIPickerView _style](self, "_style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v4, "defaultRowHeightForSize:", v5, v6);
    v8 = v7;

    return v8;
  }
  return result;
}

- (void)setSoundsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0;
  else
    v3 = 4096;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFEFFF | v3);
}

- (BOOL)_soundsEnabled
{
  return (*((_BYTE *)&self->_pickerViewFlags + 1) & 0x10) == 0;
}

void __26__UIPickerView_initialize__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:](UIPickerView, "appearanceForTraitCollection:", v0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:](UIPickerView, "appearanceForTraitCollection:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setTextColor:", v3);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.198);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setMagnifierLineColor:", v4);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setTextColor:", v5);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.198);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setMagnifierLineColor:", v6);

}

- (UIPickerView)init
{
  return -[UIPickerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (UIPickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v8;
  double v9;
  double v10;
  UIPickerView *v11;
  UIPickerView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!dyld_program_sdk_at_least()
    || (*MEMORY[0x1E0C9D820] == width ? (v8 = *(double *)(MEMORY[0x1E0C9D820] + 8) == height) : (v8 = 0), v8))
  {
    objc_msgSend((id)objc_opt_class(), "sizeForMainScreenTraitsThatFits:", width, height);
    width = v9;
    height = v10;
  }
  v14.receiver = self;
  v14.super_class = (Class)UIPickerView;
  v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    *(_DWORD *)&v11->_pickerViewFlags |= 0x800u;
    _UIPickerViewCommonInit(v11);
  }
  return v12;
}

- (UIPickerView)initWithCoder:(id)a3
{
  id v4;
  UIPickerView *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPickerView;
  v5 = -[UIView initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_delegate, v6);

    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIShowsSelectionBar")))
      v7 = 512;
    else
      v7 = 0;
    v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFFDFF | v7);
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowSelectingCells")))
      v8 = 2048;
    else
      v8 = 0;
    v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFF7FF | v8);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISkipsBackground")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISkipsBackground")))
        v9 = 0x4000;
      else
        v9 = 0;
      v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFBFFF | v9);
    }
    _UIPickerViewCommonInit(v5);
  }

  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  UIView *v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPickerView;
  -[UIView _populateArchivedSubviews:](&v8, sel__populateArchivedSubviews_, v4);
  v9[0] = self->_foregroundView;
  v9[1] = self->_topLineOrFillView;
  v5 = self->_bottomLineView;
  v6 = 0;
  v9[2] = v5;
  do
  {
    if (v9[v6])
      objc_msgSend(v4, "removeObject:");
    ++v6;
  }
  while (v6 != 3);
  for (i = 2; i != -1; --i)

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIPickerView;
  -[UIView encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x200) == 0)
  {
    if ((*(_WORD *)&pickerViewFlags & 0x800) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAllowSelectingCells"));
    if ((*(_DWORD *)&self->_pickerViewFlags & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIShowsSelectionBar"));
  pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x800) != 0)
    goto LABEL_9;
LABEL_5:
  if ((*(_WORD *)&pickerViewFlags & 0x4000) != 0)
LABEL_6:
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISkipsBackground"));
LABEL_7:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unregisterForSystemSounds:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIPickerView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  NSMutableArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;
  CGPoint v36;
  CGRect v37;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((UIViewIgnoresTouchEvents(self) & 1) == 0
    && -[UIPickerView _enabled](self, "_enabled")
    && (-[UIView bounds](self, "bounds"), v36.x = x, v36.y = y, CGRectContainsPoint(v37, v36)))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = self->_tables;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      v23 = *(_QWORD *)v30;
      v24 = v8;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v13, "_allVisibleCells", v23);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v26 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
                if (objc_msgSend(v19, "pointInside:withEvent:", v7)
                  && !objc_msgSend(v19, "isHidden"))
                {
                  v20 = v19;
                  v8 = v24;
                  goto LABEL_25;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v16)
                continue;
              break;
            }
          }

          if (objc_msgSend(v13, "_pointLiesWithinEffectiveTableBounds:", x, y))
          {
            objc_msgSend(v13, "_visibleCellClosestToPoint:inView:", self, x, y);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v24;
            if (v22)
            {
              v14 = v22;
              v20 = v14;
            }
            else
            {
              objc_msgSend(v13, "_preferredTable");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              v14 = 0;
            }
LABEL_25:

            goto LABEL_27;
          }
          v11 = v23;
          v8 = v24;
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v20 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v20 = 0;
    }
LABEL_27:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setNeedsLayout
{
  objc_super v2;

  *(_DWORD *)&self->_pickerViewFlags |= 1u;
  v2.receiver = self;
  v2.super_class = (Class)UIPickerView;
  -[UIView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (void)_updateSelectedRows
{
  id WeakRetained;
  char v4;
  NSInteger v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0 && -[UIPickerView numberOfComponents](self, "numberOfComponents") >= 1)
  {
    v5 = 0;
    do
    {
      -[UIPickerView _selectRow:inComponent:animated:notify:](self, "_selectRow:inComponent:animated:notify:", -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", v5), v5, 0, 0);
      ++v5;
    }
    while (v5 < -[UIPickerView numberOfComponents](self, "numberOfComponents"));
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPickerView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIPickerView _updateSelectedRows](self, "_updateSelectedRows");
}

- (void)_setColumnView:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  double v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v7 = v5;
  if (v4)
    v6 = 1.0;
  else
    v6 = 0.4;
  objc_msgSend(v5, "setUserInteractionEnabled:", v4);
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[UIPickerView _enabled](self, "_enabled") != a3)
  {
    self->_enabled = v3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_tables;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[UIPickerView _setColumnView:enabled:](self, "_setColumnView:enabled:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)reloadAllComponents
{
  uint64_t v3;
  int64_t v4;
  BOOL v5;
  uint64_t i;
  void *v7;

  v3 = -[NSMutableArray count](self->_tables, "count");
  v4 = -[UIPickerView _delegateNumberOfComponents](self, "_delegateNumberOfComponents");
  if (v3)
    v5 = v3 == v4;
  else
    v5 = 0;
  if (v5)
  {
    if (v3 >= 1)
    {
      for (i = 0; i != v3; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reloadData");

      }
    }
  }
  else
  {
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)reloadDataForColumn:(int)a3
{
  -[UIPickerView reloadComponent:](self, "reloadComponent:", a3);
}

- (void)reloadComponent:(NSInteger)component
{
  id v3;

  if ((*(_BYTE *)&self->_pickerViewFlags & 1) == 0)
  {
    -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", component);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (id)_selectionBarSuffix
{
  if ((*(_DWORD *)&self->_pickerViewFlags & 0x200) != 0)
    return CFSTR("-Bar");
  else
    return &stru_1E16EDF20;
}

- (CGRect)_selectionBarRectForHeight:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  UIRoundToViewScale(self);
  v8 = v7;
  v9 = 0.0;
  v10 = v6;
  v11 = a3;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (double)_selectionBarSideInset
{
  void *v2;
  double v3;
  double v4;

  if ((*((_BYTE *)&self->_pickerViewFlags + 2) & 2) != 0)
    return 0.0;
  -[UIPickerView _style](self, "_style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionBarSideInset");
  v4 = v3;

  return v4;
}

- (BOOL)_selectionBarIgnoresInset
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 2) >> 1) & 1;
}

- (void)_setSelectionBarIgnoresInset:(BOOL)a3
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  int v4;

  pickerViewFlags = self->_pickerViewFlags;
  if (((((*(_DWORD *)&pickerViewFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x20000;
    else
      v4 = 0;
    self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags & 0xFFFDFFFF | v4);
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = dyld_program_sdk_at_least();
  v7 = (void *)objc_opt_class();
  v8 = v7;
  if (v6)
  {
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:forTraits:", v9, width, height);
    v11 = v10;
    v13 = v12;

    v14 = v11;
    v15 = v13;
  }
  else
  {
    objc_msgSend(v7, "sizeForMainScreenTraitsThatFits:", width, height);
  }
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  if (dyld_program_sdk_at_least())
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v9;

  v5 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pickerView:row:column:checked:", self, a3, -[UIPickerView columnForTableView:](self, "columnForTableView:", v9), v5);

}

- (double)scrollAnimationDuration
{
  return 0.3;
}

- (int64_t)_delegateNumberOfComponents
{
  id WeakRetained;
  void *v4;
  int64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "numberOfComponentsInPickerView:", self);
  }
  else if ((*(_BYTE *)&self->_pickerViewFlags & 2) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(v6, "numberOfComponentsInPickerView:", self);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)_delegateNumberOfRowsInComponent:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  int64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "pickerView:numberOfRowsInComponent:", self, a3);
  }
  else if ((*(_BYTE *)&self->_pickerViewFlags & 4) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(v8, "pickerView:numberOfRowsInComponent:", self, a3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_delegateTitleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  void *v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_pickerViewFlags & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pickerView:titleForRow:forComponent:", self, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_delegateAttributedTitleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  void *v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_pickerViewFlags & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pickerView:attributedTitleForRow:forComponent:", self, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)_delegateWidthForComponent:(int64_t)a3 ofCount:(int)a4 withSizeLeft:(double)a5
{
  id WeakRetained;
  double v9;
  double v10;

  if ((*(_BYTE *)&self->_pickerViewFlags & 0x80) == 0)
    return round(a5 / (double)(a4 - a3));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pickerView:widthForComponent:", self, a3);
  v10 = v9;

  return v10;
}

- (double)_delegateRowHeightForComponent:(int64_t)a3
{
  double result;
  id WeakRetained;
  double v7;
  double v8;

  if ((*((_BYTE *)&self->_pickerViewFlags + 1) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pickerView:rowHeightForComponent:", self, a3);
    v8 = v7;

    return v8;
  }
  else
  {
    -[UIPickerView _tableRowHeight](self, "_tableRowHeight", a3);
  }
  return result;
}

- (void)_addMagnifierForRowHeight:(double)a3
{
  if (-[UIPickerView _magnifierEnabled](self, "_magnifierEnabled"))
  {
    if (-[UIPickerView _magnifierStyle](self, "_magnifierStyle"))
      -[UIPickerView _addHighlightRectForRowHeight:](self, "_addHighlightRectForRowHeight:", a3);
    else
      -[UIPickerView _addMagnifierLinesForRowHeight:](self, "_addMagnifierLinesForRowHeight:", a3);
  }
}

- (void)_addHighlightRectForRowHeight:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  UIView *topLineOrFillView;
  void *v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  char v27;
  id v28;
  CGRect v29;
  CGRect v30;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIPickerView _style](self, "_style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "verticalPaddingForCenterHighlightView");
  v15 = v14 + a3;

  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  CGRectGetMidY(v29);
  UIRoundToViewScale(self);
  v17 = v16;
  v18 = 0.0;
  if ((*((_BYTE *)&self->_pickerViewFlags + 2) & 2) == 0)
  {
    -[UIPickerView _style](self, "_style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "horizontalPaddingForCenterHighlightView");
    v18 = v20;

  }
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v21 = CGRectGetWidth(v30) - (v18 + v18);
  topLineOrFillView = self->_topLineOrFillView;
  if (!topLineOrFillView)
  {
    -[UIPickerView _style](self, "_style");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createCenterHighlightView");
    v24 = (UIView *)objc_claimAutoreleasedReturnValue();
    v25 = self->_topLineOrFillView;
    self->_topLineOrFillView = v24;

    topLineOrFillView = self->_topLineOrFillView;
  }
  -[UIView setFrame:](topLineOrFillView, "setFrame:", v18, v17, v21, v15);
  if (self->_topLineOrFillView)
  {
    -[UIPickerView _style](self, "_style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "highlightViewIsOverlay");

    if ((v27 & 1) != 0)
    {
      -[UIView addSubview:](self, "addSubview:", self->_topLineOrFillView);
    }
    else
    {
      -[UIPickerView _contentView](self, "_contentView");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", self->_topLineOrFillView);

    }
  }
}

- (void)_addMagnifierLinesForRowHeight:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIView *v19;
  UIView *topLineOrFillView;
  UIView *v21;
  UIView *bottomLineView;

  UIRoundToViewScale(self);
  v5 = v4;
  -[UIView bounds](self, "bounds");
  -[UIPickerView _style](self, "_style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verticalPaddingForCenterHighlightView");
  v8 = v7;

  UIRoundToViewScale(self);
  v10 = v9;
  UIRoundToViewScale(self);
  v12 = v11;
  UIRoundToViewScale(self);
  v14 = v13;
  -[UIView bounds](self, "bounds");
  v16 = v15;
  -[UIView bounds](self, "bounds");
  v18 = v17;
  if (!self->_topLineOrFillView)
  {
    v19 = objc_alloc_init(UIView);
    topLineOrFillView = self->_topLineOrFillView;
    self->_topLineOrFillView = v19;

    -[UIView setBackgroundColor:](self->_topLineOrFillView, "setBackgroundColor:", self->_magnifierLineColor);
  }
  if (!self->_bottomLineView)
  {
    v21 = objc_alloc_init(UIView);
    bottomLineView = self->_bottomLineView;
    self->_bottomLineView = v21;

    -[UIView setBackgroundColor:](self->_bottomLineView, "setBackgroundColor:", self->_magnifierLineColor);
  }
  -[UIView setFrame:](self->_topLineOrFillView, "setFrame:", 0.0, v10 - v12 - v8 * 0.5, v16, v5);
  -[UIView setFrame:](self->_bottomLineView, "setFrame:", 0.0, v8 * 0.5 + v14, v18, v5);
  -[UIView addSubview:](self, "addSubview:", self->_topLineOrFillView);
  -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_topLineOrFillView);
  -[UIView addSubview:](self, "addSubview:", self->_bottomLineView);
  -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_bottomLineView);
}

- (void)_setMagnifierLineColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_magnifierLineColor, a3);
  v5 = a3;
  -[UIView setBackgroundColor:](self->_topLineOrFillView, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_bottomLineView, "setBackgroundColor:", v5);

}

- (id)_createColumnWithTableFrame:(CGRect)a3 rowHeight:(double)a4 paddingAroundWheels:(double)a5
{
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIPickerColumnView *v22;
  UIPickerColumnView *v23;
  double y;
  double width;
  double height;
  _BYTE v28[128];

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIPickerView _style](self, "_style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "verticalPaddingForCenterHighlightView");
  v11 = v10;

  v12 = 0.0;
  if ((dyld_program_sdk_at_least() & 1) == 0 && dyld_program_sdk_at_least())
  {
    -[UIPickerView _selectionBarSideInset](self, "_selectionBarSideInset");
    v12 = v13;
  }
  -[UIView bounds](self, "bounds");
  v15 = v14;
  v17 = v12 + v16;
  v19 = v18 - (v12 + v12);
  v21 = v20 + 0.0;
  v22 = [UIPickerColumnView alloc];
  -[UIPickerView _perspectiveTransform](self, "_perspectiveTransform");
  v23 = -[UIPickerColumnView initWithFrame:tableFrame:middleBarHeight:rowHeight:paddingAroundWheels:pickerView:transform:](v22, "initWithFrame:tableFrame:middleBarHeight:rowHeight:paddingAroundWheels:pickerView:transform:", self, v28, v17, v21, v19, v15, x, y, width, height, v11 + a4, *(_QWORD *)&a4, *(_QWORD *)&a5);
  -[NSMutableArray addObject:](self->_tables, "addObject:", v23);
  -[UIView setAutoresizingMask:](v23, "setAutoresizingMask:", 26);
  -[UIPickerColumnView _setTextColor:](v23, "_setTextColor:", self->_textColor);
  -[UIPickerView _setColumnView:enabled:](self, "_setColumnView:enabled:", v23, -[UIPickerView _enabled](self, "_enabled"));
  return v23;
}

- (id)_createTableWithFrame:(CGRect)a3 forComponent:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  UIPickerTableView *v10;
  UIPickerTableView *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = [UIPickerTableView alloc];
  v11 = -[UIPickerTableView initWithFrame:style:visibleRect:](v10, "initWithFrame:style:visibleRect:", 0, x, y, width, height, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NSMutableArray addObject:](self->_tables, "addObject:", v11);
  -[UITableView setDataSource:](v11, "setDataSource:", self);
  -[UIPickerView _delegateRowHeightForComponent:](self, "_delegateRowHeightForComponent:", a4);
  -[UITableView setRowHeight:](v11, "setRowHeight:");
  -[UITableView setEstimatedRowHeight:](v11, "setEstimatedRowHeight:", 0.0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v11, "setShowsVerticalScrollIndicator:", 0);
  -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 26);
  return v11;
}

- (CGSize)rowSizeForComponent:(NSInteger)component
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if ((*(_BYTE *)&self->_pickerViewFlags & 1) != 0)
    -[UIPickerView layoutSubviews](self, "layoutSubviews");
  -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", component);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfRowsInSection:", 0) < 1)
  {
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rectForRowAtIndexPath:", v6);
    v8 = v7;
    v10 = v9;

  }
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSInteger)numberOfRowsInComponent:(NSInteger)component
{
  void *v5;
  NSInteger v6;

  if ((*(_BYTE *)&self->_pickerViewFlags & 1) != 0)
    -[UIPickerView layoutSubviews](self, "layoutSubviews");
  -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", component);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", 0);

  return v6;
}

- (NSInteger)numberOfComponents
{
  if ((*(_BYTE *)&self->_pickerViewFlags & 1) != 0)
    return -[UIPickerView _delegateNumberOfComponents](self, "_delegateNumberOfComponents");
  else
    return -[NSMutableArray count](self->_tables, "count");
}

- (UIView)viewForRow:(NSInteger)row forComponent:(NSInteger)component
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  pickerViewFlags = self->_pickerViewFlags;
  if ((*(_BYTE *)&pickerViewFlags & 1) != 0)
  {
    -[UIPickerView layoutSubviews](self, "layoutSubviews");
    pickerViewFlags = self->_pickerViewFlags;
  }
  if ((*(_BYTE *)&pickerViewFlags & 0x10) != 0)
  {
    -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", component);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", row, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "wrappedView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v11;
    }
    v8 = v12;

  }
  else
  {
    v8 = 0;
  }
  return (UIView *)v8;
}

- (void)reloadAllPickerPieces
{
  if (self->_tables)
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (double)_wheelShift
{
  return 0.0;
}

- (id)_contentView
{
  return self->_foregroundView;
}

- (void)layoutSubviews
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[8];

  pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x8000) != 0)
  {
    pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags & 0xFFFFFFFE);
    self->_pickerViewFlags = pickerViewFlags;
  }
  if ((*(_BYTE *)&pickerViewFlags & 1) != 0)
  {
    self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags | 0x8000);
    -[UIPickerView _style](self, "_style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paddingBetweenWheels");
    v6 = v5;
    objc_msgSend(v4, "paddingAroundWheels");
    v8 = v7;
    objc_msgSend(v4, "horizontalPaddingForContents");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__UIPickerView_layoutSubviews__block_invoke;
    v11[3] = &unk_1E16B1E18;
    v11[4] = self;
    v11[5] = v9;
    v11[6] = v8;
    v11[7] = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    v10.receiver = self;
    v10.super_class = (Class)UIPickerView;
    -[UIView layoutSubviews](&v10, sel_layoutSubviews);
    *(_DWORD *)&self->_pickerViewFlags &= 0xFFFF7FFE;

  }
}

void __30__UIPickerView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  _DWORD *v30;
  double v31;
  double v32;
  uint64_t k;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  double v48;
  double v49;
  int v50;
  double v51;
  void *v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  CGFloat width;
  double MinX;
  double v105;
  double v106;
  double MaxX;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  void *v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  double v122;
  double v123;
  CGFloat v124;
  void *v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t m;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  uint64_t v140;
  unint64_t v141;
  void *v142;
  uint64_t n;
  void *v144;
  void *v145;
  CGFloat height;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat rect;
  CGFloat recta;
  uint64_t v154;
  _QWORD *v155;
  unsigned int v156;
  double v157;
  CGFloat v158;
  CGFloat y;
  CGFloat v160;
  CGFloat v161;
  int v162;
  CGFloat v163;
  CGFloat x;
  CGFloat v165;
  CGFloat v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;

  v178 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v156 = *(_DWORD *)(v2 + 480);
  *(_DWORD *)(v2 + 480) = v156 | 0x1000;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 480) &= ~1u;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = v3;
  v157 = v5;
  v7 = v6;
  v9 = v8;
  v10 = *(_QWORD **)(a1 + 32);
  v11 = (void *)v10[56];
  objc_msgSend(v10, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setContentScaleFactor:", 4.0);
  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setClipsToBounds:", 0);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:");
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  if (v12)
  {
    v13 = objc_msgSend(v12, "count");
    v14 = v13;
    if (v13 < 0x11)
      v15 = v177;
    else
      v15 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
    if (v14 >= 1)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend(*(id *)(a1 + 32), "tableViewForColumn:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v15[8 * i] = objc_msgSend(v20, "selectionBarRow");

      }
    }
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v21 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v172;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v172 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
          objc_msgSend(v26, "markAsNoLongerInUse");
          objc_msgSend(v26, "removeFromSuperview");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
      }
      while (v23);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeAllObjects");
  }
  else
  {
    v16 = objc_opt_new();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 416);
    *(_QWORD *)(v17 + 416) = v16;

    v15 = 0;
    v14 = 0;
  }
  v27 = objc_msgSend(*(id *)(a1 + 32), "_delegateNumberOfComponents");
  v28 = *(double *)(a1 + 40);
  v29 = v7 - (v28 + v28);
  v30 = *(_DWORD **)(a1 + 32);
  v31 = *(double *)(a1 + 48) + *(double *)(a1 + 48);
  v162 = v30[120];
  if ((v162 & 0x80) != 0)
  {
    v32 = 0.0;
    if (v27 >= 1)
    {
      for (k = 0; k != v27; ++k)
      {
        if (k)
          v31 = v31 + *(double *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "_delegateWidthForComponent:ofCount:withSizeLeft:", k, v27, v29);
        v31 = v31 + v34;
      }
      v30 = *(_DWORD **)(a1 + 32);
    }
  }
  else
  {
    v32 = floor((v29 - v31 - *(double *)(a1 + 56) * (double)(v27 - 1)) / (double)v27);
    v31 = v29;
  }
  objc_msgSend(v30, "_wheelShift");
  v36 = v35;
  objc_msgSend(*(id *)(a1 + 32), "_selectionBarSideInset");
  v38 = v37;
  v39 = ceil((v29 - v31) * 0.5);
  if (dyld_program_sdk_at_least())
  {
    if (v39 < -v38)
      v39 = -v38;
  }
  else if (v39 < 0.0)
  {
    v39 = 0.0;
  }
  v40 = v4 + v28;
  if (v27 < 0)
  {
    v42 = 0.0;
  }
  else
  {
    v41 = 0;
    v42 = 0.0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_delegateRowHeightForComponent:", v41);
      if (v43 > v42)
        v42 = v43;
      ++v41;
    }
    while (v27 + 1 != v41);
  }
  v44 = v40 + v39;
  v45 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120);
  v46 = dyld_program_sdk_at_least();
  v47 = v45;
  v155 = v15;
  if ((v45 & 0x80000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_delegateWidthForComponent:ofCount:withSizeLeft:", 0, v27, v29);
    v49 = floor(v48);
    v50 = dyld_program_sdk_at_least();
    v51 = v29;
    if (v50)
      objc_msgSend(*(id *)(a1 + 32), "bounds");
    v44 = v51 - v44 - v49;
    if ((v46 & 1) == 0)
      v44 = v44 - *(double *)(a1 + 56);
  }
  v154 = v14;
  objc_msgSend(*(id *)(a1 + 32), "_style");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "highlightViewIsOverlay");

  if ((v53 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_addMagnifierForRowHeight:", v42);
  v54 = v45;
  if ((v27 & 0x8000000000000000) == 0 && v27)
  {
    v55 = 0;
    v56 = *(_DWORD *)&v46 & (v45 >> 19);
    v57 = v9 + 75.0;
    v58 = *(double *)(a1 + 48);
    v59 = v29 - v58;
    v60 = v36 + v58;
    if (v56)
      v60 = -v60;
    v61 = v44 + v60;
    v62 = v27 - 1;
    do
    {
      if ((v162 & 0x80) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_delegateWidthForComponent:ofCount:withSizeLeft:", v55, v27, v59);
        v32 = floor(v63);
      }
      if ((v54 & 0x80000) != 0)
      {
        v64 = v32;
        if (v62 != v55)
        {
          objc_msgSend(*(id *)(a1 + 32), "_delegateWidthForComponent:ofCount:withSizeLeft:", v55 + 1, v27, v59 - v32);
          v64 = floor(v65);
        }
        v66 = v61 - v64;
      }
      else
      {
        v66 = v61 + v32;
      }
      v67 = v59 - v32;
      objc_msgSend(*(id *)(a1 + 32), "_createColumnWithTableFrame:rowHeight:paddingAroundWheels:", v61, v157 + -37.5, v32, v57, v42, *(double *)(a1 + 48));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setAllowsMultipleSelection:", (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 480) >> 10) & 1);
      objc_msgSend(*(id *)(a1 + 32), "_contentView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addSubview:", v68);

      v70 = v55 + 1;
      v71 = 56;
      if (v62 == v55)
        v71 = 48;
      v72 = *(double *)(a1 + v71);
      v73 = v36 + v72;
      if (v56)
        v73 = -(v36 + v72);
      v61 = v66 + v73;
      v59 = v67 - v72;
      ++v55;
      v54 = v47;
    }
    while (v27 != v70);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v82 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count");
    v83 = v82 - 2;
    if (v82 == 2)
    {
      v92 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
      rect = v79;
      v147 = v75;
      v149 = v77;
      if ((v54 & 0x80000) != 0)
      {
        objc_msgSend(v92, "lastObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "firstObject");
      }
      else
      {
        objc_msgSend(v92, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "lastObject");
      }
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_tableFrame");
      v96 = v95;
      v98 = v97;
      v100 = v99;
      v102 = v101;
      objc_msgSend(v94, "_tableFrame");
      y = v183.origin.y;
      x = v183.origin.x;
      width = v183.size.width;
      height = v183.size.height;
      MinX = CGRectGetMinX(v183);
      v184.origin.x = v96;
      v184.origin.y = v98;
      v184.size.width = v100;
      v184.size.height = v102;
      v105 = (MinX - CGRectGetMaxX(v184)) * 0.5;
      v185.origin.x = v96;
      v185.origin.y = v98;
      v185.size.width = v100;
      v185.size.height = v102;
      v106 = CGRectGetMinX(v185);
      v186.origin.x = v147;
      v186.origin.y = v149;
      v186.size.width = rect;
      v186.size.height = v81;
      objc_msgSend(v85, "setLeftHitTestExtension:", v106 - CGRectGetMinX(v186));
      objc_msgSend(v85, "setRightHitTestExtension:", v105);
      objc_msgSend(v94, "setLeftHitTestExtension:", v105);
      v187.origin.x = v147;
      v187.origin.y = v149;
      v187.size.width = rect;
      v187.size.height = v81;
      MaxX = CGRectGetMaxX(v187);
      v109 = y;
      v108 = x;
      v110 = width;
      v111 = height;
    }
    else
    {
      v84 = v82;
      if (v82 == 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "_tableFrame");
        v158 = v179.size.width;
        v163 = v179.origin.x;
        v86 = v179.origin.y;
        v87 = v179.size.height;
        v88 = v75;
        v89 = v79;
        v90 = CGRectGetMinX(v179);
        v180.origin.x = v88;
        v180.origin.y = v77;
        v180.size.width = v89;
        v180.size.height = v81;
        objc_msgSend(v85, "setLeftHitTestExtension:", v90 - CGRectGetMinX(v180));
        v181.origin.x = v88;
        v181.origin.y = v77;
        v181.size.width = v89;
        v181.size.height = v81;
        v91 = CGRectGetMaxX(v181);
        v182.size.width = v158;
        v182.origin.x = v163;
        v182.origin.y = v86;
        v182.size.height = v87;
        objc_msgSend(v85, "setRightHitTestExtension:", v91 - CGRectGetMaxX(v182));
LABEL_85:

        goto LABEL_86;
      }
      v93 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
      recta = v79;
      if ((v54 & 0x80000) != 0)
        objc_msgSend(v93, "lastObject");
      else
        objc_msgSend(v93, "firstObject");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "_tableFrame");
      v113 = v188.origin.x;
      v114 = v188.origin.y;
      v160 = v188.size.width;
      v165 = v188.size.height;
      v115 = CGRectGetMinX(v188);
      v148 = v75;
      v150 = v77;
      v189.origin.x = v75;
      v189.origin.y = v77;
      v189.size.width = recta;
      v151 = v81;
      v189.size.height = v81;
      objc_msgSend(v112, "setLeftHitTestExtension:", v115 - CGRectGetMinX(v189));
      if (v84 < 3)
      {
        v85 = v112;
        v118 = v113;
        v119 = v114;
        v120 = v160;
        v121 = v165;
      }
      else
      {
        v116 = 1;
        do
        {
          if ((*(_QWORD *)&v54 & 0x80000) != 0)
            v117 = v83;
          else
            v117 = v116;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v117);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "_tableFrame");
          v118 = v190.origin.x;
          v119 = v190.origin.y;
          v120 = v190.size.width;
          v121 = v190.size.height;
          v122 = CGRectGetMinX(v190);
          v191.origin.x = v113;
          v191.origin.y = v114;
          v191.size.width = v160;
          v191.size.height = v165;
          v123 = (v122 - CGRectGetMaxX(v191)) * 0.5;
          objc_msgSend(v112, "setRightHitTestExtension:", v123);
          objc_msgSend(v85, "setLeftHitTestExtension:", v123);

          ++v116;
          v160 = v120;
          v165 = v121;
          v114 = v119;
          v113 = v118;
          v112 = v85;
          --v83;
        }
        while (v83);
      }
      v124 = v118;
      v125 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
      if ((v54 & 0x80000) != 0)
        objc_msgSend(v125, "firstObject");
      else
        objc_msgSend(v125, "lastObject");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = v119;
      objc_msgSend(v94, "_tableFrame");
      v161 = v192.size.height;
      v166 = v192.origin.x;
      v127 = v192.origin.y;
      v128 = v192.size.width;
      v129 = CGRectGetMinX(v192);
      v193.origin.x = v124;
      v193.origin.y = v126;
      v193.size.width = v120;
      v193.size.height = v121;
      v130 = (v129 - CGRectGetMaxX(v193)) * 0.5;
      objc_msgSend(v85, "setRightHitTestExtension:", v130);
      objc_msgSend(v94, "setLeftHitTestExtension:", v130);
      v194.origin.x = v148;
      v194.origin.y = v150;
      v194.size.height = v151;
      v194.size.width = recta;
      MaxX = CGRectGetMaxX(v194);
      v111 = v161;
      v108 = v166;
      v109 = v127;
      v110 = v128;
    }
    objc_msgSend(v94, "setRightHitTestExtension:", MaxX - CGRectGetMaxX(*(CGRect *)&v108));

    goto LABEL_85;
  }
LABEL_86:
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v131 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v167, v175, 16);
  if (v132)
  {
    v133 = v132;
    v134 = *(_QWORD *)v168;
    do
    {
      for (m = 0; m != v133; ++m)
      {
        if (*(_QWORD *)v168 != v134)
          objc_enumerationMutation(v131);
        v136 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * m);
        v137 = *(void **)(a1 + 32);
        objc_msgSend(v136, "rowHeight");
        objc_msgSend(v137, "_selectionBarRectForHeight:");
        objc_msgSend(v136, "setSelectionBarRect:");
      }
      v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v167, v175, 16);
    }
    while (v133);
  }

  objc_msgSend(*(id *)(a1 + 32), "_style");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v138, "highlightViewIsOverlay");

  if (v139)
    objc_msgSend(*(id *)(a1 + 32), "_addMagnifierForRowHeight:", v42);
  v140 = v154;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count"))
  {
    v141 = 0;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndex:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "reloadData");

      ++v141;
    }
    while (v141 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count"));
  }
  if (v155)
  {
    if (v27 < v154)
      v140 = v27;
    if (v140 >= 1)
    {
      for (n = 0; n != v140; ++n)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndex:", n);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "selectRow:animated:notify:updateChecked:", v155[n], 0, 0, objc_msgSend(*(id *)(a1 + 32), "allowsMultipleSelection") ^ 1);

      }
    }
    if (v155 != (_QWORD *)v177)
      free(v155);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetSelectionOfTables");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 480) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 480) & 0xFFFFEFFF | (((v156 >> 12) & 1) << 12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "addSublayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));

}

- (void)_resetSelectionOfTables
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[UIPickerView _delegateNumberOfComponents](self, "_delegateNumberOfComponents");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      if (-[UIPickerView _delegateNumberOfRowsInComponent:](self, "_delegateNumberOfRowsInComponent:", i) >= 1
        && (*((_BYTE *)&self->_pickerViewFlags + 1) & 0x20) == 0)
      {
        -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectRow:animated:notify:", 0, 0, 0);

      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  char v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize v21;
  CGSize v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIPickerView _style](self, "_style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sizeIsValid:", width, height);

  if ((v9 & 1) == 0)
  {
    -[UIPickerView _sizeThatFits:](self, "_sizeThatFits:", width, height);
    v11 = v10;
    v13 = v12;
    v21.width = width;
    v21.height = height;
    NSStringFromCGSize(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22.width = v11;
    v22.height = v13;
    NSStringFromCGSize(v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("-[UIPickerView setFrame:]: invalid size %@ pinned to %@ "), v14, v15);

    width = v11;
    height = v13;
  }
  -[UIView frame](self, "frame");
  v17 = v16;
  v19 = v18;
  v20.receiver = self;
  v20.super_class = (Class)UIPickerView;
  -[UIView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  if (v17 != width || v19 != height)
    -[UIPickerView _updateWithOldSize:newSize:](self, "_updateWithOldSize:newSize:", v17, v19, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "sizeForMainScreenTraitsThatFits:", width, height);
    width = v8;
    height = v9;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIPickerView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (v11 != width || v13 != height)
    -[UIPickerView _updateWithOldSize:newSize:](self, "_updateWithOldSize:newSize:", v11, v13, width, height);
}

- (void)setDataSource:(id)dataSource
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  id WeakRetained;

  objc_storeWeak((id *)&self->_dataSource, dataSource);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 32;
  else
    v4 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFDF | v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 64;
  else
    v5 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFBF | v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 16;
  else
    v6 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFEF | v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 8;
  else
    v7 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFF7 | v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 128;
  else
    v8 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFF7F | v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 256;
  else
    v9 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFEFF | v9);
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setDelegate:(id)delegate
{
  UIPickerViewDelegate **p_delegate;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  char v13;
  int v14;

  p_delegate = &self->_delegate;
  v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 32;
  else
    v6 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFDF | v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 64;
  else
    v7 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFBF | v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 16;
  else
    v8 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFEF | v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFF7 | v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 128;
  else
    v10 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFF7F | v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 256;
  else
    v11 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFEFF | v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 2;
  else
    v12 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFFD | v12);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
    v14 = 4;
  else
    v14 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFFB | v14);
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsSelectionIndicator:(BOOL)showsSelectionIndicator
{
  int v3;

  if (((((*(_DWORD *)&self->_pickerViewFlags & 0x200) == 0) ^ showsSelectionIndicator) & 1) == 0)
  {
    if (showsSelectionIndicator)
      v3 = 512;
    else
      v3 = 0;
    self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFDFF | v3);
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showsSelectionIndicator
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 1) & 1;
}

- (void)_sendSelectionChangedForComponent:(int64_t)a3 notify:(BOOL)a4
{
  NSInteger v6;
  id WeakRetained;

  if ((*(_BYTE *)&self->_pickerViewFlags & 8) != 0 && a4)
  {
    v6 = -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pickerView:didSelectRow:inComponent:", self, v6, a3);

  }
  -[UIPickerView _noteScrollingFinishedForComponent:](self, "_noteScrollingFinishedForComponent:", a3, a4);
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  int v3;
  NSMutableArray *tables;
  _QWORD v5[4];
  BOOL v6;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFBFF | v3);
  tables = self->_tables;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__UIPickerView_setAllowsMultipleSelection___block_invoke;
  v5[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
  v6 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](tables, "enumerateObjectsUsingBlock:", v5);
}

uint64_t __43__UIPickerView_setAllowsMultipleSelection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowsMultipleSelection:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)allowsMultipleSelection
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 2) & 1;
}

- (BOOL)_usesCheckSelection
{
  return 0;
}

- (void)_sendSelectionChangedFromTable:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v6;

  v4 = a4;
  v6 = -[UIPickerView columnForTableView:](self, "columnForTableView:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPickerView _sendSelectionChangedForComponent:notify:](self, "_sendSelectionChangedForComponent:notify:", v6, v4);
}

- (void)_setUsesCheckedSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFDFFF | v3);
}

- (BOOL)_usesCheckedSelection
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 5) & 1;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  int v4;
  void *v5;

  if (a3)
    v4 = 0;
  else
    v4 = 0x4000;
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFBFFF | v4);
  if (a3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerView setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  else
  {
    -[UIPickerView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_drawsBackground
{
  return (*((_BYTE *)&self->_pickerViewFlags + 1) & 0x40) == 0;
}

- (BOOL)_needsLayout
{
  return *(_DWORD *)&self->_pickerViewFlags & 1;
}

- (CGSize)_contentSizeForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CGSize result;

  if (-[UIPickerView numberOfComponents](self, "numberOfComponents") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("component < [self numberOfComponents]"));

  }
  if (-[UIPickerView numberOfRowsInComponent:](self, "numberOfRowsInComponent:", a4) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < [self numberOfRowsInComponent:component]"));

  }
  -[UIPickerView tableViewForColumn:](self, "tableViewForColumn:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectForRowAtIndexPath:", v9);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)_forceTextAlignmentCentered
{
  return 0;
}

- (_NSRange)visibleRowsForColumn:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_visibleGlobalRows");
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (NSInteger)selectedRowInComponent:(NSInteger)component
{
  void *v6;
  NSInteger v7;
  void *v9;

  if ((*(_BYTE *)&self->_pickerViewFlags & 1) != 0)
    -[UIPickerView layoutSubviews](self, "layoutSubviews");
  if (-[NSMutableArray count](self->_tables, "count") <= (unint64_t)component)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1290, CFSTR("Tried to fetch selected row in component %ld, but there are only %ld tables."), component, -[NSMutableArray count](self->_tables, "count"));

  }
  -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", component);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectionBarRow");

  return v7;
}

- (int)selectedRowForColumn:(int)a3
{
  return -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", a3);
}

- (int64_t)columnForTableView:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[NSMutableArray count](self->_tables, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_containsTable:", v4);

      if ((v7 & 1) != 0)
        break;
      if (++v5 >= (unint64_t)-[NSMutableArray count](self->_tables, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = -1;
  }

  return v5;
}

- (id)tableViewForColumn:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_effectiveTableViewFrameForColumn:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tableFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  char v12;
  id v13;

  v6 = a6;
  v7 = a5;
  pickerViewFlags = self->_pickerViewFlags;
  v12 = (char)pickerViewFlags;
  if (!a5)
  {
    v12 = (char)self->_pickerViewFlags;
    self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags | 0x1000);
  }
  if ((v12 & 1) != 0)
    -[UIPickerView layoutSubviews](self, "layoutSubviews");
  -[NSMutableArray objectAtIndex:](self->_tables, "objectAtIndex:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPickerView _sendSelectionChangedFromTable:notify:](self, "_sendSelectionChangedFromTable:notify:", v13, v6 & ~objc_msgSend(v13, "selectRow:animated:notify:", a3, v7, v6));
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFEFFF | (((*(unsigned int *)&pickerViewFlags >> 12) & 1) << 12));

}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{
  -[UIPickerView _selectRow:inComponent:animated:notify:](self, "_selectRow:inComponent:animated:notify:", row, component, animated, 0);
}

- (void)selectRow:(int)a3 inColumn:(int)a4 animated:(BOOL)a5
{
  -[UIPickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", a3, a4, a5);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6;
  void *v8;

  v6 = -[UIPickerView columnForTableView:](self, "columnForTableView:", a3, a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1352, CFSTR("column should exist in tables array"));

  }
  return -[UIPickerView _delegateNumberOfRowsInComponent:](self, "_delegateNumberOfRowsInComponent:", v6);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  UIPickerTableViewWrapperCell *v9;
  UIPickerTableViewTitledCell *v10;
  void *v11;
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = -[UIPickerView columnForTableView:](self, "columnForTableView:", v6);
  if ((*(_BYTE *)&self->_pickerViewFlags & 0x10) != 0)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPickerTableViewWrapperCell"));
    v9 = (UIPickerTableViewWrapperCell *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = -[UIPickerTableViewWrapperCell initWithStyle:reuseIdentifier:]([UIPickerTableViewWrapperCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("UIPickerTableViewWrapperCell"));
    -[UIPickerTableViewWrapperCell wrappedView](v9, "wrappedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "_canBeReusedInPickerView") & 1) == 0)
    {

      v14 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pickerView:viewForRow:forComponent:reusingView:", self, objc_msgSend(v7, "row"), v8, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPickerTableViewWrapperCell setWrappedView:](v9, "setWrappedView:", v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isRowChecked:", objc_msgSend(v7, "row")))
      objc_msgSend(v16, "setChecked:", 1);

    goto LABEL_15;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPickerTableViewTitledCell"));
  v9 = (UIPickerTableViewWrapperCell *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [UIPickerTableViewTitledCell alloc];
    -[UIPickerView _textColor](self, "_textColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIPickerTableViewTitledCell initWithStyle:reuseIdentifier:textColor:forceTextAlignmentCentered:](v10, "initWithStyle:reuseIdentifier:textColor:forceTextAlignmentCentered:", 0, CFSTR("UIPickerTableViewTitledCell"), v11, -[UIPickerView _forceTextAlignmentCentered](self, "_forceTextAlignmentCentered"));

  }
  pickerViewFlags = self->_pickerViewFlags;
  if ((*(_BYTE *)&pickerViewFlags & 0x40) != 0)
  {
    -[UIPickerView _delegateAttributedTitleForRow:forComponent:](self, "_delegateAttributedTitleForRow:forComponent:", objc_msgSend(v7, "row"), v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[UIPickerTableViewWrapperCell setAttributedTitle:](v9, "setAttributedTitle:", v13);
LABEL_15:

      goto LABEL_20;
    }
    pickerViewFlags = self->_pickerViewFlags;
  }
  if ((*(_BYTE *)&pickerViewFlags & 0x20) != 0)
  {
    -[UIPickerView _delegateTitleForRow:forComponent:](self, "_delegateTitleForRow:forComponent:", objc_msgSend(v7, "row"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerTableViewWrapperCell setTitle:](v9, "setTitle:", v17);

  }
  else
  {
    -[UIPickerTableViewWrapperCell setTitle:](v9, "setTitle:", CFSTR("?"));
  }
LABEL_20:

  return v9;
}

- (void)_setMagnifierEnabled:(BOOL)a3
{
  self->_magnifierEnabled = a3;
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setHighlightColor:(id)a3
{
  -[UIView _setInteractionTintColor:](self, "_setInteractionTintColor:", a3);
  -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)_textColor
{
  return self->_textColor;
}

- (void)_setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_textColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIColor)_textShadowColor
{
  return self->_textShadowColor;
}

- (void)_setTextShadowColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_textColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textShadowColor, a3);
    -[UIPickerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CATransform3D)_perspectiveTransform
{
  void *v4;
  CATransform3D *result;
  void *v6;

  -[UIPickerView _style](self, "_style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "perspectiveTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_willPlayClickSound
{
  id v2;

  -[UIPickerView _scalarStatisticsForUserValueChangedEvent](self, "_scalarStatisticsForUserValueChangedEvent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementValueBy:", 1);

}

- (id)_scalarStatisticsForUserValueChangedEvent
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics controlValueChangeEmittedCountWithCategory:suffix:](_UIStatistics, "controlValueChangeEmittedCountWithCategory:suffix:", CFSTR("picker"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_canHostViewControllerContentScrollView
{
  return 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPickerView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (void)_prepareStyleStorageIfNecessary
{
  if (_prepareStyleStorageIfNecessary_once_0 != -1)
    dispatch_once(&_prepareStyleStorageIfNecessary_once_0, &__block_literal_global_110_3);
}

void __47__UIPickerView__prepareStyleStorageIfNecessary__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__pickerViewIdiomsToStyles;
  __pickerViewIdiomsToStyles = v0;

}

+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a1, "_prepareStyleStorageIfNecessary");
  v7 = (void *)__pickerViewIdiomsToStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

}

+ (id)_styleForIdiom:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIPickerViewStyle_iOS *v7;
  _UIPickerViewStyle_iOS *v8;

  objc_msgSend(a1, "_prepareStyleStorageIfNecessary");
  v4 = (void *)__pickerViewIdiomsToStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(_UIPickerViewStyle_iOS);
  v8 = v7;

  return v8;
}

- (_UIPickerViewStyle)_style
{
  _UIPickerViewStyle *style;
  void *v4;
  _UIPickerViewStyle *v5;
  _UIPickerViewStyle *v6;

  style = self->_style;
  if (!style)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (_UIPickerViewStyle *)objc_claimAutoreleasedReturnValue();

    v6 = self->_style;
    self->_style = v5;

    style = self->_style;
  }
  return style;
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_magnifierEnabled
{
  return self->_magnifierEnabled;
}

- (BOOL)_enabled
{
  return self->_enabled;
}

- (int64_t)_magnifierStyle
{
  return self->_magnifierStyle;
}

- (void)_setMagnifierStyle:(int64_t)a3
{
  self->_magnifierStyle = a3;
}

- (UISelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)_setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (UIColor)_magnifierLineColor
{
  return self->_magnifierLineColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifierLineColor, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_currentTestParameters, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_textShadowColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_topLineOrFillView, 0);
  objc_storeStrong((id *)&self->_maskGradientLayer, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tables, 0);
}

- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6
{
  NSString *v11;
  NSInteger v12;
  _UIPickerViewTestParameters *v13;
  _UIPickerViewTestParameters *currentTestParameters;
  _UIPickerViewTestParameters *v15;
  NSString *testName;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = (NSString *)a3;
  if (self->_currentTestParameters)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1518, CFSTR("Picker Testing: Only one test may be run at a time"));

  }
  if (-[UIPickerView numberOfComponents](self, "numberOfComponents") <= a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1519, CFSTR("Picker Testing: Component specified does not exist"));

  }
  v12 = -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", a6) + a5 * a4;
  if (v12 >= -[UIPickerView _delegateNumberOfRowsInComponent:](self, "_delegateNumberOfRowsInComponent:", a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPickerView.m"), 1521, CFSTR("Picker Testing: Rows to scroll would go past the end of the component"));

  }
  v13 = objc_alloc_init(_UIPickerViewTestParameters);
  currentTestParameters = self->_currentTestParameters;
  self->_currentTestParameters = v13;

  v15 = self->_currentTestParameters;
  testName = v15->_testName;
  v15->_testName = v11;
  v17 = v11;

  self->_currentTestParameters->_remainingIterations = a4;
  self->_currentTestParameters->_rowsToScroll = a5;
  self->_currentTestParameters->_componentToScroll = a6;
  objc_msgSend((id)UIApp, "startedTest:", v17);

  -[UIPickerView _iterateOnCurrentTest](self, "_iterateOnCurrentTest");
}

- (void)_iterateOnCurrentTest
{
  _UIPickerViewTestParameters *currentTestParameters;

  currentTestParameters = self->_currentTestParameters;
  if (currentTestParameters->_remainingIterations)
    -[UIPickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", self->_currentTestParameters->_rowsToScroll+ -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:", currentTestParameters->_componentToScroll), currentTestParameters->_componentToScroll, 1);
  else
    -[UIPickerView _completeCurrentTest](self, "_completeCurrentTest");
}

- (void)_completeCurrentTest
{
  _UIPickerViewTestParameters *currentTestParameters;
  NSString *testName;
  NSString *v4;

  currentTestParameters = self->_currentTestParameters;
  testName = currentTestParameters->_testName;
  self->_currentTestParameters = 0;
  v4 = testName;

  objc_msgSend((id)UIApp, "finishedTest:", v4);
}

- (void)_noteScrollingFinishedForComponent:(int64_t)a3
{
  _UIPickerViewTestParameters *currentTestParameters;

  currentTestParameters = self->_currentTestParameters;
  if (currentTestParameters)
  {
    if (currentTestParameters->_componentToScroll == a3)
    {
      --currentTestParameters->_remainingIterations;
      -[UIPickerView _iterateOnCurrentTest](self, "_iterateOnCurrentTest");
    }
  }
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFB | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 2) & 1;
}

@end
