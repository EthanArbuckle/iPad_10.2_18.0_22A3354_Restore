@implementation _WTTextEffectView

- (_WTTextEffectView)initWithSource:(id)a3
{
  id v4;
  _WTTextEffectView *v5;
  void *v6;
  _WTTextEffectView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextEffectView;
  v5 = -[_WTView init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[_WTTextEffectView setTextEffects:](v5, "setTextEffects:", v6);

    -[_WTTextEffectView setSourceIsAsync:](v5, "setSourceIsAsync:", 0);
    -[_WTTextEffectView setSource:](v5, "setSource:", v4);
    v7 = v5;
  }

  return v5;
}

- (_WTTextEffectView)initWithAsyncSource:(id)a3
{
  id v4;
  _WTTextEffectView *v5;
  void *v6;
  _WTTextEffectView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextEffectView;
  v5 = -[_WTView init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[_WTTextEffectView setTextEffects:](v5, "setTextEffects:", v6);

    -[_WTTextEffectView setSourceIsAsync:](v5, "setSourceIsAsync:", 1);
    -[_WTTextEffectView setAsyncSource:](v5, "setAsyncSource:", v4);
    v7 = v5;
  }

  return v5;
}

- (BOOL)isFlipped
{
  return 1;
}

- (id)addEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WTTextEffectView textEffects](self, "textEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

  objc_msgSend(v4, "setIdentifier:", v5);
  if (-[_WTTextEffectView sourceIsAsync](self, "sourceIsAsync"))
  {
    -[_WTTextEffectView asyncSource](self, "asyncSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffectView _handleAddEffect:forAsyncSource:](self, "_handleAddEffect:forAsyncSource:", v4, v7);
  }
  else
  {
    -[_WTTextEffectView source](self, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffectView _handleAddEffect:forSource:](self, "_handleAddEffect:forSource:", v4, v7);
  }

  return v5;
}

- (void)_handleAddEffect:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _WTReplaceRemainderTextEffect *v11;
  void *v12;
  _WTReplaceRemainderTextEffect *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat MaxY;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  CGRect v41;

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "chunk");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textPreviewsForChunk:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateEffectWith:", v9);
  if (objc_msgSend(v6, "hidesOriginal"))
  {
    objc_msgSend(v6, "chunk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateIsTextVisible:forChunk:", 0, v10);

  }
  -[_WTTextEffectView _cacheHeightOfPreviews:forEffect:](self, "_cacheHeightOfPreviews:forEffect:", v9, v6);
  if (-[_WTTextEffectView _shouldApplyRemainderEffectForEffect:](self, "_shouldApplyRemainderEffectForEffect:", v6))
  {
    v11 = [_WTReplaceRemainderTextEffect alloc];
    objc_msgSend(v6, "chunk");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_WTReplaceTextEffect initWithChunk:effectView:](v11, "initWithChunk:effectView:", v12, self);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffectView textEffects](self, "textEffects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v13, v14);

    -[_WTTextEffect setIdentifier:](v13, "setIdentifier:", v14);
    -[_WTTextEffectView replaceSourceRect](self, "replaceSourceRect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "platformCGRectValue");
    v18 = v17;

    -[_WTTextEffectView replaceDestinationRect](self, "replaceDestinationRect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "platformCGRectValue");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[_WTReplaceRemainderTextEffect setOffset:](v13, "setOffset:", v27 - v18);
    -[_WTTextEffectView bounds](self, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v41.origin.x = v21;
    v41.origin.y = v23;
    v41.size.width = v25;
    v41.size.height = v27;
    MaxY = CGRectGetMaxY(v41);
    objc_msgSend(v7, "textPreviewForRect:", v29, MaxY + v31, v33, v35 - MaxY);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[_WTReplaceRemainderTextEffect updateEffectWith:](v13, "updateEffectWith:", v38);
    if (-[_WTTextEffect hidesOriginal](v13, "hidesOriginal"))
    {
      -[_WTTextEffect chunk](v13, "chunk");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateIsTextVisible:forChunk:", 0, v39);

    }
  }

}

- (void)_handleAddEffect:(id)a3 forAsyncSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _WTTextEffectView *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x4010000000;
  v20[3] = &unk_24A7F20EF;
  v21 = 0u;
  v22 = 0u;
  -[_WTTextEffectView bounds](self, "bounds");
  *(_QWORD *)&v21 = v8;
  *((_QWORD *)&v21 + 1) = v9;
  *(_QWORD *)&v22 = v10;
  *((_QWORD *)&v22 + 1) = v11;
  objc_msgSend(v6, "chunk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke;
  v15[3] = &unk_251C074C8;
  v13 = v6;
  v16 = v13;
  v17 = self;
  v19 = v20;
  v14 = v7;
  v18 = v14;
  objc_msgSend(v14, "textPreviewsForChunk:completion:", v12, v15);

  _Block_object_dispose(v20, 8);
}

- (BOOL)_shouldApplyRemainderEffectForEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  BOOL v9;

  v4 = a3;
  -[_WTTextEffectView replaceSourceRect](self, "replaceSourceRect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_WTTextEffectView replaceDestinationRect](self, "replaceDestinationRect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v4, "isDestination");
  else
    v8 = 0;
  v9 = v7 & v8;

  return v9;
}

- (void)_cacheHeightOfPreviews:(id)a3 forEffect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double x;
  double v11;
  double y;
  double v13;
  double width;
  double v15;
  double height;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  int v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationFrame");
  x = v9;
  y = v11;
  width = v13;
  height = v15;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "presentationFrame", (_QWORD)v28);
        v36.origin.x = v22;
        v36.origin.y = v23;
        v36.size.width = v24;
        v36.size.height = v25;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v35 = CGRectUnion(v34, v36);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_msgSend(v7, "isDestination");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPlatformCGRect:", x, y, width, height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      -[_WTTextEffectView setReplaceDestinationRect:](self, "setReplaceDestinationRect:", v27);
    else
      -[_WTTextEffectView setReplaceSourceRect:](self, "setReplaceSourceRect:", v27);

  }
}

