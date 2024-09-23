@implementation _TVCommonSenseTemplateController

- (void)loadView
{
  void *v3;
  _TVCommonSenseView *v4;
  _TVCommonSenseView *v5;
  _TVCommonSenseView *commonSenseView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVCommonSenseTemplateController;
  -[_TVCommonSenseTemplateController loadView](&v7, sel_loadView);
  -[_TVCommonSenseTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);
  v4 = [_TVCommonSenseView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[_TVCommonSenseView initWithFrame:](v4, "initWithFrame:");
  commonSenseView = self->_commonSenseView;
  self->_commonSenseView = v5;

  objc_msgSend(v3, "addSubview:", self->_commonSenseView);
  -[_TVCommonSenseTemplateController _loadTemplate](self, "_loadTemplate");

}

- (void)updateWithCommonSenseTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_templateElement, a3);
  if (-[_TVCommonSenseTemplateController isViewLoaded](self, "isViewLoaded"))
    -[_TVCommonSenseTemplateController _loadTemplate](self, "_loadTemplate");
}

- (void)_loadTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[_TVCommonSenseTemplateController templateElement](self, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "tv_elementType") == 77)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "children", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "tv_elementType");
          switch(v12)
          {
            case 13:
              -[_TVCommonSenseTemplateController _updateFooterWithElement:](self, "_updateFooterWithElement:", v11);
              break;
            case 20:
              -[_TVCommonSenseTemplateController _infoTableFromElement:](self, "_infoTableFromElement:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v13);

              break;
            case 15:
              -[_TVCommonSenseTemplateController _updateHeaderWithElement:](self, "_updateHeaderWithElement:", v11);
              break;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      -[_TVCommonSenseTemplateController commonSenseView](self, "commonSenseView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInfoViews:", v5);

    }
  }

}

- (void)_updateHeaderWithElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "tv_elementType") == 15)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCommonSenseTemplateController commonSenseView](self, "commonSenseView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_viewFromElement:existingView:", v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVCommonSenseTemplateController commonSenseView](self, "commonSenseView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeaderView:", v7);

  }
}

- (void)_updateFooterWithElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _TVCommonSenseFooterView *v8;
  _TVCommonSenseFooterView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _TVCommonSenseTemplateController *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "tv_elementType") == 13)
  {
    -[_TVCommonSenseTemplateController commonSenseView](self, "commonSenseView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "footerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v20 = self;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(_TVCommonSenseFooterView);
    v9 = v8;

    -[UIView transferLayoutStylesFromElement:](v9, "transferLayoutStylesFromElement:", v4);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "tv_elementType") == 16)
          {
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[_TVCommonSenseFooterView logoView](v9, "logoView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_viewFromElement:existingView:", v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            -[_TVCommonSenseFooterView setLogoView:](v9, "setLogoView:", v18);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    -[_TVCommonSenseTemplateController commonSenseView](v20, "commonSenseView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFooterView:", v9);

  }
}

- (id)_infoTableFromElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "tv_elementType") == 20)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_viewFromElement:existingView:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_TVCommonSenseView)commonSenseView
{
  return self->_commonSenseView;
}

- (void)setCommonSenseView:(id)a3
{
  objc_storeStrong((id *)&self->_commonSenseView, a3);
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
  objc_storeStrong((id *)&self->_templateElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_commonSenseView, 0);
}

@end
