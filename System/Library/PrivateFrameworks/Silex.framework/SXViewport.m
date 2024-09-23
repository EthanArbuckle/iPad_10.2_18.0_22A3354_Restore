@implementation SXViewport

- (SXViewport)initWithView:(id)a3
{
  id v4;
  SXViewport *v5;
  SXViewport *v6;
  uint64_t v7;
  NSHashTable *dynamicBoundsListeners;
  uint64_t v9;
  NSHashTable *boundsListeners;
  uint64_t v11;
  NSHashTable *appearStateListeners;
  uint64_t v13;
  NSHashTable *documentSizeListeners;
  uint64_t v15;
  NSHashTable *contentFrameListeners;
  uint64_t v17;
  NSHashTable *interfaceOrientationListeners;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SXViewport;
  v5 = -[SXViewport init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v7 = objc_claimAutoreleasedReturnValue();
    dynamicBoundsListeners = v6->_dynamicBoundsListeners;
    v6->_dynamicBoundsListeners = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v9 = objc_claimAutoreleasedReturnValue();
    boundsListeners = v6->_boundsListeners;
    v6->_boundsListeners = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v11 = objc_claimAutoreleasedReturnValue();
    appearStateListeners = v6->_appearStateListeners;
    v6->_appearStateListeners = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v13 = objc_claimAutoreleasedReturnValue();
    documentSizeListeners = v6->_documentSizeListeners;
    v6->_documentSizeListeners = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v15 = objc_claimAutoreleasedReturnValue();
    contentFrameListeners = v6->_contentFrameListeners;
    v6->_contentFrameListeners = (NSHashTable *)v15;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v17 = objc_claimAutoreleasedReturnValue();
    interfaceOrientationListeners = v6->_interfaceOrientationListeners;
    v6->_interfaceOrientationListeners = (NSHashTable *)v17;

  }
  return v6;
}

- (void)addViewportChangeListener:(id)a3 forOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_10;
  v13 = v6;
  if ((v4 & 2) != 0)
  {
    -[SXViewport dynamicBoundsListeners](self, "dynamicBoundsListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

    if ((v4 & 4) == 0)
    {
LABEL_4:
      if ((v4 & 8) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_4;
  }
  -[SXViewport boundsListeners](self, "boundsListeners");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[SXViewport appearStateListeners](self, "appearStateListeners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  -[SXViewport documentSizeListeners](self, "documentSizeListeners");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  if ((v4 & 0x20) != 0)
  {
LABEL_7:
    -[SXViewport contentFrameListeners](self, "contentFrameListeners");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
LABEL_8:
  v6 = v13;
  if ((v4 & 0x40) != 0)
  {
    -[SXViewport interfaceOrientationListeners](self, "interfaceOrientationListeners");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

    v6 = v13;
  }
LABEL_10:

}

- (void)removeViewportChangeListener:(id)a3 forOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_10;
  v13 = v6;
  if ((v4 & 2) != 0)
  {
    -[SXViewport dynamicBoundsListeners](self, "dynamicBoundsListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v13);

    if ((v4 & 4) == 0)
    {
LABEL_4:
      if ((v4 & 8) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_4;
  }
  -[SXViewport boundsListeners](self, "boundsListeners");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v13);

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  -[SXViewport appearStateListeners](self, "appearStateListeners");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v13);

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  -[SXViewport documentSizeListeners](self, "documentSizeListeners");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v13);

  if ((v4 & 0x20) != 0)
  {
LABEL_7:
    -[SXViewport contentFrameListeners](self, "contentFrameListeners");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v13);

  }
LABEL_8:
  v6 = v13;
  if ((v4 & 0x40) != 0)
  {
    -[SXViewport interfaceOrientationListeners](self, "interfaceOrientationListeners");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v13);

    v6 = v13;
  }
LABEL_10:

}

- (void)beginUpdates
{
  void *v3;
  SXViewport *v4;
  void *v5;
  SXViewport *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [SXViewport alloc];
    -[SXViewport view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SXViewport initWithView:](v4, "initWithView:", v5);
    -[SXViewport setViewportBeforeUpdates:](self, "setViewportBeforeUpdates:", v6);

  }
  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewport dynamicBounds](self, "dynamicBounds");
  objc_msgSend(v7, "setDynamicBounds:");

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewport bounds](self, "bounds");
  objc_msgSend(v8, "setBounds:");

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewport documentSize](self, "documentSize");
  objc_msgSend(v9, "setDocumentSize:");

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAppearState:", -[SXViewport appearState](self, "appearState"));

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterfaceOrientation:", -[SXViewport interfaceOrientation](self, "interfaceOrientation"));

  -[SXViewport setGroupChanges:](self, "setGroupChanges:", 1);
}