- (void)removeAllEffects
{
  -[_WTTextEffectView removeAllEffectsAnimated:](self, "removeAllEffectsAnimated:", 1);
}

- (void)removeAllEffectsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_WTTextEffectView textEffects](self, "textEffects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = -[_WTTextEffectView removeEffect:animated:](self, "removeEffect:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), v3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)removeEffect:(id)a3
{
  return -[_WTTextEffectView removeEffect:animated:](self, "removeEffect:animated:", a3, 1);
}

- (id)removeEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v4 = a4;
  v6 = a3;
  -[_WTTextEffectView textEffects](self, "textEffects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "chunk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v8, "isDestination") ^ 1;
  else
    v11 = 0;
  objc_msgSend(v8, "invalidate:", v4);
  if (!objc_msgSend(v8, "hidesOriginal") || (v11 & 1) != 0)
    goto LABEL_9;
  if (!-[_WTTextEffectView sourceIsAsync](self, "sourceIsAsync"))
  {
    -[_WTTextEffectView source](self, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chunk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateIsTextVisible:forChunk:", 1, v15);

LABEL_9:
    -[_WTTextEffectView textEffects](self, "textEffects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v6);

    goto LABEL_10;
  }
  -[_WTTextEffectView asyncSource](self, "asyncSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chunk");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __43___WTTextEffectView_removeEffect_animated___block_invoke;
  v18[3] = &unk_251C074F0;
  v18[4] = self;
  v19 = v6;
  objc_msgSend(v12, "updateIsTextVisible:forChunk:completion:", 1, v13, v18);

LABEL_10:
  return v10;
}

- (void)_commonLayoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v11.receiver = self;
  v11.super_class = (Class)_WTTextEffectView;
  -[_WTView _commonLayoutSubviews](&v11, sel__commonLayoutSubviews);
  -[_WTTextEffectView bounds](self, "bounds");
  *(_QWORD *)&v14.origin.x = _commonLayoutSubviews_selfBounds_0;
  *(_QWORD *)&v14.origin.y = _commonLayoutSubviews_selfBounds_1;
  *(_QWORD *)&v14.size.width = _commonLayoutSubviews_selfBounds_2;
  *(_QWORD *)&v14.size.height = _commonLayoutSubviews_selfBounds_3;
  if (!CGRectEqualToRect(v12, v14)
    || (-[_WTTextEffectView frame](self, "frame"),
        *(_QWORD *)&v15.origin.x = _commonLayoutSubviews_selfFrame_0,
        *(_QWORD *)&v15.origin.y = _commonLayoutSubviews_selfFrame_1,
        *(_QWORD *)&v15.size.width = _commonLayoutSubviews_selfFrame_2,
        *(_QWORD *)&v15.size.height = _commonLayoutSubviews_selfFrame_3,
        !CGRectEqualToRect(v13, v15)))
  {
    -[_WTTextEffectView updateSnapshots](self, "updateSnapshots");
  }
  -[_WTTextEffectView bounds](self, "bounds");
  _commonLayoutSubviews_selfBounds_0 = v3;
  _commonLayoutSubviews_selfBounds_1 = v4;
  _commonLayoutSubviews_selfBounds_2 = v5;
  _commonLayoutSubviews_selfBounds_3 = v6;
  -[_WTTextEffectView frame](self, "frame");
  _commonLayoutSubviews_selfFrame_0 = v7;
  _commonLayoutSubviews_selfFrame_1 = v8;
  _commonLayoutSubviews_selfFrame_2 = v9;
  _commonLayoutSubviews_selfFrame_3 = v10;
}

