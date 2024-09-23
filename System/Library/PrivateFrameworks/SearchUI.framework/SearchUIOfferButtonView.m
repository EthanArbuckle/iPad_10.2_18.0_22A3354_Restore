@implementation SearchUIOfferButtonView

- (SearchUIOfferButtonView)init
{
  SearchUIOfferButtonView *v2;
  SearchUIOfferButtonView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIOfferButtonView;
  v2 = -[TLKStoreButton init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKStoreButton setCornerRadius:](v2, "setCornerRadius:", 7.0);
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A98], TLKSnippetModernizationEnabled() ^ 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStoreButton setFont:](v3, "setFont:", v4);

  }
  return v3;
}

- (void)setSymbolImageName:(id)a3
{
  id v5;
  void *v6;
  SearchUISymbolImage *v7;
  void *v8;
  SearchUISymbolImage *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_symbolImageName, a3);
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = [SearchUISymbolImage alloc];
  -[TLKStoreButton font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUISymbolImage initWithSymbolName:font:scale:](v7, "initWithSymbolName:font:scale:", v5, v8, 0);
  objc_msgSend(v6, "setGlyph:", v9);

  v10 = (void *)objc_opt_new();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFormattedTextPieces:", v11);

  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKStoreButton setRichTitle:](self, "setRichTitle:", v12);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[2];
  CGSize result;

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DBD9B0];
  v11 = *MEMORY[0x1E0DC1138];
  -[TLKStoreButton font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(" "), "sizeWithAttributes:", v5);
  objc_msgSend(v3, "deviceScaledRoundedValue:forView:", self, v6 + 11.5);
  v8 = v7;

  v9 = *MEMORY[0x1E0DC55F0];
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
}

@end