- (void)endUpdates
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int64_t v49;
  void *v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SXViewport dynamicBounds](self, "dynamicBounds");
  v53.origin.x = v12;
  v53.origin.y = v13;
  v53.size.width = v14;
  v53.size.height = v15;
  v51.origin.x = v5;
  v51.origin.y = v7;
  v51.size.width = v9;
  v51.size.height = v11;
  v16 = CGRectEqualToRect(v51, v53);

  if (!v16)
  {
    -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dynamicBounds");
    -[SXViewport dynamicBoundsDidChangeFromBounds:](self, "dynamicBoundsDidChangeFromBounds:");

  }
  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[SXViewport bounds](self, "bounds");
  v54.origin.x = v27;
  v54.origin.y = v28;
  v54.size.width = v29;
  v54.size.height = v30;
  v52.origin.x = v20;
  v52.origin.y = v22;
  v52.size.width = v24;
  v52.size.height = v26;
  v31 = CGRectEqualToRect(v52, v54);

  if (!v31)
  {
    -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    -[SXViewport boundsDidChangeFromBounds:](self, "boundsDidChangeFromBounds:");

  }
  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "appearState");
  v35 = -[SXViewport appearState](self, "appearState");

  if (v34 != v35)
  {
    -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXViewport appearStateChangedFromState:](self, "appearStateChangedFromState:", objc_msgSend(v36, "appearState"));

  }
  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "documentSize");
  v39 = v38;
  v41 = v40;
  -[SXViewport documentSize](self, "documentSize");
  v43 = v42;
  v45 = v44;

  if (v39 != v43 || v41 != v45)
  {
    -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "documentSize");
    -[SXViewport documentSizeDidChangeFromSize:](self, "documentSizeDidChangeFromSize:");

  }
  -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "interfaceOrientation");
  v49 = -[SXViewport interfaceOrientation](self, "interfaceOrientation");

  if (v48 != v49)
  {
    -[SXViewport viewportBeforeUpdates](self, "viewportBeforeUpdates");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXViewport interfaceOrientationChangedFromOrientation:](self, "interfaceOrientationChangedFromOrientation:", objc_msgSend(v50, "interfaceOrientation"));

  }
  -[SXViewport setGroupChanges:](self, "setGroupChanges:", 0);
}

- (void)dynamicBoundsDidChangeFromBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXViewport dynamicBoundsListeners](self, "dynamicBoundsListeners", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "viewport:dynamicBoundsDidChangeFromBounds:", self, x, y, width, height);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)boundsDidChangeFromBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXViewport boundsListeners](self, "boundsListeners", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "viewport:boundsDidChangeFromBounds:", self, x, y, width, height);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)appearStateChangedFromState:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SXViewport appearStateListeners](self, "appearStateListeners", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "viewport:appearStateChangedFromState:", self, a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)documentSizeDidChangeFromSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  height = a3.height;
  width = a3.width;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXViewport documentSizeListeners](self, "documentSizeListeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "viewport:documentSizeDidChangeFromSize:", self, width, height);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)contentFrameDidChangeFromFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXViewport contentFrameListeners](self, "contentFrameListeners", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "viewport:contentFrameDidChangeFromFrame:", self, x, y, width, height);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)interfaceOrientationChangedFromOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SXViewport interfaceOrientationListeners](self, "interfaceOrientationListeners", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "viewport:interfaceOrientationChangedFromOrientation:", self, a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setDynamicBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXViewport dynamicBounds](self, "dynamicBounds");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    v8 = self->_dynamicBounds.origin.x;
    v9 = self->_dynamicBounds.origin.y;
    v10 = self->_dynamicBounds.size.width;
    v11 = self->_dynamicBounds.size.height;
    self->_dynamicBounds.origin.x = x;
    self->_dynamicBounds.origin.y = y;
    self->_dynamicBounds.size.width = width;
    self->_dynamicBounds.size.height = height;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport dynamicBoundsDidChangeFromBounds:](self, "dynamicBoundsDidChangeFromBounds:", v8, v9, v10, v11);
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXViewport bounds](self, "bounds");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    v8 = self->_bounds.origin.x;
    v9 = self->_bounds.origin.y;
    v10 = self->_bounds.size.width;
    v11 = self->_bounds.size.height;
    self->_bounds.origin.x = x;
    self->_bounds.origin.y = y;
    self->_bounds.size.width = width;
    self->_bounds.size.height = height;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport boundsDidChangeFromBounds:](self, "boundsDidChangeFromBounds:", v8, v9, v10, v11);
  }
}

- (void)setAppearState:(unint64_t)a3
{
  unint64_t appearState;

  if (-[SXViewport appearState](self, "appearState") != a3)
  {
    appearState = self->_appearState;
    self->_appearState = a3;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport appearStateChangedFromState:](self, "appearStateChangedFromState:", appearState);
  }
}

