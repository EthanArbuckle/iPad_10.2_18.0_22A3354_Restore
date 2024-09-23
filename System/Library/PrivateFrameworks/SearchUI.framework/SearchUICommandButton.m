@implementation SearchUICommandButton

- (SearchUICommandButton)initWithWatchListState:(id)a3
{
  id v4;
  SearchUICommandButton *v5;
  SearchUICommandButton *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICommandButton;
  v5 = -[TLKTextButton init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SearchUICommandButton setWatchListState:](v5, "setWatchListState:", v4);
    -[SearchUICommandButton updateStateIfNecessary](v6, "updateStateIfNecessary");
    -[TLKTextButton tlkImageView](v6, "tlkImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SearchUICommandButton_initWithWatchListState___block_invoke;
    v10[3] = &unk_1EA1F62F0;
    v11 = v7;
    v8 = v7;
    objc_msgSend(v8, "performBatchUpdates:", v10);

  }
  return v6;
}

uint64_t __48__SearchUICommandButton_initWithWatchListState___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setProminence:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSymbolFont:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setSymbolWeight:", 7);
  return objc_msgSend(*(id *)(a1 + 32), "setSymbolScale:", 3);
}

- (void)watchListStateDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__SearchUICommandButton_watchListStateDidChange___block_invoke;
  v3[3] = &unk_1EA1F62F0;
  v3[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v3);
}

uint64_t __49__SearchUICommandButton_watchListStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStateIfNecessary");
}

- (void)updateStateIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;

  -[SearchUICommandButton watchListState](self, "watchListState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUICommandButton watchListState](self, "watchListState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isWatchListed");
    v6 = CFSTR("plus");
    if (v5)
      v6 = CFSTR("checkmark");
    v7 = v6;

    v8 = objc_alloc(MEMORY[0x1E0DBD970]);
    +[SearchUISymbolImage uiImageWithSymbolName:](SearchUISymbolImage, "uiImageWithSymbolName:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_msgSend(v8, "initWithImage:", v9);
    objc_msgSend(v10, "setIsTemplate:", 1);
    -[TLKTextButton setTlkImage:](self, "setTlkImage:", v10);

  }
}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 808, 1);
}

- (void)setButtonItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (SearchUIWatchListState)watchListState
{
  return (SearchUIWatchListState *)objc_getProperty(self, a2, 816, 1);
}

- (void)setWatchListState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListState, 0);
  objc_storeStrong((id *)&self->buttonItem, 0);
}

@end
