@implementation _UIStatusBarNavigationItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("backNavigationEntry"));
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarNavigationItem;
  -[_UIStatusBarItem createDisplayItemForIdentifier:](&v6, sel_createDisplayItemForIdentifier_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarSystemNavigationAction backNavigationAction](_UIStatusBarSystemNavigationAction, "backNavigationAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", v4);

  objc_msgSend(v3, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIStatusBarNavigationItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v19, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "dataChanged") & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
  {
    objc_msgSend(v6, "styleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "effectiveLayoutDirection");
    v10 = CFSTR("\u200E◀︎ %@");
    if (v9 == 1)
      v10 = CFSTR("\u200F▶︎ %@");
    v11 = v10;

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backNavigationEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarNavigationItem nameView](self, "nameView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

  }
  return v7;
}

- (_UIStatusBarStringView)nameView
{
  _UIStatusBarStringView *nameView;

  nameView = self->_nameView;
  if (!nameView)
  {
    -[_UIStatusBarNavigationItem _create_nameView](self, "_create_nameView");
    nameView = self->_nameView;
  }
  return nameView;
}

- (void)_create_nameView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *nameView;
  double v6;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameView = self->_nameView;
  self->_nameView = v4;

  LODWORD(v6) = 1132068864;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_nameView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  -[NSObject setAccessibilityIdentifier:](self->_nameView, "setAccessibilityIdentifier:", CFSTR("breadcrumb"));
}

- (void)setNameView:(id)a3
{
  objc_storeStrong((id *)&self->_nameView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameView, 0);
}

@end
