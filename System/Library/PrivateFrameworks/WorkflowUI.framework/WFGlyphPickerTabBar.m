@implementation WFGlyphPickerTabBar

- (WFGlyphPickerTabBar)initWithTabNames:(id)a3 tabCharacters:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  WFGlyphPickerTabBar *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  WFGlyphPickerTabBar *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  objc_super v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGlyphPickerTabBar.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tabNames.count == tabCharacters.count"));

  }
  v42.receiver = self;
  v42.super_class = (Class)WFGlyphPickerTabBar;
  v10 = -[WFGlyphPickerTabBar initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.09);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPickerTabBar setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setDrawBackground:", 0);
    v13 = objc_alloc_init(MEMORY[0x24BEBD9D0]);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setDelegate:", v10);
    objc_msgSend(v13, "setItemPositioning:", 2);
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __54__WFGlyphPickerTabBar_initWithTabNames_tabCharacters___block_invoke;
    v39[3] = &unk_24E603980;
    v40 = v12;
    v41 = v7;
    v38 = v12;
    objc_msgSend(v8, "if_map:", v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v14);

    objc_msgSend(v13, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectedItem:", v16);

    -[WFGlyphPickerTabBar addSubview:](v10, "addSubview:", v13);
    objc_storeWeak((id *)&v10->_tabBar, v13);
    -[WFGlyphPickerTabBar safeAreaLayoutGuide](v10, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v13, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v35;
    objc_msgSend(v13, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    objc_msgSend(v17, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v30;
    objc_msgSend(v13, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v19;
    -[WFGlyphPickerTabBar heightAnchor](v10, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = v8;
    v23 = v7;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v25);

    v7 = v23;
    v8 = v22;

    v26 = v10;
  }

  return v10;
}

- (void)setSelectedTabIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_selectedTabIndex = a3;
  -[WFGlyphPickerTabBar tabBar](self, "tabBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGlyphPickerTabBar tabBar](self, "tabBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedItem:", v6);

}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  self->_selectedTabIndex = objc_msgSend(v5, "tag");
  -[WFGlyphPickerTabBar delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tag");

  objc_msgSend(v7, "glyphPickerTabBar:didSelectTabAtIndex:", self, v6);
}

- (unint64_t)selectedTabIndex
{
  return self->_selectedTabIndex;
}

- (WFGlyphPickerTabBarDelegate)delegate
{
  return (WFGlyphPickerTabBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITabBar)tabBar
{
  return (UITabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (void)setTabBar:(id)a3
{
  objc_storeWeak((id *)&self->_tabBar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_destroyWeak((id *)&self->_delegate);
}

id __54__WFGlyphPickerTabBar_initWithTabNames_tabCharacters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "setGlyphCharacter:", (unsigned __int16)objc_msgSend(a2, "unsignedIntegerValue"));
  v5 = objc_alloc(MEMORY[0x24BEBD9E8]);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageWithSize:", 17.0, 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UIImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithTitle:image:tag:", v6, v8, a3);

  return v9;
}

@end
