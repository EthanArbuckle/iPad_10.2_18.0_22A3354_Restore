@implementation CACEditingModeOverlayViewController

- (void)loadView
{
  CACEditingModeOverlayWordsView *v3;
  CACEditingModeOverlayWordsView *wordsView;

  v3 = objc_alloc_init(CACEditingModeOverlayWordsView);
  -[CACEditingModeOverlayViewController setView:](self, "setView:", v3);
  wordsView = self->_wordsView;
  self->_wordsView = v3;

  -[CACEditingModeOverlayViewController _syncUI](self, "_syncUI");
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
  -[CACEditingModeOverlayViewController _syncUI](self, "_syncUI");
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
  -[CACEditingModeOverlayViewController _syncUI](self, "_syncUI");
}

- (void)_syncUI
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_elements;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "label", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLabel:", v11);

        objc_msgSend(v9, "interfaceOrientedFrame");
        objc_msgSend(v10, "setFrame:");
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[CACEditingModeOverlayWordsView setOverlayType:](self->_wordsView, "setOverlayType:", self->_overlayType);
  -[CACEditingModeOverlayWordsView setLabels:](self->_wordsView, "setLabels:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)elements
{
  return self->_elements;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_wordsView, 0);
}

@end
