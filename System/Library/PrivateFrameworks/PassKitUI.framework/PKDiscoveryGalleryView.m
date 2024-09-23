@implementation PKDiscoveryGalleryView

+ (BOOL)isVisibleForSectionsState:(id *)a3 dataSource:(id)a4
{
  __int128 v5;
  id v6;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;

  if (!a4)
    return 0;
  v5 = *((_OWORD *)&a3->var0 + 1);
  v10 = *(_OWORD *)&a3->var0.var0;
  v11 = v5;
  v6 = a4;
  LOBYTE(a1) = objc_msgSend(a1, "_welcomeStateForState:", &v10);
  objc_msgSend(v6, "articleLayouts", v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (a1 & 3 | ((unint64_t)(objc_msgSend(v7, "count") != 0) << 8)) != 0;
  return v8;
}

+ ($7D24B5AD5894795FD85A0EE1D817D743)_welcomeStateForState:(id *)a3
{
  unsigned int v3;
  _BOOL4 v4;
  int v5;

  v3 = *((unsigned __int8 *)&a3->var0 + 16);
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    v4 = (v3 & 2) == 0;
    if ((v3 & 4) != 0)
    {
      v5 = 0;
    }
    else if (PKBarcodePassWelcomeCardDismissed())
    {
      v5 = 0;
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v4 = 0;
    v5 = ~(v3 >> 1) & 2;
  }
  return ($7D24B5AD5894795FD85A0EE1D817D743)(v5 | v4);
}

+ (BOOL)isWelcomeCardVisibleForSectionsState:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *((_OWORD *)&a3->var0 + 1);
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  return (objc_msgSend(a1, "_welcomeStateForState:", v5) & 3) != 0;
}

- (PKDiscoveryGalleryView)init
{

  return 0;
}

- (PKDiscoveryGalleryView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKDiscoveryGalleryView)initWithCardTemplateInformation:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PKDiscoveryCardViewTemplateInformation *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, void *);
  void *v43;
  id v44;
  id location;
  objc_super v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKDiscoveryGalleryView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PKDiscoveryGalleryView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)*((_QWORD *)v10 + 52);
    *((_QWORD *)v10 + 52) = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = (void *)*((_QWORD *)v10 + 53);
    *((_QWORD *)v10 + 53) = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v16 = (void *)*((_QWORD *)v10 + 54);
    *((_QWORD *)v10 + 54) = v15;

    v17 = -[PKDiscoveryCardViewTemplateInformation initWithCardSize:displayType:]([PKDiscoveryCardViewTemplateInformation alloc], "initWithCardSize:displayType:", PKDiscoveryForceIgnoreCEOCards(), 0);
    v18 = (void *)*((_QWORD *)v10 + 68);
    *((_QWORD *)v10 + 68) = v17;

    objc_storeStrong((id *)v10 + 67, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v6, v7, v8, v9);
    v21 = (void *)*((_QWORD *)v10 + 58);
    *((_QWORD *)v10 + 58) = v20;

    objc_msgSend(*((id *)v10 + 58), "setDelegate:", v10);
    objc_msgSend(*((id *)v10 + 58), "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(*((id *)v10 + 58), "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(*((id *)v10 + 58), "setPagingEnabled:", 1);
    objc_msgSend(*((id *)v10 + 58), "setScrollsToTop:", 0);
    objc_msgSend(*((id *)v10 + 58), "setClipsToBounds:", 0);
    objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 58));
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A88]), "initWithFrame:", v6, v7, v8, v9);
    v23 = (void *)*((_QWORD *)v10 + 59);
    *((_QWORD *)v10 + 59) = v22;

    objc_msgSend(*((id *)v10 + 59), "addTarget:action:forControlEvents:", v10, sel__pageControlChanged_, 4096);
    objc_msgSend(*((id *)v10 + 59), "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v10 + 59), "setCurrentPageIndicatorTintColor:", v24);
    v25 = (void *)*((_QWORD *)v10 + 59);
    objc_msgSend(v24, "colorWithAlphaComponent:", 0.3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPageIndicatorTintColor:", v26);

    PKPassKitUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLForResource:withExtension:", CFSTR("xmark"), CFSTR("pdf"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = PKUIScreenScale();
    PKUIImageFromPDF(v28, 100.0, 100.0, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v10 + 60);
    *((_QWORD *)v10 + 60) = v30;

    objc_msgSend(*((id *)v10 + 60), "imageWithRenderingMode:", 2);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v10 + 60);
    *((_QWORD *)v10 + 60) = v32;

    objc_msgSend(v10, "_updatePageControlVisibilityWithDelay:", 0.0);
    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)v10 + 256) = objc_msgSend(v34, "registerObserver:", v10);

    objc_initWeak(&location, v10);
    v47[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __58__PKDiscoveryGalleryView_initWithCardTemplateInformation___block_invoke;
    v43 = &unk_1E3E6F878;
    objc_copyWeak(&v44, &location);
    v36 = (id)objc_msgSend(v10, "registerForTraitChanges:withHandler:", v35, &v40);

    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, 1.79769313e308, v40, v41, v42, v43);
    objc_msgSend(v10, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v37, v38);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

  }
  return (PKDiscoveryGalleryView *)v10;
}

void __58__PKDiscoveryGalleryView_initWithCardTemplateInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a2, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIScrollView setDelegate:](self->_horizontalScrollView, "setDelegate:", 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_allActiveDiscoveryCards, "enumerateObjectsUsingBlock:", &__block_literal_global_156);
  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryGalleryView;
  -[PKDiscoveryGalleryView dealloc](&v4, sel_dealloc);
}

