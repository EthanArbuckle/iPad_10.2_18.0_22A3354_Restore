@implementation SearchUIMovieCardSectionUpNextButtonView

- (id)initIsInUpNext:(BOOL)a3 cardSectionView:(id)a4
{
  _BOOL8 v4;
  SearchUIMovieCardSectionUpNextButtonView *v5;
  SearchUIWatchListState *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchUIWatchListState *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIMovieCardSectionUpNextButtonView;
  v5 = -[SearchUIMovieCardSectionBuyButtonView initWithTitle:subtitle:punchout:cardSectionView:](&v12, sel_initWithTitle_subtitle_punchout_cardSectionView_, 0, 0, 0, a4);
  if (v5)
  {
    v6 = [SearchUIWatchListState alloc];
    -[SearchUIMovieCardSectionBuyButtonView cardSectionView](v5, "cardSectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "watchListIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SearchUIWatchListState initWithIdentifier:watchListed:](v6, "initWithIdentifier:watchListed:", v9, v4);
    -[SearchUIMovieCardSectionUpNextButtonView setWatchListState:](v5, "setWatchListState:", v10);

    -[SearchUIMovieCardSectionUpNextButtonView updateUpNextStatus](v5, "updateUpNextStatus");
  }
  return v5;
}

- (void)updateUpNextStatus
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SearchUIMovieCardSectionUpNextButtonView watchListState](self, "watchListState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWatchListed");

  if (v4)
    v5 = CFSTR("IN_UP_NEXT_BUTTON_SUBTITLE");
  else
    v5 = CFSTR("ADD_TO_UP_NEXT_BUTTON_SUBTITLE");
  if (v4)
    v6 = CFSTR("checkmark");
  else
    v6 = CFSTR("plus");
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMovieCardSectionBuyButtonView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[SearchUIMovieCardSectionBuyButtonView button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

  -[SearchUIMovieCardSectionBuyButtonView button](self, "button");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSymbolImageName:", v6);

}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIMovieCardSectionUpNextButtonView;
  -[SearchUIMovieCardSectionBuyButtonView buttonPressed](&v6, sel_buttonPressed);
  -[SearchUIMovieCardSectionBuyButtonView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[SearchUIMovieCardSectionUpNextButtonView watchListState](self, "watchListState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SearchUIMovieCardSectionUpNextButtonView_buttonPressed__block_invoke;
  v5[3] = &unk_1EA1F62F0;
  v5[4] = self;
  objc_msgSend(v4, "toggleStateWithCompletion:", v5);

}

uint64_t __57__SearchUIMovieCardSectionUpNextButtonView_buttonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUpNextStatus");
}

- (SearchUIWatchListState)watchListState
{
  return self->_watchListState;
}

- (void)setWatchListState:(id)a3
{
  objc_storeStrong((id *)&self->_watchListState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListState, 0);
}

@end