- (void)setDocumentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  -[SXViewport documentSize](self, "documentSize");
  if (v7 != width || v6 != height)
  {
    v9 = self->_documentSize.width;
    v10 = self->_documentSize.height;
    self->_documentSize.width = width;
    self->_documentSize.height = height;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport documentSizeDidChangeFromSize:](self, "documentSizeDidChangeFromSize:", v9, v10);
  }
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXViewport contentFrame](self, "contentFrame");
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v12, v13))
  {
    v8 = self->_contentFrame.origin.x;
    v9 = self->_contentFrame.origin.y;
    v10 = self->_contentFrame.size.width;
    v11 = self->_contentFrame.size.height;
    self->_contentFrame.origin.x = x;
    self->_contentFrame.origin.y = y;
    self->_contentFrame.size.width = width;
    self->_contentFrame.size.height = height;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport contentFrameDidChangeFromFrame:](self, "contentFrameDidChangeFromFrame:", v8, v9, v10, v11);
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  int64_t interfaceOrientation;

  interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    if (!-[SXViewport groupChanges](self, "groupChanges"))
      -[SXViewport interfaceOrientationChangedFromOrientation:](self, "interfaceOrientationChangedFromOrientation:", interfaceOrientation);
  }
}

- (BOOL)isPopulated
{
  double v3;
  double v4;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  -[SXViewport dynamicBounds](self, "dynamicBounds");
  if (CGRectIsEmpty(v6))
    return 0;
  -[SXViewport bounds](self, "bounds");
  if (CGRectIsEmpty(v7))
    return 0;
  -[SXViewport contentFrame](self, "contentFrame");
  if (CGRectIsEmpty(v8))
    return 0;
  -[SXViewport documentSize](self, "documentSize");
  if (v3 <= 0.0)
    return 0;
  -[SXViewport documentSize](self, "documentSize");
  return v4 > 0.0;
}

- (void)reset
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[SXViewport setDynamicBounds:](self, "setDynamicBounds:", *MEMORY[0x24BDBF090], v4, v5, v6);
  -[SXViewport setBounds:](self, "setBounds:", v3, v4, v5, v6);
  -[SXViewport setDocumentSize:](self, "setDocumentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SXViewport view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SXViewport view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
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
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SXViewport view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
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
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SXViewport view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)convertRectToViewportCoordinateSpace:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
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
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SXViewport view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", v9, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGPoint)convertPointToViewportCoordinateSpace:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SXViewport view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", v7, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)stringFroInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_24D688DD8[a3];
}

- (id)stringForAppearState:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_24D688E00[a3];
}

- (id)debugDescriptionForViewport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGSize v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend(v4, "dynamicBounds");
  NSStringFromCGRect(v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  NSStringFromCGRect(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewport stringForAppearState:](self, "stringForAppearState:", objc_msgSend(v4, "appearState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentSize");
  NSStringFromCGSize(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFrame");
  NSStringFromCGRect(v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "interfaceOrientation");

  -[SXViewport stringFroInterfaceOrientation:](self, "stringFroInterfaceOrientation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; dynamicBounds: %@; bounds: %@; appearState: %@; documentSize: %@; contentFrame: %@; interfaceOrientation: %@"),
    objc_opt_class(),
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  return -[SXViewport debugDescriptionForViewport:](self, "debugDescriptionForViewport:", self);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)dynamicBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dynamicBounds.origin.x;
  y = self->_dynamicBounds.origin.y;
  width = self->_dynamicBounds.size.width;
  height = self->_dynamicBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)documentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_documentSize.width;
  height = self->_documentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (NSHashTable)dynamicBoundsListeners
{
  return self->_dynamicBoundsListeners;
}

- (void)setDynamicBoundsListeners:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicBoundsListeners, a3);
}

- (NSHashTable)boundsListeners
{
  return self->_boundsListeners;
}

- (void)setBoundsListeners:(id)a3
{
  objc_storeStrong((id *)&self->_boundsListeners, a3);
}

- (NSHashTable)appearStateListeners
{
  return self->_appearStateListeners;
}

- (void)setAppearStateListeners:(id)a3
{
  objc_storeStrong((id *)&self->_appearStateListeners, a3);
}

- (NSHashTable)documentSizeListeners
{
  return self->_documentSizeListeners;
}

- (void)setDocumentSizeListeners:(id)a3
{
  objc_storeStrong((id *)&self->_documentSizeListeners, a3);
}

- (NSHashTable)contentFrameListeners
{
  return self->_contentFrameListeners;
}

- (void)setContentFrameListeners:(id)a3
{
  objc_storeStrong((id *)&self->_contentFrameListeners, a3);
}

- (NSHashTable)interfaceOrientationListeners
{
  return self->_interfaceOrientationListeners;
}

- (void)setInterfaceOrientationListeners:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceOrientationListeners, a3);
}

- (SXViewport)viewportBeforeUpdates
{
  return self->_viewportBeforeUpdates;
}

- (void)setViewportBeforeUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_viewportBeforeUpdates, a3);
}

- (BOOL)groupChanges
{
  return self->_groupChanges;
}

- (void)setGroupChanges:(BOOL)a3
{
  self->_groupChanges = a3;
}

- (UIScrollView)view
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_viewportBeforeUpdates, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationListeners, 0);
  objc_storeStrong((id *)&self->_contentFrameListeners, 0);
  objc_storeStrong((id *)&self->_documentSizeListeners, 0);
  objc_storeStrong((id *)&self->_appearStateListeners, 0);
  objc_storeStrong((id *)&self->_boundsListeners, 0);
  objc_storeStrong((id *)&self->_dynamicBoundsListeners, 0);
}

@end
