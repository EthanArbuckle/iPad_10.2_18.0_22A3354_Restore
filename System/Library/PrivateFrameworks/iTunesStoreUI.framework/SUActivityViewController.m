@implementation SUActivityViewController

- (SUActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  SUActivityViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  v5 = -[SUActivityViewController initWithActivityItems:applicationActivities:](&v7, sel_initWithActivityItems_applicationActivities_, a3, a4);
  if (v5)
    v5->_suActivityItems = (NSArray *)objc_msgSend(a3, "copy");
  return v5;
}

- (void)dealloc
{
  int64_t transitionSafetyCount;
  objc_super v4;

  transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_transitionSafetyCount = transitionSafetyCount - 1;
      objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
      transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController dealloc](&v4, sel_dealloc);
}

- (void)setTitle:(id)a3 forActivityType:(id)a4
{
  NSMutableDictionary *customTitles;

  customTitles = self->_customTitles;
  if (a3)
  {
    if (!customTitles)
    {
      customTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_customTitles = customTitles;
    }
    -[NSMutableDictionary setObject:forKey:](customTitles, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](customTitles, "removeObjectForKey:", a4);
  }
}

- (void)_performActivity:(id)a3
{
  NSArray *suActivityItems;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
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
  suActivityItems = self->_suActivityItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](suActivityItems, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(suActivityItems);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setSUActivity:", a3);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](suActivityItems, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController _performActivity:](&v10, sel__performActivity_, a3);
}

- (void)_prepareActivity:(id)a3
{
  void *v5;
  NSArray *suActivityItems;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(a3, "socialComposeViewController");
    objc_msgSend(v5, "removeAllURLs");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    suActivityItems = self->_suActivityItems;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](suActivityItems, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(suActivityItems);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "suLastProvidedItem");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addURL:withPreviewImage:", v12, objc_msgSend(v11, "suPreviewImage"));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](suActivityItems, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController _prepareActivity:](&v13, sel__prepareActivity_, a3);
}

- (id)_titleForActivity:(id)a3
{
  id result;
  objc_super v6;

  result = (id)-[NSMutableDictionary objectForKey:](self->_customTitles, "objectForKey:");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUActivityViewController;
    return -[SUActivityViewController _titleForActivity:](&v6, sel__titleForActivity_, a3);
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  int64_t transitionSafetyCount;
  BOOL v5;
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  transitionSafetyCount = self->_transitionSafetyCount;
  v5 = transitionSafetyCount < 1;
  v6 = transitionSafetyCount - 1;
  if (!v5)
  {
    self->_transitionSafetyCount = v6;
    objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  int64_t transitionSafetyCount;
  BOOL v5;
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  transitionSafetyCount = self->_transitionSafetyCount;
  v5 = transitionSafetyCount < 1;
  v6 = transitionSafetyCount - 1;
  if (!v5)
  {
    self->_transitionSafetyCount = v6;
    objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (a3)
  {
    ++self->_transitionSafetyCount;
    objc_msgSend((id)objc_opt_class(), "beginTransitionSafety");
  }
  v5.receiver = self;
  v5.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  int64_t transitionSafetyCount;
  objc_super v6;

  v3 = a3;
  transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_transitionSafetyCount = transitionSafetyCount - 1;
      objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
      transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  if (v3)
  {
    self->_transitionSafetyCount = transitionSafetyCount + 1;
    objc_msgSend((id)objc_opt_class(), "beginTransitionSafety");
  }
  v6.receiver = self;
  v6.super_class = (Class)SUActivityViewController;
  -[SUActivityViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

@end
