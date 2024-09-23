@implementation STUIStatusBarNameItem

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STUIStatusBarNameItem nameEntryKey](self, "nameEntryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (STUIStatusBarStringView)nameView
{
  STUIStatusBarStringView *nameView;

  nameView = self->_nameView;
  if (!nameView)
  {
    -[STUIStatusBarNameItem _create_nameView](self, "_create_nameView");
    nameView = self->_nameView;
  }
  return nameView;
}

- (void)_create_nameView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *nameView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameView = self->_nameView;
  self->_nameView = v4;

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarNameItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v16, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarNameItem nameEntryKey](self, "nameEntryKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEnabled"))
      v12 = objc_msgSend(v11, "isEnabled");
    else
      v12 = 0;
    objc_msgSend(v7, "setEnabled:", v12);
    if (objc_msgSend(v7, "isEnabled"))
    {
      objc_msgSend(v11, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarNameItem nameView](self, "nameView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);

    }
  }

  return v8;
}

- (NSString)nameEntryKey
{
  return self->_nameEntryKey;
}

- (void)setNameView:(id)a3
{
  objc_storeStrong((id *)&self->_nameView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameView, 0);
  objc_storeStrong((id *)&self->_nameEntryKey, 0);
}

@end
