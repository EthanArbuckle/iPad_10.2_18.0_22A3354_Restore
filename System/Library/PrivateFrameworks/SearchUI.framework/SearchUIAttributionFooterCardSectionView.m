@implementation SearchUIAttributionFooterCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 1;
}

+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3
{
  return 1;
}

+ (void)removeIconsFromRichText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "formattedTextItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setFormattedTextItems:", v4);
}

- (id)setupTextButtonThatIsLeadingAttribution:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char **v7;
  uint64_t v8;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setProminence:", 3);
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], TLKSnippetModernizationEnabled() ^ 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setMatchesHeightForAlignmentRectWithIntrinsicContentSize:", 1);
  v7 = &selRef_didPressLeadingTextButton;
  if (v3)
  {
    v8 = 4;
  }
  else
  {
    v7 = &selRef_didPressTrailingTextButton_;
    v8 = 5;
  }
  objc_msgSend(v5, "addTarget:action:", self, *v7);
  objc_msgSend(v5, "setContentHorizontalAlignment:", v8);
  return v5;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[SearchUIAttributionFooterCardSectionView setupTextButtonThatIsLeadingAttribution:](self, "setupTextButtonThatIsLeadingAttribution:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAttributionFooterCardSectionView setLeadingTextButton:](self, "setLeadingTextButton:", v3);

  -[SearchUIAttributionFooterCardSectionView setupTextButtonThatIsLeadingAttribution:](self, "setupTextButtonThatIsLeadingAttribution:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAttributionFooterCardSectionView setTrailingTextButton:](self, "setTrailingTextButton:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DBDA08]);
  -[SearchUIAttributionFooterCardSectionView leadingTextButton](self, "leadingTextButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  -[SearchUIAttributionFooterCardSectionView trailingTextButton](self, "trailingTextButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v8);
  -[SearchUIAttributionFooterCardSectionView setStackView:](self, "setStackView:", v9);

  v10 = *MEMORY[0x1E0DBDA70];
  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpacing:", v10);

  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  v15 = v14;
  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLayoutMargins:", -3.0, v13, 13.0, v15);

  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLayoutMarginsRelativeArrangement:", 1);

  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlignment:", 4);

  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDistribution:", 5);

  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);

  -[SearchUIAttributionFooterCardSectionView stackView](self, "stackView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUserInteractionEnabled:(BOOL)a3 forButton:(id)a4
{
  objc_msgSend(a4, "setUserInteractionEnabled:", a3);
}

- (void)updateAttributionThatIsLeading:(BOOL)a3 withSection:(id)a4 isRTL:(BOOL)a5
{
  int v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a5;
  v6 = a3;
  v23 = a4;
  objc_msgSend(v23, "userReportRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "affordanceText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
  else
    objc_msgSend(v23, "trailingAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v23, "leadingAttribution", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[SearchUIAttributionFooterCardSectionView leadingTextButton](self, "leadingTextButton");
  }
  else
  {
    v11 = v10;
    -[SearchUIAttributionFooterCardSectionView trailingTextButton](self, "trailingTextButton", v21);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
    objc_msgSend(v23, "leadingAttributionPunchout");
  else
    objc_msgSend(v23, "trailingAttributionPunchout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    v17 = 0;
  else
    v17 = 2;
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "removeIconsFromRichText:", v13);
    objc_msgSend(v12, "setAlignment:", v17);
    objc_msgSend(v12, "setRichTitle:", v13);
LABEL_17:
    v19 = objc_msgSend(v13, "hasContent");
    if (v16)
      v18 = 1;
    else
      v18 = v19;
    goto LABEL_20;
  }
  objc_msgSend((id)objc_opt_class(), "removeIconsFromRichText:", v13);
  objc_msgSend(v12, "setAlignment:", v17);
  objc_msgSend(v12, "setRichTitle:", v13);
  v18 = 0;
  if (v9 && (v6 & 1) == 0)
    goto LABEL_17;
LABEL_20:
  -[SearchUIAttributionFooterCardSectionView setUserInteractionEnabled:forButton:](self, "setUserInteractionEnabled:forButton:", v18, v12);
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTlkImage:", v20);

}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIAttributionFooterCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v9, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIAttributionFooterCardSectionView setCardSection:](self, "setCardSection:", v5);
  v6 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") ^ 1;
  -[SearchUIAttributionFooterCardSectionView cardSection](self, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAttributionFooterCardSectionView updateAttributionThatIsLeading:withSection:isRTL:](self, "updateAttributionThatIsLeading:withSection:isRTL:", 1, v7, v6);

  -[SearchUIAttributionFooterCardSectionView cardSection](self, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAttributionFooterCardSectionView updateAttributionThatIsLeading:withSection:isRTL:](self, "updateAttributionThatIsLeading:withSection:isRTL:", 0, v8, v6);

  -[SearchUIAttributionFooterCardSectionView configureMenuForTrailingFootnoteButton](self, "configureMenuForTrailingFootnoteButton");
}

- (void)didPressLeadingTextButton
{
  void *v3;
  id v4;

  -[SearchUIAttributionFooterCardSectionView cardSection](self, "cardSection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAttributionPunchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView openPunchout:triggerEvent:](self, "openPunchout:triggerEvent:", v3, 2);

}

- (void)didPressTrailingTextButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchUICardSectionView rowModel](self, "rowModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userReportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "affordanceText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SearchUIAttributionFooterCardSectionView cardSection](self, "cardSection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAttributionPunchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView openPunchout:triggerEvent:](self, "openPunchout:triggerEvent:", v8, 2);

  }
}

- (void)configureMenuForTrailingFootnoteButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SearchUIAttributionFooterCardSectionView trailingTextButton](self, "trailingTextButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userReportRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "affordanceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SearchUICardSectionView configureUserReportButton:](self, "configureUserReportButton:", v8);
  else
    objc_msgSend(v8, "setMenu:", 0);
  objc_msgSend(v8, "menu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", v7 != 0);

}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (TLKTextButton)leadingTextButton
{
  return self->_leadingTextButton;
}

- (void)setLeadingTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTextButton, a3);
}

- (TLKTextButton)trailingTextButton
{
  return self->_trailingTextButton;
}

- (void)setTrailingTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTextButton, a3);
}

- (SFAttributionFooterCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_trailingTextButton, 0);
  objc_storeStrong((id *)&self->_leadingTextButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
