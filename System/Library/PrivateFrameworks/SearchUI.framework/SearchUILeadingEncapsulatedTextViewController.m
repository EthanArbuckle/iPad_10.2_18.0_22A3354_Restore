@implementation SearchUILeadingEncapsulatedTextViewController

+ (BOOL)supportsRowModel:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "pinText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)setupView
{
  return (id)objc_opt_new();
}

- (BOOL)shouldCenterAlignToTitle
{
  return 1;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchUISymbolImage *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SearchUILeadingEncapsulatedTextViewController;
  v4 = a3;
  -[SearchUILeadingViewController updateWithRowModel:](&v16, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "pinText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.square.fill"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUISymbolImage uiImageWithSymbolName:](SearchUISymbolImage, "uiImageWithSymbolName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SearchUISymbolImage initWithSymbolName:font:scale:]([SearchUISymbolImage alloc], "initWithSymbolName:font:scale:", v8, v12, 2);
    objc_msgSend(v11, "setGlyph:", v13);

  }
  else
  {
    objc_msgSend(v10, "setText:", v5);
    objc_msgSend(v11, "setEncapsulationStyle:", 2);
    objc_msgSend(MEMORY[0x1E0DBD940], "preferredMonospacedFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SearchUILeadingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSfText:", v11);

  -[SearchUILeadingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v12);

}

@end
