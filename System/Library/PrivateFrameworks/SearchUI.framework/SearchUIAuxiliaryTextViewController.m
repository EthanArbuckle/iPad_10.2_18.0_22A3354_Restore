@implementation SearchUIAuxiliaryTextViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "trailingTopText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasContent") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "trailingMiddleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasContent") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "trailingBottomText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "hasContent");

    }
  }

  return v6;
}

- (BOOL)shouldVerticallyCenter
{
  return 1;
}

- (id)setupView
{
  return (id)objc_opt_new();
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAuxiliaryTextViewController;
  -[SearchUIAccessoryViewController updateWithRowModel:](&v9, sel_updateWithRowModel_, v4);
  -[SearchUIAccessoryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SearchUIAuxiliaryTextViewController_updateWithRowModel___block_invoke;
  v7[3] = &unk_1EA1F6210;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBatchUpdates:", v7);

}

void __58__SearchUIAuxiliaryTextViewController_updateWithRowModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 40), "useCompactVersionOfUI");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseCompactMode:", v2);

  objc_msgSend(*(id *)(a1 + 40), "trailingTopText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTopText:", v5);

  objc_msgSend(*(id *)(a1 + 40), "trailingMiddleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMiddleText:", v8);

  objc_msgSend(*(id *)(a1 + 40), "trailingBottomText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBottomText:", v10);

}

- (unint64_t)type
{
  return 1;
}

- (BOOL)shouldCenter
{
  return self->_shouldCenter;
}

- (void)setShouldCenter:(BOOL)a3
{
  self->_shouldCenter = a3;
}

@end
