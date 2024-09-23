@implementation _UISearchTextFieldCanvasView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchTextFieldCanvasView;
  -[_UITextCanvasView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UISearchTextFieldCanvasView _updateTokenViews](self, "_updateTokenViews");
}

- (double)_uiatom_currentScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

- (void)_updateTokenViews
{
  NSMutableSet *atomViews;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _UISearchTextFieldCanvasView *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  atomViews = self->_atomViews;
  if (atomViews)
  {
    v4 = (void *)-[NSMutableSet mutableCopy](atomViews, "mutableCopy");
    -[NSMutableSet removeAllObjects](self->_atomViews, "removeAllObjects");
  }
  else
  {
    v5 = (NSMutableSet *)objc_opt_new();
    v6 = self->_atomViews;
    self->_atomViews = v5;

    v4 = (void *)objc_opt_new();
  }
  -[_UITextCanvasView context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainerOrigin");
  v9 = v8;
  v11 = v10;

  -[_UISearchTextFieldCanvasView _uiatom_currentScreenScale](self, "_uiatom_currentScreenScale");
  v13 = v12;
  -[_UITextCanvasView context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextCanvasView context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  v20 = *(_QWORD *)off_1E1678C48;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __49___UISearchTextFieldCanvasView__updateTokenViews__block_invoke;
  v33[3] = &unk_1E16E5F60;
  v21 = v15;
  v34 = v21;
  v22 = v17;
  v35 = v22;
  v23 = v4;
  v36 = v23;
  v37 = self;
  v38 = v13;
  v39 = v9;
  v40 = v11;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v19, 0, v33);
  if (objc_msgSend(v23, "count"))
  {
    -[NSMutableSet minusSet:](self->_atomViews, "minusSet:", v23);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v28++), "removeFromSuperview", (_QWORD)v29);
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v26);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomViews, 0);
}

@end