uint64_t __33__PKDiscoveryGalleryView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PKDiscoveryGalleryView _cardSize](self, "_cardSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6 + 6.0 + 6.0;
  v8 = -[NSMutableArray count](self->_allActiveDiscoveryCards, "count");
  v9 = 39.0;
  if (v8 <= 1)
    v9 = 0.0;
  v10 = v5 + v9;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  NSArray *displayedCardViews;
  uint64_t v29;
  id WeakRetained;
  double v31;
  _QWORD v32[9];
  objc_super v33;
  CGRect v34;
  CGRect v35;

  if (!-[PKDiscoveryGalleryView isAnimatingCard](self, "isAnimatingCard"))
  {
    v33.receiver = self;
    v33.super_class = (Class)PKDiscoveryGalleryView;
    -[PKDiscoveryGalleryView layoutSubviews](&v33, sel_layoutSubviews);
    -[PKDiscoveryGalleryView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PKDiscoveryGalleryView sizeThatFits:](self, "sizeThatFits:", v7, 1.79769313e308);
    v13 = v10 == v12 && v8 == v11;
    if (v13)
    {
      v14 = v10;
    }
    else
    {
      v15 = v11;
      v14 = v12;
      -[PKDiscoveryGalleryView setBounds:](self, "setBounds:", v4, v6, v11, v12);
      v8 = v15;
    }
    -[UIScrollView contentSize](self->_horizontalScrollView, "contentSize");
    v17 = v16;
    v19 = v18;
    -[PKDiscoveryGalleryView _contentSize](self, "_contentSize");
    v21 = v20;
    v23 = v22;
    v24 = -[UIScrollView _isAnimatingScroll](self->_horizontalScrollView, "_isAnimatingScroll");
    if (v24)
      v25 = v17;
    else
      v25 = v21;
    if (v24)
      v23 = v19;
    v26 = fmax(v14, v23);
    -[UIScrollView frame](self->_horizontalScrollView, "frame", *(_QWORD *)&v25);
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v26;
    if (!CGRectEqualToRect(v34, v35))
      -[UIScrollView setFrame:](self->_horizontalScrollView, "setFrame:", v4, v6, v8, v26);
    if (v17 != v31 || v19 != v23)
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:");
    -[PKDiscoveryGalleryView _cardSize](self, "_cardSize");
    PKFloatRoundToPixel();
    displayedCardViews = self->_displayedCardViews;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __40__PKDiscoveryGalleryView_layoutSubviews__block_invoke;
    v32[3] = &__block_descriptor_72_e36_v32__0__PKDiscoveryCardView_8Q16_B24l;
    *(double *)&v32[4] = v4;
    *(double *)&v32[5] = v6;
    *(double *)&v32[6] = v8;
    *(double *)&v32[7] = v14;
    v32[8] = v29;
    -[NSArray enumerateObjectsUsingBlock:](displayedCardViews, "enumerateObjectsUsingBlock:", v32);
    -[PKDiscoveryGalleryView _updatePageControlVisibilityWithDelay:](self, "_updatePageControlVisibilityWithDelay:", 0.0);
    if (!v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
      objc_msgSend(WeakRetained, "setNeedsUpdateForGroupStackViewSectionSubheaderView:", self);

    }
  }
}

void __40__PKDiscoveryGalleryView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = a1[7];
  v4 = a1[6];
  v5 = a1[8] + (double)a3 * v4;
  v8 = a2;
  objc_msgSend(v8, "sizeThatFits:", v4, v3);
  objc_msgSend(v8, "setFrame:", v5, 0.0, v6, v7);

}

- (void)updateArticleLayouts:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_pendingDeletes)
  {
    v6 = *((unsigned __int8 *)&self->_layoutState.cards.welcome + 1);
    *((_BYTE *)&self->_layoutState.cards.welcome + 1) = *((_BYTE *)&self->_layoutState.cards.welcome + 1) & 0xFE | (objc_msgSend(v4, "count") != 0);
    -[PKDiscoveryGalleryView _requestDismissalIfNecessaryAfterLayoutStateUpdate](self, "_requestDismissalIfNecessaryAfterLayoutStateUpdate");
    if (((*((unsigned __int8 *)&self->_layoutState.cards.welcome + 1) | v6) & 1) != 0)
    {
      if (LOBYTE(self->_lastTimeForegroundActive))
      {
        v7 = 0;
      }
      else
      {
        v14 = 0u;
        v15 = 0u;
        v12 = 0u;
        v13 = 0u;
        v8 = v5;
        v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
        {
          v9 = *(_QWORD *)v13;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v13 != v9)
                objc_enumerationMutation(v8);
              v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v11, "hasRequestedBadge", (_QWORD)v12))
              {
                objc_msgSend(v11, "itemIdentifier");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_15;
              }
            }
            v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_15:

      }
      -[PKDiscoveryGalleryView _updateDiscoveryCardViewsForUpdatedArticleLayouts:overrideFrontmostCardToIdentifier:animated:](self, "_updateDiscoveryCardViewsForUpdatedArticleLayouts:overrideFrontmostCardToIdentifier:animated:", v5, v7, 1, (_QWORD)v12);

    }
    LOBYTE(self->_lastTimeForegroundActive) = 1;
  }

}

- (id)cardViewForCardWithItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  NSMutableArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_allActiveDiscoveryCards;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "articleLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemIdentifier");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v4;
        v14 = v13;
        if (v12 == v13)
        {

LABEL_12:
          v11 = v7;
          v7 = v10;
LABEL_14:

          continue;
        }
        if (!v4 || !v12)
        {

          goto LABEL_14;
        }
        v15 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v15 & 1) != 0)
          goto LABEL_12;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v6)
        goto LABEL_19;
    }
  }
  v7 = 0;
LABEL_19:

  return v7;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  id v6;
  char v7;
  double Current;
  double v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = BYTE1(self->_lastReportedDiscoveryItemIdentifier);
  LOWORD(self->_lastReportedDiscoveryItemIdentifier) = a4;
  if ((v7 & 1) != 0)
  {
    if ((*(_WORD *)&a4 & 0xFF00) == 0)
      LOBYTE(self->_welcomeCardTemplateInformation) = 3;
  }
  else
  {
    v11 = v6;
    if ((*(_WORD *)&a4 & 0xFF00) != 0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v9 = Current;
      v10 = (void *)*((_QWORD *)&self->_layoutState + 1);
      if (v10 && Current - *(double *)&self->_foregroundState.foreground > 300.0)
      {
        *((_QWORD *)&self->_layoutState + 1) = 0;

      }
      *(double *)&self->_foregroundState.foreground = v9;
      LOBYTE(self->_lastTimeForegroundActive) = 0;
      v6 = v11;
      if (!LOBYTE(self->_welcomeCardTemplateInformation))
      {
        -[PKDiscoveryGalleryView _updateCardSizeIfNecessary](self, "_updateCardSizeIfNecessary");
        v6 = v11;
      }
      LOBYTE(self->_welcomeCardTemplateInformation) = 2;
    }
    else
    {
      LOBYTE(self->_welcomeCardTemplateInformation) = 0;
      -[PKDiscoveryGalleryView _updateCardSizeIfNecessary](self, "_updateCardSizeIfNecessary");
      v6 = v11;
    }
  }

}

- (void)_updateCardSizeIfNecessary
{
  void *v3;
  char v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  PKDiscoveryCardView *passWelcomeView;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)&self->_layoutState.cards.welcome + 3))
  {
    if (PKDiscoveryForceIgnoreCEOCards())
    {
      *((_BYTE *)&self->_layoutState.cards.welcome + 3) = 0;
      return;
    }
    objc_msgSend(*(id *)&self->_visibilityState, "articleLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_35);

    v5 = objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize");
    if ((v4 & 1) != 0 || self->_paymentWelcomeView)
    {
      if (!v5)
      {
LABEL_15:
        *((_BYTE *)&self->_layoutState.cards.welcome + 3) = 0;
        -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v18);
        -[PKDiscoveryGalleryView layoutIfNeeded](self, "layoutIfNeeded");
        return;
      }
    }
    else
    {
      passWelcomeView = self->_passWelcomeView;
      if (passWelcomeView)
        v12 = 1;
      else
        v12 = v5 == 1;
      if (!v12)
      {
        objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "updateCardSize:", 1);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v6 = self->_allActiveDiscoveryCards;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setCardSize:", 1);
            }
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          }
          while (v15);
        }
        goto LABEL_14;
      }
      if (passWelcomeView)
        v13 = v5 == 0;
      else
        v13 = 1;
      if (v13)
        goto LABEL_15;
    }
    objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "updateCardSize:", 0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_allActiveDiscoveryCards;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "setCardSize:", 0, (_QWORD)v18);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v8);
    }
