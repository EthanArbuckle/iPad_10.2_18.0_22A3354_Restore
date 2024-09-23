@implementation SUDeferredUIButton

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDeferredUIButton;
  -[SUDeferredUIButton dealloc](&v3, sel_dealloc);
}

- (BOOL)isDeferringInterfaceUpdates
{
  return self->_isDeferringInterfaceUpdates;
}

- (void)setDeferringInterfaceUpdates:(BOOL)a3
{
  if (self->_isDeferringInterfaceUpdates != a3)
  {
    if (!self->_isDeferringInterfaceUpdates)
      -[SUDeferredUIButton _saveCurrentStateAsDeferred](self, "_saveCurrentStateAsDeferred");
    self->_isDeferringInterfaceUpdates = a3;
    if (!a3)
      -[SUDeferredUIButton _commitDeferredInterfaceUpdates](self, "_commitDeferredInterfaceUpdates");
  }
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect result;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    x = self->_deferredFrame.origin.x;
    y = self->_deferredFrame.origin.y;
    width = self->_deferredFrame.size.width;
    height = self->_deferredFrame.size.height;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUIButton;
    -[SUDeferredUIButton frame](&v7, sel_frame);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isEnabled
{
  objc_super v4;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredEnabled;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUIButton;
  return -[SUDeferredUIButton isEnabled](&v4, sel_isEnabled);
}

- (id)imageForState:(unint64_t)a3
{
  id v5;
  void *v6;
  objc_super v8;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    v5 = (id)-[NSMutableDictionary objectForKey:](self->_deferredImages, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    v5 = -[SUDeferredUIButton imageForState:](&v8, sel_imageForState_, a3);
  }
  v6 = v5;
  if (v5 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return 0;
  else
    return v6;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredEnabled = v3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUIButton;
    -[SUDeferredUIButton setEnabled:](&v5, sel_setEnabled_, v3);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredFrame.origin.x = x;
    self->_deferredFrame.origin.y = y;
    self->_deferredFrame.size.width = width;
    self->_deferredFrame.size.height = height;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    -[SUDeferredUIButton setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *deferredImages;
  objc_super v8;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    deferredImages = self->_deferredImages;
    if (deferredImages)
    {
      if (a3)
      {
LABEL_4:
        -[NSMutableDictionary setObject:forKey:](deferredImages, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4));
        return;
      }
    }
    else
    {
      deferredImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_deferredImages = deferredImages;
      if (a3)
        goto LABEL_4;
    }
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)SUDeferredUIButton;
  -[SUDeferredUIButton setImage:forState:](&v8, sel_setImage_forState_, a3, a4);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *deferredTitles;
  objc_super v8;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    deferredTitles = self->_deferredTitles;
    if (deferredTitles)
    {
      if (a3)
      {
LABEL_4:
        -[NSMutableDictionary setObject:forKey:](deferredTitles, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4));
        return;
      }
    }
    else
    {
      deferredTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_deferredTitles = deferredTitles;
      if (a3)
        goto LABEL_4;
    }
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)SUDeferredUIButton;
  -[SUDeferredUIButton setTitle:forState:](&v8, sel_setTitle_forState_, a3, a4);
}

- (id)titleForState:(unint64_t)a3
{
  id v5;
  void *v6;
  objc_super v8;

  if (-[SUDeferredUIButton isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    v5 = (id)-[NSMutableDictionary objectForKey:](self->_deferredTitles, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUIButton;
    v5 = -[SUDeferredUIButton titleForState:](&v8, sel_titleForState_, a3);
  }
  v6 = v5;
  if (v5 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return 0;
  else
    return v6;
}

- (void)_commitDeferredInterfaceUpdates
{
  NSMutableDictionary *deferredImages;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *deferredTitles;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SUDeferredUIButton setEnabled:](self, "setEnabled:", self->_deferredEnabled);
  -[SUDeferredUIButton setFrame:](self, "setFrame:", self->_deferredFrame.origin.x, self->_deferredFrame.origin.y, self->_deferredFrame.size.width, self->_deferredFrame.size.height);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  deferredImages = self->_deferredImages;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](deferredImages, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(deferredImages);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = -[NSMutableDictionary objectForKey:](self->_deferredImages, "objectForKey:", v8);
        if (v9 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
          v9 = 0;
        -[SUDeferredUIButton setImage:forState:](self, "setImage:forState:", v9, objc_msgSend(v8, "integerValue"));
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](deferredImages, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  self->_deferredImages = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  deferredTitles = self->_deferredTitles;
  v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](deferredTitles, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(deferredTitles);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        v16 = -[NSMutableDictionary objectForKey:](self->_deferredTitles, "objectForKey:", v15);
        if (v16 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
          v16 = 0;
        -[SUDeferredUIButton setTitle:forState:](self, "setTitle:forState:", v16, objc_msgSend(v15, "integerValue"));
      }
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](deferredTitles, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  self->_deferredTitles = 0;
}

- (void)_saveCurrentStateAsDeferred
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  self->_deferredEnabled = -[SUDeferredUIButton isEnabled](self, "isEnabled");
  -[SUDeferredUIButton frame](self, "frame");
  self->_deferredFrame.origin.x = v3;
  self->_deferredFrame.origin.y = v4;
  self->_deferredFrame.size.width = v5;
  self->_deferredFrame.size.height = v6;
  -[SUDeferredUIButton _saveImagesAsDeferred](self, "_saveImagesAsDeferred");
  -[SUDeferredUIButton _saveTitlesAsDeferred](self, "_saveTitlesAsDeferred");
}

- (void)_saveImagesAsDeferred
{
  NSMutableDictionary *deferredImages;
  id v4;
  id v5;
  id v6;
  id v7;

  deferredImages = self->_deferredImages;
  if (!deferredImages)
  {
    deferredImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_deferredImages = deferredImages;
  }
  -[NSMutableDictionary removeAllObjects](deferredImages, "removeAllObjects");
  v4 = -[SUDeferredUIButton imageForState:](self, "imageForState:", 0);
  if (v4)
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v4, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0));
  v5 = -[SUDeferredUIButton imageForState:](self, "imageForState:", 1);
  if (v5)
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1));
  v6 = -[SUDeferredUIButton imageForState:](self, "imageForState:", 2);
  if (v6)
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2));
  v7 = -[SUDeferredUIButton imageForState:](self, "imageForState:", 4);
  if (v7)
    -[NSMutableDictionary setObject:forKey:](self->_deferredImages, "setObject:forKey:", v7, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4));
}

- (void)_saveTitlesAsDeferred
{
  NSMutableDictionary *deferredTitles;
  id v4;
  id v5;
  id v6;
  id v7;

  deferredTitles = self->_deferredTitles;
  if (!deferredTitles)
  {
    deferredTitles = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_deferredTitles = deferredTitles;
  }
  -[NSMutableDictionary removeAllObjects](deferredTitles, "removeAllObjects");
  v4 = -[SUDeferredUIButton titleForState:](self, "titleForState:", 0);
  if (v4)
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v4, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0));
  v5 = -[SUDeferredUIButton titleForState:](self, "titleForState:", 1);
  if (v5)
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1));
  v6 = -[SUDeferredUIButton titleForState:](self, "titleForState:", 2);
  if (v6)
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2));
  v7 = -[SUDeferredUIButton titleForState:](self, "titleForState:", 4);
  if (v7)
    -[NSMutableDictionary setObject:forKey:](self->_deferredTitles, "setObject:forKey:", v7, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4));
}

@end
