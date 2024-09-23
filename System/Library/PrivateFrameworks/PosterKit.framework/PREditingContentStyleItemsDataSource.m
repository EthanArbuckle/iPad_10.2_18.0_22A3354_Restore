@implementation PREditingContentStyleItemsDataSource

- (PREditingContentStyleItemsDataSource)initWithConfiguration:(id)a3 includesSuggestedStyle:(BOOL)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PREditingContentStyleItemsDataSource *v11;
  PREditingContentStyleItemsDataSource *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PREditingContentStyleItemsDataSource;
  v11 = -[PREditingContentStyleItemsDataSource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    v12->_includeSuggestedStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    -[PREditingContentStyleItemsDataSource buildCoordinators](v12, "buildCoordinators");
  }

  return v12;
}

- (unint64_t)numberOfCoordinators
{
  return -[NSArray count](self->_coordinators, "count");
}

- (void)buildCoordinators
{
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  PREditingPosterContentStyleCoordinator *v7;
  void *v8;
  void *v9;
  PREditorContentStylePalette *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  PREditingPosterContentStyleCoordinator *v20;
  NSArray *v21;
  NSArray *coordinators;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_coordinators)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorContentStylePickerConfiguration suggestedStyle](self->_configuration, "suggestedStyle");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PREditorContentStylePickerConfiguration stylePalette](self->_configuration, "stylePalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v4;
    if (self->_includeSuggestedStyle
      && -[PREditorContentStylePickerConfiguration showsSuggestedContentStyleItem](self->_configuration, "showsSuggestedContentStyleItem")&& v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "coordinatorForStyle:isSuggestedStyle:fromDataSource:", v4, 1, self);
      v7 = (PREditingPosterContentStyleCoordinator *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        v7 = -[PREditingPosterContentStyleCoordinator initWithInitialStyle:suggested:]([PREditingPosterContentStyleCoordinator alloc], "initWithInitialStyle:suggested:", v4, 1);
      objc_msgSend(v3, "addObject:", v7);
      if (objc_msgSend(v5, "isDefaultPalette") && objc_msgSend(v5, "context") == 1)
      {
        objc_msgSend(v5, "styles");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v9, "removeObjectAtIndex:", 15);
        v10 = [PREditorContentStylePalette alloc];
        objc_msgSend(v5, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PREditorContentStylePalette initWithContentStyles:localizedName:](v10, "initWithContentStyles:localizedName:", v9, v11);

        v5 = (void *)v12;
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "styles", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v19 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v19, "coordinatorForStyle:isSuggestedStyle:fromDataSource:", v18, 0, self);
          v20 = (PREditingPosterContentStyleCoordinator *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            v20 = -[PREditingPosterContentStyleCoordinator initWithInitialStyle:suggested:]([PREditingPosterContentStyleCoordinator alloc], "initWithInitialStyle:suggested:", v18, 0);
          objc_msgSend(v3, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    v21 = (NSArray *)objc_msgSend(v3, "copy");
    coordinators = self->_coordinators;
    self->_coordinators = v21;

  }
}

- (id)firstCoordinatorPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_coordinators;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)indexForCoordinator:(id)a3
{
  id v4;
  NSArray *coordinators;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  coordinators = self->_coordinators;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PREditingContentStyleItemsDataSource_indexForCoordinator___block_invoke;
  v9[3] = &unk_1E21863A0;
  v10 = v4;
  v6 = v4;
  v7 = -[NSArray indexOfObjectPassingTest:](coordinators, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__PREditingContentStyleItemsDataSource_indexForCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (id)coordinatorForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_coordinators, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_coordinators, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setContentsLuminance:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_contentsLuminance != a3)
  {
    self->_contentsLuminance = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_coordinators;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setContentsLuminance:", a3, (_QWORD)v9);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingContentStyleItemsDataSourceDelegate)delegate
{
  return (PREditingContentStyleItemsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditorContentStylePickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)includeSuggestedStyle
{
  return self->_includeSuggestedStyle;
}

- (void)setIncludeSuggestedStyle:(BOOL)a3
{
  self->_includeSuggestedStyle = a3;
}

- (NSArray)coordinators
{
  return self->_coordinators;
}

- (void)setCoordinators:(id)a3
{
  objc_storeStrong((id *)&self->_coordinators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