LABEL_14:

    goto LABEL_15;
  }
}

uint64_t __52__PKDiscoveryGalleryView__updateCardSizeIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entitledToForceLargeCard");
}

- (void)_updateDiscoveryCardViewsForUpdatedArticleLayouts:(id)a3 overrideFrontmostCardToIdentifier:(id)a4 animated:(BOOL)a5
{
  id v7;
  uint64_t v8;
  char v9;
  NSMutableArray *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  PKDiscoveryCardView *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableArray *activeDiscoveryCards;
  void *v25;
  unint64_t v26;
  _BOOL4 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v27 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v8 = objc_msgSend(v7, "count");
  v9 = v8 != -[NSMutableArray count](self->_activeDiscoveryCards, "count");
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKDiscoveryGalleryView _indexForCardViewWithIdentifier:](self, "_indexForCardViewWithIdentifier:", v13);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:]([PKDiscoveryCardView alloc], "initWithArticleLayout:dismissImage:cardTemplateInformation:", v12, self->_dismissImage, *(_QWORD *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive);
        -[PKDiscoveryCardView setDelegate:](v15, "setDelegate:", self);
        -[UIScrollView addSubview:](self->_horizontalScrollView, "addSubview:", v15);
        v9 = 1;
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_allActiveDiscoveryCards, "objectAtIndex:", v14);
        v15 = (PKDiscoveryCardView *)objc_claimAutoreleasedReturnValue();
        -[PKDiscoveryCardView articleLayout](v15, "articleLayout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDiscoveryCardView setArticleLayout:](v15, "setArticleLayout:", v12);
        if ((v9 & 1) != 0)
          v9 = 1;
        else
          v9 = objc_msgSend(v16, "isEqualForUI:", v12) ^ 1;

      }
      objc_msgSend(v12, "actionOnDismiss");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryCardView setDismissAction:](v15, "setDismissAction:", v17);

      -[NSMutableArray addObject:](v10, "addObject:", v15);
      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = self->_activeDiscoveryCards;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (-[NSMutableArray indexOfObjectIdenticalTo:](v10, "indexOfObjectIdenticalTo:", v23) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v23, "setDelegate:", 0);
          objc_msgSend(v23, "removeFromSuperview");
          v9 = 1;
        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

  activeDiscoveryCards = self->_activeDiscoveryCards;
  self->_activeDiscoveryCards = v10;

  if ((v9 & 1) != 0)
  {
    v25 = v28;
    -[PKDiscoveryGalleryView _updateCardViewsAnimated:overrideFrontmostCardToIdentifier:](self, "_updateCardViewsAnimated:overrideFrontmostCardToIdentifier:", v27, v28);
LABEL_24:
    -[PKDiscoveryGalleryView _reportCurrentDiscoveryCardToDiscoveryService](self, "_reportCurrentDiscoveryCardToDiscoveryService");
    goto LABEL_25;
  }
  v25 = v28;
  if (v28)
  {
    v26 = -[PKDiscoveryGalleryView _indexForCardViewWithIdentifier:](self, "_indexForCardViewWithIdentifier:", v28);
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PKDiscoveryGalleryView _updateScrollViewToCardIndex:animated:](self, "_updateScrollViewToCardIndex:animated:", v26, v27);
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (void)_updateCardViewsAnimated:(BOOL)a3
{
  -[PKDiscoveryGalleryView _updateCardViewsAnimated:overrideFrontmostCardToIdentifier:](self, "_updateCardViewsAnimated:overrideFrontmostCardToIdentifier:", a3, 0);
}