- (void)updateSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_WTTextEffectView textEffects](self, "textEffects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_WTTextEffectView updateSnapshotForEffectID:](self, "updateSnapshotForEffectID:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateSnapshotForEffectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _WTTextEffectView *v16;

  v4 = a3;
  -[_WTTextEffectView textEffects](self, "textEffects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_WTTextEffectView sourceIsAsync](self, "sourceIsAsync"))
  {
    -[_WTTextEffectView asyncSource](self, "asyncSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chunk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47___WTTextEffectView_updateSnapshotForEffectID___block_invoke;
    v14[3] = &unk_251C07518;
    v15 = v6;
    v16 = self;
    objc_msgSend(v7, "textPreviewsForChunk:completion:", v8, v14);

  }
  else
  {
    -[_WTTextEffectView source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chunk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textPreviewsForChunk:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateEffectWith:", v11);

    if (objc_msgSend(v6, "hidesOriginal"))
    {
      -[_WTTextEffectView source](self, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chunk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateIsTextVisible:forChunk:", 0, v13);

    }
  }

}

- (_WTTextPreviewSource)source
{
  return (_WTTextPreviewSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (_WTTextPreviewAsyncSource)asyncSource
{
  return (_WTTextPreviewAsyncSource *)objc_loadWeakRetained((id *)&self->_asyncSource);
}

- (void)setAsyncSource:(id)a3
{
  objc_storeWeak((id *)&self->_asyncSource, a3);
}

- (NSMutableDictionary)textEffects
{
  return self->_textEffects;
}

- (void)setTextEffects:(id)a3
{
  objc_storeStrong((id *)&self->_textEffects, a3);
}

- (BOOL)sourceIsAsync
{
  return self->_sourceIsAsync;
}

- (void)setSourceIsAsync:(BOOL)a3
{
  self->_sourceIsAsync = a3;
}

- (NSValue)replaceSourceRect
{
  return (NSValue *)objc_getProperty(self, a2, 448, 1);
}

- (void)setReplaceSourceRect:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSValue)replaceDestinationRect
{
  return (NSValue *)objc_getProperty(self, a2, 456, 1);
}

- (void)setReplaceDestinationRect:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceDestinationRect, 0);
  objc_storeStrong((id *)&self->_replaceSourceRect, 0);
  objc_storeStrong((id *)&self->_textEffects, 0);
  objc_destroyWeak((id *)&self->_asyncSource);
  objc_destroyWeak((id *)&self->_source);
}

@end
