@implementation SearchUIDescriptionCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 1;
}

- (id)setupContentView
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SearchUIDescriptionCardSectionView *v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == v5 && -[SearchUIDescriptionCardSectionView expanded](self, "expanded");
  -[SearchUIDescriptionCardSectionView setExpanded:](self, "setExpanded:", v7);

  v15.receiver = self;
  v15.super_class = (Class)SearchUIDescriptionCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v15, sel_updateWithRowModel_, v4);

  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SearchUIDescriptionCardSectionView_updateWithRowModel___block_invoke;
  v11[3] = &unk_1EA1F6518;
  v12 = v8;
  v13 = v5;
  v14 = self;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v10, "performBatchUpdates:", v11);

}

void __57__SearchUIDescriptionCardSectionView_updateWithRowModel___block_invoke(id *a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __objc2_class *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(a1[5], "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setImage:", v5);

  objc_msgSend(a1[5], "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTitle:", v7);

  objc_msgSend(a1[5], "richDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = SearchUITLKMultilineTextConverter;
  v11 = a1[5];
  if (v9)
  {
    objc_msgSend(v11, "richDescriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v13);
    v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setText:", v10);

  }
  else
  {
    objc_msgSend(v11, "descriptionText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKMultilineTextConverter textForSearchUIText:](SearchUITLKMultilineTextConverter, "textForSearchUIText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setText:", v13);
  }

  v14 = objc_msgSend(a1[6], "expanded");
  if ((v14 & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "richDescriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = v18 != 0;
    v19 = a1[5];
    if (v18)
    {
      objc_msgSend(v19, "richDescriptions");
      v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class firstObject](v10, "firstObject");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)v18;
    }
    else
    {
      objc_msgSend(v19, "descriptionText");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = 0;
    }
    v16 = v18 == 0;
    v17 = objc_msgSend(v1, "maxLines");
  }
  objc_msgSend(a1[4], "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaxLines:", v17);

  if (!v16)
  {
    if (!v15)
      goto LABEL_12;
LABEL_16:

    if ((v14 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }

  if (v15)
    goto LABEL_16;
LABEL_12:
  if ((v14 & 1) == 0)
  {
LABEL_13:

  }
LABEL_14:
  objc_msgSend(a1[5], "expandText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setMoreButtonText:", v21);

  objc_msgSend(a1[5], "attributionText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setFootnoteButtonText:", v22);

  objc_msgSend(a1[5], "userReportRequest");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "affordanceText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTrailingFootnoteButtonText:", v23);

}

+ (id)dragTitleForCardSection:(id)a3
{
  return (id)objc_msgSend(a3, "title");
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "descriptionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didPressMoreButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v8, "setCommand:", v3);

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v8, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wasPerformedWithTriggerEvent:", 2);

  -[SearchUICardSectionView didInvalidateSizeAnimate:](self, "didInvalidateSizeAnimate:", 1);
  -[SearchUIDescriptionCardSectionView setExpanded:](self, "setExpanded:", 1);

}

- (void)didPressFootnoteButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D8C5E0];
  objc_msgSend(v7, "attributionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView openPunchout:triggerEvent:](self, "openPunchout:triggerEvent:", v6, 2);

}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

@end
