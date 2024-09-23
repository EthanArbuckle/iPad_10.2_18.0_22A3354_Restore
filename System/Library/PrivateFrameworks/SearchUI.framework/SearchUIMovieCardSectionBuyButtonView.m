@implementation SearchUIMovieCardSectionBuyButtonView

- (SearchUIMovieCardSectionBuyButtonView)initWithTitle:(id)a3 subtitle:(id)a4 punchout:(id)a5 cardSectionView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SearchUIMovieCardSectionBuyButtonView *v14;
  SearchUIMovieCardSectionBuyButtonView *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SearchUIMovieCardSectionBuyButtonView;
  v14 = -[SearchUIMovieCardSectionBuyButtonView init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SearchUIMovieCardSectionBuyButtonView setPunchout:](v14, "setPunchout:", v12);
    -[SearchUIMovieCardSectionBuyButtonView setCardSectionView:](v15, "setCardSectionView:", v13);
    -[TLKStackView setAxis:](v15, "setAxis:", 1);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", v15, sel_buttonPressed, 64);
    LODWORD(v18) = 1148846080;
    objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v18);
    LODWORD(v19) = 1148846080;
    objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    if (v10)
      objc_msgSend(v16, "setTitle:", v10);
    else
      objc_msgSend(v16, "setSymbolImageName:", CFSTR("play.fill"));
    -[TLKStackView addArrangedSubview:](v15, "addArrangedSubview:", v16);
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", v15, 4.5);
    -[NUIContainerStackView setCustomSpacing:afterView:](v15, "setCustomSpacing:afterView:", v16);
    -[SearchUIMovieCardSectionBuyButtonView setButton:](v15, "setButton:", v16);
    +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __89__SearchUIMovieCardSectionBuyButtonView_initWithTitle_subtitle_punchout_cardSectionView___block_invoke;
    v27 = &unk_1EA1F6210;
    v21 = v20;
    v28 = v21;
    v29 = v11;
    objc_msgSend(v21, "performBatchUpdates:", &v24);
    if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize", v24, v25, v26, v27))
    {
      -[TLKStackView setAlignment:](v15, "setAlignment:", 3);
      -[TLKStackView setAxis:](v15, "setAxis:", 0);
      objc_msgSend(v21, "setTextAlignment:", 4);
      -[NUIContainerStackView setCustomSpacing:afterView:](v15, "setCustomSpacing:afterView:", v16, 12.0);
      objc_msgSend(v16, "setMinimumLayoutSize:", 100.0, 1.79769313e308);
      LODWORD(v22) = 1148846080;
      objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    }
    -[TLKStackView addArrangedSubview:](v15, "addArrangedSubview:", v21);
    -[SearchUIMovieCardSectionBuyButtonView setSubtitleLabel:](v15, "setSubtitleLabel:", v21);

  }
  return v15;
}

void __89__SearchUIMovieCardSectionBuyButtonView_initWithTitle_subtitle_punchout_cardSectionView___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DBD940], "preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AA0], *MEMORY[0x1E0DC48C8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFont:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setTextAlignment:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSfText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfLines:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v2) = 1144750080;
  objc_msgSend(*(id *)(a1 + 32), "setContentHuggingPriority:forAxis:", 1, v2);

}

- (void)buttonPressed
{
  void *v3;
  id v4;

  -[SearchUIMovieCardSectionBuyButtonView cardSectionView](self, "cardSectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIMovieCardSectionBuyButtonView punchout](self, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openPunchout:triggerEvent:", v3, 2);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SearchUIMovieCardSectionBuyButtonView *v5;
  SearchUIMovieCardSectionBuyButtonView *v6;
  SearchUIMovieCardSectionBuyButtonView *v7;
  SearchUIMovieCardSectionBuyButtonView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIMovieCardSectionBuyButtonView;
  -[SearchUIMovieCardSectionBuyButtonView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SearchUIMovieCardSectionBuyButtonView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    -[SearchUIMovieCardSectionBuyButtonView button](self, "button");
    v7 = (SearchUIMovieCardSectionBuyButtonView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (SearchUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (SearchUIOfferButtonView)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (SearchUIMovieCardSectionView)cardSectionView
{
  return (SearchUIMovieCardSectionView *)objc_loadWeakRetained((id *)&self->_cardSectionView);
}

- (void)setCardSectionView:(id)a3
{
  objc_storeWeak((id *)&self->_cardSectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionView);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end
