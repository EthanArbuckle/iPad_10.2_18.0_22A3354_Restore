@implementation TUIAssistantButtonSizeProvider

- (CGSize)_preferredTitleSizeForBarButtonItem:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(a3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v5, "subviews", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            if (v8)
              goto LABEL_5;
            goto LABEL_14;
          }
        }
        v12 = v11;

        if (!v12)
          goto LABEL_15;
        objc_msgSend(v12, "sizeThatFits:", v4, v3);
        v4 = v13;
        v3 = v14;
        v6 = v12;
      }
LABEL_14:

    }
  }
LABEL_15:

  v15 = v4;
  v16 = v3;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)preferredSizeForButtonBarItem:(id)a3
{
  id v4;
  double v5;
  double *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v4 = a3;
  objc_msgSend(v4, "width");
  v6 = (double *)MEMORY[0x1E0DC55F0];
  if (v5 != 0.0)
    goto LABEL_12;
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[TUIAssistantButtonSizeProvider _preferredTitleSizeForBarButtonItem:](self, "_preferredTitleSizeForBarButtonItem:", v4);
LABEL_12:
      v17 = v5;
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "customView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (objc_msgSend(v4, "systemItem") != 5)
    {
      -[TUIAssistantButtonSizeProvider barButtonWidth](self, "barButtonWidth");
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v12 = v11;
  v14 = v13;

  if (v12 <= 0.0)
  {
LABEL_10:
    v17 = *v6;
    goto LABEL_13;
  }
  objc_msgSend(v4, "customView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", v12, v14);
  v17 = v16;

LABEL_13:
  v18 = *v6;

  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)barButtonWidth
{
  return self->_barButtonWidth;
}

- (void)setBarButtonWidth:(double)a3
{
  self->_barButtonWidth = a3;
}

@end
