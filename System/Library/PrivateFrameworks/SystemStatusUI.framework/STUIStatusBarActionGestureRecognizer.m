@implementation STUIStatusBarActionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1, a4);
  -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    objc_msgSend(v10, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarActionGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarActionGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", objc_msgSend(v8, "pointInside:withEvent:", v6));

  }
  else
  {
    -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[STUIStatusBarActionGestureRecognizer highlighted](self, "highlighted", a3, a4))
    v5 = 3;
  else
    v5 = 5;
  -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", 4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "type", (_QWORD)v10) == 4)
        {
          -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1);
          -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", 1);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type", (_QWORD)v11) == 4)
        {
          if (-[STUIStatusBarActionGestureRecognizer highlighted](self, "highlighted"))
            v10 = 3;
          else
            v10 = 5;
          -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", v10);
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", 4);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (-[STUIStatusBarActionGestureRecognizer state](self, "state") >= 1)
      -[STUIStatusBarActionGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end
