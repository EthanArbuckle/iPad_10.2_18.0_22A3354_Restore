@implementation CACCorrectionsCandidatesViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACCorrectionsCandidatesViewController;
  -[CACCorrectionsCandidatesViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CACCorrectionsCandidatesViewController candidateView](self, "candidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("candidateResultSet"));

  v4.receiver = self;
  v4.super_class = (Class)CACCorrectionsCandidatesViewController;
  -[CACCorrectionsCandidatesViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TUICandidateView *v11;
  TUICandidateView *candidateView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  _QWORD v63[14];

  v63[12] = *MEMORY[0x24BDAC8D0];
  if (!self->_candidateView)
  {
    -[CACCorrectionsCandidatesViewController setupConfigurations](self, "setupConfigurations");
    v3 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    v5 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CACCorrectionsCandidatesViewController text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v7);

    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.5, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "setAlpha:", 0.2);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CACCorrectionsCandidatesViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = -[CACCorrectionsCandidatesViewController newCandidateKeyWithFrame:](self, "newCandidateKeyWithFrame:");
    candidateView = self->_candidateView;
    self->_candidateView = v11;

    -[TUICandidateView setState:](self->_candidateView, "setState:", self->_candidateConfiguration);
    -[TUICandidateView setTranslatesAutoresizingMaskIntoConstraints:](self->_candidateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CACCorrectionsCandidatesViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_titleLabel);

    -[CACCorrectionsCandidatesViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v8);

    -[CACCorrectionsCandidatesViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_candidateView);

    -[CACCorrectionsCandidatesViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintGreaterThanOrEqualToAnchor:constant:", v60, 10.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v59;
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "scaledValueForValue:", 26.0);
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v55;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 14.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v52;
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:constant:", v50, -14.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v49;
    objc_msgSend(v8, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCorrectionsCandidatesViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v44;
    objc_msgSend(v8, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCorrectionsCandidatesViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v63[5] = v39;
    objc_msgSend(v8, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scaledValueForValue:", 10.0);
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v63[6] = v34;
    v18 = v8;
    v43 = v8;
    objc_msgSend(v8, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v63[7] = v32;
    -[TUICandidateView leadingAnchor](self->_candidateView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 14.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63[8] = v29;
    -[TUICandidateView trailingAnchor](self->_candidateView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v17;
    objc_msgSend(v17, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v19, -14.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63[9] = v20;
    -[TUICandidateView topAnchor](self->_candidateView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 4.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63[10] = v23;
    -[TUICandidateView bottomAnchor](self->_candidateView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63[11] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v27);

    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __63__CACCorrectionsCandidatesViewController_viewDidLayoutSubviews__block_invoke;
    v62[3] = &unk_24F2AA860;
    v62[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v62);
    -[CACCorrectionsCandidatesViewController updateCandidateSet](self, "updateCandidateSet");

  }
}

uint64_t __63__CACCorrectionsCandidatesViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConfigurations");
}

- (id)newCandidateKeyWithFrame:(CGRect)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5AE8]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("candidateResultSet"), 3, CandidateSetContext);
  return v4;
}

- (void)setupConfigurations
{
  CACCorrectionsCandidateState *v3;
  CACCorrectionsCandidateState *candidateConfiguration;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(CACCorrectionsCandidateState);
  candidateConfiguration = self->_candidateConfiguration;
  self->_candidateConfiguration = v3;

  -[CACCorrectionsCandidateState setHasBackdrop:](self->_candidateConfiguration, "setHasBackdrop:", 0);
  if (CACIsInDarkMode())
    +[CACCorrectionsCandidateViewStyle cacDarkStyle](CACCorrectionsCandidateViewStyle, "cacDarkStyle");
  else
    +[CACCorrectionsCandidateViewStyle cacLightStyle](CACCorrectionsCandidateViewStyle, "cacLightStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidateState setStyle:](self->_candidateConfiguration, "setStyle:", v5);

  +[CACCorrectionsCandidateViewStyle cacLightStyle](CACCorrectionsCandidateViewStyle, "cacLightStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidateState setDisambiguationStyle:](self->_candidateConfiguration, "setDisambiguationStyle:", v6);

  -[CACCorrectionsCandidateState setPrimaryGridRowType:](self->_candidateConfiguration, "setPrimaryGridRowType:", 1);
  -[CACCorrectionsCandidateState setArrowButtonPosition:](self->_candidateConfiguration, "setArrowButtonPosition:", 0);
}

- (void)updateConfigurations
{
  void *v3;
  void *v4;
  id v5;

  -[CACCorrectionsCandidateState setDisambiguationGridPosition:](self->_candidateConfiguration, "setDisambiguationGridPosition:", 0);
  -[CACCorrectionsCandidateState setInlineTextViewPosition:](self->_candidateConfiguration, "setInlineTextViewPosition:", 0);
  -[CACCorrectionsCandidateState setDisambiguationGridRowType:](self->_candidateConfiguration, "setDisambiguationGridRowType:", 1);
  -[CACCorrectionsCandidateState setSortControlPosition:](self->_candidateConfiguration, "setSortControlPosition:", 0);
  -[CACCorrectionsCandidatesViewController candidateView](self, "candidateView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidatesViewController candidateView](self, "candidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:animated:force:completion:", v4, 1, 0, 0);

}

- (void)setAlternatives:(id)a3
{
  CACCorrectionsCandidatesViewController *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_alternatives != v6)
  {
    objc_storeStrong((id *)&v5->_alternatives, a3);
    -[CACCorrectionsCandidatesViewController updateCandidateSet](v5, "updateCandidateSet");
  }
  objc_sync_exit(v5);

}

- (void)setEmojis:(id)a3
{
  CACCorrectionsCandidatesViewController *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_emojis != v6)
  {
    objc_storeStrong((id *)&v5->_emojis, a3);
    -[CACCorrectionsCandidatesViewController updateCandidateSet](v5, "updateCandidateSet");
  }
  objc_sync_exit(v5);

}

- (void)updateCandidateSet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CACCorrectionsCandidatesViewController candidateView](self, "candidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidatesViewController candidateResultSet](self, "candidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCandidateResultSet:", v4);

  -[CACCorrectionsCandidatesViewController text](self, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidatesViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

}

- (id)candidateResultSet
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CACCorrectionsCandidatesViewController *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[CACCorrectionsCandidatesViewController alternatives](self, "alternatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v7);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[CACCorrectionsCandidatesViewController emojis](self, "emojis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v13);
  }
  v37 = self;

  objc_msgSend(v39, "addObjectsFromArray:", v3);
  v38 = v4;
  objc_msgSend(v39, "addObjectsFromArray:", v4);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = objc_msgSend(&unk_24F2CF4B8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(&unk_24F2CF4B8);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v21);
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("All"));
        v24 = v39;
        if ((v23 & 1) != 0
          || (v25 = objc_msgSend(v22, "isEqualToString:", CFSTR("Text")), v24 = v3, (v25 & 1) != 0)
          || (v26 = objc_msgSend(v22, "isEqualToString:", CFSTR("Emoji")), v24 = v38, v26))
        {
          v27 = v24;
        }
        else
        {
          v27 = 0;
        }
        objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E10]), "initWithTitle:candidates:", &stru_24F2ADCC8, v28);
        v52 = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v30, v22);

        ++v21;
      }
      while (v19 != v21);
      v31 = objc_msgSend(&unk_24F2CF4B8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      v19 = v31;
    }
    while (v31);
  }
  v32 = (void *)MEMORY[0x24BEB4E20];
  -[CACCorrectionsCandidatesViewController text](v37, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "candidateWithUnchangedInput:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidatesViewController setOriginalTextCandidate:](v37, "setOriginalTextCandidate:", v34);

  objc_msgSend(MEMORY[0x24BEB4E18], "setWithCandidates:", v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidatesViewController setAllCandidates:](v37, "setAllCandidates:", v39);

  return v35;
}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  float v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGSize result;

  v35 = *MEMORY[0x24BDAC8D0];
  -[CACCorrectionsCandidatesViewController alternatives](self, "alternatives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CACCorrectionsCandidatesViewController emojis](self, "emojis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)(objc_msgSend(v5, "count") + v4);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6 / 3.0;
  -[CACCorrectionsCandidatesViewController alternatives](self, "alternatives", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if (((unint64_t)objc_msgSend(v14, "length") < 0x1F) | v11 & 1)
      {
        if ((unint64_t)objc_msgSend(v14, "length") >= 0x15 && (v11 & 1) == 0)
          v7 = v7 + 0.5;
      }
      else
      {
        v7 = 2.0;
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    -[CACCorrectionsCandidatesViewController emojis](self, "emojis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (double)(unint64_t)objc_msgSend(v8, "count") / 3.0;
    v7 = v7 + ceilf(v15);
LABEL_16:

  }
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scaledValueForValue:", 34.0);
  v18 = v17;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scaledValueForValue:", 44.0);
  v21 = v20;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    *(double *)&v24 = 374.0;
  }
  else
  {
    -[CACCorrectionsCandidatesViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v24 = v26;

  }
  v27 = v7;
  v28 = v18 / 3.0 + v21 + v18 * ceilf(v27);
  v29 = *(double *)&v24;
  result.height = v28;
  result.width = v29;
  return result;
}

- (void)closeButtonTapped
{
  id v3;

  -[CACCorrectionsCandidatesViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissCorrectionsCandidatesViewController:", self);

}

- (void)candidateViewDidTapArrowButton:(id)a3
{
  NSObject *v3;

  CACLogCorrections();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CACCorrectionsCandidatesViewController candidateViewDidTapArrowButton:].cold.1();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  if ((void *)CandidateSetContext == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("candidateResultSet")))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
    }
  }

}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  CACLogCorrections();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CACCorrectionsCandidatesViewController candidateView:didAcceptCandidate:atIndexPath:inGridType:].cold.1((uint64_t)v9, (uint64_t)v10, v12);

  -[CACCorrectionsCandidatesViewController originalTextCandidate](self, "originalTextCandidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForCandidate:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 != v10)
  {
    -[CACCorrectionsCandidatesViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "correctionsCandidatesViewController:didSelectItemWithText:", self, v16);

  }
}

- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4
{
  NSObject *v4;

  CACLogCorrections();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CACCorrectionsCandidatesViewController candidateViewSelectionDidChange:inGridType:].cold.1();

}

- (void)candidateViewWillBeginDragging:(id)a3
{
  NSObject *v3;

  CACLogCorrections();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CACCorrectionsCandidatesViewController candidateViewWillBeginDragging:].cold.1();

}

- (void)candidateViewNeedsToExpand:(id)a3
{
  NSObject *v3;

  CACLogCorrections();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CACCorrectionsCandidatesViewController candidateViewNeedsToExpand:].cold.1();

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACCorrectionsCandidatesViewController;
  -[CACCorrectionsCandidatesViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  if (CACIsInDarkMode())
    +[CACCorrectionsCandidateViewStyle cacDarkStyle](CACCorrectionsCandidateViewStyle, "cacDarkStyle");
  else
    +[CACCorrectionsCandidateViewStyle cacLightStyle](CACCorrectionsCandidateViewStyle, "cacLightStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCandidateState setStyle:](self->_candidateConfiguration, "setStyle:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCCorrectionsCandidatesViewControllerDelegate)delegate
{
  return (CACCCorrectionsCandidatesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSArray)emojis
{
  return self->_emojis;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TUICandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_candidateView, a3);
}

- (TUICandidateView)secondaryCandidateView
{
  return self->_secondaryCandidateView;
}

- (void)setSecondaryCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryCandidateView, a3);
}