- (void)_updateCardViewsAnimated:(BOOL)a3 overrideFrontmostCardToIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  _QWORD v20[5];
  _QWORD aBlock[5];
  id v22;
  unint64_t v23;

  v4 = a3;
  v6 = a4;
  v7 = -[PKDiscoveryGalleryView displayIndex](self, "displayIndex");
  v8 = -[NSMutableArray count](self->_allActiveDiscoveryCards, "count");
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    if (v8)
      v10 = v7 >= v8;
    else
      v10 = 1;
    if (v10)
    {
      v9 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_allActiveDiscoveryCards, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "articleLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifier");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke;
  aBlock[3] = &unk_1E3E63480;
  aBlock[4] = self;
  v23 = v7;
  v14 = v9;
  v22 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  v16 = v15;
  if (v4)
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_2;
    v20[3] = &unk_1E3E612E8;
    v20[4] = self;
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_3;
    v18[3] = &unk_1E3E61338;
    v18[4] = self;
    v19 = v15;
    objc_msgSend(v17, "pkui_animateUsingOptions:delay:velocity:animations:completion:", 4, v20, v18, 0.0, 0.0);

  }
  else
  {
    v15[2](v15);
  }

}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateCardViews");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "count") - 1)
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "count") - 1;
  else
    v3 = *(_QWORD *)(a1 + 48);
  v4 = objc_msgSend(*(id *)(a1 + 32), "_indexForCardViewWithIdentifier:", *(_QWORD *)(a1 + 40));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = v3;
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewToCardIndex:animated:", v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "_updatePageControlVisibilityWithDelay:", 0.32);
  objc_msgSend(*(id *)(a1 + 32), "_updatePageControlWithDisplayIndex");
  return objc_msgSend(*(id *)(a1 + 32), "_reportCurrentDiscoveryCardToDiscoveryService");
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_3(uint64_t a1)
{
  _QWORD v3[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_4;
  v3[3] = &unk_1E3E612E8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:delay:velocity:animations:completion:", 4, v3, 0, 0.0, 0.0);
}

uint64_t __85__PKDiscoveryGalleryView__updateCardViewsAnimated_overrideFrontmostCardToIdentifier___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

- (void)_updateCardViews
{
  char welcome;
  int v4;
  $FED95A779F944789D45F91CDF1F04AC3 v5;
  int v6;
  PKDiscoveryCardView *passWelcomeView;
  void *v8;
  PKDiscoveryCardView *v9;
  PKDiscoveryCardView *paymentWelcomeView;
  PKDiscoveryCardView *v11;
  PKDiscoveryCardView *v12;
  int v13;
  NSMutableArray *allActiveDiscoveryCards;
  void *v15;
  NSArray *v16;
  NSArray *displayedCardViews;
  char v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  NSArray *v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD aBlock[4];
  id v33;
  id location;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_allActiveDiscoveryCards, "removeAllObjects");
  welcome = (char)self->_layoutState.cards.welcome;
  if ((welcome & 1) != 0 && !self->_paymentWelcomeView)
  {
    -[PKDiscoveryGalleryView _createPaymentWelcomeCardView](self, "_createPaymentWelcomeCardView");
    v9 = (PKDiscoveryCardView *)objc_claimAutoreleasedReturnValue();
    paymentWelcomeView = self->_paymentWelcomeView;
    self->_paymentWelcomeView = v9;

    -[UIScrollView addSubview:](self->_horizontalScrollView, "addSubview:", self->_paymentWelcomeView);
    v5 = self->_layoutState.cards.welcome;
    v4 = 1;
  }
  else
  {
    v4 = 0;
    v5 = self->_layoutState.cards.welcome;
  }
  v6 = (*(unsigned int *)&v5 >> 1) & 1;
  if ((*(_BYTE *)&v5 & 2) != 0)
  {
    passWelcomeView = self->_passWelcomeView;
    if (passWelcomeView)
    {
      if ((*((_BYTE *)&self->_layoutState.cards.welcome + 2) & 1) != 0)
      {
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __42__PKDiscoveryGalleryView__updateCardViews__block_invoke;
        aBlock[3] = &unk_1E3E72388;
        objc_copyWeak(&v33, &location);
        v8 = _Block_copy(aBlock);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
        passWelcomeView = self->_passWelcomeView;
      }
      else
      {
        v8 = 0;
      }
      -[PKDiscoveryCardView setDismissAction:](passWelcomeView, "setDismissAction:", v8);

    }
    else
    {
      -[PKDiscoveryGalleryView _createPassWelcomeCardView](self, "_createPassWelcomeCardView");
      v11 = (PKDiscoveryCardView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_passWelcomeView;
      self->_passWelcomeView = v11;

      -[UIScrollView addSubview:](self->_horizontalScrollView, "addSubview:", self->_passWelcomeView);
      v4 = 1;
    }
  }
  if ((*((_BYTE *)&self->_layoutState.cards.welcome + 1) & 1) == 0)
  {
    if ((welcome & 1) != 0)
      goto LABEL_40;
LABEL_14:
    if (v6)
      goto LABEL_15;
    goto LABEL_16;
  }
  v27 = v4;
  v18 = welcome & 1;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = self->_activeDiscoveryCards;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (!v20)
    goto LABEL_39;
  v21 = v20;
  v22 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v29 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      v25 = objc_msgSend(v24, "priority");
      if ((v18 & 1) == 0)
        goto LABEL_32;
      if (-[PKDiscoveryCardView priority](self->_paymentWelcomeView, "priority") >= v25)
      {
        -[NSMutableArray addObject:](self->_allActiveDiscoveryCards, "addObject:", self->_paymentWelcomeView);
LABEL_32:
        v18 = 0;
        if ((v6 & 1) == 0)
          goto LABEL_36;
        goto LABEL_33;
      }
      v18 = 1;
      if ((v6 & 1) == 0)
        goto LABEL_36;
LABEL_33:
      if (-[PKDiscoveryCardView priority](self->_passWelcomeView, "priority") < v25)
      {
        v6 = 1;
        goto LABEL_37;
      }
      -[NSMutableArray addObject:](self->_allActiveDiscoveryCards, "addObject:", self->_passWelcomeView);
LABEL_36:
      v6 = 0;
LABEL_37:
      -[NSMutableArray addObject:](self->_allActiveDiscoveryCards, "addObject:", v24);
    }
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  }
  while (v21);
LABEL_39:

  v4 = v27;
  if ((v18 & 1) == 0)
    goto LABEL_14;
LABEL_40:
  -[NSMutableArray addObject:](self->_allActiveDiscoveryCards, "addObject:", self->_paymentWelcomeView);
  if ((v6 & 1) == 0)
    goto LABEL_16;
LABEL_15:
  -[NSMutableArray addObject:](self->_allActiveDiscoveryCards, "addObject:", self->_passWelcomeView);
LABEL_16:
  if (v4
    && objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize") == 1
    && (PKDiscoveryForceIgnoreCEOCards() & 1) == 0)
  {
    *((_BYTE *)&self->_layoutState.cards.welcome + 3) = 1;
    -[PKDiscoveryGalleryView _updateCardSizeIfNecessary](self, "_updateCardSizeIfNecessary");
  }
  v13 = -[PKDiscoveryGalleryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  allActiveDiscoveryCards = self->_allActiveDiscoveryCards;
  if (v13)
  {
    -[NSMutableArray reverseObjectEnumerator](allActiveDiscoveryCards, "reverseObjectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    displayedCardViews = self->_displayedCardViews;
    self->_displayedCardViews = v16;

  }
  else
  {
    v26 = (NSArray *)-[NSMutableArray copy](allActiveDiscoveryCards, "copy");
    v15 = self->_displayedCardViews;
    self->_displayedCardViews = v26;
  }

  -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout");
  -[PKDiscoveryGalleryView layoutIfNeeded](self, "layoutIfNeeded");
}

void __42__PKDiscoveryGalleryView__updateCardViews__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSetBarcodePassWelcomeCardDismissed();
    v4[2](v4, 1, 0);
  }

}

