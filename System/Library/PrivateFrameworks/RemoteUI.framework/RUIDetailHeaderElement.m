@implementation RUIDetailHeaderElement

- (void)configureView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RUIHeaderView **p_headerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id location[3];
  _QWORD v44[10];
  _QWORD v45[11];

  v45[10] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIElement body](self, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailText:attributes:", v5, v6);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_headerView = &self->_headerView;
    objc_storeWeak((id *)&self->_headerView, v4);
    v8 = (void *)MEMORY[0x24BEBD4B8];
    -[RUIElement attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("color"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_remoteUI_colorWithString:defaultColor:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[RUIElement style](self, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailHeaderLabelTextColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    objc_msgSend(WeakRetained, "setDetailHeaderColor:", v13);

    -[RUIElement attributes](self, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("url"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else
    {
      -[RUIElement attributes](self, "attributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("activationFunction"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_11;
    }
    objc_initWeak(location, self);
    v20 = objc_loadWeakRetained((id *)&self->_headerView);
    objc_msgSend(v20, "detailHeaderLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __40__RUIDetailHeaderElement_configureView___block_invoke;
    v41[3] = &unk_24C297688;
    objc_copyWeak(&v42, location);
    objc_msgSend(v21, "setAction:", v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);
LABEL_11:
    v22 = *MEMORY[0x24BEBE240];
    v44[0] = CFSTR("title1");
    v44[1] = CFSTR("title2");
    v23 = *MEMORY[0x24BEBE248];
    v45[0] = v22;
    v45[1] = v23;
    v24 = *MEMORY[0x24BEBE250];
    v44[2] = CFSTR("title3");
    v44[3] = CFSTR("headline");
    v25 = *MEMORY[0x24BEBE200];
    v45[2] = v24;
    v45[3] = v25;
    v26 = *MEMORY[0x24BEBE220];
    v44[4] = CFSTR("subheadline");
    v44[5] = CFSTR("body");
    v27 = *MEMORY[0x24BEBE1D0];
    v45[4] = v26;
    v45[5] = v27;
    v28 = *MEMORY[0x24BEBE1D8];
    v44[6] = CFSTR("callout");
    v44[7] = CFSTR("footnote");
    v29 = *MEMORY[0x24BEBE1F0];
    v45[6] = v28;
    v45[7] = v29;
    v44[8] = CFSTR("caption1");
    v44[9] = CFSTR("caption2");
    v30 = *MEMORY[0x24BEBE1E8];
    v45[8] = *MEMORY[0x24BEBE1E0];
    v45[9] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("textStyle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_loadWeakRetained((id *)p_headerView);
      -[NSObject detailHeaderLabel](v35, "detailHeaderLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v31, "objectForKeyedSubscript:", v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "traitCollection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "preferredFontForTextStyle:compatibleWithTraitCollection:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFont:", v40);

    }
    else
    {
      if (!v33 || !_isInternalInstall())
        goto LABEL_14;
      _RUILoggingFacility();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v33;
        _os_log_impl(&dword_209E87000, v35, OS_LOG_TYPE_DEFAULT, "'%@' is not a supported text style", (uint8_t *)location, 0xCu);
      }
    }

LABEL_14:
  }

}

void __40__RUIDetailHeaderElement_configureView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performAction:completion:", 2, 0);

}

- (void)setBody:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[RUIElement body](self, "body");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)RUIDetailHeaderElement;
    -[RUIElement setBody:](&v9, sel_setBody_, v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    -[RUIElement body](self, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setDetailText:attributes:", v7, v8);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RUIDetailHeaderElement;
  -[RUIElement setEnabled:](&v7, sel_setEnabled_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  objc_msgSend(WeakRetained, "detailHeaderLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerView);
}

@end