- (UIView)candidateBackdropView
{
  return self->_candidateBackdropView;
}

- (void)setCandidateBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_candidateBackdropView, a3);
}

- (CACCorrectionsCandidateState)candidateConfiguration
{
  return self->_candidateConfiguration;
}

- (void)setCandidateConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_candidateConfiguration, a3);
}

- (TIKeyboardCandidateSingle)originalTextCandidate
{
  return self->_originalTextCandidate;
}

- (void)setOriginalTextCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_originalTextCandidate, a3);
}

- (NSArray)allCandidates
{
  return self->_allCandidates;
}

- (void)setAllCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_allCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allCandidates, 0);
  objc_storeStrong((id *)&self->_originalTextCandidate, 0);
  objc_storeStrong((id *)&self->_candidateConfiguration, 0);
  objc_storeStrong((id *)&self->_candidateBackdropView, 0);
  objc_storeStrong((id *)&self->_secondaryCandidateView, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_emojis, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)candidateViewDidTapArrowButton:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Tapped arrow somehow?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)candidateView:(os_log_t)log didAcceptCandidate:atIndexPath:inGridType:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "Accepted candidate %@ at index %@", (uint8_t *)&v3, 0x16u);
}

- (void)candidateViewSelectionDidChange:inGridType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Candidate selection changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)candidateViewWillBeginDragging:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Starting drag of candidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)candidateViewNeedsToExpand:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Candidate view needs expansion!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