- (CGSize)_cardSize
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize");
  +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
  v4 = v3;
  if (v2)
  {
    v5 = 120.0;
  }
  else
  {
    +[PKDiscoveryCardView compressedHeight](PKDiscoveryCardView, "compressedHeight");
    v5 = v6;
  }
  v7 = v4;
  result.height = v5;
  result.width = v7;
  return result;
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PKDiscoveryGalleryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 * (double)-[NSArray count](self->_displayedCardViews, "count");
  v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (unint64_t)_indexForCardViewWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *allActiveDiscoveryCards;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  allActiveDiscoveryCards = self->_allActiveDiscoveryCards;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKDiscoveryGalleryView__indexForCardViewWithIdentifier___block_invoke;
  v9[3] = &unk_1E3E723B0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](allActiveDiscoveryCards, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__PKDiscoveryGalleryView__indexForCardViewWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "articleLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_removeCardView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[5];
  id v14;
  BOOL v15;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke;
  aBlock[3] = &unk_1E3E64908;
  aBlock[4] = self;
  v8 = v6;
  v14 = v8;
  v15 = v4;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v4)
  {
    objc_msgSend(v8, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_6;
    v11[3] = &unk_1E3E614F0;
    v12 = v9;
    +[PKPassDeleteAnimationController performPassbookDeleteWithView:inSuperview:completion:](PKPassDeleteAnimationController, "performPassbookDeleteWithView:inSuperview:completion:", v8, v10, v11);

  }
  else
  {
    objc_msgSend(v8, "removeFromSuperview");
    v9[2](v9);
  }

}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  _QWORD v22[5];
  char v23;
  _QWORD v24[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 488);
  objc_msgSend(*(id *)(a1 + 40), "articleLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v2, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_indexForCardViewWithIdentifier:", v4);

  v6 = objc_msgSend(*(id *)(a1 + 32), "displayIndex");
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 == v6)
    {
      if (v5 >= v7 - 1)
        v6 = v7 - 1;
      else
        v6 = v5;
    }
    else if (v6)
    {
      if (v5 < v6 || v5 >= v7)
      {
        if (v6 - 1 >= v7 - 1)
          v6 = v7 - 1;
        else
          --v6;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewToCardIndex:animated:", v6, *(unsigned __int8 *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  if (v9 == *(void **)(v10 + 456))
  {
    *(_QWORD *)(v10 + 456) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 496) &= ~1u;
    v11 = 1;
  }
  else if (v9 == *(void **)(v10 + 448))
  {
    *(_QWORD *)(v10 + 448) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 496) &= ~2u;
    v11 = 1;
    PKSetBarcodePassWelcomeCardDismissed();
  }
  else
  {
    objc_msgSend(*(id *)(v10 + 424), "removeObject:");
    v11 = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 497) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 497) & 0xFE | (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "count") != 0);
  }
  v12 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v12 + 497) & 1) == 0 && (*(_BYTE *)(v12 + 496) & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removedAllDiscoveryItems");

    v12 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v12 + 416), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "articleLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pk_arrayByRemovingObject:", v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "cardSize")
    && (v11 | objc_msgSend(v2, "entitledToForceLargeCard")) == 1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "isMiniCardsAllowed"))
    {
      if ((objc_msgSend(v15, "pk_containsObjectPassingTest:", &__block_literal_global_42) & 1) == 0)
      {
        v16 = *(_QWORD *)(a1 + 32);
        if (!*(_QWORD *)(v16 + 456) && !*(_QWORD *)(v16 + 448))
          *(_BYTE *)(v16 + 499) = 1;
      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_requestDismissalIfNecessaryAfterLayoutStateUpdate") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    if (*(_BYTE *)(a1 + 48))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_3;
      v24[3] = &unk_1E3E612E8;
      v24[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v24, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateCardViews");
      objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
    }
    objc_msgSend(*(id *)(a1 + 32), "_updatePageControlVisibilityWithDelay:", 0.65);
  }
  objc_msgSend(*(id *)(a1 + 40), "dismissAction");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_4;
    v22[3] = &unk_1E3E723F8;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v11;
    (*(void (**)(uint64_t, _QWORD *))(v17 + 16))(v17, v22);
  }
  else
  {
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 488);
    v19 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v19 + 488))
      v20 = 1;
    else
      v20 = v11;
    if ((v20 & 1) == 0)
    {
      objc_msgSend(*(id *)(v19 + 560), "articleLayouts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v19, "updateArticleLayouts:", v21);

    }
  }

}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "entitledToForceLargeCard"))
    v3 = objc_msgSend(v2, "hasHitMaxLargeViewCount") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateCardViews");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD v3[5];
  char v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_5;
  v3[3] = &unk_1E3E64930;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v5 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v3;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 488);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 488) && !*(_BYTE *)(a1 + 40))
  {
    if (!*(_BYTE *)(a1 + 41))
    {
      if (objc_msgSend(*(id *)(v1 + 416), "count"))
        return;
      v1 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v1 + 560), "articleLayouts");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "updateArticleLayouts:", v3);

  }
}

uint64_t __51__PKDiscoveryGalleryView__removeCardView_animated___block_invoke_6(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (BOOL)_requestDismissalIfNecessaryAfterLayoutStateUpdate
{
  _BOOL4 v3;
  id WeakRetained;
  void *v5;

  v3 = -[PKDiscoveryGalleryView needsRemoval](self, "needsRemoval");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "setNeedsUpdateForGroupStackViewSectionSubheaderView:", self);

  }
  return v3;
}

- (void)_updateScrollViewToCardIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  CGRect v12;

  v4 = a4;
  v7 = -[PKDiscoveryGalleryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v8 = -[NSArray count](self->_displayedCardViews, "count");
  v9 = v8 - 1;
  v10 = v8 - 1 - a3;
  if (v8 - 1 >= a3)
    v9 = a3;
  if (!v8)
    v10 = 0;
  if (v7)
    v9 = v10;
  v11 = (double)v9;
  -[UIScrollView bounds](self->_horizontalScrollView, "bounds");
  -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", v4, CGRectGetWidth(v12) * v11, 0.0);
}

- (void)_pageControlChanged:(id)a3
{
  unint64_t v4;
  NSInteger v5;

  v4 = -[PKDiscoveryGalleryView displayIndex](self, "displayIndex", a3);
  v5 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
  if (v4 != v5)
  {
    -[PKDiscoveryGalleryView _updateScrollViewToCardIndex:animated:](self, "_updateScrollViewToCardIndex:animated:", v5, 1);
    -[PKDiscoveryGalleryView _reportCurrentDiscoveryCardToDiscoveryService](self, "_reportCurrentDiscoveryCardToDiscoveryService");
  }
}

- (void)updatePageControlFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;
  CGRect slice;
  CGRect v15;

  -[PKDiscoveryGalleryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryGalleryView _cardSize](self, "_cardSize", *(_QWORD *)&v3, *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, 0, 0, 0, 0);
  v12 = v11 + -5.0;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGRectDivide(v15, &slice, &v13, v12, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:");
}

- (void)_updatePageControlWithDisplayIndex
{
  unint64_t v3;

  v3 = -[PKDiscoveryGalleryView displayIndex](self, "displayIndex");
  if (v3 != -[UIPageControl currentPage](self->_pageControl, "currentPage"))
  {
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v3);
    -[PKDiscoveryGalleryView _reportCurrentDiscoveryCardToDiscoveryService](self, "_reportCurrentDiscoveryCardToDiscoveryService");
  }
}

