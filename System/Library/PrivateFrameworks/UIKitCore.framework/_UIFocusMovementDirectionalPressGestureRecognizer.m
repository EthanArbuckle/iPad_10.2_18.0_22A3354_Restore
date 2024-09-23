@implementation _UIFocusMovementDirectionalPressGestureRecognizer

- (void)configureDefaults
{
  -[UIGestureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", &unk_1E1A94C88);
  -[_UIFocusMovementPressGestureRecognizer setShouldRepeat:](self, "setShouldRepeat:", 1);
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  objc_msgSend(a3, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    v6 = 1;
    switch(v5)
    {
      case 0:
        break;
      case 1:
        v6 = 2;
        break;
      case 2:
        v6 = 4;
        break;
      case 3:
        v6 = 8;
        break;
      default:
        v7 = 2;
        if (v5 != 31)
          v7 = 0;
        if (v5 != 30)
          v6 = v7;
        break;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_filterPressesByPressSource:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_UIFocusMovementDirectionalPressGestureRecognizer pressSource](self, "pressSource");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "_source", (_QWORD)v16) != v5)
        {
          if (!v9)
            v9 = (void *)objc_msgSend(v6, "mutableCopy");
          objc_msgSend(v9, "removeObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v9)
    v13 = v9;
  else
    v13 = v6;
  v14 = v13;

  return v14;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v14, "_isAnalogStickPress"))
        {
          -[UIGestureRecognizer ignorePress:forEvent:](self, "ignorePress:forEvent:", v14, v7);
          objc_msgSend(v8, "removeObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count") && (*(_BYTE *)&self->_flags & 1) == 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (objc_msgSend(v20, "_source"))
          {
            -[_UIFocusMovementDirectionalPressGestureRecognizer setPressSource:](self, "setPressSource:", objc_msgSend(v20, "_source"));
            goto LABEL_22;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_22:

    *(_BYTE *)&self->_flags |= 1u;
  }
  -[_UIFocusMovementDirectionalPressGestureRecognizer _filterPressesByPressSource:](self, "_filterPressesByPressSource:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer pressesBegan:withEvent:](&v22, sel_pressesBegan_withEvent_, v21, v7);

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  -[_UIFocusMovementDirectionalPressGestureRecognizer _filterPressesByPressSource:](self, "_filterPressesByPressSource:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v7, v6);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  -[_UIFocusMovementDirectionalPressGestureRecognizer _filterPressesByPressSource:](self, "_filterPressesByPressSource:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v7, v6);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  -[_UIFocusMovementDirectionalPressGestureRecognizer _filterPressesByPressSource:](self, "_filterPressesByPressSource:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v7, v6);

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  -[_UIFocusMovementPressGestureRecognizer reset](&v3, sel_reset);
  -[_UIFocusMovementDirectionalPressGestureRecognizer setPressSource:](self, "setPressSource:", 0);
  *(_BYTE *)&self->_flags &= ~1u;
}

- (unint64_t)pressSource
{
  return self->_pressSource;
}

- (void)setPressSource:(unint64_t)a3
{
  self->_pressSource = a3;
}

@end
