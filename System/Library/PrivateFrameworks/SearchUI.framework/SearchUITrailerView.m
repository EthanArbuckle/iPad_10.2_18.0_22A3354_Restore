@implementation SearchUITrailerView

- (SearchUITrailerView)initWithMediaItem:(id)a3 cardSectionView:(id)a4
{
  id v6;
  id v7;
  SearchUITrailerView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SearchUITrailerView;
  v8 = -[SearchUITrailerView init](&v21, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "punchout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITrailerView setPunchout:](v8, "setPunchout:", v9);

    -[SearchUITrailerView setCardSectionView:](v8, "setCardSectionView:", v7);
    -[TLKStackView setAxis:](v8, "setAxis:", 1);
    -[TLKStackView setAlignment:](v8, "setAlignment:", 3);
    -[NUIContainerStackView setSpacing:](v8, "setSpacing:", 4.0);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v8);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setVerticalAlignment:", 3);
    objc_msgSend(v10, "setHorizontalAlignment:", 3);
    -[SearchUITrailerView setCenteredBoxView:](v8, "setCenteredBoxView:", v10);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v10);
    -[TLKStackView addArrangedSubview:](v8, "addArrangedSubview:", v10);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);
    objc_msgSend(v10, "addArrangedSubview:", v11);
    objc_msgSend(v6, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateWithImage:fallbackImage:needsOverlayButton:", v13, 0, 1);

    objc_msgSend(v11, "overlayPlayButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTarget:forAction:", v8, sel_playTrailer);

    objc_msgSend(v11, "overlayPlayButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContainerView:", v10);

    objc_msgSend(v11, "overlayPlayButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITrailerView setPlayButton:](v8, "setPlayButton:", v16);

    objc_msgSend(MEMORY[0x1E0DBD9A8], "secondaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v18);

    objc_msgSend(MEMORY[0x1E0DBD940], "footnoteFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v19);

    -[TLKStackView addArrangedSubview:](v8, "addArrangedSubview:", v17);
    -[SearchUITrailerView setTitleLabel:](v8, "setTitleLabel:", v17);

  }
  return v8;
}

- (void)playTrailer
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[SearchUITrailerView cardSectionView](self, "cardSectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUITrailerView punchout](self, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D8C220]);
  objc_msgSend(v17, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCardSection:destination:triggerEvent:actionCardType:", v6, v3, 2, 1);

  objc_msgSend(v17, "feedbackDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v8, "shouldHandleCardSectionEngagement:", v7))
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v3, "urls");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUrl:", v11);

    if (v9)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setCommand:", v9);
      objc_msgSend(v17, "rowModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "feedbackDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v12, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "executeWithTriggerEvent:", 2);

    }
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUITrailerView;
  -[SearchUITrailerView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITrailerView centeredBoxView](self, "centeredBoxView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    -[SearchUITrailerView playButton](self, "playButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hitView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (SearchUITrailersCardSectionView)cardSectionView
{
  return (SearchUITrailersCardSectionView *)objc_loadWeakRetained((id *)&self->_cardSectionView);
}

- (void)setCardSectionView:(id)a3
{
  objc_storeWeak((id *)&self->_cardSectionView, a3);
}

- (SearchUIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (UIView)centeredBoxView
{
  return self->_centeredBoxView;
}

- (void)setCenteredBoxView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBoxView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredBoxView, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_destroyWeak((id *)&self->_cardSectionView);
}

@end