- (void)_updatePageControlVisibilityWithDelay:(double)a3
{
  unint64_t v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;
  id v13;

  v5 = -[NSMutableArray count](self->_allActiveDiscoveryCards, "count");
  -[UIPageControl setHidden:](self->_pageControl, "setHidden:", v5 < 2);
  if (v5 != -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages"))
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v5);
  if (v5 >= 2)
    -[PKDiscoveryGalleryView addSubview:](self, "addSubview:", self->_pageControl);
  else
    -[UIPageControl removeFromSuperview](self->_pageControl, "removeFromSuperview");
  -[PKDiscoveryGalleryView updatePageControlFrame](self, "updatePageControlFrame");
  -[UIPageControl layer](self->_pageControl, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "opacity");
  v6 = v5 > 1;
  v7 = *(float *)&v8;
  HIDWORD(v8) = 0;
  if (v5 <= 1)
    v9 = 0.0;
  else
    v9 = 1.0;
  if (v7 == v9)
  {
    *(float *)&v8 = (float)v6;
    objc_msgSend(v13, "setOpacity:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v7, v9);
    objc_msgSend(v10, "setBeginTime:", a3);
    *(float *)&v11 = (float)v6;
    objc_msgSend(v13, "setOpacity:", v11);
    if (v10)
    {
      v12 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v10);

    }
  }

}

- (void)_reportCurrentDiscoveryCardToDiscoveryService
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKDiscoveryCardView *v20;

  if (BYTE1(self->_lastReportedDiscoveryItemIdentifier))
  {
    v3 = -[NSMutableArray count](self->_allActiveDiscoveryCards, "count");
    v4 = -[PKDiscoveryGalleryView displayIndex](self, "displayIndex");
    if (v3 >= 1)
    {
      v5 = v4;
      if ((v4 & 0x8000000000000000) == 0 && v4 < v3)
      {
        -[NSMutableArray objectAtIndex:](self->_allActiveDiscoveryCards, "objectAtIndex:", v4);
        v20 = (PKDiscoveryCardView *)objc_claimAutoreleasedReturnValue();
        -[PKDiscoveryCardView articleLayout](v20, "articleLayout");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "card");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "callToAction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "action");

        -[PKDiscoveryCardView articleLayout](v20, "articleLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 == self->_paymentWelcomeView || v20 == self->_passWelcomeView)
        {
          v17 = *(void **)&self->_visibilityState;
          -[PKDiscoveryCardView articleLayout](v20, "articleLayout");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "item");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayedDiscoveryItem:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:", v19, 1, v5 != 0, (unint64_t)v3 > 1, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));

          v16 = (void *)*((_QWORD *)&self->_layoutState + 1);
          *((_QWORD *)&self->_layoutState + 1) = 0;
        }
        else
        {
          if ((objc_msgSend(v11, "isEqualToString:", *((_QWORD *)&self->_layoutState + 1)) & 1) != 0)
          {
LABEL_12:

            return;
          }
          v12 = *(void **)&self->_visibilityState;
          -[PKDiscoveryCardView articleLayout](v20, "articleLayout");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "item");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "displayedDiscoveryItem:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:", v14, 0, v5 != 0, (unint64_t)v3 > 1, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));

          v15 = v11;
          v16 = (void *)*((_QWORD *)&self->_layoutState + 1);
          *((_QWORD *)&self->_layoutState + 1) = v15;
        }

        goto LABEL_12;
      }
    }
  }
}

- (unint64_t)displayIndex
{
  int v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  CGRect v16;

  v3 = -[PKDiscoveryGalleryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIScrollView bounds](self->_horizontalScrollView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[NSMutableArray count](self->_allActiveDiscoveryCards, "count");
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  v13 = (unint64_t)fmax(fmin(CGRectGetMidX(v16) / v9, (double)(unint64_t)(v12 - 1)), 0.0);
  if (v3)
  {
    v14 = -[NSArray count](self->_displayedCardViews, "count");
    if (v14)
      return v14 + ~v13;
    else
      return 0;
  }
  return v13;
}

- (NSString)frontmostItemIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  if (-[NSMutableArray count](self->_allActiveDiscoveryCards, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_allActiveDiscoveryCards, "objectAtIndexedSubscript:", -[PKDiscoveryGalleryView displayIndex](self, "displayIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "articleLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_horizontalScrollView == a3)
  {
    if ((objc_msgSend(a3, "_isAnimatingScroll") & 1) == 0)
      -[PKDiscoveryGalleryView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->_horizontalScrollView == a3 && !a4)
  {
    -[PKDiscoveryGalleryView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_horizontalScrollView == a3)
  {
    -[PKDiscoveryGalleryView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_horizontalScrollView == a3)
  {
    -[PKDiscoveryGalleryView _contentSize](self, "_contentSize");
    v5 = v4;
    v7 = v6;
    -[UIScrollView contentSize](self->_horizontalScrollView, "contentSize");
    if (v5 != v9 || v7 != v8)
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:", v5, v7);
    -[PKDiscoveryGalleryView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKDiscoveryGalleryView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)discoveryArticleViewController:(id)a3 tappedCallToAction:(id)a4 item:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(void **)&self->_visibilityState;
  v7 = *(void **)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v6, "tappedDiscoveryItem:callToAction:cardSize:", v8, v9, objc_msgSend(v7, "cardSize"));

}

- (void)discoveryCardViewTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  PKDiscoveryArticleViewController *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_subheaderDelegate);
  if (WeakRetained)
  {
    objc_msgSend(v17, "articleLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKDiscoveryArticleViewController initWithArticleLayout:referrerIdentifier:cardTemplateInformation:]([PKDiscoveryArticleViewController alloc], "initWithArticleLayout:referrerIdentifier:cardTemplateInformation:", v5, 0, *(_QWORD *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive);
    -[PKDiscoveryArticleViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
    -[PKDiscoveryArticleViewController setDelegate:](v6, "setDelegate:", self);
    objc_msgSend(v17, "callToActionTappedOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryArticleViewController setCallToActionTappedOverride:](v6, "setCallToActionTappedOverride:", v7);

    objc_msgSend(WeakRetained, "groupStackViewSectionSubheaderView:transitionToViewController:", self, v6);
    v8 = -[NSMutableArray indexOfObject:](self->_allActiveDiscoveryCards, "indexOfObject:", v17) != 0;
    v9 = -[NSMutableArray count](self->_activeDiscoveryCards, "count");
    if (self->_passWelcomeView)
      v10 = v9 + 1;
    else
      v10 = v9;
    if (self->_paymentWelcomeView)
      v11 = v10 + 1;
    else
      v11 = v10;
    objc_msgSend(v5, "card");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callToAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "action");

    objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "expandedDiscoveryItemWithIdentifier:callToAction:afterSwipingToCard:multipleStoryCardsAvailable:cardSize:", v16, v14, v8, v11 > 1, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));

  }
}

- (void)discoveryCardViewRemoveTapped:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "isRemoving");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v7, "setRemoving:", 1);
      -[PKDiscoveryGalleryView _removeCardView:animated:](self, "_removeCardView:animated:", v7, 1);
      v5 = v7;
    }
  }

}

