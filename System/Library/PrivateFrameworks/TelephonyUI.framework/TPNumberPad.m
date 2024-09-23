@implementation TPNumberPad

- (void)_addButton:(id)a3
{
  BOOL v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF4C0430))
    v4 = objc_msgSend(v6, "character") == 13;
  else
    v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
  {
    objc_msgSend(v6, "setExclusiveTouch:", 1);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 64);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonDown_, 1);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonUp_, 64);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonUpOutside_, 128);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonCancelled_, 256);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_buttonLongPressedViaGesture_);
  objc_msgSend(v5, "setAllowableMovement:", 100.0);
  objc_msgSend(v5, "setMinimumPressDuration:", 1.0);
  objc_msgSend(v6, "addGestureRecognizer:", v5);
  -[TPNumberPad addSubview:](self, "addSubview:", v6);

}

- (void)setButtons:(id)a3
{
  NSMutableArray *buttons;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;

  v8 = a3;
  buttons = self->_buttons;
  if (!buttons)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_buttons;
    self->_buttons = v5;

    buttons = self->_buttons;
  }
  -[NSMutableArray removeAllObjects](buttons, "removeAllObjects");
  v7 = v8;
  if (v8)
  {
    -[NSMutableArray addObjectsFromArray:](self->_buttons, "addObjectsFromArray:", v8);
    v7 = v8;
  }

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[TPNumberPad buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "frame");
  v5 = v4 * 3.0;
  objc_msgSend(v3, "frame");
  v7 = v6 * 4.0;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (TPNumberPad)initWithButtons:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  TPNumberPad *v10;
  TPNumberPad *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_numberButtonsEnabled = 1;
  if ((unint64_t)objc_msgSend(v5, "count") <= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPNumberPad.m"), 29, CFSTR("Must have 12 buttons to use this class."));

  }
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7 * 3.0;
  objc_msgSend(v6, "frame");
  v25.receiver = self;
  v25.super_class = (Class)TPNumberPad;
  v10 = -[TPNumberPad initWithFrame:](&v25, sel_initWithFrame_, 0.0, 0.0, v8, v9 * 4.0);
  v11 = v10;
  if (v10)
  {
    -[TPNumberPad setButtons:](v10, "setButtons:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPad setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[TPNumberPad setOpaque:](v11, "setOpaque:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          -[TPNumberPad _addButton:](v11, "_addButton:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++), (_QWORD)v21);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v15);
    }

    -[TPNumberPad _layoutGrid](v11, "_layoutGrid");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel_handleCurrentLocaleDidChangeNotification_, *MEMORY[0x1E0C99720], 0);

  }
  return v11;
}

- (NSArray)buttons
{
  return (NSArray *)self->_buttons;
}

- (void)_layoutGrid
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;

  -[NSMutableArray objectAtIndex:](self->_buttons, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0.0;
  do
  {
    v12 = 0;
    v13 = 0.0;
    do
    {
      v14 = v10;
      -[NSMutableArray objectAtIndex:](self->_buttons, "objectAtIndex:", v8 + v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "frame");
      objc_msgSend(v15, "setFrame:", v13, v11);
      v10 = v15;
      ++v12;
      v13 = v5 + v13;
    }
    while (v12 != 3);
    ++v9;
    v11 = v7 + v11;
    v8 += 3;
  }
  while (v9 != 4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TPNumberPad;
  -[TPNumberPad dealloc](&v4, sel_dealloc);
}

- (void)handleCurrentLocaleDidChangeNotification:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TPNumberPad buttons](self, "buttons", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "loadImagesForCurrentCharacter");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)replaceButton:(id)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPNumberPad.m"), 86, CFSTR("Index out of bounds: %u"), a4);

  }
  -[NSMutableArray objectAtIndex:](self->_buttons, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_buttons, "replaceObjectAtIndex:withObject:", a4, v9);
  -[TPNumberPad _addButton:](self, "_addButton:", v9);
  -[TPNumberPad _layoutGrid](self, "_layoutGrid");

}

- (void)setNumberButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (self->_numberButtonsEnabled != a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_buttons;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "character", (_QWORD)v11) != 12)
            objc_msgSend(v10, "setEnabled:", v3);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  self->_numberButtonsEnabled = v3;
}

- (void)buttonLongPressedViaGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPNumberPad buttonLongPressed:](self, "buttonLongPressed:", v4);

  }
}

- (BOOL)numberButtonsEnabled
{
  return self->_numberButtonsEnabled;
}

- (double)buttonBackgroundAlpha
{
  return self->_buttonBackgroundAlpha;
}

- (void)setButtonBackgroundAlpha:(double)a3
{
  self->_buttonBackgroundAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
