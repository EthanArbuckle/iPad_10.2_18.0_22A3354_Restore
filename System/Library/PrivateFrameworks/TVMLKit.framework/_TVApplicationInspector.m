@implementation _TVApplicationInspector

- (_TVApplicationInspector)initWithApplicationController:(id)a3
{
  id v4;
  _TVApplicationInspector *v5;
  _TVApplicationInspector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVApplicationInspector;
  v5 = -[_TVApplicationInspector init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_applicationController, v4);
    v6->_inspectionModeEnabled = 0;
  }

  return v6;
}

- (NSHashTable)highlightViews
{
  NSHashTable *highlightViews;
  NSHashTable *v4;
  NSHashTable *v5;

  highlightViews = self->_highlightViews;
  if (!highlightViews)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highlightViews;
    self->_highlightViews = v4;

    highlightViews = self->_highlightViews;
  }
  return highlightViews;
}

- (_TVInspectorCapturingView)capturingView
{
  _TVInspectorCapturingView *capturingView;
  _TVInspectorCapturingView *v4;
  _TVInspectorCapturingView *v5;
  _TVInspectorCapturingView *v6;

  capturingView = self->_capturingView;
  if (!capturingView)
  {
    v4 = [_TVInspectorCapturingView alloc];
    v5 = -[_TVInspectorCapturingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_capturingView;
    self->_capturingView = v5;

    -[_TVInspectorCapturingView setDelegate:](self->_capturingView, "setDelegate:", self);
    capturingView = self->_capturingView;
  }
  return capturingView;
}

- (id)rootView
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  -[_TVApplicationInspector applicationController](self, "applicationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyTraitEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v3, "keyTraitEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "view");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "keyTraitEnvironment");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[_TVApplicationInspector applicationController](self, "applicationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)setInspectionModeEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_inspectionModeEnabled != a3)
  {
    self->_inspectionModeEnabled = a3;
    if (a3)
    {
      -[_TVApplicationInspector rootView](self, "rootView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_TVApplicationInspector capturingView](self, "capturingView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      objc_msgSend(v4, "setFrame:");

      -[_TVApplicationInspector capturingView](self, "capturingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v5);

    }
    else
    {
      -[_TVApplicationInspector capturingView](self, "capturingView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");
    }

  }
}

- (void)capturingView:(id)a3 didCaptureTapOnView:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE51A30], "tv_approximateViewElementForView:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_TVApplicationInspector applicationController](self, "applicationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inspectElement:", v7);

    -[_TVApplicationInspector setInspectionModeEnabled:](self, "setInspectionModeEnabled:", 0);
  }

}

- (void)highlightViewElements:(id)a3 contentColor:(id)a4 borderColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_TVApplicationInspector cancelHighlight](self, "cancelHighlight");
  -[_TVApplicationInspector highlightViews](self, "highlightViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v24;
    *(_QWORD *)&v14 = 138412290;
    v22 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[_TVApplicationInspector _highlightViewForElement:contentColor:borderColor:](self, "_highlightViewForElement:contentColor:borderColor:", v18, v9, v10, v22, (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[_TVApplicationInspector highlightViews](self, "highlightViews");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v19);

        }
        else
        {
          -[_TVApplicationInspector cancelHighlight](self, "cancelHighlight");
          v21 = TVMLKitLogObject;
          if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            v28 = v18;
            _os_log_debug_impl(&dword_222D98000, v21, OS_LOG_TYPE_DEBUG, "Couldn't find view to highlight for %@", buf, 0xCu);
          }
        }

      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v15);
  }

}

- (void)cancelHighlight
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_TVApplicationInspector highlightViews](self, "highlightViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperview");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_highlightViewForElement:(id)a3 contentColor:(id)a4 borderColor:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _TVInspectorHighlightView *v12;
  double v14;
  double v15;
  _TVInspectorHighlightView *v16;
  _TVInspectorHighlightView *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _TVInspectorHighlightView *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "tv_proxyView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (objc_msgSend(v10, "isHidden") & 1) != 0)
  {

LABEL_4:
    v12 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v10, "alpha");
  v15 = v14;

  if (v15 <= 0.0)
    goto LABEL_4;
  v47 = v10;
  v16 = [_TVInspectorHighlightView alloc];
  v17 = -[_TVInspectorHighlightView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v49 = v8;
  -[_TVInspectorHighlightView setContentColor:](v17, "setContentColor:", v8);
  v46 = v17;
  v48 = v9;
  -[_TVInspectorHighlightView setBorderColor:](v17, "setBorderColor:", v9);
  v18 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v7, "elementName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

  v21 = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 15.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAttribute:value:range:", v21, v22, 0, objc_msgSend(v23, "length"));

  v24 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "systemDarkPinkColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAttribute:value:range:", v24, v25, 0, objc_msgSend(v26, "length"));

  objc_msgSend(v7, "attributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BE51830]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v29);
    objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 15.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAttribute:value:range:", v21, v31, 0, objc_msgSend(v29, "length"));

    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAttribute:value:range:", v24, v32, 0, objc_msgSend(v29, "length"));

    objc_msgSend(v20, "appendAttributedString:", v30);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = v7;
  objc_msgSend(v7, "attributes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x24BE51820]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "componentsSeparatedByString:", CFSTR(" "));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v35;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@"), *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v40);
        objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 15.0, 0.0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addAttribute:value:range:", v21, v42, 0, objc_msgSend(v40, "length"));

        objc_msgSend(MEMORY[0x24BDF6950], "systemDarkPinkColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addAttribute:value:range:", v24, v43, 0, 1);

        objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addAttribute:value:range:", v24, v44, 1, objc_msgSend(v40, "length") - 1);

        objc_msgSend(v20, "appendAttributedString:", v41);
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v37);
  }

  v12 = v46;
  -[_TVInspectorHighlightView descriptionLabel](v46, "descriptionLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAttributedText:", v20);

  v10 = v47;
  -[_TVInspectorHighlightView highlightView:](v46, "highlightView:", v47);

  v8 = v49;
  v7 = v50;
  v9 = v48;
LABEL_5:

  return v12;
}

- (TVApplicationController)applicationController
{
  return (TVApplicationController *)objc_loadWeakRetained((id *)&self->_applicationController);
}

- (BOOL)isInspectionModeEnabled
{
  return self->_inspectionModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationController);
  objc_storeStrong((id *)&self->_capturingView, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
}

@end
