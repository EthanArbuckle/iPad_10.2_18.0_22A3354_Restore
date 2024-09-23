@implementation SearchUIWatchListState

- (SearchUIWatchListState)initWithIdentifier:(id)a3 watchListed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SearchUIWatchListState *v7;
  SearchUIWatchListState *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIWatchListState;
  v7 = -[SearchUIWatchListState init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SearchUIWatchListState setWatchListIdentifier:](v7, "setWatchListIdentifier:", v6);
    -[SearchUIWatchListState setIsWatchListed:](v8, "setIsWatchListed:", v4);
  }

  return v8;
}

- (SearchUIWatchListState)initWithResponse:(id)a3
{
  id v4;
  SearchUIWatchListState *v5;
  void *v6;
  uint64_t v7;
  SearchUIWatchListState *v8;

  v4 = a3;
  v5 = [SearchUIWatchListState alloc];
  objc_msgSend(v4, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isWatchListed");

  v8 = -[SearchUIWatchListState initWithIdentifier:watchListed:](v5, "initWithIdentifier:watchListed:", v6, v7);
  return v8;
}

- (SearchUIWatchListState)initWithContainerResponse:(id)a3
{
  id v4;
  SearchUIWatchListState *v5;
  void *v6;
  uint64_t v7;
  SearchUIWatchListState *v8;

  v4 = a3;
  v5 = [SearchUIWatchListState alloc];
  objc_msgSend(v4, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isWatchListed");

  v8 = -[SearchUIWatchListState initWithIdentifier:watchListed:](v5, "initWithIdentifier:watchListed:", v6, v7);
  return v8;
}

- (void)toggleStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;

  v4 = a3;
  v5 = -[SearchUIWatchListState isWatchListed](self, "isWatchListed") ^ 1;
  -[SearchUIWatchListState watchListIdentifier](self, "watchListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke;
  v8[3] = &unk_1EA1F7080;
  v10 = v5;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[SearchUIWatchListUtilities updateStatusIsInWatchList:watchListItemWithIdentifier:completion:](SearchUIWatchListUtilities, "updateStatusIsInWatchList:watchListItemWithIdentifier:completion:", v5, v6, v8);

}

void __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;
  char v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1EA1F7058;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[1] = 3221225472;
  v5 = *(_BYTE *)(a1 + 48);
  v6 = a2;
  v4 = v2;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v3);

}

uint64_t __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsWatchListed:", *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a1 + 49));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isWatchListed
{
  return self->_isWatchListed;
}

- (void)setIsWatchListed:(BOOL)a3
{
  self->_isWatchListed = a3;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_watchListIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
}

@end