- (void)discoveryCardViewCTATapped:(id)a3 callToAction:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  id v31;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "action");
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v61 = v11;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Gallery view CTA (action=%ld) tapped", buf, 0xCu);
  }

  -[PKDiscoveryGalleryView cardViewForCardWithItemIdentifier:](self, "cardViewForCardWithItemIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "articleLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)&self->_visibilityState, "tappedDiscoveryItem:callToAction:cardSize:", v15, v9, objc_msgSend(*(id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, "cardSize"));
  switch(v11)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rootViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_msgSend(v9, "paymentSetupMode");
        objc_msgSend(v9, "referrerIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "paymentNetworks");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transitNetworkIdentifiers");
        v58 = v15;
        v23 = v13;
        v24 = v8;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allowedFeatureIdentifiers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "productIdentifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:", v24, v20, v21, v22, v25, v26, v27);

        v8 = v24;
        v13 = v23;
        v15 = v58;

      }
      goto LABEL_27;
    case 4:
      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      v29 = (_QWORD *)MEMORY[0x1E0D6BAD0];
      goto LABEL_25;
    case 5:
      PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "openSensitiveURL:withOptions:", v19, 0);

      objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "completedDiscoveryItemCTAWithCompletion:", 0);
      goto LABEL_26;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rootViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      if (PKPeerPaymentIsSetup())
      {
        objc_msgSend(v19, "presentPeerPaymentPassAnimated:completion:", 1, 0);
      }
      else
      {
        v31 = objc_alloc_init(MEMORY[0x1E0D673D8]);
        objc_msgSend(v31, "setRegistrationFlowState:", 0);
        objc_msgSend(v19, "presentPeerPaymentSetupWithConfiguration:", v31);
LABEL_26:

      }
LABEL_27:

LABEL_28:
      return;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "window");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rootViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v19, "presentCreateAccountUserInvitationWithCompletion:", 0);
      goto LABEL_27;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "window");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "rootViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v19;
      else
        v41 = 0;
      v42 = v41;
      objc_msgSend(v9, "appStoreAppIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "presentAppStorePageForItemWithIdentifier:", v43);

      goto LABEL_23;
    case 9:
      objc_msgSend(v9, "allowedFeatureIdentifiers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "anyObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = PKFeatureIdentifierFromString();

      if (!v46)
        goto LABEL_28;
      v47 = (void *)MEMORY[0x1E0CB3940];
      v48 = *MEMORY[0x1E0D6BB38];
      v49 = *MEMORY[0x1E0D6BAD8];
      PKFeatureIdentifierToString();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("//%@/%@/%@"), v48, v49, v50);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v19);
      objc_msgSend(v43, "setScheme:", *MEMORY[0x1E0D6BCA8]);
      objc_msgSend(v9, "referrerIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v52 = objc_alloc(MEMORY[0x1E0CB39D8]);
        v53 = (void *)objc_msgSend(v52, "initWithName:value:", *MEMORY[0x1E0D6BB58], v51);
        v59 = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setQueryItems:", v54);

      }
      objc_msgSend(v43, "URL");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "openURL:withOptions:", v55, 0);

      }
LABEL_23:

      goto LABEL_27;
    case 10:
      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      v29 = (_QWORD *)MEMORY[0x1E0D6BAE0];
LABEL_25:
      v19 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("prefs:root=PASSBOOK&path=%@"), *v29);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "openSensitiveURL:withOptions:", v31, 0);

      goto LABEL_26;
    default:
      goto LABEL_28;
  }
}

- (BOOL)needsRemoval
{
  return !*(_QWORD *)&self->_visibilityState || (*(_WORD *)&self->_layoutState.cards.welcome & 0x103) == 0;
}

- (int64_t)scrollType
{
  return 1;
}

- (void)setSectionsState:(id *)a3
{
  void *v5;
  __int128 v6;
  unsigned __int8 v7;
  $FED95A779F944789D45F91CDF1F04AC3 welcome;
  unsigned __int8 v9;
  int v10;
  PKDiscoveryCardView *paymentWelcomeView;
  PKDiscoveryCardView *passWelcomeView;
  _OWORD v13[2];

  v5 = (void *)objc_opt_class();
  v6 = *((_OWORD *)&a3->var0 + 1);
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v7 = objc_msgSend(v5, "_welcomeStateForState:", v13);
  welcome = self->_layoutState.cards.welcome;
  if (((*(_BYTE *)&welcome ^ v7) & 3) != 0)
  {
    v9 = v7;
    v10 = *((unsigned __int8 *)&self->_layoutState.cards.welcome + 1);
    *(_BYTE *)&self->_layoutState.cards.welcome = v7;
    *((_BYTE *)&self->_layoutState.cards.welcome + 2) = *((_BYTE *)&self->_layoutState.cards.welcome + 2) & 0xFE | *((_BYTE *)a3 + 24) & 1;
    if ((v7 & 1) == 0 && (*(_BYTE *)&welcome & 1) != 0)
    {
      -[PKDiscoveryCardView removeFromSuperview](self->_paymentWelcomeView, "removeFromSuperview");
      paymentWelcomeView = self->_paymentWelcomeView;
      self->_paymentWelcomeView = 0;

    }
    if ((v9 & 2) == 0 && (*(_BYTE *)&welcome & 2) != 0)
    {
      -[PKDiscoveryCardView removeFromSuperview](self->_passWelcomeView, "removeFromSuperview");
      passWelcomeView = self->_passWelcomeView;
      self->_passWelcomeView = 0;

    }
    if (!self->_paymentWelcomeView && !self->_passWelcomeView)
      *((_BYTE *)&self->_layoutState.cards.welcome + 3) = 1;
    -[PKDiscoveryGalleryView _requestDismissalIfNecessaryAfterLayoutStateUpdate](self, "_requestDismissalIfNecessaryAfterLayoutStateUpdate");
    -[PKDiscoveryGalleryView _updateCardViewsAnimated:](self, "_updateCardViewsAnimated:", ((*(unsigned int *)&welcome | (v10 << 8)) & 0x103) != 0);
  }
}

- (void)setSubheaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subheaderDelegate, a3);
}

+ (id)passWelcomeCardMessageAttributedString
{
  void *v2;
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  PKLocalizedString(CFSTR("PASS_SHELF_1_BODY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKUIGetMinScreenWidthType() - 1;
  if (v3 >= 6)
    v4 = 0.0;
  else
    v4 = 2.0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("zh")) & 1) != 0
     || (objc_msgSend(v6, "isEqualToString:", CFSTR("ja")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("ko"))))
  {
    v4 = v4 + 2.0;
  }
  if (v3 >= 6)
    v7 = 9.5;
  else
    v7 = 12.5;
  v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v8, "setParagraphSpacing:", v7);
  objc_msgSend(v8, "setLineSpacing:", v4);
  v9 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(v9, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v9, "setShadowColor:", 0);
  objc_msgSend(v9, "setShadowBlurRadius:", 0.0);
  v18[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  v18[2] = *MEMORY[0x1E0DC1100];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC1178];
  v19[2] = v12;
  v19[3] = v8;
  v14 = *MEMORY[0x1E0DC1198];
  v18[3] = v13;
  v18[4] = v14;
  v19[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v2, v15);
  return v16;
}

- (id)_createPaymentWelcomeCardView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKDiscoveryCardView *v23;
  void *v25;

  PKPassKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("paymentWelcomeCard"), CFSTR("json"));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v4);
  v25 = (void *)v4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D66CF8]);
  objc_msgSend(v7, "setIdentifier:", CFSTR("paymentWelcomeCard"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66CE8]), "initWithDictionary:", v6);
  objc_msgSend(v8, "setItem:", v7);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemIdentifier:", v9);

  objc_msgSend(v8, "setPriority:", *MEMORY[0x1E0D69DB0]);
  PKPassKitBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizeWithBundle:table:", v10, CFSTR("Discovery_Localizable"));

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKDeviceSupportsTransitWithWebService();
  -[PKDiscoveryGalleryView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (PKDeviceSupportsFelicaDebitWithWebService() || (v14 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v17 = PKWebServiceFeaturesCredential();
    if (!v12 || v17)
    {
      if (PKPearlIsAvailable())
        v18 = CFSTR("WELCOME_CARD_PAYMENTS_BODY_PEARL");
      else
        v18 = CFSTR("WELCOME_CARD_PAYMENTS_BODY");
    }
    else
    {
      v18 = CFSTR("WELCOME_CARD_PAYMENTS_BODY_TRANSIT");
    }
    PKLocalizedDiscoveryString(&v18->isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!v15)
      goto LABEL_18;
  }
  else
  {
    PKLocalizedDiscoveryString(CFSTR("WELCOME_CARD_PAYMENTS_BODY_SUICA"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedDiscoveryString(CFSTR("WELCOME_CARD_PAYMENTS_CTA_SUBTITLE_SUICA"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_18;
  }
  objc_msgSend(v8, "shelves");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v20, "setLocalizedBody:", v15);

LABEL_18:
  if (v16)
  {
    objc_msgSend(v8, "card");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callToAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setLocalizedSubtitle:", v16);
  }
  v23 = -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:isWelcomeCard:]([PKDiscoveryCardView alloc], "initWithArticleLayout:dismissImage:cardTemplateInformation:isWelcomeCard:", v8, self->_dismissImage, self->_cardTemplateInformation, 1);
  -[PKDiscoveryCardView setDelegate:](v23, "setDelegate:", self);

  return v23;
}

- (id)_createPassWelcomeCardView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  PKDiscoveryCardView *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD aBlock[4];
  __CFString *v21;
  id v22;
  PKDiscoveryGalleryView *v23;
  id v24;
  id location;

  PKPassKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("passWelcomeCard"), CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D66CF8]);
  objc_msgSend(v7, "setIdentifier:", CFSTR("passWelcomeCard"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66CE8]), "initWithDictionary:", v6);
  objc_msgSend(v8, "setItemIdentifier:", CFSTR("passWelcomeCard"));
  objc_msgSend(v8, "setItem:", v7);
  objc_msgSend(v8, "setPriority:", *MEMORY[0x1E0D69DB0]);
  PKPassKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizeWithBundle:table:", v9, CFSTR("Discovery_Localizable"));

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke;
  aBlock[3] = &unk_1E3E72420;
  objc_copyWeak(&v24, &location);
  v21 = CFSTR("passWelcomeCard");
  v11 = v8;
  v22 = v11;
  v23 = self;
  v12 = _Block_copy(aBlock);
  v13 = -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:isWelcomeCard:]([PKDiscoveryCardView alloc], "initWithArticleLayout:dismissImage:cardTemplateInformation:isWelcomeCard:", v11, self->_dismissImage, self->_cardTemplateInformation, 1);
  if ((*((_BYTE *)&self->_layoutState.cards.welcome + 2) & 1) != 0)
  {
    v15 = v10;
    v16 = 3221225472;
    v17 = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_4;
    v18 = &unk_1E3E72388;
    objc_copyWeak(&v19, &location);
    -[PKDiscoveryCardView setDismissAction:](v13, "setDismissAction:", &v15);
    objc_destroyWeak(&v19);
  }
  -[PKDiscoveryCardView setCallToActionTappedOverride:](v13, "setCallToActionTappedOverride:", v12, v15, v16, v17, v18);
  -[PKDiscoveryCardView setDelegate:](v13, "setDelegate:", self);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v13;
}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "card");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callToAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tappedDiscoveryItemWithIdentifier:callToAction:cardSize:", v6, objc_msgSend(v8, "action"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 536), "cardSize"));

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedDiscoveryString(CFSTR("PASS_WELCOME_CARD_FIND_APPS_ACTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_2;
    v25[3] = &unk_1E3E63F88;
    objc_copyWeak(&v26, &to);
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedDiscoveryString(CFSTR("PASS_WELCOME_CARD_SCAN_CODE_ACTION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_3;
    v23[3] = &unk_1E3E63F88;
    objc_copyWeak(&v24, &to);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedDiscoveryString(CFSTR("PASS_WELCOME_CARD_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v19);

    v20 = objc_loadWeakRetained(&to);
    objc_msgSend(v20, "pkui_viewControllerFromResponderChain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pkui_frontMostViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentViewController:animated:completion:", v9, 1, 0);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);

  }
  objc_destroyWeak(&to);

}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_appStorePressed");

}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scanCodePressed");

}

void __52__PKDiscoveryGalleryView__createPassWelcomeCardView__block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSetBarcodePassWelcomeCardDismissed();
    v4[2](v4, 1, 0);
  }

}

- (void)_scanCodePressed
{
  void *v2;
  id v3;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68368], 0);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D6A818]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)_appStorePressed
{
  void *v2;
  id v3;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68370], 0);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D6A6A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (BOOL)isAnimatingCard
{
  return BYTE1(self->_welcomeCardTemplateInformation);
}

- (void)setAnimatingCard:(BOOL)a3
{
  BYTE1(self->_welcomeCardTemplateInformation) = a3;
}

- (PKDiscoveryDataSource)dataSource
{
  return *(PKDiscoveryDataSource **)&self->_visibilityState;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityState, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_storeStrong((id *)&self->_articleLayoutsUpdatedAfterEnteringForegroundActive, 0);
  objc_storeStrong((id *)&self->_layoutState + 1, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);
  objc_storeStrong((id *)&self->_paymentWelcomeView, 0);
  objc_storeStrong((id *)&self->_passWelcomeView, 0);
  objc_destroyWeak((id *)&self->_subheaderDelegate);
  objc_storeStrong((id *)&self->_displayedCardViews, 0);
  objc_storeStrong((id *)&self->_activeDiscoveryCards, 0);
  objc_storeStrong((id *)&self->_allActiveDiscoveryCards, 0);
}

@end
